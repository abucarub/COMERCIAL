unit uCriaHorarioMensal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, System.StrUtils, Vcl.Mask, JvExMask, JvToolEdit, Vcl.Buttons, Pessoa, Departamento, Convenio, TabelaPreco,
  ClienteMensal, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker, FireDAC.Stan.Def,
  FireDAC.Phys.IBWrapper, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase;

type
  TfrmCriaHorarioMensal = class(TfrmPadrao)
    gridDiasSemana: TDBGrid;
    cdsDiasSemana: TClientDataSet;
    dsDiasSemana: TDataSource;
    cdsDiasSemanaDIA_SEMANA: TStringField;
    cdsDiasSemanaSELECAO: TStringField;
    cmbHora: TComboBox;
    cmbMinutos: TComboBox;
    cdsDiasSemanaHORA: TStringField;
    cdsDiasSemanaMINUTOS: TStringField;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    lbTitulo: TLabel;
    lbProfissional: TLabel;
    lbPessoa: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    Label5: TLabel;
    gridServicos: TDBGrid;
    cdsServicos: TClientDataSet;
    cdsServicosSELECAO: TStringField;
    cdsServicosID_SERVICO: TIntegerField;
    cdsServicosSERVICO: TStringField;
    cdsServicosPRECO: TFloatField;
    cdsServicosID_TABELA_PRECO: TIntegerField;
    dsServicos: TDataSource;
    Label6: TLabel;
    cmbDiaPagamento: TComboBox;
    cdsDiasSemanaNUM_DIA: TIntegerField;
    dtpDataInicial: TJvDatePickerEdit;
    btnTransparencia: TBitBtn;
    procedure gridDiasSemanaCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure gridDiasSemanaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridServicosCellClick(Column: TColumn);
    procedure gridServicosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure dtpDataInicialChange(Sender: TObject);
    procedure btnTransparenciaClick(Sender: TObject);
  private
    FPessoa :TPessoa;
    FProfissional :TPessoa;
    FDepartamento :TDepartamento;
    FConvenio :TConvenio;

    procedure iniciaGridDias;
    procedure carregarServicos;
    procedure mostraServicosTela(servicos :TObjectList<TTabelaPreco>);
    procedure desmarcaTodos;
    procedure criaHorario;
    function informacoesFornecidas :boolean;
    function horariosInformados :boolean;
    function dataValida(data :TDate) :boolean;
  public
    constructor create(AOwner: TComponent; pProfissional, pPessoa :TPessoa; pDepartamento :TDepartamento; pConvenio :TConvenio); overload;
  end;

var
  frmCriaHorarioMensal: TfrmCriaHorarioMensal;

implementation

uses ServicoAgendado, SPA;

{$R *.dfm}

procedure TfrmCriaHorarioMensal.BitBtn2Click(Sender: TObject);
begin
  if informacoesFornecidas then
    if confirma('Os horário criado para "'+FPessoa.Nome+'" será salvo. Confirma?') then
      criaHorario;

end;

procedure TfrmCriaHorarioMensal.btnTransparenciaClick(Sender: TObject);
begin
  self.AlphaBlend := not self.AlphaBlend;
end;

procedure TfrmCriaHorarioMensal.carregarServicos;
var ServicoTabela  :TTabelaPreco;
    Servicos :TObjectList<TTabelaPreco>;
begin
 try
   cdsServicos.EmptyDataSet;
   ServicoTabela  := TTabelaPreco.Create;
   Servicos       := ServicoTabela.LoadList<TTabelaPreco>( ' LEFT JOIN SERVICOS ON SERVICOS.ID = TABELA_PRECO.ID_SERVICO '+
                                                           ' WHERE SERVICOS.ID_DEPARTAMENTO = '+intToStr(FDepartamento.ID)+
                                                           '   AND TABELA_PRECO.ID_CONVENIO = '+intToStr(FConvenio.ID));
   mostraServicosTela(Servicos);

 finally
   FreeAndNil(ServicoTabela);
   FreeAndNil(Servicos);
 end;
end;

constructor TfrmCriaHorarioMensal.create(AOwner: TComponent; pProfissional, pPessoa: TPessoa; pDepartamento: TDepartamento; pConvenio :TConvenio);
begin
  inherited Create(AOwner);
  cdsServicos.CreateDataSet;
  FPessoa          := pPessoa;
  FProfissional    := pProfissional;
  FDepartamento    := pDepartamento;
  FConvenio        := pConvenio;
  lbTitulo.Caption := 'CRIANDO HORÁRIO ('+FDepartamento.departamento+')';
  lbProfissional.Caption := FProfissional.Nome;
  lbPessoa.Caption := FPessoa.Nome;
  carregarServicos;
end;

procedure TfrmCriaHorarioMensal.criaHorario;
var clienteMensal :TClienteMensal;
begin
  try
    cdsServicos.Locate('SELECAO','S',[]);
    ClienteMensal := TClienteMensal.Create;
    if FPessoa.ClienteMensal.isLoaded then
      clienteMensal.Load(FPessoa.ClienteMensal.ID);

    clienteMensal.ID_Pessoa       := FPessoa.ID;
    clienteMensal.ID_Profissional := FProfissional.ID;
    clienteMensal.ID_Departamento := FDepartamento.ID;
    clienteMensal.ID_TabelaPreco  := cdsServicosID_TABELA_PRECO.AsInteger;

    if cdsDiasSemana.Locate('DIA_SEMANA','SEGUNDA-FEIRA',[]) and (cdsDiasSemanaSELECAO.AsString = 'S') then
      clienteMensal.Segunda      := StrToTime(cdsDiasSemanaHORA.AsString+':'+cdsDiasSemanaMINUTOS.AsString)
    else
      clienteMensal.Segunda      := 0;

    if cdsDiasSemana.Locate('DIA_SEMANA','TERÇA-FEIRA',[]) and (cdsDiasSemanaSELECAO.AsString = 'S') then
      clienteMensal.Terca        := StrToTime(cdsDiasSemanaHORA.AsString+':'+cdsDiasSemanaMINUTOS.AsString)
    else
      clienteMensal.Terca        := 0;

    if cdsDiasSemana.Locate('DIA_SEMANA','QUARTA-FEIRA',[]) and (cdsDiasSemanaSELECAO.AsString = 'S') then
      clienteMensal.Quarta       := StrToTime(cdsDiasSemanaHORA.AsString+':'+cdsDiasSemanaMINUTOS.AsString)
    else
      clienteMensal.Quarta       := 0;

    if cdsDiasSemana.Locate('DIA_SEMANA','QUINTA-FEIRA',[]) and (cdsDiasSemanaSELECAO.AsString = 'S') then
      clienteMensal.Quinta       := StrToTime(cdsDiasSemanaHORA.AsString+':'+cdsDiasSemanaMINUTOS.AsString)
    else
      clienteMensal.Quinta       := 0;

    if cdsDiasSemana.Locate('DIA_SEMANA','SEXTA-FEIRA',[]) and (cdsDiasSemanaSELECAO.AsString = 'S') then
      clienteMensal.Sexta        := StrToTime(cdsDiasSemanaHORA.AsString+':'+cdsDiasSemanaMINUTOS.AsString)
    else
      clienteMensal.Sexta        := 0;

    if cdsDiasSemana.Locate('DIA_SEMANA','SÁBADO',[]) and (cdsDiasSemanaSELECAO.AsString = 'S') then
      clienteMensal.Sabado       := StrToTime(cdsDiasSemanaHORA.AsString+':'+cdsDiasSemanaMINUTOS.AsString)
    else
      clienteMensal.Sabado        := 0;

    clienteMensal.DiaPagamento := strToInt(cmbDiaPagamento.Items[cmbDiaPagamento.ItemIndex]);
    clienteMensal.Inicio       := dtpDataInicial.Date;
    clienteMensal.Save;

    avisar('Horário salvo com sucesso');
    self.Close;

   { - cria horarios até o fim do mes, a partir da data inicial
    - adaptar tela Agendamentos, p/mostrar horarios dpto "Mensal" criados até o fim do 2º mes.
      a partir do segundo mês, carrega os horarios do dpto mensal com base na tabela clientes mensal (porem sem possibilidade de
      alterar o status desses horarios nem de cancelar
    - existira o cancelar direto (informando motivo) e o remarcar, que cancela horario (colocando motivo automatico) e cria um horario em outra data com status de reposição

      (nessa tela ira se alterar o status do horario ) tela mostrará horarios do dia, até no máximo horarios do ultimo dia do mÊs seguinte
    - cancelar ou alterar data

    - reposição é criada a partir de um horário cancelado}

  finally
    FreeAndNil(clienteMensal);
  end;
end;

function TfrmCriaHorarioMensal.dataValida(data: TDate): boolean;
begin
  result := cdsDiasSemana.Locate('NUM_DIA', DayOfWeek(data), []) and (cdsDiasSemanaSELECAO.AsString = 'S');
end;

procedure TfrmCriaHorarioMensal.desmarcaTodos;
var registro :integer;
begin
  registro := cdsServicos.RecNo;
  cdsServicos.First;
  while not cdsServicos.Eof do
  begin
    cdsServicos.Edit;
    cdsServicosSELECAO.AsString := 'N';
    cdsServicos.Post;
    cdsServicos.Next;
  end;
  cdsServicos.RecNo := registro;
end;

procedure TfrmCriaHorarioMensal.dtpDataInicialChange(Sender: TObject);
begin
  dtpDataInicial.OnChange := nil;
  if (dtpDataInicial.Date < date) then
  begin
    avisar('A data selecionada não pode ser inferior a data de hoje');
    dtpDataInicial.Clear;
  end
  else if not dataValida(dtpDataInicial.Date) then
  begin
    avisar('A data de início deve corresponder a um dos dias da semana selecionados acima');
    dtpDataInicial.Clear;
  end;
    dtpDataInicial.OnChange := dtpDataInicialChange;
end;

procedure TfrmCriaHorarioMensal.FormCreate(Sender: TObject);
begin
  inherited;
  iniciaGridDias;
end;

procedure TfrmCriaHorarioMensal.gridDiasSemanaCellClick(Column: TColumn);
begin
  if Column.PickList.Count > 0 then
  begin
    keybd_event(VK_F2,0,0,0);
    keybd_event(VK_F2,0,KEYEVENTF_KEYUP,0);
    keybd_event(VK_MENU,0,0,0);
    keybd_event(VK_DOWN,0,0,0);
    keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);
    keybd_event(VK_MENU,0,KEYEVENTF_KEYUP,0);
  end;

  if (Column.FieldName = 'SELECAO') or (Column.FieldName = 'DIA_SEMANA') then
  begin
    cdsDiasSemana.Edit;
    cdsDiasSemanaSELECAO.AsString := IfThen(cdsDiasSemanaSELECAO.AsString = 'S', 'N', 'S');
    cdsDiasSemana.Post;
  end;

  gridDiasSemana.Columns[2].ReadOnly := cdsDiasSemanaSELECAO.AsString <> 'S';
  gridDiasSemana.Columns[3].ReadOnly := cdsDiasSemanaSELECAO.AsString <> 'S';

  if gridDiasSemana.SelectedIndex in [0,1] then
     gridDiasSemana.Options := gridDiasSemana.Options - [dgEditing]
  else
     gridDiasSemana.Options := gridDiasSemana.Options + [dgEditing];
end;

procedure TfrmCriaHorarioMensal.gridDiasSemanaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin
  if cdsDiasSemanaSELECAO.AsString = 'S' then
    gridDiasSemana.Canvas.Brush.Color:= $00D5ECCA
  else
    gridDiasSemana.Canvas.Brush.Color:= clWhite;

  gridDiasSemana.Canvas.FillRect(Rect);
  gridDiasSemana.DefaultDrawDataCell(Rect, Column.Field, State);

  if (Column.FieldName = 'HORA') or (Column.FieldName = 'MINUTOS') then
  begin
    if cdsDiasSemanaSELECAO.AsString = 'S' then
    begin
       gridDiasSemana.Canvas.Brush.Color := clWhite;
       gridDiasSemana.Canvas.Font.Color  := clBlack;       
    end
    else
    begin
      gridDiasSemana.Canvas.Brush.Color  := clBtnFace;
      gridDiasSemana.Canvas.Font.Color   := clBtnFace;      
    end;

    gridDiasSemana.Canvas.FillRect(Rect);
    gridDiasSemana.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  //Desenha um checkbox no dbgrid
  if Column.FieldName = 'SELECAO' then
  begin
    gridDiasSemana.Canvas.FillRect(Rect);
    iCheck := 0;
    if cdsDiasSemanaSELECAO.AsString = 'S' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;

    rRect := Rect;
    InflateRect(rRect,-2,-2);
    DrawFrameControl(gridDiasSemana.Canvas.Handle,rRect,DFC_BUTTON, DFCS_BUTTONCHECK or iCheck);
  end;
end;

procedure TfrmCriaHorarioMensal.gridServicosCellClick(Column: TColumn);
begin
 if Column.PickList.Count > 0 then
  begin
    keybd_event(VK_F2,0,0,0);
    keybd_event(VK_F2,0,KEYEVENTF_KEYUP,0);
    keybd_event(VK_MENU,0,0,0);
    keybd_event(VK_DOWN,0,0,0);
    keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);
    keybd_event(VK_MENU,0,KEYEVENTF_KEYUP,0);
  end;

  if (Column.FieldName = 'SELECAO') or (Column.FieldName = 'SERVICO') then
  begin
    if cdsServicosSELECAO.AsString <> 'S' then
      desmarcaTodos;

    cdsServicos.Edit;
    cdsServicosSELECAO.AsString := IfThen(cdsServicosSELECAO.AsString = 'S', 'N', 'S');
    cdsServicos.Post;
  end;

  if gridServicos.SelectedIndex in [0,1,2] then
     gridServicos.Options := gridServicos.Options - [dgEditing]
  else
     gridServicos.Options := gridServicos.Options + [dgEditing];
end;

procedure TfrmCriaHorarioMensal.gridServicosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin
  if cdsServicosSELECAO.AsString = 'S' then
    gridServicos.Canvas.Brush.Color:= $00D5ECCA
  else
    gridServicos.Canvas.Brush.Color:= clWhite;

  gridServicos.Canvas.FillRect(Rect);
  gridServicos.DefaultDrawDataCell(Rect, Column.Field, State);

  //Desenha um checkbox no dbgrid
  if Column.FieldName = 'SELECAO' then
  begin
    gridServicos.Canvas.FillRect(Rect);
    iCheck := 0;
    if cdsServicosSELECAO.AsString = 'S' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;

    rRect := Rect;
    InflateRect(rRect,-2,-2);
    DrawFrameControl(gridServicos.Canvas.Handle,rRect,DFC_BUTTON, DFCS_BUTTONCHECK or iCheck);
  end;
end;

function TfrmCriaHorarioMensal.horariosInformados: boolean;
begin
  result := true;
  cdsDiasSemana.First;
  while not cdsDiasSemana.Eof do
  begin
    if cdsDiasSemanaHORA.Text = '00' then
    begin
      result := false;
      exit;
    end;
    cdsDiasSemana.Next;
  end;

end;

function TfrmCriaHorarioMensal.informacoesFornecidas: boolean;
begin
  result := false;

  cdsServicos.Filtered := false;
  cdsServicos.Filter   := 'SELECAO = ''S'' ';
  cdsServicos.Filtered := true;
  cdsDiasSemana.Filtered := false;
  cdsDiasSemana.Filter   := 'SELECAO = ''S'' ';
  cdsDiasSemana.Filtered := true;

  if cdsServicos.IsEmpty then
  begin
    avisar('Ao menos um serviço prestado deve ser selecionado');
    gridServicos.SetFocus;
  end
  else if cdsDiasSemana.IsEmpty then
  begin
    avisar('Ao menos um dia da semana deve ser selecionado');
    gridDiasSemana.SetFocus;
  end
  else if not horariosInformados then
    avisar('Horário de '+cdsDiasSemanaDIA_SEMANA.AsString+' não foi informado')
  else if dtpDataInicial.Date = strToDate('30/12/1899') then
  begin
    avisar('A data de início das aulas não foi informada');
    dtpDataInicial.SetFocus;
  end
  else if cmbDiaPagamento.ItemIndex = 0 then
  begin
    avisar('A data do pagamento não foi informada');
    cmbDiaPagamento.SetFocus;
  end
  else
    result := true;

  if not result then
  begin
    cdsServicos.Filtered   := false;
    cdsDiasSemana.Filtered := false;
    cdsDiasSemana.IndexFieldNames := 'NUM_DIA';
  end;

end;

procedure TfrmCriaHorarioMensal.iniciaGridDias;
const
  dias : array[1..6] of string = ('SEGUNDA-FEIRA','TERÇA-FEIRA','QUARTA-FEIRA','QUINTA-FEIRA','SEXTA-FEIRA','SÁBADO');
var
  i :integer;
begin
  cdsDiasSemana.CreateDataSet;

  gridDiasSemana.Columns[2].PickList := cmbHora.Items;
  gridDiasSemana.Columns[3].PickList := cmbMinutos.Items;

  for i := 1 to 6 do
  begin
    cdsDiasSemana.Append;
    cdsDiasSemanaDIA_SEMANA.AsString := dias[i];
    cdsDiasSemanaHORA.AsString       := '00';
    cdsDiasSemanaMINUTOS.AsString    := '00';
    cdsDiasSemanaNUM_DIA.AsInteger   := i+1;
    cdsDiasSemana.Post;
  end;
end;

procedure TfrmCriaHorarioMensal.mostraServicosTela(servicos: TObjectList<TTabelaPreco>);
var TabelaPreco :TTabelaPreco;
begin
  if not assigned(Servicos) or (Servicos.Count <= 0) then
    exit;

  for TabelaPreco in  Servicos do
  begin
    cdsServicos.Append;
    cdsServicosID_SERVICO.AsInteger      := TabelaPreco.ID_Servico;
    cdsServicosID_TABELA_PRECO.AsInteger := TabelaPreco.ID;
    cdsServicosSERVICO.AsString          := TabelaPreco.Servico.Servico;
    cdsServicosPRECO.AsFloat             := TabelaPreco.Valor;
    cdsServicos.Post;
  end;
end;

end.

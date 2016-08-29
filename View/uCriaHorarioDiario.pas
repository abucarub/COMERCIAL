unit uCriaHorarioDiario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, RxToolEdit, RxCurrEdit,
  Datasnap.DBClient, Vcl.ExtCtrls, Vcl.ComCtrls, JvExComCtrls, JvMonthCalendar, Vcl.Grids, Vcl.DBGrids,
  Pessoa, Departamento, Convenio, TabelaPreco, System.StrUtils, Utilitario, SPA, ServicoAgendado;

type
  TfrmCriaHorarioDiario = class(TfrmPadrao)
    gridServicos: TDBGrid;
    Label1: TLabel;
    calendario: TJvMonthCalendar;
    Label2: TLabel;
    Panel1: TPanel;
    lbTitulo: TLabel;
    lbProfissional: TLabel;
    cdsServicos: TClientDataSet;
    dsServicos: TDataSource;
    cdsServicosSERVICO: TStringField;
    cdsServicosPRECO: TFloatField;
    Label5: TLabel;
    Label6: TLabel;
    edtValorTotal: TCurrencyEdit;
    Label7: TLabel;
    DBGrid2: TDBGrid;
    cmbHora: TComboBox;
    Label8: TLabel;
    cmbMinutos: TComboBox;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    cdsServicosTEMPO: TStringField;
    cdsHorarios: TClientDataSet;
    dsHorarios: TDataSource;
    cdsHorariosPESSOA: TStringField;
    cdsHorariosDATA: TDateField;
    cdsHorariosHORA: TStringField;
    cdsHorariosDIA_SEMANA: TStringField;
    edtTempoDuracao: TEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cmbTempo: TComboBox;
    lbPessoa: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    cdsServicosSELECAO: TStringField;
    cdsServicosID_TABELA_PRECO: TIntegerField;
    cdsServicosID_SERVICO: TIntegerField;
    procedure gridServicosCellClick(Column: TColumn);
    procedure gridServicosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsServicosTEMPOChange(Sender: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure calendarioClick(Sender: TObject);
  private
    FPessoa :TPessoa;
    FProfissional :TPessoa;
    FDepartamento :TDepartamento;
    FConvenio :TConvenio;
    FHorarios :TObjectList<TSPA>;

    procedure carregarServicos;
    procedure atualizaTotais;
    procedure mostraServicosTela(Servicos :TObjectList<TTabelaPreco>);
    procedure criaHorario;
    procedure Reinicializa;
    procedure removeHorario;
    procedure salvarHorariosCriados;

    function informacoesFornecidas :Boolean;
  public
    constructor create(AOwner: TComponent; pProfissional, pPessoa :TPessoa; pDepartamento :TDepartamento; pConvenio :TConvenio); overload;
  end;

var
  frmCriaHorarioDiario: TfrmCriaHorarioDiario;

implementation

{$R *.dfm}

procedure TfrmCriaHorarioDiario.atualizaTotais;
var tempoTotal :TTime;
    valorTotal :Real;
begin
  tempoTotal := 0;
  valorTotal := 0;
  cdsServicos.first;
  while not cdsServicos.Eof do
  begin
    if cdsServicosSELECAO.AsString = 'S' then
    begin
      tempoTotal := tempoTotal + strToTime(cdsServicosTEMPO.Text);
      valorTotal := valorTotal + cdsServicosPRECO.AsFloat;
    end;
    cdsServicos.Next;
  end;

  edtTempoDuracao.Text := FormatDateTime('hh:mm', tempoTotal);
  edtValorTotal.Value  := valorTotal;
end;

procedure TfrmCriaHorarioDiario.BitBtn1Click(Sender: TObject);
begin
  if informacoesFornecidas then
    criaHorario;
end;

procedure TfrmCriaHorarioDiario.BitBtn2Click(Sender: TObject);
begin
  if not cdsHorarios.IsEmpty then
    if confirma('Os horários criados para "'+FPessoa.Nome+'" serão salvos. Confirma?') then
      salvarHorariosCriados;
end;

procedure TfrmCriaHorarioDiario.BitBtn3Click(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmCriaHorarioDiario.calendarioClick(Sender: TObject);
begin
  if calendario.Date < date then
  begin
    avisar('Atenção! Um horário não pode ser criado para uma data que já passou.');
    calendario.Date := date;
  end;
end;

procedure TfrmCriaHorarioDiario.carregarServicos;
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

procedure TfrmCriaHorarioDiario.cdsServicosTEMPOChange(Sender: TField);
begin
  if cdsServicos.State in [dsEdit] then
    atualizaTotais;
end;

constructor TfrmCriaHorarioDiario.create(AOwner: TComponent; pProfissional, pPessoa: TPessoa; pDepartamento: TDepartamento; pConvenio :TConvenio);
begin
  inherited Create(AOwner);
  cdsServicos.CreateDataSet;
  cdsHorarios.CreateDataSet;
  calendario.Date := date;
  FHorarios := TObjectList<TSPA>.Create;
  gridServicos.Columns[2].PickList := cmbTempo.Items;
  FPessoa          := pPessoa;
  FProfissional    := pProfissional;
  FDepartamento    := pDepartamento;
  FConvenio        := pConvenio;
  lbTitulo.Caption := 'CRIANDO HORÁRIO ('+FDepartamento.departamento+')';
  lbProfissional.Caption := FProfissional.Nome;
  lbPessoa.Caption := FPessoa.Nome;
  carregarServicos;
end;

procedure TfrmCriaHorarioDiario.criaHorario;
var horario :TSPA;
    servicoAgendado :TServicoAgendado;
begin
  horario := TSPA.Create;
  horario.Data            := calendario.Date;
  horario.Hora            := StrToTime(cmbHora.Items[cmbHora.ItemIndex]+':'+cmbMinutos.Items[cmbMinutos.ItemIndex]);
  horario.ID_Pessoa       := FPessoa.ID;
  horario.ID_Departamento := FDepartamento.ID;
  horario.ID_Profissional := FProfissional.ID;

  cdsServicos.First;
  while not cdsServicos.Eof do
  begin
    servicoAgendado                := TServicoAgendado.Create;
    servicoAgendado.ID_TabelaPreco := cdsServicosID_TABELA_PRECO.AsInteger;
    servicoAgendado.duracao        := cdsServicosTEMPO.AsDateTime;

    cdsServicos.Next;
    horario.ServicosAgendados.Add(ServicoAgendado);
  end;

  FHorarios.Add(horario);

  cdsHorarios.Append;
  cdsHorariosPESSOA.AsString     := FPessoa.Nome;
  cdsHorariosDATA.AsDateTime     := horario.Data;
  cdsHorariosHORA.AsString       := formatDateTime('hh:mm',horario.Hora);
  cdsHorariosDIA_SEMANA.AsString := TUtilitario.diaSemanaExtenso(calendario.Date);
  cdsHorarios.Post;

  Reinicializa;
  atualizaTotais;
end;

procedure TfrmCriaHorarioDiario.DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_DELETE then
    removeHorario;
end;

procedure TfrmCriaHorarioDiario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  frmCriaHorarioDiario := nil;
end;

procedure TfrmCriaHorarioDiario.FormDestroy(Sender: TObject);
begin
  FHorarios.Free;
end;

procedure TfrmCriaHorarioDiario.gridServicosCellClick(Column: TColumn);
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
    cdsServicos.Edit;
    cdsServicosSELECAO.AsString := IfThen(cdsServicosSELECAO.AsString = 'S', 'N', 'S');
    cdsServicos.Post;

    atualizaTotais;
  end;

  gridServicos.Columns[2].ReadOnly := cdsServicosSELECAO.AsString <> 'S';
  gridServicos.Columns[3].ReadOnly := cdsServicosSELECAO.AsString <> 'S';

  if gridServicos.SelectedIndex in [0,1,3] then
     gridServicos.Options := gridServicos.Options - [dgEditing]
  else
     gridServicos.Options := gridServicos.Options + [dgEditing];
end;

procedure TfrmCriaHorarioDiario.gridServicosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
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

function TfrmCriaHorarioDiario.informacoesFornecidas: Boolean;
begin
  result := false;

  cdsServicos.Filtered := false;
  cdsServicos.Filter   := 'SELECAO = ''S'' ';
  cdsServicos.Filtered := true;

  if cdsServicos.IsEmpty then
  begin
    avisar('Ao menos um serviço prestado deve ser selecionado');
    gridServicos.SetFocus;
  end
  else if cmbHora.ItemIndex <= 0 then
  begin
    avisar('O horário da consulta deve ser informado');
    cmbHora.SetFocus;
  end
  else if cdsHorarios.Locate('DATA',calendario.Date,[]) then
  begin
    avisar('Já existe um horário criado neste dia');
  end
  else
    result := true;

  if not result then
    cdsServicos.Filtered := false;
end;

procedure TfrmCriaHorarioDiario.mostraServicosTela(Servicos: TObjectList<TTabelaPreco>);
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
    cdsServicosTEMPO.AsString            := FormatDateTime('hh:mm',TabelaPreco.Servico.Duracao);
    cdsServicos.Post;
  end;

end;

procedure TfrmCriaHorarioDiario.Reinicializa;
begin
  cdsServicos.Filtered := false;
  carregarServicos;
  cmbHora.ItemIndex := 0;
  cmbMinutos.ItemIndex := 0;
end;

procedure TfrmCriaHorarioDiario.removeHorario;
begin
  FHorarios.Items[cdsHorarios.RecNo - 1].Free;
  cdsHorarios.Delete;
end;

procedure TfrmCriaHorarioDiario.salvarHorariosCriados;
var horario :TSPA;
begin
  for horario in FHorarios do
    horario.Save;

  avisar('Horários salvos com sucesso');
  self.Close;
end;

end.

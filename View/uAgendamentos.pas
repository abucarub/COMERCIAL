unit uAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Generics.Collections, System.StrUtils,
  Vcl.StdCtrls, frameBuscaPessoa, frameBuscaTabelaPreco, frameBuscaConvenio,
  Vcl.ExtCtrls, frameHorarioMarcado, JvExControls, JvCalendar, Vcl.ComCtrls,
  JvExComCtrls, JvMonthCalendar, Vcl.Grids, Vcl.Samples.Calendar,
  JvDateTimePicker, JvExMask, JvToolEdit, Vcl.Mask, RxToolEdit, Data.DB,
  Datasnap.DBClient, JvTimer, JvTimerList, RxSpin, Vcl.Samples.Spin, RxCurrEdit,
  Vcl.Buttons, Vcl.DBGrids, DBGridCBN, SPA, frameBusca, Vcl.Imaging.pngimage,
  frameBuscaDepartamento, frameMostraServico, Servico, Vcl.AppEvnts, ClienteMensal;

type
  TfrmAgendamentos = class(TfrmPadrao)
    cdsHorarios: TClientDataSet;
    cdsHorariosDIA_SEMANA: TStringField;
    dsHorarios: TDataSource;
    dsServicos: TDataSource;
    cdsServicos: TClientDataSet;
    cdsServicosHORARIO: TStringField;
    cdsHorariosDATA: TDateField;
    cdsHorariosHORA: TTimeField;
    cdsHorariosDia: TClientDataSet;
    dsHorariosDia: TDataSource;
    cdsHorariosDiaNOME: TStringField;
    cdsHorariosDiaINICIO: TTimeField;
    cdsHorariosDiaFIM: TTimeField;
    cdsHorariosID_HORARIO: TIntegerField;
    cdsHorariosDiaID_HORARIO: TIntegerField;
    cdsHorariosNDIA_SEMANA: TSmallintField;
    Panel2: TPanel;
    Image2: TImage;
    BuscaDepartamento1: TBuscaDepartamento;
    BuscaPessoa1: TBuscaPessoa;
    BuscaProfissional: TBuscaPessoa;
    pnlCorpo: TPanel;
    ScrollBox1: TScrollBox;
    pnlHorarios: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    pnlHorarioCliente: TPanel;
    Shape6: TShape;
    pnlTopo: TPanel;
    lbHorarios: TLabel;
    ApplicationEvents2: TApplicationEvents;
    rgpDiasSemana: TRadioGroup;
    StaticText1: TStaticText;
    gpbCalendario: TGroupBox;
    calendario: TJvMonthCalendar;
    Image4: TImage;
    btnCriaHorario: TBitBtn;
    BuscaConvenio1: TBuscaConvenio;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure fisioEsteticaClick(Sender: TObject);
    procedure pilatesClick(Sender: TObject);
    procedure speHorasChange(Sender: TObject);
    procedure BuscaConvenio1Exit(Sender: TObject);
    procedure BuscaTabelaPreco1Exit(Sender: TObject);
    procedure btnCriaHorarioClick(Sender: TObject);
    procedure BuscaPessoa1Exit(Sender: TObject);
    procedure btnAddServicoClick(Sender: TObject);
    procedure BuscaDepartamento1Exit(Sender: TObject);
    procedure MostraServico1btnLimpaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncMinClick(Sender: TObject);
    procedure btnDecMinClick(Sender: TObject);
    procedure BuscaTabelaPreco1edtCodigoChange(Sender: TObject);
    procedure speHorasEnter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
   // procedure dbgHorariosDiaDrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
//      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BuscaProfissionalExit(Sender: TObject);
    procedure btnCancelarHorarioClick(Sender: TObject);
    procedure BuscaDepartamento1edtDepartamentoChange(Sender: TObject);
    procedure chkSegundaClick(Sender: TObject);
    procedure btnSalvarHorariosClick(Sender: TObject);
    procedure rgpDiasSemanaClick(Sender: TObject);
    procedure speHorasExit(Sender: TObject);
    procedure speMinutosExit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure BuscaPessoa1edtNomeChange(Sender: TObject);
    procedure BuscaConvenio1edtConvenioChange(Sender: TObject);
    procedure calendarioClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure pnlHorariosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure rpbDiasSemanaClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BuscaProfissionaledtNomeChange(Sender: TObject);
  private
    FPrimeiroHorarioDisponivel :TTime;
    FUltimoHorarioDisponivel   :TTime;
    FPrimeiroHorarioDia :TTime;
    FUltimoHorarioDia   :TTime;
    fimHorario, limiteHorario :TTime;
    panelList :TObjectList<TPanel>;

    procedure carregarHorariosDia;
    procedure carregarHorariosMensal;
    procedure mostrarHorariosDia(horarios: TObjectList<TSPA>);
    procedure mostrarHorariosMensal(clientes :TObjectList<TClienteMensal>);

    procedure criaHorarioDiario;
    procedure criaHorarioMensal;
    procedure limpaHorariosTela;
    procedure mostraHorarioTela(horario :TSPA);
    function calculaTopHorario(horario :TSPA):integer;
    function calculaLeftHorario(panelCriado :TPanel) :integer;


    procedure carregarHorariosCliente;
    procedure mostrarHorariosCliente(horarios: TObjectList<TSPA>);
    procedure defineHorarioMinMax;
    procedure setaHorario(horario :TTime);
    procedure insereHorarioGrid(spa :TSPA);
    procedure habilitaMarcacao(habilita :boolean);
    procedure adicionaServicoHorario(Horario :TSPA; ID_TabelaPreco :integer; tempoServico :TTime);
    procedure limpaServicosTela;
    function cancelaHorario :Boolean;
    procedure cancelaHorarioNormal;
    procedure cancelaHorarioPilates;
    procedure cancela(idHorario :integer);
    procedure zeraTela;
    procedure configuraTela;
    procedure adicionaRemoveHorario(checkBox :TCheckBox);
    procedure marcaHorarioPilates;
    procedure preencheHorariosRestantes;
    procedure carregaDadosAluno;
    procedure limpaDadosAluno;
    procedure salvaDadosAluno;
    
    function diasSemanaSelecionados :String;
    function diaSemanaPreSelecionado(data:TDateTime) :Boolean;
    function tempoServicosSelecionados :TTime;
    function valorServicosSelecionados :Real;
    function adicionaServicoTela(servico :TServico) :Boolean;
    function servicoAdicionado(servico :TServico):boolean;
    function marcaHorario :boolean;
    function SalvaHorariosPilates :boolean;
    function verificaObrigatorios :boolean;
    
  public
    { Public declarations }
  end;

var
  frmAgendamentos: TfrmAgendamentos;

implementation

uses Utilitario, TipoPessoa, ServicoAgendado, uCriaHorarioDiario, uCriaHorarioMensal;

{$R *.dfm}

function TfrmAgendamentos.adicionaServicoTela(servico: TServico) :Boolean;
begin

end;

procedure TfrmAgendamentos.BitBtn3Click(Sender: TObject);
begin
  if BuscaDepartamento1.Departamento.tipoHorarios = 'D' then
    criaHorarioDiario
  else
    criaHorarioMensal;
end;

procedure TfrmAgendamentos.adicionaRemoveHorario(checkBox: TCheckBox);
begin
  if not checkBox.Checked then
  begin
    checkBox.Font.Style := [];
    if cdsHorarios.Locate('DIA_SEMANA',ANSIUPPERCASE(checkBox.Caption)+'-FEIRA',[]) then
      cdsHorarios.Delete;
  end
  else
  begin
    checkBox.Font.Style := [fsBold];
    if cdsHorarios.Locate('DIA_SEMANA',ANSIUPPERCASE(checkBox.Caption)+'-FEIRA',[]) then
      cdsHorarios.Edit
    else
      cdsHorarios.Append;

    cdsHorariosDIA_SEMANA.AsString   := ANSIUPPERCASE(checkBox.Caption)+'-FEIRA';
    cdsHorariosNDIA_SEMANA.AsInteger := TUtilitario.numeroDiaSemana(checkBox.Caption);
    cdsHorarios.Post;
  end;

  cdsHorarios.IndexFieldNames := 'NDIA_SEMANA';
end;

procedure TfrmAgendamentos.adicionaServicoHorario(Horario: TSPA; ID_TabelaPreco :integer; tempoServico :TTime);
var servicoAgendado :TServicoAgendado;
begin
  servicoAgendado                := TServicoAgendado.Create;
  servicoAgendado.ID_SPA         := Horario.ID;
  servicoAgendado.ID_TabelaPreco := ID_TabelaPreco;
  servicoAgendado.duracao        := tempoServico;

  Horario.ServicosAgendados.Add(ServicoAgendado);
end;

procedure TfrmAgendamentos.btnAddServicoClick(Sender: TObject);
begin
  {if not assigned(BuscaTabelaPreco1.TabelaPreco) or (BuscaTabelaPreco1.TabelaPreco.ID = 0) then
  begin
    BuscaTabelaPreco1.edtCodigo.SetFocus;
    exit;
  end;
  if adicionaServicoTela(BuscaTabelaPreco1.TabelaPreco.Servico) then
  begin
    habilitaMarcacao(true);
    //calendarioClick(nil);
  end;

  BuscaTabelaPreco1.limpa;
  BuscaTabelaPreco1.edtCodigo.SetFocus;
  edtTempoDuracao.Clear;   }
end;

procedure TfrmAgendamentos.btnCancelarHorarioClick(Sender: TObject);
begin
  if cancelaHorario then
    MessageDlg('Horário cancelado com sucesso.', mtInformation,[mbOk],0);
end;

procedure TfrmAgendamentos.btnCriaHorarioClick(Sender: TObject);
begin
 if verificaObrigatorios then
 begin
   if BuscaDepartamento1.Departamento.Departamento = 'PILATES' then
     marcaHorarioPilates
   else
   begin
     if marcaHorario then
     MessageDlg('Horário criado com sucesso!', mtInformation,[mbOk],0);
   end;
 end;
end;

procedure TfrmAgendamentos.btnDecMinClick(Sender: TObject);
begin
 { if not assigned(BuscaTabelaPreco1.TabelaPreco) or (BuscaTabelaPreco1.TabelaPreco.ID = 0) then
    exit;

  edtTempoDuracao.Text := TimeToStr(strToTime(edtTempoDuracao.Text)-strToTime('00:10:00'));

  if strToTime(edtTempoDuracao.Text) < strToTime('00:10:00') then
    edtTempoDuracao.Text := ('00:10:00');   }
end;

procedure TfrmAgendamentos.btnIncMinClick(Sender: TObject);
begin
 { if not assigned(BuscaTabelaPreco1.TabelaPreco) or (BuscaTabelaPreco1.TabelaPreco.ID = 0) then
    exit;

  edtTempoDuracao.Text := TimeToStr(strToTime(edtTempoDuracao.Text)+strToTime('00:10:00'));  }
end;

procedure TfrmAgendamentos.btnSalvarHorariosClick(Sender: TObject);
begin
{  if edtDiaPagamento.AsInteger = 0 then
  begin
    MessageDlg('Favor informar o dia do pagamento.', mtInformation,[mbOk],0);
    edtDiaPagamento.SetFocus;
    exit;
  end;       }

  if SalvaHorariosPilates then
  begin
    rgpDiasSemanaClick(nil);
    MessageDlg('Horários salvos com sucesso!', mtInformation,[mbOk],0);
  end;
end;

procedure TfrmAgendamentos.BuscaConvenio1edtConvenioChange(Sender: TObject);
begin
  inherited;
  limpaServicosTela;
 // BuscaTabelaPreco1.limpa;
end;

procedure TfrmAgendamentos.BuscaConvenio1Exit(Sender: TObject);
begin
  inherited;
 { BuscaConvenio1.FrameExit(Sender);
  if assigned(BuscaConvenio1.Convenio) and (BuscaConvenio1.Convenio.ID > 0) then
    BuscaTabelaPreco1.IDConvenio := BuscaConvenio1.Convenio.ID;   }
end;

procedure TfrmAgendamentos.BuscaDepartamento1edtDepartamentoChange(
  Sender: TObject);
begin
  inherited;
  zeraTela;
end;

procedure TfrmAgendamentos.BuscaDepartamento1Exit(Sender: TObject);
begin
  inherited;
  BuscaDepartamento1.FrameExit(Sender);
  if assigned(BuscaDepartamento1.Departamento) then
  begin
//  BuscaTabelaPreco1.IDDepartamento := BuscaDepartamento1.Departamento.ID;
    gpbCalendario.Visible := BuscaDepartamento1.Departamento.tipoHorarios = 'D'; {Diário}
    rgpDiasSemana.Visible := BuscaDepartamento1.Departamento.tipoHorarios = 'M'; {Mensal}
    configuraTela;
  end;
end;

procedure TfrmAgendamentos.BuscaPessoa1edtNomeChange(Sender: TObject);
begin
  inherited;
  limpaServicosTela;
end;

procedure TfrmAgendamentos.BuscaPessoa1Exit(Sender: TObject);
begin
  inherited;
  BuscaPessoa1.FrameExit(Sender);
  cdsHorarios.EmptyDataSet;
  if assigned(BuscaPessoa1.Pessoa) and (BuscaPessoa1.Pessoa.ID > 0) then
    carregarHorariosCliente;

  //btnCancelarHorario.Enabled  := not cdsHorarios.IsEmpty;
end;

procedure TfrmAgendamentos.BuscaProfissionaledtNomeChange(Sender: TObject);
begin
  inherited;
  limpaHorariosTela;
end;

procedure TfrmAgendamentos.BuscaProfissionalExit(Sender: TObject);
begin
  inherited;
  BuscaProfissional.FrameExit(Sender);
  if assigned(BuscaProfissional.Pessoa) and (BuscaProfissional.Pessoa.ID > 0)then
  begin
    calendario.Enabled := true;
    rgpDiasSemana.Enabled := true;
    if (BuscaDepartamento1.Departamento.tipoHorarios = 'M') and assigned(BuscaDepartamento1.Departamento) then
      rgpDiasSemanaClick(nil)
    else if (BuscaDepartamento1.Departamento.tipoHorarios = 'D') and assigned(BuscaDepartamento1.Departamento) then
      calendarioClick(nil);
  end
  else
  begin
    calendario.Enabled := false;
    rgpDiasSemana.Enabled := false;
    cdsHorariosDia.EmptyDataSet;
  end;
end;

procedure TfrmAgendamentos.BuscaTabelaPreco1edtCodigoChange(Sender: TObject);
begin
  inherited;
//  edtTempoDuracao.Clear;
end;

procedure TfrmAgendamentos.BuscaTabelaPreco1Exit(Sender: TObject);
begin
  inherited;
{  BuscaTabelaPreco1.FrameExit(Sender);
  if Assigned(BuscaTabelaPreco1.TabelaPreco) and (BuscaTabelaPreco1.TabelaPreco.ID > 0) then
    edtTempoDuracao.Text := TimeToStr(BuscaTabelaPreco1.TabelaPreco.Servico.Duracao)
  else
    edtTempoDuracao.Clear;     }
end;

procedure TfrmAgendamentos.fisioEsteticaClick(Sender: TObject);
begin



 { lbHorarioDia.Caption := 'Horários do dia  '+DateToStr(calendario.Date);
  lbDiaSemana.Caption  := '('+TUtilitario.diaSemanaExtenso(calendario.Date)+')';

  if DateToStr(calendario.Date) = formatDateTime('dd/mm/yyyy',date) then
    Timer1.Enabled := true
  else
    Timer1.Enabled := false;  }
end;

function TfrmAgendamentos.calculaLeftHorario(panelCriado: TPanel): integer;
var i :integer;
    panel :TPanel;
begin
  result := 50;
  if assigned(panelList) then

  for panel in  panelList do
  begin
    { se for ele mesmo não entra na condição  }
    if panel.Name = panelCriado.Name then
      break;
    { verifica se há sobreposição, se sim, reposiciona o panel }
    if ((panelCriado.Top >= panel.Top) and
       (panelCriado.Top <= (panel.Top + panel.Height ))) 
    or (((panelCriado.Top + panelCriado.Height) >= panel.Top) and
       ((panelCriado.Top + panelCriado.Height) <= (panel.Top + panel.Height ))) then
    result := panel.Left + panel.Width + 5;
    
  end;

end;

function TfrmAgendamentos.calculaTopHorario(horario: TSPA): integer;
var diferencaHorarios :TTime;
begin
  diferencaHorarios := horario.hora - FPrimeiroHorarioDia;
  result            := TUtilitario.dataParaMinutos(diferencaHorarios)+9;
end;

procedure TfrmAgendamentos.cancela(idHorario: integer);
var horario :TSPA;
begin
  try
    horario := TSPA.Create;
    horario.Load(cdsHorariosID_HORARIO.AsInteger);
    horario.tipo := 'C';
    horario.Save;
  finally
    FreeAndNil(horario);
  end;
end;

function TfrmAgendamentos.cancelaHorario :Boolean;
begin
  try
    if BuscaDepartamento1.Departamento.Departamento = 'PILATES' then
      cancelaHorarioPilates
    else
      cancelaHorarioNormal;

  Except
    on e :Exception do
      raise Exception.Create(e.Message);
  end;

  carregarHorariosCliente;
end;

procedure TfrmAgendamentos.cancelaHorarioNormal;
begin
  if MessageBox(Handle, PWideChar('Deseja cancelar o horário do dia '+cdsHorariosDATA.AsString+' marcado às '+cdsHorariosHORA.AsString+#13#10+
                          'referente ao '+BuscaPessoa1.DescricaoTipo+' '+ BuscaPessoa1.Pessoa.Nome+'?')
                  , '', MB_YESNO+MB_SYSTEMMODAL+MB_ICONQUESTION+MB_DEFBUTTON1) = ID_YES then
  begin
    try
      cancela(cdsHorariosID_HORARIO.AsInteger);
      MessageDlg('Horário cancelado com sucesso!', mtInformation,[mbOk],0);
      carregarHorariosCliente;
    Except
      on e:Exception do
        raise Exception.Create('Erro ao cancelar horário');
    end;
  end;
end;

procedure TfrmAgendamentos.cancelaHorarioPilates;
begin
  if MessageBox(Handle, PWideChar('Deseja cancelar o(s) horário(s) de pilates de '+ BuscaPessoa1.Pessoa.Nome+'?')
                  , '', MB_YESNO+MB_SYSTEMMODAL+MB_ICONQUESTION+MB_DEFBUTTON1) = ID_YES then
  begin
    try
      cdsHorarios.First;
      while not cdsHorarios.Eof do
      begin
        cancela(cdsHorariosID_HORARIO.AsInteger);
        cdsHorarios.Next;
      end;
    Except
      on e:Exception do
        raise Exception.Create('Erro ao cancelar horário');
    end;
  end;
end;

procedure TfrmAgendamentos.mostraHorarioTela(horario: TSPA);
var labelHoraConsulta :TLabel;
    labelNomeCliente  :TLabel;
    shapeFundo        :TShape;
begin
  {cria panel horario}
  panelList.Add(TPanel.Create(self));
  panelList.Items[panelList.Count-1].Name   := 'pnlHr'+intToStr(horario.ID);
  panelList.Items[panelList.Count-1].Parent := pnlHorarios;
  panelList.Items[panelList.Count-1].Top    := calculaTopHorario(horario);
  panelList.Items[panelList.Count-1].Height := TUtilitario.dataParaMinutos(horario.duracaoServicos);  
  panelList.Items[panelList.Count-1].Left   := calculaLeftHorario( panelList.Items[panelList.Count-1]);
  panelList.Items[panelList.Count-1].Width  := 220;
  panelList.Items[panelList.Count-1].Repaint;  
  panelList.Items[panelList.Count-1].BevelOuter := bvNone;
//  panelList.Items[panelList.Count-1].BevelKind  := bkTile;
  panelList.Items[panelList.Count-1].Caption    := '';
  
  {cria label hora consulta}
  labelHoraConsulta             := TLabel.Create(self);
  labelHoraConsulta.Parent      := panelList.Items[panelList.Count-1];
  labelHoraConsulta.Caption     := TimeToStr(horario.hora)+' às '+TimeToStr(horario.hora+horario.duracaoServicos);
  labelHoraConsulta.Align       := alTop;
  labelHoraConsulta.AutoSize    := false;
  labelHoraConsulta.Alignment   := taCenter;
  labelHoraConsulta.Transparent := false;
  labelHoraConsulta.Height      := 13;
  labelHoraConsulta.Color       := $00BCB485;
  labelHoraConsulta.Font.Color  := clWhite;
  labelHoraConsulta.Font.Name  := 'Lucida Console';
  labelHoraConsulta.Font.Size  := 8; 
  labelHoraConsulta.Font.Style := [fsBold]; 

  { cria shape de fundo }  
  shapeFundo              := TShape.Create(self);
  shapeFundo.Parent       := panelList.Items[panelList.Count-1];
  shapeFundo.Brush.Color  := $00ECEFCF;
  shapeFundo.Pen.Style    := psClear;
  shapefundo.Align        := alClient;

  {cria label nome cliente}
  labelNomeCliente             := TLabel.Create(self);
  labelNomeCliente.Parent      := panelList.Items[panelList.Count-1];
  labelNomeCliente.Caption     := horario.Pessoa.Nome;
//  labelNomeCliente.Align       := alBottom;
//  labelNomeCliente.AutoSize    := false;
  labelNomeCliente.Color       := $00ECEFCF;    
  labelNomeCliente.Alignment   := taCenter;
  labelNomeCliente.Height      := 14;
  labelNomeCliente.Font.Name   := 'Calibri Light';
  labelNomeCliente.Font.Style  := [fsBold];
  labelNomeCliente.Font.Color  := $003C3C3C;
  labelNomeCliente.Font.Size   := 9;
  labelNomeCliente.Left        := 3;
  labelNomeCliente.Top         := trunc(panelList.Items[panelList.Count-1].Height / 2);  
end;

procedure TfrmAgendamentos.mostrarHorariosCliente(horarios: TObjectList<TSPA>);
var horario :TSPA;
begin
  if not assigned(horarios) then
    exit;

  cdsHorarios.EmptyDataSet;
  for horario in horarios do
    if (BuscaDepartamento1.Departamento.Departamento = 'PILATES') or not horario.horarioPassado then
      insereHorarioGrid(horario);

  //btnCancelarHorario.Enabled  := not cdsHorarios.IsEmpty;
end;

procedure TfrmAgendamentos.mostrarHorariosDia(horarios: TObjectList<TSPA>);
var
    horario :TSPA;
begin
  cdsHorariosDia.EmptyDataSet;
  if not assigned(horarios) then
    Exit;

  for horario in horarios do
  begin
     mostraHorarioTela(horario);
  {   cdsHorariosDia.Append;
     cdsHorariosDiaID_HORARIO.AsInteger := horario.ID;
     cdsHorariosDiaNOME.AsString        := horario.Pessoa.Nome;
     cdsHorariosDiaINICIO.AsDateTime    := horario.Hora;
     cdsHorariosDiaFIM.AsDateTime       := horario.Hora + horario.duracaoServicos;
     cdsHorariosDia.Post;}
  end;

end;

procedure TfrmAgendamentos.mostrarHorariosMensal(clientes: TObjectList<TClienteMensal>);
var horario :TSPA;
    cliente :TClienteMensal;
begin
  if not assigned(clientes) or (clientes.count <= 0) then
    exit;

  horario := TSPA.Create;

  for cliente in clientes do
  begin
    horario.ID := cliente.ID;
    horario.ID_Departamento := BuscaDepartamento1.Departamento.ID;
    horario.ID_Pessoa       := cliente.ID_Pessoa;
//    horario.ID_Profissional := BuscaProfissional.Pessoa.ID;

    case rgpDiasSemana.ItemIndex of
      0 :  horario.hora := cliente.Segunda;
      1 :  horario.hora := cliente.Terca;
      2 :  horario.hora := cliente.Quarta;
      3 :  horario.hora := cliente.Quinta;
      4 :  horario.hora := cliente.Sexta;
      5 :  horario.hora := cliente.Sabado;
      6 :  horario.hora := cliente.Domingo;
    end;

    if horario.hora > 0 then
      mostraHorarioTela(horario);
  end;

end;

procedure TfrmAgendamentos.MostraServico1btnLimpaClick(Sender: TObject);
begin
  inherited;
  TMostraServico(TSpeedButton(Sender).Owner).btnLimpaClick(Sender);
  TMostraServico(TSpeedButton(Sender).Owner).Visible := false;
  TMostraServico(TSpeedButton(Sender).Owner).Align   := alNone;
  TMostraServico(TSpeedButton(Sender).Owner).Left    := 700;
  //calendarioClick(nil);
  if TUtilitario.dataParaMinutos(tempoServicosSelecionados) = 0 then
    habilitaMarcacao(false);

//  lbTempoDuracao.Caption  := TimeToStr(tempoServicosSelecionados);
//  lbValorServicos.Caption := FormatFloat('R$ #,0.00',valorServicosSelecionados);
end;

procedure TfrmAgendamentos.pilatesClick(Sender: TObject);
begin
  {if diasSemanaSelecionados = '' then
     MessageDlg('Nenhum dia da semana foi escolhido para a aula. Favor informar acima.', mtInformation,[mbOk],0)
  else if not diaSemanaPreSelecionado(calendario.Date) then
  begin
    MessageDlg('Data selecionada deve corresponder a um dia da semana pre-selecionado.'+#13#10+
                diasSemanaSelecionados, mtInformation,[mbOk],0);
    habilitaMarcacao(false);
  end
  else
    habilitaMarcacao(true);  }
    carregarHorariosMensal;
end;

procedure TfrmAgendamentos.pnlHorariosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if not (screen.ActiveControl = scrollbox1) then
    scrollbox1.SetFocus;
end;

procedure TfrmAgendamentos.preencheHorariosRestantes;
var primeiroDia :integer;
    diferenca :integer;
    ultimoDia :integer; 
    ultimaData :TDateTime;                                             
begin                                                                   
  primeiroDia := cdsHorariosNDIA_SEMANA.AsInteger;
  ultimoDia   := primeiroDia; 
  ultimaData  := cdsHorariosDATA.AsDateTime;                     
  cdsHorarios.Next;
                                                                        
  if cdsHorarios.Eof then                                               
    cdsHorarios.First;                                                  
                                                                        
  while not cdsHorarios.Eof do                                          
  begin                                                                 
    if cdsHorariosNDIA_SEMANA.AsInteger = primeiroDia then              
      break;
      
    if cdsHorariosNDIA_SEMANA.AsInteger > ultimoDia then 
      diferenca := cdsHorariosNDIA_SEMANA.AsInteger - ultimoDia
    else
      diferenca := (7 - ultimoDia) + cdsHorariosNDIA_SEMANA.AsInteger; 

    cdsHorarios.Edit;
    cdsHorariosDATA.AsDateTime := ultimaData + diferenca;
   // cdsHorariosHORA.AsDateTime := StrToTime(speHoras.Text+':'+speMinutos.Text+':00');
    cdsHorarios.Post;

    ultimoDia   := cdsHorariosNDIA_SEMANA.AsInteger;
    ultimaData  := cdsHorariosDATA.AsDateTime;
      
    cdsHorarios.Next;  
          
    if cdsHorarios.Eof then                                               
      cdsHorarios.First;   
  end;
  
end;

procedure TfrmAgendamentos.rgpDiasSemanaClick(Sender: TObject);
begin
  limpaHorariosTela;
  carregarHorariosMensal;
end;

procedure TfrmAgendamentos.rpbDiasSemanaClick(Sender: TObject);
begin
  limpaHorariosTela;
  carregarHorariosMensal;
end;

procedure TfrmAgendamentos.salvaDadosAluno;
var clienteMensal :TClienteMensal;
begin
 { try
    ClienteMensal := TAlunoPilates.Create;
    if BuscaPessoa1.Pessoa.AlunoPilates.isLoaded then
      AlunoPilates.Load(BuscaPessoa1.Pessoa.AlunoPilates.ID);

    AlunoPilates.ID_Pessoa := BuscaPessoa1.Pessoa.ID;
    AlunoPilates.Segunda := IfThen(chkSegunda.Checked,'X','');
    AlunoPilates.Terca   := IfThen(chkTerca.Checked,'X','');
    AlunoPilates.Quarta  := IfThen(chkQuarta.Checked,'X','');
    AlunoPilates.Quinta  := IfThen(chkQuinta.Checked,'X','');
    AlunoPilates.Sexta   := IfThen(chkSexta.Checked,'X','');
    AlunoPilates.DiaPagamento := edtDiaPagamento.AsInteger;
    AlunoPilates.Save;
  finally
    FreeAndNil(AlunoPilates);
  end;                    }
end;

function TfrmAgendamentos.SalvaHorariosPilates: boolean;
var SPA :TSPA;
begin
  try
    cdsHorarios.First;
    while not cdsHorarios.Eof do
    begin
      SPA := TSPA.Create;
      SPA.Data            := cdsHorariosDATA.AsDateTime;
      SPA.Hora            := cdsHorariosHORA.AsDateTime;
      SPA.ID_Pessoa       := BuscaPessoa1.Pessoa.ID;
      SPA.ID_Departamento := BuscaDepartamento1.Departamento.ID;
      SPA.ID_Profissional := BuscaProfissional.Pessoa.ID;
  //    adicionaServicoHorario(SPA,BuscaTabelaPreco1.TabelaPreco.ID, strToTime(edtTempoDuracao.Text));
      SPA.Save;

      cdsHorarios.Next;

      FreeAndNil(SPA);
    end;

    salvaDadosAluno;

    result := true;  
    //btnSalvarHorarios.Enabled := false;
  Except
    raise Exception.Create('Erro ao salvar horários');
    result := false;
  end;
end;

procedure TfrmAgendamentos.ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  with TScrollBox(Sender).VertScrollBar do
  begin
      Position := Position - Increment;
  end;
end;

procedure TfrmAgendamentos.ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  with TScrollBox(Sender).VertScrollBar do
  begin
      Position := Position + Increment;
  end;
end;

procedure TfrmAgendamentos.FormActivate(Sender: TObject);
begin
  inherited;
  if (calendario.Enabled) and (gpbCalendario.Visible) then
    calendarioClick(nil)
  else if (rgpDiasSemana.Visible) and (rgpDiasSemana.Enabled) then
    rgpDiasSemanaClick(nil);
end;

procedure TfrmAgendamentos.FormCreate(Sender: TObject);
begin
  inherited;
  BuscaPessoa1.Tipo      := 1;    //trocar por get numerico
  BuscaProfissional.Tipo := 2;
  FPrimeiroHorarioDia    := StrToTime('06:00:00');
  FUltimoHorarioDia      := StrToTime('21:00:00');
  cdsHorarios.CreateDataSet;
  cdsHorariosDia.CreateDataSet;
  habilitaMarcacao(false);
  calendario.Date := Date;
end;

procedure TfrmAgendamentos.FormDestroy(Sender: TObject);
begin
  inherited;
  if assigned(panelList) then
    panelList.Free;  
end;

procedure TfrmAgendamentos.FormShow(Sender: TObject);
begin
  BuscaDepartamento1.edtCodigo.SetFocus;
end;

procedure TfrmAgendamentos.habilitaMarcacao(habilita: boolean);
begin
{  speHoras.Value         := 0;
  speMinutos.Value       := 0;

  if habilita then
  begin
    speHoras.Color := clWhite;
    speMinutos.Color := clWhite;
  end
  else
  begin
    speHoras.Color := $00D4D4D4;
    speMinutos.Color := $00D4D4D4;
  end;

  gpbHorario.Enabled     := habilita;
  btnCriaHorario.Enabled := habilita;  }
end;

procedure TfrmAgendamentos.insereHorarioGrid(spa: TSPA);
begin
  cdsHorarios.Append;
  cdsHorariosID_HORARIO.AsInteger := spa.ID;
  cdsHorariosDATA.AsDateTime      := spa.Data;
  cdsHorariosHORA.AsDateTime      := spa.Hora;
  cdsHorariosDIA_SEMANA.AsString  := TUtilitario.diaSemanaExtenso(spa.Data);
  cdsHorarios.Post;
end;

procedure TfrmAgendamentos.limpaDadosAluno;
begin
{  chkSegunda.Checked := false;
  chkTerca.Checked := false;
  chkQuarta.Checked := false;
  chkQuinta.Checked := false;
  chkSexta.Checked := false;
  edtDiaPagamento.Clear;   }
end;

procedure TfrmAgendamentos.limpaHorariosTela;
begin
  if assigned(panelList) then  
    panelList.Free;

  panelList := TObjectList<TPanel>.Create;
end;

procedure TfrmAgendamentos.limpaServicosTela;
begin
 { MostraServico1.btnLimpa.Click;
  MostraServico2.btnLimpa.Click;
  MostraServico3.btnLimpa.Click;
  MostraServico4.btnLimpa.Click;
  MostraServico5.btnLimpa.Click;}
end;

function TfrmAgendamentos.marcaHorario :boolean;
var SPA :TSPA;
begin
  try
    SPA := TSPA.Create;
    SPA.Data            := calendario.Date;
  //  SPA.Hora            := StrToTime(speHoras.Text+':'+speMinutos.Text+':00');
    SPA.ID_Pessoa       := BuscaPessoa1.Pessoa.ID;
    SPA.ID_Departamento := BuscaDepartamento1.Departamento.ID;
    SPA.ID_Profissional := BuscaProfissional.Pessoa.ID;

 {   if assigned(MostraServico1.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico1.TabelaPreco.ID, MostraServico1.tempoServico);
    if assigned(MostraServico2.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico2.TabelaPreco.ID, MostraServico2.tempoServico);
    if assigned(MostraServico3.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico3.TabelaPreco.ID, MostraServico3.tempoServico);
    if assigned(MostraServico4.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico4.TabelaPreco.ID, MostraServico4.tempoServico);
    if assigned(MostraServico5.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico5.TabelaPreco.ID, MostraServico5.tempoServico);
                                                                                   }
    SPA.Save;

    insereHorarioGrid(SPA);
    habilitaMarcacao(false);
    limpaServicosTela;
    fisioEsteticaClick(nil);
  finally
    FreeAndNil(SPA);
  end;
end;

procedure TfrmAgendamentos.marcaHorarioPilates;
begin      
  if cdsHorarios.Locate('DIA_SEMANA',TUtilitario.diaSemanaExtenso(calendario.Date),[]) then
  begin
    cdsHorarios.Edit;
    cdsHorariosDATA.AsDateTime := calendario.Date;
  //  cdsHorariosHORA.AsDateTime := StrToTime(speHoras.Text+':'+speMinutos.Text+':00');
    cdsHorarios.Post;
    
    if cdsHorarios.RecordCount > 1 then
      preencheHorariosRestantes;
      
    MessageDlg('Horário(s) criado(s) com sucesso.', mtInformation,[mbOk],0);
  end;  

  habilitaMarcacao(false);
  //btnSalvarHorarios.Enabled := true;
end;

procedure TfrmAgendamentos.carregaDadosAluno;
begin
{  chkSegunda.Checked := BuscaPessoa1.Pessoa.AlunoPilates.Segunda = 'X';
  chkTerca.Checked   := BuscaPessoa1.Pessoa.AlunoPilates.Terca = 'X';
  chkQuarta.Checked  := BuscaPessoa1.Pessoa.AlunoPilates.Quarta = 'X';
  chkQuinta.Checked  := BuscaPessoa1.Pessoa.AlunoPilates.Quinta = 'X';
  chkSexta.Checked   := BuscaPessoa1.Pessoa.AlunoPilates.Sexta = 'X';
  edtDiaPagamento.asInteger := BuscaPessoa1.Pessoa.AlunoPilates.DiaPagamento;   }
end;

procedure TfrmAgendamentos.carregarHorariosCliente;
var Horario  :TSPA;
    Horarios :TObjectList<TSPA>;
begin
 try
   limpaDadosAluno;
   if (BuscaPessoa1.Pessoa.ClienteMensal.isLoaded) and (BuscaDepartamento1.Departamento.Departamento = 'PILATES') then
     carregaDadosAluno;

   Horario  := TSPA.Create;
   Horarios := Horario.Horarios(BuscaPessoa1.Pessoa.ID, BuscaDepartamento1.Departamento.ID,'');

   mostrarHorariosCliente(Horarios);
 finally
   FreeAndNil(Horario);
   FreeAndNil(Horarios);
 end;
end;

procedure TfrmAgendamentos.carregarHorariosDia;
var Horario  :TSPA;
    Horarios :TObjectList<TSPA>;
begin
 try
   lbHorarios.Caption := 'Horários '+BuscaDepartamento1.Departamento.departamento+' - dia '+DateToStr(calendario.Date)
                                    +'   ('+TUtilitario.diaSemanaExtenso(calendario.Date)+')';
   Horario  := TSPA.Create;
   Horarios := Horario.LoadList<TSPA>('WHERE DATA = '''+FormatDateTime('dd.mm.yyyy', calendario.Date)+''' '+
                                      'and ID_DEPARTAMENTO = '+IntToStr(BuscaDepartamento1.Departamento.ID)+
                                      'and ID_PROFISSIONAL = '+IntToStr(BuscaProfissional.Pessoa.ID)+
                                      ' order by HORA');

   mostrarHorariosDia(Horarios);
 finally
   FreeAndNil(Horario);
   FreeAndNil(Horarios);
 end;
end;

procedure TfrmAgendamentos.carregarHorariosMensal;
var Cliente  :TClienteMensal;
    Clientes :TObjectList<TClienteMensal>;
begin
 try
   lbHorarios.Caption := 'Horários '+BuscaDepartamento1.Departamento.departamento+' ('+rgpDiasSemana.Items[rgpDiasSemana.ItemIndex]+')';
   Cliente  := TClienteMensal.Create;
   Clientes := Cliente.LoadList<TClienteMensal>('WHERE ID_PROFISSIONAL = '+intToStr(BuscaProfissional.Pessoa.ID));

   mostrarHorariosMensal(Clientes);

   habilitaMarcacao(true);
 finally
   FreeAndNil(Cliente);
   FreeAndNil(Clientes);
 end;
end;

procedure TfrmAgendamentos.chkSegundaClick(Sender: TObject);
begin
   adicionaRemoveHorario(TCheckBox(Sender));
end;

procedure TfrmAgendamentos.configuraTela;
begin
{  if BuscaDepartamento1.Departamento.Departamento = 'PILATES' then
  begin
    lbHorarioDia.Caption      := 'Horários';
    lbDiaSemana.Visible       := false;
    pnlServicos.Visible       := false;
  //  pnlDiasSemana.Visible     := true;
  //  pnlDiasSemana.Align       := alBottom;
    lbCalendario.Caption      := 'Filtro aulas do dia';
    lbHorarioMarcado.Caption  := 'Horário da aula';
    calendario.OnClick        := pilatesClick;
    rgpDiasSemana.Visible     := true;
    rgpDiasSemana.ItemIndex   := 0;
    btnSalvarHorarios.Visible := true;
//    btnAddServico.Visible     := false;
  end
  else
  begin
    lbHorarioDia.Caption      := 'Horários do dia';
    lbDiaSemana.Visible       := true;
    pnlServicos.Visible       := true;
 //   pnlDiasSemana.Visible     := false;
    lbCalendario.Caption      := 'Selecione a data desejada';
    lbHorarioMarcado.Caption  := 'Horários marcados';
    calendario.OnClick        := fisioEsteticaClick;
    rgpDiasSemana.Visible     := false;
    btnSalvarHorarios.Visible := false;
 //   btnAddServico.Visible     := true;
  end;

  gpbHorario.Caption       := '            Horário '+IfThen(BuscaDepartamento1.Departamento.Departamento = 'PILATES', 'da aula',
                                                 IfThen(BuscaDepartamento1.Departamento.Departamento = 'FISIOTERAPIA', 'da sessão',
                                                                                                                      'do procedimento'));
                                                                                                                      }
end;

procedure TfrmAgendamentos.criaHorarioDiario;
begin
  frmCriaHorarioDiario := TfrmCriaHorarioDiario.create(self, BuscaProfissional.Pessoa,
                                                             BuscaPessoa1.Pessoa,
                                                             BuscaDepartamento1.Departamento,
                                                             BuscaConvenio1.Convenio);
  frmCriaHorarioDiario.Show;
//  frmCriaHorarioDiario.Release;
//  frmCriaHorarioDiario := nil;
end;

procedure TfrmAgendamentos.criaHorarioMensal;
begin
  frmCriaHorarioMensal := TfrmCriaHorarioMensal.create(self, BuscaProfissional.Pessoa,
                                                             BuscaPessoa1.Pessoa,
                                                             BuscaDepartamento1.Departamento,
                                                             BuscaConvenio1.Convenio);
  frmCriaHorarioMensal.Show;
//  frmCriaHorarioMensal.Release;
//  frmCriaHorarioMensal := nil;
end;

{
procedure TfrmAgendamentos.dbgHorariosDiaDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
    if not (gdSelected in State) then
      begin
      TDBGrid(Sender).Canvas.Brush.Color := $00EEF3E2;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).DefaultDrawDataCell(rect,Column.Field,state);
    end;
end;         }

procedure TfrmAgendamentos.DBGrid1Enter(Sender: TObject);
begin
  //btnCancelarHorario.Enabled := not cdsHorarios.IsEmpty;
end;

procedure TfrmAgendamentos.defineHorarioMinMax;
var hora :TTime;
begin
{  min1 :=  TUtilitario.dataParaMinutos(FPrimeiroHorarioDia);
  min2 :=  TUtilitario.dataParaMinutos(FUltimoHorarioDia);
  showmessage(intToStr(trunc((min2-min1)/TUtilitario.dataParaMinutos(BuscaTabelaPreco1.TabelaPreco.Servico.Duracao))));
}

  hora := FPrimeiroHorarioDisponivel;

  if (calendario.Date = date) and (FPrimeiroHorarioDisponivel < time) then
    hora := time;

  setaHorario(hora);
end;

function TfrmAgendamentos.diaSemanaPreSelecionado(data:TDateTime): Boolean;
var diaExtenso :String;
begin
  diaExtenso := TUtilitario.diaSemanaExtenso(data);
  result     := pos(diaExtenso, diasSemanaSelecionados) > 0;
end;

function TfrmAgendamentos.diasSemanaSelecionados: String;
begin
{  result := result +IfThen(chkSegunda.Checked, 'ou "SEGUNDA-FEIRA" ');
  result := result +IfThen(chkTerca.Checked, 'ou "TERÇA-FEIRA" ');
  result := result +IfThen(chkQuarta.Checked, 'ou "QUARTA-FEIRA" ');
  result := result +IfThen(chkQuinta.Checked, 'ou "QUINTA-FEIRA" ');
  result := result +IfThen(chkSexta.Checked, 'ou "SEXTA-FEIRA" ');
  result := TRIM('('+copy(result,4,length(result))+')');         }
end;

function TfrmAgendamentos.servicoAdicionado(servico: TServico): boolean;
begin
  result := true;

 { if (assigned(MostraServico1.TabelaPreco) and (MostraServico1.TabelaPreco.Servico.ID = servico.ID)) or
     (assigned(MostraServico2.TabelaPreco) and (MostraServico2.TabelaPreco.Servico.ID = servico.ID)) or
     (assigned(MostraServico3.TabelaPreco) and (MostraServico3.TabelaPreco.Servico.ID = servico.ID)) or
     (assigned(MostraServico4.TabelaPreco) and (MostraServico4.TabelaPreco.Servico.ID = servico.ID)) or
     (assigned(MostraServico5.TabelaPreco) and (MostraServico5.TabelaPreco.Servico.ID = servico.ID)) then
    MessageDlg('Serviço '+BuscaTabelaPreco1.TabelaPreco.Servico.Servico+' já foi adicionado', mtInformation,[mbOk],0)
  else
    result := false;   }
end;

procedure TfrmAgendamentos.setaHorario(horario: TTime);
var minutos :integer;
begin
  minutos := strToInt(copy(formatDateTime('hh:mm',horario),4,2));

  if (minutos mod 10) <> 0 then
  begin
    horario := horario + StrToTime('00:'+ '0'+intToStr((10-(minutos mod 10)))+':00');
    minutos := strToInt(copy(formatDateTime('hh:mm',horario),4,2));
  end;

  //speHoras.Text   := formatDateTime('hh',horario);

  //speMinutos.Text := intToStr(minutos);
end;

procedure TfrmAgendamentos.speHorasChange(Sender: TObject);
var horarioInformado :TTime;
begin
{  horarioInformado := strToTime(speHoras.Text+':'+speMinutos.Text);

  if horarioInformado < FPrimeiroHorarioDisponivel then
    setaHorario(FPrimeiroHorarioDisponivel)
  else if horarioInformado > FUltimoHorarioDisponivel then
    setaHorario(FUltimoHorarioDisponivel);
  }
end;

procedure TfrmAgendamentos.speHorasEnter(Sender: TObject);
begin
  TSpinEdit(Sender).SelectAll;
end;

procedure TfrmAgendamentos.speHorasExit(Sender: TObject);
begin
  //speHoras.Text   := FormatFloat('00', speHoras.Value);
end;

procedure TfrmAgendamentos.speMinutosExit(Sender: TObject);
begin
 // speMinutos.Text := FormatFloat('00', speMinutos.Value);
end;

function TfrmAgendamentos.tempoServicosSelecionados: TTime;
begin
  result := 0;
{  if assigned(MostraServico1.TabelaPreco) then
    result := result + MostraServico1.TempoServico;
  if assigned(MostraServico2.TabelaPreco) then
    result := result + MostraServico2.TempoServico;
  if assigned(MostraServico3.TabelaPreco) then
    result := result + MostraServico3.TempoServico;
  if assigned(MostraServico4.TabelaPreco) then
    result := result + MostraServico4.TempoServico;
  if assigned(MostraServico5.TabelaPreco) then
    result := result + MostraServico5.TempoServico;      }
end;

procedure TfrmAgendamentos.Timer1Timer(Sender: TObject);
begin
 // if (time > StrToTime(speHoras.Text+':'+speMinutos.Text+':00')) then
    setaHorario(time);
end;

function TfrmAgendamentos.valorServicosSelecionados: Real;
begin
  result := 0;
{  if assigned(MostraServico1.TabelaPreco) then
    result := result + MostraServico1.valorServico;
  if assigned(MostraServico2.TabelaPreco) then
    result := result + MostraServico2.valorServico;
  if assigned(MostraServico3.TabelaPreco) then
    result := result + MostraServico3.valorServico;
  if assigned(MostraServico4.TabelaPreco) then
    result := result + MostraServico4.valorServico;
  if assigned(MostraServico5.TabelaPreco) then
    result := result + MostraServico5.valorServico;    }
end;

function TfrmAgendamentos.verificaObrigatorios: boolean;
begin
  result := false;

  if not assigned(BuscaProfissional.Pessoa) or (BuscaProfissional.Pessoa.ID = 0) then
  begin
    MessageDlg('Profissional precisa ser informado.', mtInformation,[mbOk],0);
    BuscaProfissional.edtCodigo.SetFocus;
  end
  else if not assigned(BuscaPessoa1.Pessoa) or (BuscaPessoa1.Pessoa.ID = 0) then
  begin
    MessageDlg(BuscaPessoa.titulo+' precisa ser informado.', mtInformation,[mbOk],0);
    BuscaPessoa1.edtCodigo.SetFocus;
  end
  else
    result := true;

end;

procedure TfrmAgendamentos.zeraTela;
begin
  limpaHorariosTela;
  cdsHorarios.EmptyDataSet;
  cdsHorariosDia.EmptyDataSet;
  calendario.Enabled := false;
  habilitaMarcacao(false);
  //btnCancelarHorario.Enabled := false;
  BuscaProfissional.limpa;
  BuscaPessoa1.limpa;
 // BuscaConvenio1.limpa;
 // BuscaTabelaPreco1.limpa;
 // edtTempoDuracao.Clear;
 // lbDiaSemana.Left := 260;
end;

procedure TfrmAgendamentos.calendarioClick(Sender: TObject);
begin
  limpaHorariosTela;
  carregarHorariosDia;
end;

end.

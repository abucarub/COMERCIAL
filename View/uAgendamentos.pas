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
  frameBuscaDepartamento, frameMostraServico, Servico, Vcl.AppEvnts, ClienteMensal, Vcl.Menus, System.ImageList, Vcl.ImgList;

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
    rgpDiasSemana: TRadioGroup;
    StaticText1: TStaticText;
    gpbCalendario: TGroupBox;
    calendario: TJvMonthCalendar;
    btnCriaHorario: TBitBtn;
    BuscaConvenio1: TBuscaConvenio;
    pupUpOpcoes: TPopupMenu;
    ImageList: TImageList;
    popCancelarHorario: TMenuItem;
    popCompareceu: TMenuItem;
    popFaltou: TMenuItem;
    popReposicao: TMenuItem;
    GroupBox1: TGroupBox;
    Shape1: TShape;
    Shape2: TShape;
    Label3: TLabel;
    pnlTopo: TPanel;
    Panel1: TPanel;
    lbHorarios: TLabel;
    Image5: TImage;
    Label1: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Label35: TLabel;
    Label36: TLabel;
    lbProfissional: TLabel;
    Label34: TLabel;
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
    Panel3: TPanel;
    Image1: TImage;
    Label37: TLabel;
    Label38: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnCriaHorarioClick(Sender: TObject);
    procedure BuscaDepartamento1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure speHorasEnter(Sender: TObject);
   // procedure dbgHorariosDiaDrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
//      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BuscaProfissionalExit(Sender: TObject);
    procedure BuscaDepartamento1edtDepartamentoChange(Sender: TObject);
    procedure rgpDiasSemanaClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure calendarioClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure BuscaProfissionaledtNomeChange(Sender: TObject);

    procedure SpeedButtonClick(Sender: TObject);
    procedure popCancelarHorarioClick(Sender: TObject);
    procedure popFaltouClick(Sender: TObject);
    procedure popCompareceuClick(Sender: TObject);
    procedure popReposicaoClick(Sender: TObject);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Panel2MouseEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FIDHorarioSelecionado :Integer;
    FIDPessoa :Integer;
    FHoraMarcadaEmMinutos :Integer;
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
    function existeHorarioCriado(horario :TSPA) :boolean;

    procedure carregarHorariosCliente;
    procedure defineHorarioMinMax;
    procedure setaHorario(horario :TTime);
    procedure adicionaServicoHorario(Horario :TSPA; ID_TabelaPreco :integer; tempoServico :TTime);
    procedure cancelaHorarioCriado;
    procedure cancelaHorarioMensal;
    procedure criaHorarioCancelado;
    procedure cancelaHorarioPilates;
    procedure alteraStatusHorario(compareceu :String);
    procedure cancela(idHorario :integer);
    procedure zeraTela;
    procedure configuraTela;

    function diasSemanaSelecionados :String;
    function diaSemanaPreSelecionado(data:TDateTime) :Boolean;
    function verificaObrigatorios :boolean;
    function informacoesFornecidas :boolean;
    
  public
    { Public declarations }
  end;

var
  frmAgendamentos: TfrmAgendamentos;

implementation

uses Utilitario, TipoPessoa, ServicoAgendado, uCriaHorarioDiario, uCriaHorarioMensal, Math, uCriaReposicaoHorario,
     uCadastroClientes, uContasHorarios;

{$R *.dfm}

procedure TfrmAgendamentos.adicionaServicoHorario(Horario: TSPA; ID_TabelaPreco :integer; tempoServico :TTime);
var servicoAgendado :TServicoAgendado;
begin
  servicoAgendado                := TServicoAgendado.Create;
  servicoAgendado.ID_SPA         := Horario.ID;
  servicoAgendado.ID_TabelaPreco := ID_TabelaPreco;
  servicoAgendado.duracao        := tempoServico;

  Horario.ServicosAgendados.Add(ServicoAgendado);
end;

procedure TfrmAgendamentos.alteraStatusHorario(compareceu: String);
var horario :TSPA;
    servicoAgendado :TServicoAgendado;
    gera_conta :Boolean;
begin
  try
  try
    horario := TSPA.Create;

    if FIDHorarioSelecionado > 0 then
      horario.Load(FIDHorarioSelecionado)
    else
    begin
      horario.ID_Pessoa       := FIDPessoa;
      horario.ID_Departamento := BuscaDepartamento1.Departamento.ID;
      horario.ID_Profissional := BuscaProfissional.Pessoa.ID;
      horario.data            := calendario.Date;
      horario.hora            := TUtilitario.minutosParaHora(FHoraMarcadaEmMinutos);

      servicoAgendado         := nil;
      servicoAgendado         := TServicoAgendado.Create;
      servicoAgendado.ID_TabelaPreco := TClienteMensal.getIDTabelaPrecoClienteMensal(FIDPessoa, horario.ID_Departamento, horario.ID_Profissional);
      servicoAgendado.duracao := BuscaDepartamento1.Departamento.Servicos.Items[0].Duracao;
      horario.ServicosAgendados.Add(servicoAgendado);
    end;

    if confirma('Deseja alterar o status do horário para "'+IfThen(compareceu='S','COMPARECEU','FALTOU')+'"?') then
    begin
      horario.compareceu := compareceu;

      gera_conta := (compareceu = 'S');// or (confirma('Deseja gerar conta para esta falta?'));

      horario.geraConta := IfThen(gera_conta,'S','N');

      horario.Save;
      avisar('Status alterado com sucesso!');

      if gpbCalendario.Visible then
        calendarioClick(nil);
     { else
        rgpDiasSemanaClick(nil); }
    end;

  finally
    FreeAndNil(horario);
  end;
  Except
    on e:Exception do
      raise Exception.Create('Erro ao cancelar horário');
  end;
end;

procedure TfrmAgendamentos.BitBtn1Click(Sender: TObject);
begin
  frmContasHorarios := TfrmContasHorarios.Create(nil);
  frmContasHorarios.Showmodal;
  frmContasHorarios.Release;
  frmContasHorarios := nil;
end;

procedure TfrmAgendamentos.BitBtn2Click(Sender: TObject);
begin
  frmCadastroClientes := TfrmCadastroClientes.Create(nil);
  frmCadastroClientes.Showmodal;
  frmCadastroClientes.Release;
  frmCadastroClientes := nil;
end;

procedure TfrmAgendamentos.btnCriaHorarioClick(Sender: TObject);
begin
  if not informacoesFornecidas then
    exit;
  if BuscaDepartamento1.Departamento.tipoHorarios = 'D' then
    criaHorarioDiario
  else
    criaHorarioMensal;
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
{  if assigned(BuscaDepartamento1.Departamento) then
  begin
    gpbCalendario.Visible := BuscaDepartamento1.Departamento.tipoHorarios = 'D'; {Diário}
//    rgpDiasSemana.Visible := BuscaDepartamento1.Departamento.tipoHorarios = 'M'; {Mensal}
//  end;
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
    {if (BuscaDepartamento1.Departamento.tipoHorarios = 'M') and assigned(BuscaDepartamento1.Departamento) then
      rgpDiasSemanaClick(nil)
    else if (BuscaDepartamento1.Departamento.tipoHorarios = 'D') and assigned(BuscaDepartamento1.Departamento) then}
      calendarioClick(nil);
  end
  else
  begin
    calendario.Enabled := false;
    rgpDiasSemana.Enabled := false;
    if cdsHorariosDia.active then
      cdsHorariosDia.EmptyDataSet;
  end;
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
       (panelCriado.Top < (panel.Top + panel.Height )))
    or (((panelCriado.Top + panelCriado.Height) > panel.Top) and
       ((panelCriado.Top + panelCriado.Height) <= (panel.Top + panel.Height ))) then
    result := panel.Left + panel.Width + 5;
    
  end;

end;

function TfrmAgendamentos.calculaTopHorario(horario: TSPA): integer;
var diferencaHorarios :TTime;
begin
  diferencaHorarios := horario.hora - FPrimeiroHorarioDia;
  result            := TUtilitario.horaParaMinutos(diferencaHorarios)+9;
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

procedure TfrmAgendamentos.cancelaHorarioCriado;
var horario :TSPA;
begin
  try
  try
    horario := TSPA.Create;
    horario.Load(FIDHorarioSelecionado);

    if confirma('Deseja realmente cancelar o horário de "'+horario.Pessoa.Nome+'",'+#13#10+
                'marcado para o dia '+DateToStr(horario.data)+' às '+ TimeToStr(horario.hora)+'?') then
    begin
      horario.tipo := 'C';
      horario.Save;
      avisar('Horário cancelado com sucesso!');
      calendarioClick(nil);
    end;

  finally
    FreeAndNil(horario);
  end;
  Except
    on e:Exception do
      raise Exception.Create('Erro ao cancelar horário');
  end;
end;

procedure TfrmAgendamentos.cancelaHorarioMensal;
begin
  if FIDHorarioSelecionado > 0 then
    cancelaHorarioCriado
  else
    criaHorarioCancelado;
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
    btnOpcoes         :TSpeedButton;
    imagem            :TImage;
    panel             :TPanel;
begin
  {cria panel horario}
  panel        := TPanel.Create(self);
  panel.Visible := false;
  panel.Name   := 'pnlHr'+intToStr(horario.ID)+IfThen(horario.ID = 0,intToStr(panelList.Count)+'c','');

  panel.Tag    := IfThen(horario.ID = 0, horario.ID_Pessoa, 0);
  panel.Parent := pnlHorarios;
  panel.Top    := calculaTopHorario(horario);
  panel.Left   := calculaLeftHorario( panel);
  panel.Height := TUtilitario.horaParaMinutos(horario.duracaoServicos);
  panel.Width  := 220;
  panel.Repaint;
  panel.BevelOuter := bvNone;
  panel.BevelKind  := bkFlat;
  panel.Caption    := '';

  {cria label hora consulta}
  labelHoraConsulta             := TLabel.Create(self);
  labelHoraConsulta.Parent      := panel;
  labelHoraConsulta.Caption     := TimeToStr(horario.hora)+' às '+TimeToStr(horario.hora+horario.duracaoServicos);
  labelHoraConsulta.Align       := alTop;
  labelHoraConsulta.AutoSize    := false;
  labelHoraConsulta.Alignment   := taCenter;
  labelHoraConsulta.Transparent := false;
  labelHoraConsulta.Height      := 13;
  if horario.tipo = 'C' then
    labelHoraConsulta.Color       := $007DABFF
  else if horario.tipo = 'R' then
    labelHoraConsulta.Color       := $00CD3096
  else
    labelHoraConsulta.Color       := $00BCB485;

  if horario.tipo <> 'R' then
  begin
    if horario.compareceu = 'S' then
      labelHoraConsulta.Color       := $0032B67D
    else if horario.compareceu = 'N' then
      labelHoraConsulta.Color       := $00242CB0;
  end;

  labelHoraConsulta.Font.Color  := clWhite;
  labelHoraConsulta.Font.Name  := 'Lucida Console';
  labelHoraConsulta.Font.Size  := 8; 
  labelHoraConsulta.Font.Style := [fsBold];

  { cria shape de fundo }  
  shapeFundo              := TShape.Create(self);
  shapeFundo.Parent       := panel;

  if horario.tipo = 'C' then
    shapeFundo.Brush.Color  := $00D9E6FF
  else
    shapeFundo.Brush.Color  := $00ECEFCF;
  shapeFundo.Pen.Style    := psClear;
  shapefundo.Align        := alClient;

  {cria label nome cliente}
  labelNomeCliente             := TLabel.Create(self);
  labelNomeCliente.Parent      := panel;
  labelNomeCliente.Caption     := horario.Pessoa.Nome;
//  labelNomeCliente.Align       := alBottom;
//  labelNomeCliente.AutoSize    := false;
  labelNomeCliente.Color       := $00ECEFCF;    
  labelNomeCliente.Alignment   := taCenter;
  labelNomeCliente.Height      := 14;
  labelNomeCliente.Font.Name   := 'Calibri Light';
 // labelNomeCliente.Font.Style  := [fsBold];
  labelNomeCliente.Font.Color  := $003C3C3C;
  labelNomeCliente.Font.Size   := 9;
  labelNomeCliente.Left        := 3;
  labelNomeCliente.Top         := trunc(panel.Height / 2);

  {cria botão de opções}
  btnOpcoes           := TSpeedButton.Create(self);
  ImageList.GetBitmap(0,btnOpcoes.Glyph);
  btnOpcoes.Parent    := panel;
  btnOpcoes.Left      := panel.Width-btnOpcoes.Width-2;
  btnOpcoes.Top       := panel.Height-btnOpcoes.Height-2;
  btnOpcoes.OnClick   := SpeedButtonClick;
  btnOpcoes.Tag       := TUtilitario.horaParaMinutos(horario.hora);
  btnOpcoes.Flat      := true;

  panel.Visible := true;
  panelList.Add(panel);
{  if (horario.compareceu <> '') then
  begin
    imagem := TImage.Create(self);
    ImageList.GetBitmap( IfThen(horario.tipo = 'R',5, IfThen(horario.compareceu = 'S',1,2)),imagem.Picture.Bitmap );
    imagem.Parent := panelList.Items[panelList.Count-1];
    imagem.Left   := 0;
    imagem.Top    := 0;
    imagem.Height := 16;
    imagem.Width  := 16;
  end;   }

end;

procedure TfrmAgendamentos.mostrarHorariosDia(horarios: TObjectList<TSPA>);
var
   horario :TSPA;
begin
  if not assigned(horarios) then
    exit;

  for horario in horarios do
     mostraHorarioTela(horario);
end;

procedure TfrmAgendamentos.mostrarHorariosMensal(clientes: TObjectList<TClienteMensal>);
var horario :TSPA;
    cliente :TClienteMensal;
    servicoAgendado :TServicoAgendado;
begin
  if not assigned(clientes) or (clientes.count <= 0) then
    exit;

  for cliente in clientes do
  begin
    horario := TSPA.Create;
    horario.ID              := 0;
    horario.ID_Departamento := BuscaDepartamento1.Departamento.ID;
    horario.ID_Pessoa       := cliente.ID_Pessoa;
    horario.ID_Profissional := BuscaProfissional.Pessoa.ID;
    horario.data            := calendario.Date;

    case dayOfWeek(calendario.date)-1 of
      1 :  horario.hora := cliente.Segunda;
      2 :  horario.hora := cliente.Terca;
      3 :  horario.hora := cliente.Quarta;
      4 :  horario.hora := cliente.Quinta;
      5 :  horario.hora := cliente.Sexta;
      6 :  horario.hora := cliente.Sabado;
      7 :  horario.hora := cliente.Domingo;
    end;

    servicoAgendado         := nil;
    servicoAgendado         := TServicoAgendado.Create;
    servicoAgendado.duracao := BuscaDepartamento1.Departamento.Servicos.Items[0].Duracao;
    horario.ServicosAgendados.Add(servicoAgendado);

    if horario.hora > 0 then
      {se nao existe um horario criado para aquele dia horario dept. prof. e pessoa, aí mostra o reservado(fictício)}
      if not existeHorarioCriado(horario) then
        mostraHorarioTela(horario);

    FreeAndNil(horario);
  end;
end;
 tratar para nao gerar horario ficticio antes de data de inicio
 diminuir fonte grid tela contas
 corrigir relatorio contas receber

procedure TfrmAgendamentos.Panel2MouseEnter(Sender: TObject);
begin
  inherited;
  if ActiveControl = ScrollBox1 then
    BuscaDepartamento1.edtCodigo.SetFocus;
end;

procedure TfrmAgendamentos.popCancelarHorarioClick(Sender: TObject);
begin
  if confirma('Confirma cancelamento do horário?') then
  begin
    if BuscaDepartamento1.Departamento.tipoHorarios = 'D' then
      cancelaHorarioCriado
    else
      cancelaHorarioMensal;
  end;
end;

procedure TfrmAgendamentos.popCompareceuClick(Sender: TObject);
begin
   alteraStatusHorario('S');
end;

procedure TfrmAgendamentos.rgpDiasSemanaClick(Sender: TObject);
begin
  limpaHorariosTela;
  carregarHorariosMensal;
end;

procedure TfrmAgendamentos.calendarioClick(Sender: TObject);
var dataSelecionada, dataHoje :TDate;
begin
  dataSelecionada        := calendario.Date;
  dataHoje               := Date;
  btnCriaHorario.Enabled := dataSelecionada >= dataHoje;

  limpaHorariosTela;
  carregarHorariosDia;

  if BuscaDepartamento1.Departamento.tipoHorarios = 'M' then
    carregarHorariosMensal;
end;

procedure TfrmAgendamentos.ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
var movimento :integer;
begin
  with TScrollBox(Sender).VertScrollBar do
  begin
      movimento := TScrollBox(Sender).VertScrollBar.Position - Increment;
      //Image1.Top                                  := IfThen(movimento < 0, 0, movimento);
      TScrollBox(Sender).VertScrollBar.Position   := TScrollBox(Sender).VertScrollBar.Position - Increment;
  end;
end;

procedure TfrmAgendamentos.ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
var movimento :integer;
begin
  with TScrollBox(Sender).VertScrollBar do
  begin
      movimento  := TScrollBox(Sender).VertScrollBar.Position + Increment;
     // Image1.Top := IfThen(movimento > 302, 302, movimento);
      TScrollBox(Sender).VertScrollBar.Position := TScrollBox(Sender).VertScrollBar.Position + Increment;
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
  calendario.Date            := Date;
  self.DoubleBuffered        := True;
  pnlHorarios.DoubleBuffered := true;
  pnlCorpo.DoubleBuffered    := true;
  ScrollBox1.DoubleBuffered  := true;
end;

procedure TfrmAgendamentos.FormDestroy(Sender: TObject);
begin
  inherited;
  if assigned(panelList) then
    panelList.Free;  
end;

procedure TfrmAgendamentos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var x :TPoint;
    var handle :Boolean;
begin
  if (key = VK_Escape) and (assigned(frmCriaHorarioDiario) or assigned(frmCriaHorarioMensal) or assigned(frmCriaReposicaoHorario)) then
    key := 0;

  inherited;

  if key = 40 then
    ScrollBox1MouseWheelDown(ScrollBox1, Shift, x, handle)
  else if key = 38 then
    ScrollBox1MouseWheelUp(ScrollBox1, Shift, x, handle);
end;

procedure TfrmAgendamentos.FormShow(Sender: TObject);
begin
  BuscaDepartamento1.edtCodigo.SetFocus;
end;

procedure TfrmAgendamentos.Image3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
 if not (screen.ActiveControl = scrollbox1) then
    scrollbox1.SetFocus;
end;

function TfrmAgendamentos.informacoesFornecidas: boolean;
begin
  result := false;

  if BuscaDepartamento1.edtDepartamento.Text = '' then
  begin
    avisar('O departamento deve ser selecionado');
    BuscaDepartamento1.edtCodigo.SetFocus;
  end
  else if BuscaProfissional.edtNome.Text = '' then
  begin
    avisar('O profissional deve ser selecionado');
    BuscaProfissional.edtCodigo.SetFocus;
  end
  else if BuscaPessoa1.edtNome.Text = '' then
  begin
    avisar('A pessoa deve ser selecionada');
    BuscaPessoa1.edtCodigo.SetFocus;
  end
  else if BuscaConvenio1.edtConvenio.Text = '' then
  begin
    avisar('O convênio deve ser selecionado');
    BuscaConvenio1.edtCodigo.SetFocus;
  end
  else
    result := true;
end;

procedure TfrmAgendamentos.limpaHorariosTela;
begin
  if assigned(panelList) then  
    panelList.Free;

  panelList := TObjectList<TPanel>.Create;
end;

procedure TfrmAgendamentos.popReposicaoClick(Sender: TObject);
var horario :TSPA;
begin
  horario := TSPA.Create;
  horario.Load(FIDHorarioSelecionado);
  frmCriaReposicaoHorario      := TfrmCriaReposicaoHorario.create(self, horario);
  frmCriaReposicaoHorario.left := self.Width - frmCriaReposicaoHorario.Width -2;
  frmCriaReposicaoHorario.Top  := 2;
  frmCriaReposicaoHorario.Show;
end;

procedure TfrmAgendamentos.carregarHorariosCliente;
var Horario  :TSPA;
    Horarios :TObjectList<TSPA>;
begin
 try
{   limpaDadosAluno;
   if (BuscaPessoa1.Pessoa.ClienteMensal.isLoaded) and (BuscaDepartamento1.Departamento.Departamento = 'PILATES') then
     carregaDadosAluno;

   Horario  := TSPA.Create;
   Horarios := Horario.Horarios(BuscaPessoa1.Pessoa.ID, BuscaDepartamento1.Departamento.ID,'');

   mostrarHorariosCliente(Horarios); }
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
   lbHorarios.Caption       := BuscaDepartamento1.Departamento.departamento+' - '+DateToStr(calendario.Date)
                               +'   ('+TUtilitario.diaSemanaExtenso(calendario.Date)+')';
   lbProfissional.Caption   := BuscaProfissional.Pessoa.Nome;
   Horario  := TSPA.Create;
   Horarios := Horario.LoadList<TSPA>('WHERE DATA = '''+FormatDateTime('dd.mm.yyyy', calendario.Date)+''' '+
                                      ' and ID_DEPARTAMENTO = '+IntToStr(BuscaDepartamento1.Departamento.ID)+
                                      ' and ID_PROFISSIONAL = '+IntToStr(BuscaProfissional.Pessoa.ID)+
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
   lbHorarios.Caption := BuscaDepartamento1.Departamento.departamento+' ('+TUtilitario.diaSemanaExtenso(calendario.Date)+')';
   Cliente  := TClienteMensal.Create;
   Clientes := Cliente.LoadList<TClienteMensal>('WHERE ID_PROFISSIONAL = '+intToStr(BuscaProfissional.Pessoa.ID));

   mostrarHorariosMensal(Clientes);

 finally
   FreeAndNil(Cliente);
   FreeAndNil(Clientes);
 end;
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

procedure TfrmAgendamentos.criaHorarioCancelado;
var horario :TSPA;
    agendado :TServicoAgendado;
begin
  try
    horario                 := TSPA.Create;
    horario.ID_Pessoa       := FIDPessoa;
    horario.ID_Departamento := BuscaDepartamento1.Departamento.ID;
    horario.ID_Profissional := BuscaProfissional.Pessoa.ID;
    horario.data            := calendario.Date;
    horario.hora            := TUtilitario.minutosParaHora(FHoraMarcadaEmMinutos);
    horario.tipo            := 'C';

    agendado                := TServicoAgendado.Create;
    agendado.ID_TabelaPreco := TClienteMensal.getIDTabelaPrecoClienteMensal(FIDPessoa, horario.ID_Departamento, horario.ID_Profissional);
    agendado.duracao        := BuscaDepartamento1.Departamento.Servicos.Items[0].Duracao;
    horario.ServicosAgendados.Add(agendado);
    horario.Save;
    calendarioClick(nil);
    avisar('Horário cancelado com sucesso!');
  finally
    FreeAndNil(horario);
  end;
end;

procedure TfrmAgendamentos.criaHorarioDiario;
begin
  frmCriaHorarioDiario := TfrmCriaHorarioDiario.create(self, BuscaProfissional.Pessoa,
                                                             BuscaPessoa1.Pessoa,
                                                             BuscaDepartamento1.Departamento,
                                                             BuscaConvenio1.Convenio);

  frmCriaHorarioDiario.left := self.Width - frmCriaHorarioDiario.Width -2;
  frmCriaHorarioDiario.Top  := 2;
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
  frmCriaHorarioMensal.left := self.Width - frmCriaHorarioMensal.Width -2;
  frmCriaHorarioMensal.Top  := 2;
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

function TfrmAgendamentos.existeHorarioCriado(horario: TSPA): boolean;
var horarioCriado :TSPA;
begin
  try
    horarioCriado := nil;
    try
      horarioCriado := horario.LoadList<TSPA>('WHERE ID_PESSOA = '+intToStr(horario.ID_Pessoa)+
                                        '  AND ID_PROFISSIONAL = '+intToStr(horario.ID_Profissional)+
                                        '  AND ID_DEPARTAMENTO = '+intToStr(horario.ID_Departamento)+
                                        '  AND DATA = '+ TUtilitario.dataParaParametro(horario.data)+
                                        '  AND HORA = '+QuotedStr( TimeToStr(horario.hora))).Items[0];
    Except
    end;

    result := assigned(horarioCriado);
  finally
    FreeAndNil(horarioCriado);
  end;
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

procedure TfrmAgendamentos.SpeedButtonClick(Sender: TObject);
var
  pt: TPoint;
  dataConsulta, dataAtual :TDate;
  horarioCriado, faltou, compareceu, cancelado, reposto :Boolean;
  condicaoFaltou, condicaoCompareceu, condicaoCancelar, condicaoReposicao :Boolean;
  horario :TSPA;
begin
  condicaoFaltou     := true;
  condicaoCompareceu := true;
  condicaoCancelar   := true;
  condicaoReposicao  := false;
  FIDHorarioSelecionado := 0;
  FIDPessoa             := 0;
  FHoraMarcadaEmMinutos := TSPeedButton(Sender).Tag;
  dataConsulta          := strToDate(formatDateTime('dd/mm/yyyy',calendario.Date));
  dataAtual             := date;

  {se tag > 0 quer dizer que horario ainda não foi criado na tabela SPA, pois é tipo 'M' e ainda não está no dia dele}
  horarioCriado         := (TSPeedButton(Sender).Parent.Tag = 0);

  if horarioCriado then
  begin
    FIDHorarioSelecionado :=  StrToIntDef( TUtilitario.somenteNumeros(TSPeedButton(Sender).Parent.Name) ,0);
    horario := TSPA.Create;
    horario.Load(FIDHorarioSelecionado);
    faltou     := horario.compareceu = 'N';
    compareceu := horario.compareceu = 'S';
    cancelado  := horario.tipo = 'C';
    reposto    := horario.tipo = 'R';

    condicaoFaltou     := not(faltou) and not(compareceu) and not (cancelado) and not (reposto);
    condicaoCompareceu := not(faltou) and not(compareceu) and not (cancelado) and not (reposto);
    condicaoCancelar   := not(faltou) and not(compareceu) and not (cancelado);
    condicaoReposicao  := cancelado or faltou and not (reposto);
  end
  else
    FIDPessoa             := TSPeedButton(Sender).Parent.Tag;

  popCompareceu.Enabled      := condicaoFaltou and (dataConsulta < dataAtual) or (   (DateToStr(calendario.Date) = DateToStr(date) )
                                               and (TUtilitario.minutosParaHora(FHoraMarcadaEmMinutos)< time));
  popFaltou.Enabled          := condicaoCompareceu and (dataConsulta < dataAtual) or (   (DateToStr(calendario.Date) = DateToStr(date) )
                                                   and (TUtilitario.minutosParaHora(FHoraMarcadaEmMinutos)< time));
  popCancelarHorario.Enabled := condicaoCancelar and ((dataConsulta > dataAtual) or ( (DateToStr(calendario.Date) = DateToStr(date) )
                                                 and (TUtilitario.minutosParaHora(FHoraMarcadaEmMinutos)> time)));

  {só é possivel marcar uma reposição para horários MENSAIS (criados), CANCELADOS ou FALTAS}
  popReposicao.visible       := (BuscaDepartamento1.Departamento.tipoHorarios = 'M');
  popReposicao.Enabled       := condicaoReposicao;

  GetCursorPos(pt);
  pupUpOpcoes.Popup(pt.X, pt.Y);
end;

procedure TfrmAgendamentos.speHorasEnter(Sender: TObject);
begin
  TSpinEdit(Sender).SelectAll;
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
  calendario.Enabled := false;
  //btnCancelarHorario.Enabled := false;
  BuscaProfissional.limpa;
  BuscaPessoa1.limpa;
  lbHorarios.Caption := '...';
  lbProfissional.Caption := '...';
 // BuscaConvenio1.limpa;
 // BuscaTabelaPreco1.limpa;
 // edtTempoDuracao.Clear;
 // lbDiaSemana.Left := 260;
end;

procedure TfrmAgendamentos.popFaltouClick(Sender: TObject);
begin
   alteraStatusHorario('N');
end;

end.

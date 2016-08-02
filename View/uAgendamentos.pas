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
  frameBuscaDepartamento, frameMostraServico, Servico;

type
  TfrmAgendamentos = class(TfrmPadrao)
    cdsHorarios: TClientDataSet;
    cdsHorariosDIA_SEMANA: TStringField;
    dsHorarios: TDataSource;
    Panel1: TPanel;
    gpbHorario: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    speHoras: TSpinEdit;
    speMinutos: TSpinEdit;
    Shape1: TShape;
    dsServicos: TDataSource;
    cdsServicos: TClientDataSet;
    cdsServicosHORARIO: TStringField;
    calendario: TJvMonthCalendar;
    lbCalendario: TLabel;
    cdsHorariosDATA: TDateField;
    cdsHorariosHORA: TTimeField;
    Image1: TImage;
    Image2: TImage;
    btnCriaHorario: TBitBtn;
    Panel2: TPanel;
    BuscaConvenio1: TBuscaConvenio;
    BuscaDepartamento1: TBuscaDepartamento;
    BuscaPessoa1: TBuscaPessoa;
    BuscaTabelaPreco1: TBuscaTabelaPreco;
    Label5: TLabel;
    edtTempoDuracao: TMaskEdit;
    BuscaProfissional: TBuscaPessoa;
    btnAddServico: TBitBtn;
    pnlServicos: TPanel;
    MostraServico1: TMostraServico;
    MostraServico5: TMostraServico;
    MostraServico4: TMostraServico;
    MostraServico3: TMostraServico;
    MostraServico2: TMostraServico;
    btnIncMin: TBitBtn;
    btnDecMin: TBitBtn;
    Splitter1: TSplitter;
    cdsHorariosDia: TClientDataSet;
    dsHorariosDia: TDataSource;
    cdsHorariosDiaNOME: TStringField;
    pnlHorarioCliente: TPanel;
    Shape2: TShape;
    Shape6: TShape;
    Image4: TImage;
    lbHorarioMarcado: TLabel;
    lbHorarioDia: TLabel;
    cdsHorariosDiaINICIO: TTimeField;
    cdsHorariosDiaFIM: TTimeField;
    lbDiaSemana: TLabel;
    Timer1: TTimer;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    btnCancelarHorario: TBitBtn;
    cdsHorariosID_HORARIO: TIntegerField;
    cdsHorariosDiaID_HORARIO: TIntegerField;
    Label2: TLabel;
    lbTempoDuracao: TLabel;
    pnlDiasSemana: TPanel;
    chkSegunda: TCheckBox;
    chkTerca: TCheckBox;
    chkQuarta: TCheckBox;
    chkQuinta: TCheckBox;
    chkSexta: TCheckBox;
    lbDiasAula: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure calendarioClick(Sender: TObject);
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
    procedure DBGrid2DrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BuscaProfissionalExit(Sender: TObject);
    procedure btnCancelarHorarioClick(Sender: TObject);
    procedure BuscaDepartamento1edtDepartamentoChange(Sender: TObject);
  private
    FPrimeiroHorarioDisponivel :TTime;
    FUltimoHorarioDisponivel   :TTime;
    FPrimeiroHorarioDia :TTime;
    FUltimoHorarioDia   :TTime;
    fimHorario, limiteHorario :TTime;

    procedure carregarHorariosDia;
    procedure mostrarHorariosDia(horarios: TObjectList<TSPA>);
    procedure carregarHorariosCliente;
    procedure mostrarHorariosCliente(horarios: TObjectList<TSPA>);
    procedure defineHorarioMinMax;
    procedure setaHorario(horario :TTime);
    procedure insereHorarioGrid(spa :TSPA);
    procedure habilitaMarcacao(habilita :boolean);
    procedure adicionaServicoHorario(Horario :TSPA; frameServico: TMostraServico);
    procedure limpaServicosTela;
    procedure cancelaHorario;
    procedure zeraTela;
    procedure configuraTela;

    function tempoServicosSelecionados :TTime;
    function adicionaServicoTela(servico :TServico) :Boolean;
    function servicoAdicionado(servico :TServico):boolean;
    function marcaHorario :boolean;
  public
    { Public declarations }
  end;

var
  frmAgendamentos: TfrmAgendamentos;

implementation

uses Utilitario, TipoPessoa, ServicoAgendado;

{$R *.dfm}

function TfrmAgendamentos.adicionaServicoTela(servico: TServico) :Boolean;
begin
  result := false;
  if not servicoAdicionado(servico)  then
  begin
    result := true;
    if not assigned(MostraServico1.TabelaPreco) then
      MostraServico1.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text))
    else if not assigned(MostraServico2.TabelaPreco) then
      MostraServico2.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text))
    else if not assigned(MostraServico3.TabelaPreco) then
      MostraServico3.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text))
    else if not assigned(MostraServico4.TabelaPreco) then
      MostraServico4.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text))
    else if not assigned(MostraServico5.TabelaPreco) then
      MostraServico5.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text))
    else
    begin
      result := false;
      MessageDlg('O máximo de serviços por horário já foi atingido.', mtInformation,[mbOk],0);
      exit;
    end;

    lbTempoDuracao.Caption := TimeToStr(tempoServicosSelecionados);
  end;
end;

procedure TfrmAgendamentos.adicionaServicoHorario(Horario: TSPA; frameServico: TMostraServico);
var servicoAgendado :TServicoAgendado;
begin
  servicoAgendado                := TServicoAgendado.Create;
  servicoAgendado.ID_SPA         := Horario.ID;
  servicoAgendado.ID_TabelaPreco := frameServico.TabelaPreco.ID;
  servicoAgendado.duracao        := frameServico.tempoServico;

  Horario.ServicosAgendados.Add(ServicoAgendado);
end;

procedure TfrmAgendamentos.BitBtn1Click(Sender: TObject);
begin

    //MessageDlg('Deseja realmente sair do sistema?', mtInformation,[mbOk],0);

  //quando gera o numero de parcelas correspondente ao vezes na semana, o botao gerar restantes habilita
end;

procedure TfrmAgendamentos.btnAddServicoClick(Sender: TObject);
begin
  if not assigned(BuscaTabelaPreco1.TabelaPreco) then
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
  edtTempoDuracao.Clear;
end;

procedure TfrmAgendamentos.btnCancelarHorarioClick(Sender: TObject);
begin
  if MessageBox(Handle, PWideChar('Deseja cancelar o horário do dia '+cdsHorariosDATA.AsString+' marcado às '+cdsHorariosHORA.AsString+#13#10+
                        'referente ao '+BuscaPessoa1.DescricaoTipo+' '+ BuscaPessoa1.Pessoa.Nome+'?')
                , '', MB_YESNO+MB_SYSTEMMODAL+MB_ICONQUESTION+MB_DEFBUTTON1) = ID_YES then
    cancelaHorario;
  MessageDlg('Horário cancelado com sucesso.', mtInformation,[mbOk],0);
end;

procedure TfrmAgendamentos.btnCriaHorarioClick(Sender: TObject);
begin
 if marcaHorario then
   MessageDlg('Horário criado com sucesso!', mtInformation,[mbOk],0);
end;

procedure TfrmAgendamentos.btnDecMinClick(Sender: TObject);
begin
  if not assigned(BuscaTabelaPreco1.TabelaPreco) then
    exit;

  edtTempoDuracao.Text := TimeToStr(strToTime(edtTempoDuracao.Text)-strToTime('00:10:00'));

  if strToTime(edtTempoDuracao.Text) < strToTime('00:10:00') then
    edtTempoDuracao.Text := ('00:10:00');
end;

procedure TfrmAgendamentos.btnIncMinClick(Sender: TObject);
begin
  if not assigned(BuscaTabelaPreco1.TabelaPreco) then
    exit;

  edtTempoDuracao.Text := TimeToStr(strToTime(edtTempoDuracao.Text)+strToTime('00:10:00'));
end;

procedure TfrmAgendamentos.BuscaConvenio1Exit(Sender: TObject);
begin
  inherited;
  BuscaConvenio1.FrameExit(Sender);
  if assigned(BuscaConvenio1.Convenio) and (BuscaConvenio1.Convenio.ID > 0) then
    BuscaTabelaPreco1.IDConvenio := BuscaConvenio1.Convenio.ID;
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
    BuscaTabelaPreco1.IDDepartamento := BuscaDepartamento1.Departamento.ID;
    configuraTela;
  end;
end;

procedure TfrmAgendamentos.BuscaPessoa1Exit(Sender: TObject);
begin
  inherited;
  BuscaPessoa1.FrameExit(Sender);
  cdsHorarios.EmptyDataSet;
  if assigned(BuscaPessoa1.Pessoa) and (BuscaPessoa1.Pessoa.ID > 0) then
    carregarHorariosCliente;

  btnCancelarHorario.Enabled  := not cdsHorarios.IsEmpty;
end;

procedure TfrmAgendamentos.BuscaProfissionalExit(Sender: TObject);
begin
  inherited;
  if assigned(BuscaProfissional.Pessoa) and (BuscaProfissional.Pessoa.ID > 0)then
  begin
    calendario.Enabled := true;
    calendarioClick(nil);
  end
  else
  begin
    calendario.Enabled := false;
    cdsHorariosDia.EmptyDataSet;
  end;
end;

procedure TfrmAgendamentos.BuscaTabelaPreco1edtCodigoChange(Sender: TObject);
begin
  inherited;
  edtTempoDuracao.Clear;
end;

procedure TfrmAgendamentos.BuscaTabelaPreco1Exit(Sender: TObject);
begin
  inherited;
  BuscaTabelaPreco1.FrameExit(Sender);
  if Assigned(BuscaTabelaPreco1.TabelaPreco) and (BuscaTabelaPreco1.TabelaPreco.ID > 0) then
    edtTempoDuracao.Text := TimeToStr(BuscaTabelaPreco1.TabelaPreco.Servico.Duracao)
  else
    edtTempoDuracao.Clear;
end;

procedure TfrmAgendamentos.calendarioClick(Sender: TObject);
begin
  if calendario.Date < date then
  begin
    MessageDlg('Atenção. Horários não podem ser marcados para datas inferiores à do dia atual.', mtInformation,[mbOk],0);
    exit;
  end;

  habilitaMarcacao(false);
  carregarHorariosDia;
  lbHorarioDia.Caption := 'Horários do dia  '+DateToStr(calendario.Date);
  lbDiaSemana.Caption  := '('+TUtilitario.diaSemanaExtenso(calendario.Date)+')';
end;

procedure TfrmAgendamentos.cancelaHorario;
var horario :TSPA;
begin
  try
  horario := TSPA.Create;
  horario.Load(cdsHorariosID_HORARIO.AsInteger);
  horario.tipo := 'C';
  horario.Save;
  Except
    on e:Exception do
      raise Exception.Create('Erro ao cancelar horário');
  end;
end;

procedure TfrmAgendamentos.mostrarHorariosCliente(horarios: TObjectList<TSPA>);
var horario :TSPA;
begin
  if not assigned(horarios) then
    exit;

  cdsHorarios.EmptyDataSet;
  for horario in horarios do
    if not horario.horarioPassado then
      insereHorarioGrid(horario);

  btnCancelarHorario.Enabled  := not cdsHorarios.IsEmpty;
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
     cdsHorariosDia.Append;
     cdsHorariosDiaID_HORARIO.AsInteger := horario.ID;
     cdsHorariosDiaNOME.AsString        := horario.Pessoa.Nome;
     cdsHorariosDiaINICIO.AsDateTime    := horario.Hora;
     cdsHorariosDiaFIM.AsDateTime       := horario.Hora + horario.duracaoServicos;
     cdsHorariosDia.Post;
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

procedure TfrmAgendamentos.FormShow(Sender: TObject);
begin
  BuscaDepartamento1.edtCodigo.SetFocus;
end;

procedure TfrmAgendamentos.habilitaMarcacao(habilita: boolean);
begin
  speHoras.Value         := 0;
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
  btnCriaHorario.Enabled := habilita;

  if True then
  
  if DateToStr(calendario.Date) = formatDateTime('dd/mm/yyyy',date) then
    Timer1.Enabled := true
  else  
    Timer1.Enabled := false;

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

procedure TfrmAgendamentos.limpaServicosTela;
begin
  MostraServico1.btnLimpa.Click;
  MostraServico2.btnLimpa.Click;
  MostraServico3.btnLimpa.Click;
  MostraServico4.btnLimpa.Click;
  MostraServico5.btnLimpa.Click;
end;

function TfrmAgendamentos.marcaHorario :boolean;
var SPA :TSPA;
begin
  try
    SPA := TSPA.Create;
    SPA.Data            := calendario.Date;
    SPA.Hora            := StrToTime(speHoras.Text+':'+speMinutos.Text+':00');
    SPA.ID_Pessoa       := BuscaPessoa1.Pessoa.ID;
    SPA.ID_Departamento := BuscaDepartamento1.Departamento.ID;
    SPA.ID_Profissional := BuscaProfissional.Pessoa.ID;

    if assigned(MostraServico1.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico1);
    if assigned(MostraServico2.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico2);
    if assigned(MostraServico3.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico3);
    if assigned(MostraServico4.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico4);
    if assigned(MostraServico5.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico5);

    SPA.Save;

    insereHorarioGrid(SPA);
    habilitaMarcacao(false);
    limpaServicosTela;
    calendarioClick(nil);
  finally
    FreeAndNil(SPA);
  end;
end;

procedure TfrmAgendamentos.carregarHorariosCliente;
var Horario  :TSPA;
    Horarios :TObjectList<TSPA>;
begin
 try
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
   Horario  := TSPA.Create;
   Horarios := Horario.LoadList<TSPA>('WHERE DATA = '''+FormatDateTime('dd.mm.yyyy', calendario.Date)+''' order by HORA');

   mostrarHorariosDia(Horarios);
 finally
   FreeAndNil(Horario);
   FreeAndNil(Horarios);
 end;
end;

procedure TfrmAgendamentos.configuraTela;
begin
  if BuscaDepartamento1.Departamento.Departamento = 'PILATES' then
  begin
    lbHorarioDia.Caption     := 'Horários';
    lbDiaSemana.Left         := 120; //260
    pnlServicos.Visible      := false;
    pnlDiasSemana.Visible    := true;
    lbCalendario.Caption     := 'Selecione a data de início';
    gpbHorario.Caption       := 'Horário da aula';
    lbHorarioMarcado.Caption := 'Horário da aula';
  end
  else
  begin
    lbHorarioDia.Caption     := 'Horários do dia';
    lbDiaSemana.Left         := 260;
    pnlServicos.Visible      := true;
    pnlDiasSemana.Visible    := false;
    lbCalendario.Caption     := 'Selecione a data desejada';
    lbHorarioMarcado.Caption := 'Horários marcados';
  end;

  gpbHorario.Caption       := '            Horário '+IfThen(BuscaDepartamento1.Departamento.Departamento = 'PILATES', 'da aula',
                                                 IfThen(BuscaDepartamento1.Departamento.Departamento = 'FISIOTERAPIA', 'da sessão',
                                                                                                                      'do procedimento'));
end;

procedure TfrmAgendamentos.DBGrid2DrawColumnCell(Sender: TObject;
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

function TfrmAgendamentos.servicoAdicionado(servico: TServico): boolean;
begin
  result := true;

  if (assigned(MostraServico1.TabelaPreco) and (MostraServico1.TabelaPreco.Servico.ID = servico.ID)) or
     (assigned(MostraServico2.TabelaPreco) and (MostraServico2.TabelaPreco.Servico.ID = servico.ID)) or
     (assigned(MostraServico3.TabelaPreco) and (MostraServico3.TabelaPreco.Servico.ID = servico.ID)) or
     (assigned(MostraServico4.TabelaPreco) and (MostraServico4.TabelaPreco.Servico.ID = servico.ID)) or
     (assigned(MostraServico5.TabelaPreco) and (MostraServico5.TabelaPreco.Servico.ID = servico.ID)) then
    MessageDlg('Serviço '+BuscaTabelaPreco1.TabelaPreco.Servico.Servico+' já foi adicionado', mtInformation,[mbOk],0)
  else
    result := false;
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

  speHoras.Text   := formatDateTime('hh',horario);

  speMinutos.Text := intToStr(minutos);
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
  speHoras.Text   := FormatFloat('00', speHoras.Value);
  speMinutos.Text := FormatFloat('00', speMinutos.Value);
end;

procedure TfrmAgendamentos.speHorasEnter(Sender: TObject);
begin
  TSpinEdit(Sender).SelectAll;
end;

function TfrmAgendamentos.tempoServicosSelecionados: TTime;
begin
  if assigned(MostraServico1.TabelaPreco) then
    result := result + MostraServico1.TempoServico;
  if assigned(MostraServico2.TabelaPreco) then
    result := result + MostraServico2.TempoServico;
  if assigned(MostraServico3.TabelaPreco) then
    result := result + MostraServico3.TempoServico;
  if assigned(MostraServico4.TabelaPreco) then
    result := result + MostraServico4.TempoServico;
  if assigned(MostraServico5.TabelaPreco) then
    result := result + MostraServico5.TempoServico;
end;

procedure TfrmAgendamentos.Timer1Timer(Sender: TObject);
begin
  if (time > StrToTime(speHoras.Text+':'+speMinutos.Text+':00')) then
    setaHorario(time);
end;

procedure TfrmAgendamentos.zeraTela;
begin
  limpaServicosTela;
  cdsHorarios.EmptyDataSet;
  cdsHorariosDia.EmptyDataSet;
  calendario.Enabled := false;
  habilitaMarcacao(false);
  btnCancelarHorario.Enabled := false;
  BuscaProfissional.limpa;
  BuscaPessoa1.limpa;
  BuscaConvenio1.limpa;
  BuscaTabelaPreco1.limpa;
  edtTempoDuracao.Clear;
  lbDiaSemana.Left := 260;
end;

end.

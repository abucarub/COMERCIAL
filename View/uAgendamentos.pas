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
    dbgHorariosDia: TDBGrid;
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
    cdsHorariosNDIA_SEMANA: TSmallintField;
    btnSalvarHorarios: TBitBtn;
    Label4: TLabel;
    edtDiaPagamento: TCurrencyEdit;
    Shape3: TShape;
    rgpDiasSemana: TRadioGroup;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    lbValorServicos: TLabel;
    Shape4: TShape;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
    procedure dbgHorariosDiaDrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
  private
    FPrimeiroHorarioDisponivel :TTime;
    FUltimoHorarioDisponivel   :TTime;
    FPrimeiroHorarioDia :TTime;
    FUltimoHorarioDia   :TTime;
    fimHorario, limiteHorario :TTime;

    procedure carregarHorariosDia;
    procedure carregarHorariosDiaSemana;
    procedure mostrarHorariosDia(horarios: TObjectList<TSPA>);
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

uses Utilitario, TipoPessoa, ServicoAgendado, AlunoPilates;

{$R *.dfm}

function TfrmAgendamentos.adicionaServicoTela(servico: TServico) :Boolean;
begin
  result := false;
  if not servicoAdicionado(servico)  then
  begin
    result := true;
    if not assigned(MostraServico1.TabelaPreco) then
      MostraServico1.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text), BuscaTabelaPreco1.edtValor.Value)
    else if not assigned(MostraServico2.TabelaPreco) then
      MostraServico2.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text), BuscaTabelaPreco1.edtValor.Value)
    else if not assigned(MostraServico3.TabelaPreco) then
      MostraServico3.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text), BuscaTabelaPreco1.edtValor.Value)
    else if not assigned(MostraServico4.TabelaPreco) then
      MostraServico4.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text), BuscaTabelaPreco1.edtValor.Value)
    else if not assigned(MostraServico5.TabelaPreco) then
      MostraServico5.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text), BuscaTabelaPreco1.edtValor.Value)
    else
    begin
      result := false;
      MessageDlg('O máximo de serviços por horário já foi atingido.', mtInformation,[mbOk],0);
      exit;
    end;

    lbTempoDuracao.Caption  := TimeToStr(tempoServicosSelecionados);
    lbValorServicos.Caption := FormatFloat('R$ #,0.00',valorServicosSelecionados);
  end;
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

procedure TfrmAgendamentos.BitBtn1Click(Sender: TObject);
begin

   // MessageDlg('Deseja realmente sair do sistema?', mtConfirmation,[mbOk],0);

  //quando gera o numero de parcelas correspondente ao vezes na semana, o botao gerar restantes habilita
end;

procedure TfrmAgendamentos.btnAddServicoClick(Sender: TObject);
begin
  if not assigned(BuscaTabelaPreco1.TabelaPreco) or (BuscaTabelaPreco1.TabelaPreco.ID = 0) then
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
  if not assigned(BuscaTabelaPreco1.TabelaPreco) or (BuscaTabelaPreco1.TabelaPreco.ID = 0) then
    exit;

  edtTempoDuracao.Text := TimeToStr(strToTime(edtTempoDuracao.Text)-strToTime('00:10:00'));

  if strToTime(edtTempoDuracao.Text) < strToTime('00:10:00') then
    edtTempoDuracao.Text := ('00:10:00');
end;

procedure TfrmAgendamentos.btnIncMinClick(Sender: TObject);
begin
  if not assigned(BuscaTabelaPreco1.TabelaPreco) or (BuscaTabelaPreco1.TabelaPreco.ID = 0) then
    exit;

  edtTempoDuracao.Text := TimeToStr(strToTime(edtTempoDuracao.Text)+strToTime('00:10:00'));
end;

procedure TfrmAgendamentos.btnSalvarHorariosClick(Sender: TObject);
begin
  if edtDiaPagamento.AsInteger = 0 then
  begin
    MessageDlg('Favor informar o dia do pagamento.', mtInformation,[mbOk],0);
    edtDiaPagamento.SetFocus;
    exit;
  end;

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
  BuscaTabelaPreco1.limpa;
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

  btnCancelarHorario.Enabled  := not cdsHorarios.IsEmpty;
end;

procedure TfrmAgendamentos.BuscaProfissionalExit(Sender: TObject);
begin
  inherited;
  BuscaProfissional.FrameExit(Sender);
  if assigned(BuscaProfissional.Pessoa) and (BuscaProfissional.Pessoa.ID > 0)then
  begin
    calendario.Enabled := true;
    if not (BuscaDepartamento1.Departamento.Departamento = 'PILATES') then
      fisioEsteticaClick(nil);  
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

procedure TfrmAgendamentos.fisioEsteticaClick(Sender: TObject);
begin
  if calendario.Date < date then
  begin
    //MessageDlg('Atenção. Horários não podem ser marcados para datas inferiores à do dia atual.', mtInformation,[mbOk],0);
    calendario.Date := Date;
    fisioEsteticaClick(nil);
    exit;
  end;

  carregarHorariosDia;
  lbHorarioDia.Caption := 'Horários do dia  '+DateToStr(calendario.Date);
  lbDiaSemana.Caption  := '('+TUtilitario.diaSemanaExtenso(calendario.Date)+')';

  if DateToStr(calendario.Date) = formatDateTime('dd/mm/yyyy',date) then
    Timer1.Enabled := true
  else
    Timer1.Enabled := false;
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

procedure TfrmAgendamentos.mostrarHorariosCliente(horarios: TObjectList<TSPA>);
var horario :TSPA;
begin
  if not assigned(horarios) then
    exit;

  cdsHorarios.EmptyDataSet;
  for horario in horarios do
    if (BuscaDepartamento1.Departamento.Departamento = 'PILATES') or not horario.horarioPassado then
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

  lbTempoDuracao.Caption  := TimeToStr(tempoServicosSelecionados);
  lbValorServicos.Caption := FormatFloat('R$ #,0.00',valorServicosSelecionados);
end;

procedure TfrmAgendamentos.pilatesClick(Sender: TObject);
begin
 { if diasSemanaSelecionados = '' then
     MessageDlg('Nenhum dia da semana foi escolhido para a aula. Favor informar acima.', mtInformation,[mbOk],0)
  else if not diaSemanaPreSelecionado(calendario.Date) then
  begin
    MessageDlg('Data selecionada deve corresponder a um dia da semana pre-selecionado.'+#13#10+
                diasSemanaSelecionados, mtInformation,[mbOk],0);
    habilitaMarcacao(false);
  end
  else
    habilitaMarcacao(true);
  //  carregarHorariosDiaSemana; }
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
    cdsHorariosHORA.AsDateTime := StrToTime(speHoras.Text+':'+speMinutos.Text+':00');
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
  carregarHorariosDiaSemana;
end;

procedure TfrmAgendamentos.salvaDadosAluno;
var AlunoPilates :TAlunoPilates;
begin
  try
    AlunoPilates := TAlunoPilates.Create;
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
  end;
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
      adicionaServicoHorario(SPA,BuscaTabelaPreco1.TabelaPreco.ID, strToTime(edtTempoDuracao.Text));
      SPA.Save;

      cdsHorarios.Next;

      FreeAndNil(SPA);
    end;

    salvaDadosAluno;

    result := true;  
    btnSalvarHorarios.Enabled := false;  
  Except
    raise Exception.Create('Erro ao salvar horários');
    result := false;
  end;
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
  chkSegunda.Checked := false;
  chkTerca.Checked := false;
  chkQuarta.Checked := false;
  chkQuinta.Checked := false;
  chkSexta.Checked := false;
  edtDiaPagamento.Clear;
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
      adicionaServicoHorario(SPA,MostraServico1.TabelaPreco.ID, MostraServico1.tempoServico);
    if assigned(MostraServico2.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico2.TabelaPreco.ID, MostraServico2.tempoServico);
    if assigned(MostraServico3.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico3.TabelaPreco.ID, MostraServico3.tempoServico);
    if assigned(MostraServico4.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico4.TabelaPreco.ID, MostraServico4.tempoServico);
    if assigned(MostraServico5.TabelaPreco) then
      adicionaServicoHorario(SPA,MostraServico5.TabelaPreco.ID, MostraServico5.tempoServico);

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
    cdsHorariosHORA.AsDateTime := StrToTime(speHoras.Text+':'+speMinutos.Text+':00');
    cdsHorarios.Post;
    
    if cdsHorarios.RecordCount > 1 then
      preencheHorariosRestantes;
      
    MessageDlg('Horário(s) criado(s) com sucesso.', mtInformation,[mbOk],0);
  end;  

  habilitaMarcacao(false);
  btnSalvarHorarios.Enabled := true;
end;

procedure TfrmAgendamentos.carregaDadosAluno;
begin
  chkSegunda.Checked := BuscaPessoa1.Pessoa.AlunoPilates.Segunda = 'X';
  chkTerca.Checked   := BuscaPessoa1.Pessoa.AlunoPilates.Terca = 'X';
  chkQuarta.Checked  := BuscaPessoa1.Pessoa.AlunoPilates.Quarta = 'X';
  chkQuinta.Checked  := BuscaPessoa1.Pessoa.AlunoPilates.Quinta = 'X';
  chkSexta.Checked   := BuscaPessoa1.Pessoa.AlunoPilates.Sexta = 'X';
  edtDiaPagamento.asInteger := BuscaPessoa1.Pessoa.AlunoPilates.DiaPagamento;
end;

procedure TfrmAgendamentos.carregarHorariosCliente;
var Horario  :TSPA;
    Horarios :TObjectList<TSPA>;
begin
 try
   limpaDadosAluno;
   if (BuscaPessoa1.Pessoa.AlunoPilates.isLoaded) and (BuscaDepartamento1.Departamento.Departamento = 'PILATES') then
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

procedure TfrmAgendamentos.carregarHorariosDiaSemana;
var Horario  :TSPA;
    Horarios :TObjectList<TSPA>;
begin
 try
   Horario  := TSPA.Create;
   Horarios := Horario.LoadList<TSPA>('WHERE EXTRACT(weekday from SPA.data) = '+IntToStr(rgpDiasSemana.ItemIndex+1)+
                                      '  AND SPA.ID_DEPARTAMENTO = '+IntToStr(BuscaDepartamento1.Departamento.ID));

   mostrarHorariosDia(Horarios);

   habilitaMarcacao(true);
 finally
   FreeAndNil(Horario);
   FreeAndNil(Horarios);
 end;
end;

procedure TfrmAgendamentos.chkSegundaClick(Sender: TObject);
begin
   adicionaRemoveHorario(TCheckBox(Sender));
end;

procedure TfrmAgendamentos.configuraTela;
begin
  if BuscaDepartamento1.Departamento.Departamento = 'PILATES' then
  begin
    lbHorarioDia.Caption      := 'Horários';
    lbDiaSemana.Visible       := false;
    pnlServicos.Visible       := false;
    pnlDiasSemana.Visible     := true;
    pnlDiasSemana.Align       := alBottom;
    lbCalendario.Caption      := 'Filtro aulas do dia';
    lbHorarioMarcado.Caption  := 'Horário da aula';
    calendario.OnClick        := pilatesClick;
    rgpDiasSemana.Visible     := true;
    rgpDiasSemana.ItemIndex   := 0;
    btnSalvarHorarios.Visible := true;
    btnAddServico.Visible     := false;
  end
  else
  begin
    lbHorarioDia.Caption      := 'Horários do dia';
    lbDiaSemana.Visible       := true;
    pnlServicos.Visible       := true;
    pnlDiasSemana.Visible     := false;
    lbCalendario.Caption      := 'Selecione a data desejada';
    lbHorarioMarcado.Caption  := 'Horários marcados';
    calendario.OnClick        := fisioEsteticaClick;
    rgpDiasSemana.Visible     := false;
    btnSalvarHorarios.Visible := false;
    btnAddServico.Visible     := true;
  end;

  gpbHorario.Caption       := '            Horário '+IfThen(BuscaDepartamento1.Departamento.Departamento = 'PILATES', 'da aula',
                                                 IfThen(BuscaDepartamento1.Departamento.Departamento = 'FISIOTERAPIA', 'da sessão',
                                                                                                                      'do procedimento'));
end;

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
end;

procedure TfrmAgendamentos.DBGrid1Enter(Sender: TObject);
begin
  btnCancelarHorario.Enabled := not cdsHorarios.IsEmpty;
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
  result := result +IfThen(chkSegunda.Checked, 'ou "SEGUNDA-FEIRA" ');
  result := result +IfThen(chkTerca.Checked, 'ou "TERÇA-FEIRA" ');
  result := result +IfThen(chkQuarta.Checked, 'ou "QUARTA-FEIRA" ');
  result := result +IfThen(chkQuinta.Checked, 'ou "QUINTA-FEIRA" ');
  result := result +IfThen(chkSexta.Checked, 'ou "SEXTA-FEIRA" ');
  result := TRIM('('+copy(result,4,length(result))+')');
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
end;

procedure TfrmAgendamentos.speHorasEnter(Sender: TObject);
begin
  TSpinEdit(Sender).SelectAll;
end;

procedure TfrmAgendamentos.speHorasExit(Sender: TObject);
begin
  speHoras.Text   := FormatFloat('00', speHoras.Value);
end;

procedure TfrmAgendamentos.speMinutosExit(Sender: TObject);
begin
  speMinutos.Text := FormatFloat('00', speMinutos.Value);
end;

function TfrmAgendamentos.tempoServicosSelecionados: TTime;
begin
  result := 0;
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

function TfrmAgendamentos.valorServicosSelecionados: Real;
begin
  result := 0;
  if assigned(MostraServico1.TabelaPreco) then
    result := result + MostraServico1.valorServico;
  if assigned(MostraServico2.TabelaPreco) then
    result := result + MostraServico2.valorServico;
  if assigned(MostraServico3.TabelaPreco) then
    result := result + MostraServico3.valorServico;
  if assigned(MostraServico4.TabelaPreco) then
    result := result + MostraServico4.valorServico;
  if assigned(MostraServico5.TabelaPreco) then
    result := result + MostraServico5.valorServico;
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

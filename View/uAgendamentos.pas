unit uAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Generics.Collections,
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
    rgpHorarios: TGroupBox;
    StringGrid1: TStringGrid;
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
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    cdsHorariosDIA_SEMANA: TStringField;
    dsHorarios: TDataSource;
    Panel1: TPanel;
    gpbHorario: TGroupBox;
    Shape3: TShape;
    Label3: TLabel;
    Label1: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    lbHMinimo: TLabel;
    lbHMaximo: TLabel;
    speHoras: TSpinEdit;
    speMinutos: TSpinEdit;
    Shape1: TShape;
    Label4: TLabel;
    DBGridCBN1: TDBGridCBN;
    dsServicos: TDataSource;
    cdsServicos: TClientDataSet;
    cdsServicosHORARIO: TStringField;
    lbHorarioDia: TLabel;
    calendario: TJvMonthCalendar;
    Label37: TLabel;
    cdsHorariosDATA: TDateField;
    cdsHorariosHORA: TTimeField;
    Image1: TImage;
    Image2: TImage;
    btnCriaHorario: TBitBtn;
    Image3: TImage;
    Shape2: TShape;
    Shape4: TShape;
    Shape5: TShape;
    lbDiaSemana: TLabel;
    Shape6: TShape;
    Image4: TImage;
    Panel2: TPanel;
    BuscaConvenio1: TBuscaConvenio;
    BuscaDepartamento1: TBuscaDepartamento;
    BuscaPessoa1: TBuscaPessoa;
    BuscaTabelaPreco1: TBuscaTabelaPreco;
    Label5: TLabel;
    edtTempoDuracao: TMaskEdit;
    BuscaPessoa2: TBuscaPessoa;
    btnAddServico: TBitBtn;
    pnlServicos: TPanel;
    MostraServico1: TMostraServico;
    MostraServico5: TMostraServico;
    MostraServico4: TMostraServico;
    MostraServico3: TMostraServico;
    MostraServico2: TMostraServico;
    btnIncMin: TBitBtn;
    btnDecMin: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure calendarioClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
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
  private
    FPrimeiroHorarioDisponivel :TTime;
    FUltimoHorarioDisponivel   :TTime;
    FPrimeiroHorarioDia :TTime;
    FUltimoHorarioDia   :TTime;
    fimHorario, limiteHorario :TTime;

    function tempoServicosSelecionados :TTime;
    procedure carregarHorariosDia;
    procedure mostrarHorariosDia(horarios: TObjectList<TSPA>);
    procedure carregarHorariosCliente;
    procedure mostrarHorariosCliente(horarios: TObjectList<TSPA>);
    procedure defineHorarioMinMax;
    procedure setaHorario(horario :TTime);
    function marcaHorario :boolean;
    procedure insereHorarioGrid(spa :TSPA);
    procedure habilitaMarcacao(habilita :boolean);
    procedure adicionaServicos(Horario :TSPA);

    function adicionaServico(servico :TServico) :Boolean;
    function servicoAdicionado(servico :TServico):boolean;
  public
    { Public declarations }
  end;

var
  frmAgendamentos: TfrmAgendamentos;

implementation

uses Utilitario, TipoPessoa, ServicoAgendado;

{$R *.dfm}

function TfrmAgendamentos.adicionaServico(servico: TServico) :Boolean;
begin
  result := false;
  if not servicoAdicionado(servico)  then
  begin
    result := true;
    if not assigned(MostraServico1.Servico) then
      MostraServico1.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text))
    else if not assigned(MostraServico2.Servico) then
      MostraServico2.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text))
    else if not assigned(MostraServico3.Servico) then
      MostraServico3.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text))
    else if not assigned(MostraServico4.Servico) then
      MostraServico4.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text))
    else if not assigned(MostraServico5.Servico) then
      MostraServico5.carregaServico(servico.ID, strToTime(edtTempoDuracao.Text))
    else
    begin
      result := false;
      MessageDlg('O máximo de serviços por horário já foi atingido.', mtInformation,[mbOk],0);
    end;
  end;

  BuscaTabelaPreco1.edtCodigo.SetFocus;
end;

procedure TfrmAgendamentos.adicionaServicos(Horario: TSPA);
begin
  if assigned(MostraServico1.Servico) then
    Horario.ServicosAgendados.Add(MostraServico1.Servico, passar horario para salvar na tabela servico_agendado);
  if assigned(MostraServico2.Servico) then
    Horario.ServicosAgendados.Add(MostraServico2.Servico);
  if assigned(MostraServico3.Servico) then
    Horario.ServicosAgendados.Add(MostraServico3.Servico);
  if assigned(MostraServico4.Servico) then
    Horario.ServicosAgendados.Add(MostraServico4.Servico);
  if assigned(MostraServico5.Servico) then
    Horario.ServicosAgendados.Add(MostraServico5.Servico);
end;

procedure TfrmAgendamentos.BitBtn1Click(Sender: TObject);
begin

    //MessageDlg('Deseja realmente sair do sistema?', mtInformation,[mbOk],0);

  //quando gera o numero de parcelas correspondente ao vezes na semana, o botao gerar restantes habilita
end;

procedure TfrmAgendamentos.btnAddServicoClick(Sender: TObject);
begin
  if adicionaServico(BuscaTabelaPreco1.TabelaPreco.Servico) then
  begin
    BuscaTabelaPreco1.limpa;
    edtTempoDuracao.Clear;
  end;
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
  if assigned(BuscaConvenio1.Convenio) then
    BuscaTabelaPreco1.IDConvenio := BuscaConvenio1.Convenio.ID;
end;

procedure TfrmAgendamentos.BuscaDepartamento1Exit(Sender: TObject);
begin
  inherited;
  BuscaDepartamento1.FrameExit(Sender);
  if assigned(BuscaDepartamento1.Departamento) then
    BuscaTabelaPreco1.IDDepartamento := BuscaDepartamento1.Departamento.ID;
end;

procedure TfrmAgendamentos.BuscaPessoa1Exit(Sender: TObject);
begin
  inherited;
  BuscaPessoa1.FrameExit(Sender);
  cdsHorarios.EmptyDataSet;
  if assigned(BuscaPessoa1.Pessoa) then
    carregarHorariosCliente;
end;

procedure TfrmAgendamentos.BuscaTabelaPreco1Exit(Sender: TObject);
begin
  inherited;
  BuscaTabelaPreco1.FrameExit(Sender);
  if Assigned(BuscaTabelaPreco1.TabelaPreco) then
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
  StringGrid1.OnSelectCell := nil;
  carregarHorariosDia;
  StringGrid1.OnSelectCell := StringGrid1SelectCell;
  lbHorarioDia.Caption := 'Horários do dia '+DateToStr(calendario.Date);
  lbDiaSemana.Caption  := TUtilitario.diaSemanaExtenso(calendario.Date);
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
end;

procedure TfrmAgendamentos.mostrarHorariosDia(horarios: TObjectList<TSPA>);
var time :TTime;
    horario :TSPA;
    minutos,min1,min2 :integer;
    alturaLinha :integer;
    primeiroCriado :Boolean;

begin
  StringGrid1.RowCount := 1;
  StringGrid1.RowHeights[StringGrid1.RowCount-1] := 0;

  if not assigned(horarios) then
  begin
    min1 :=  TUtilitario.dataParaMinutos(FUltimoHorarioDia);
    min2 :=  TUtilitario.dataParaMinutos(FPrimeiroHorarioDia);
    minutos     := trunc((min1-min2)/10);
    alturaLinha := minutos * 6;
    StringGrid1.RowHeights[StringGrid1.RowCount-1] := alturaLinha;
    StringGrid1.Cells[0,StringGrid1.RowCount-1] := formatDatetime('hh:mm',FPrimeiroHorarioDia) + ' às ' +
                                                       formatDatetime('hh:mm',FUltimoHorarioDia) + ' DISPONÍVEL';
    exit;
  end;

  {cada 10 min corresponde a 6px de altura da linha do stringgrid}
   fimHorario   := strToTime('06:00:00');
   limiteHorario := strToTime('21:00:00');

  for horario in horarios do
  begin
    {se o horário marcardo for maior que o final do ultimo horário marcado, calcula-se o intervalo entre eles}
    if horario.Hora > fimHorario then
    begin
      StringGrid1.RowCount := StringGrid1.RowCount +1;
      min1 :=  TUtilitario.dataParaMinutos(horario.Hora);
      min2 :=  TUtilitario.dataParaMinutos(fimHorario);
      minutos     := trunc((min1-min2)/10);
      alturaLinha := minutos * 6;
      StringGrid1.RowHeights[StringGrid1.RowCount-1] := alturaLinha;

      {Se o intervalo entre as sessoes (em min.) for maior que a duração do serviço selecionado, o intervalo é disponível}
      if (minutos*10) >= TUtilitario.dataParaMinutos(tempoServicosSelecionados) then
        StringGrid1.Cells[0,StringGrid1.RowCount-1] := formatDatetime('hh:mm',fimHorario) + ' às ' +
                                                       formatDatetime('hh:mm',horario.Hora) + ' DISPONÍVEL'
      else
        StringGrid1.Cells[0,StringGrid1.RowCount-1] := '';
    end;

    StringGrid1.RowCount := StringGrid1.RowCount +1;

    minutos     := TUtilitario.dataParaMinutos(horario.duracaoServicos); //pega a duração do serviço pela sessao
    alturaLinha := trunc(minutos/10)*6;
    StringGrid1.RowHeights[StringGrid1.RowCount-1] := alturaLinha;
    StringGrid1.Cells[0,StringGrid1.RowCount-1]    := formatDatetime('hh:mm',horario.Hora) + ' às ' +
                                                      formatDatetime('hh:mm',horario.Hora + horario.duracaoServicos) +
                                                      ' MARCADO';

    fimHorario := horario.Hora + horario.duracaoServicos;
  end;

  if fimHorario < limiteHorario then
  begin
    StringGrid1.RowCount := StringGrid1.RowCount +1;
    min1 :=  TUtilitario.dataParaMinutos(limiteHorario);
    min2 :=  TUtilitario.dataParaMinutos(fimHorario);
    minutos     := trunc((min1-min2)/10);
    alturaLinha := minutos * 6;
    StringGrid1.RowHeights[StringGrid1.RowCount-1] := alturaLinha;
    if (minutos*10) >= TUtilitario.dataParaMinutos(tempoServicosSelecionados) then
      StringGrid1.Cells[0,StringGrid1.RowCount-1] := formatDatetime('hh:mm',fimHorario) + ' às ' +
                                                     formatDatetime('hh:mm',limiteHorario) + ' DISPONÍVEL';
  end;

end;

procedure TfrmAgendamentos.MostraServico1btnLimpaClick(Sender: TObject);
begin
  inherited;
  TMostraServico(TSpeedButton(Sender).Owner).btnLimpaClick(Sender);
  TMostraServico(TSpeedButton(Sender).Owner).Visible := false;
  TMostraServico(TSpeedButton(Sender).Owner).Align   := alNone;
  TMostraServico(TSpeedButton(Sender).Owner).Left    := 700;
end;

procedure TfrmAgendamentos.FormCreate(Sender: TObject);
begin
  inherited;
  BuscaPessoa1.Tipo := 1;    //trocar por get numerico
  FPrimeiroHorarioDia := StrToTime('06:00:00');
  FUltimoHorarioDia   := StrToTime('21:00:00');
  cdsHorarios.CreateDataSet;
  habilitaMarcacao(false);
  calendario.Date := Date;
  calendarioClick(nil);
end;

procedure TfrmAgendamentos.FormShow(Sender: TObject);
begin
  BuscaDepartamento1.edtCodigo.SetFocus;
end;

procedure TfrmAgendamentos.habilitaMarcacao(habilita: boolean);
begin
  speHoras.Value         := 0;
  speMinutos.Value       := 0;
  lbHminimo.Caption      := '00:00';
  lbHMaximo.Caption      := '00:00';

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
  cdsHorariosDATA.AsDateTime     := spa.Data;
  cdsHorariosHORA.AsDateTime     := spa.Hora;
  cdsHorariosDIA_SEMANA.AsString := TUtilitario.diaSemanaExtenso(spa.Data);
  cdsHorarios.Post;
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

    adicionaServicos(SPA);
    SPA.Save;

    insereHorarioGrid(SPA);
    habilitaMarcacao(false);
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

procedure TfrmAgendamentos.defineHorarioMinMax;
var hora :TTime;
begin
{  min1 :=  TUtilitario.dataParaMinutos(FPrimeiroHorarioDia);
  min2 :=  TUtilitario.dataParaMinutos(FUltimoHorarioDia);
  showmessage(intToStr(trunc((min2-min1)/TUtilitario.dataParaMinutos(BuscaTabelaPreco1.TabelaPreco.Servico.Duracao))));
}

  lbHMinimo.Caption      := formatDateTime('hh:mm',FPrimeiroHorarioDisponivel);
  lbHMaximo.Caption      := formatDateTime('hh:mm',FUltimoHorarioDisponivel);

  hora := FPrimeiroHorarioDisponivel;

  if (calendario.Date = date) and (FPrimeiroHorarioDisponivel < time) then
    hora := time;

  setaHorario(hora);
end;

function TfrmAgendamentos.servicoAdicionado(servico: TServico): boolean;
begin
  result := true;

  if (assigned(MostraServico1.Servico) and (MostraServico1.Servico.ID = servico.ID)) or
     (assigned(MostraServico2.Servico) and (MostraServico2.Servico.ID = servico.ID)) or
     (assigned(MostraServico3.Servico) and (MostraServico3.Servico.ID = servico.ID)) or
     (assigned(MostraServico4.Servico) and (MostraServico4.Servico.ID = servico.ID)) or
     (assigned(MostraServico5.Servico) and (MostraServico5.Servico.ID = servico.ID)) then
    MessageDlg('Serviço já inserido', mtInformation,[mbOk],0)
  else
    result := false;
end;

procedure TfrmAgendamentos.setaHorario(horario: TTime);
var minutos :integer;
begin
  speHoras.Text   := formatDateTime('hh',horario);
  minutos := strToInt(copy(formatDateTime('hh:mm',horario),4,2));
  if (minutos mod 10) <> 0 then
    minutos := minutos + (10-(minutos mod 10));

  speMinutos.Text := intToStr(minutos);
end;

procedure TfrmAgendamentos.speHorasChange(Sender: TObject);
var horarioInformado :TTime;
begin
  horarioInformado := strToTime(speHoras.Text+':'+speMinutos.Text);

  if horarioInformado < FPrimeiroHorarioDisponivel then
    setaHorario(FPrimeiroHorarioDisponivel)
  else if horarioInformado > FUltimoHorarioDisponivel then
    setaHorario(FUltimoHorarioDisponivel);

  speHoras.Text   := FormatFloat('00', speHoras.Value);
  speMinutos.Text := FormatFloat('00', speMinutos.Value);
end;

procedure TfrmAgendamentos.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var texto : string;
    largurat : integer;
    largurac : integer;
    larguraTL : integer;
    larguraCL : integer;
begin
  texto := StringGrid1.Cells[ACol, ARow];
  largurat := Canvas.TextWidth(texto) div 2;
  largurac := StringGrid1.ColWidths[ACol] div 2;
  larguraTL := Canvas.TextHeight(texto) div 2;
  larguraCL := StringGrid1.RowHeights[ARow] div 2;

  if pos('DISPONÍV',StringGrid1.Cells[ACol,Arow]) > 0 then
    StringGrid1.Canvas.Brush.Color := $00B8F1DD
  else if pos('MARCADO',StringGrid1.Cells[ACol,Arow]) > 0 then
    StringGrid1.Canvas.Brush.Color := $0084A2FB
  else
    StringGrid1.Canvas.Brush.Color := clWhite;

  StringGrid1.Canvas.FillRect(Rect); // redesenha a celula
  StringGrid1.Canvas.TextOut(Rect.Left+largurac-largurat,Rect.Top+larguraCL-larguraTL, texto);

end;

procedure TfrmAgendamentos.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if pos('DISPONÍV',StringGrid1.Cells[ACol,Arow]) > 0 then
  begin
    habilitaMarcacao(true);
    speHoras.SetFocus;
    FPrimeiroHorarioDisponivel       := StrToTime(copy(StringGrid1.Cells[ACol, ARow],1,5));
    FUltimoHorarioDisponivel         := StrToTime(copy(StringGrid1.Cells[ACol, ARow],10,5)) - tempoServicosSelecionados;

    if (calendario.Date = date) and (FUltimoHorarioDisponivel < time) then
      habilitaMarcacao(false)
    else
      defineHorarioMinMax;
  end
  else
  begin
    habilitaMarcacao(false);
  end;
end;

function TfrmAgendamentos.tempoServicosSelecionados: TTime;
begin
  if assigned(MostraServico1.Servico) then
    result := result + MostraServico1.TempoServico;
  if assigned(MostraServico2.Servico) then
    result := result + MostraServico2.TempoServico;
  if assigned(MostraServico3.Servico) then
    result := result + MostraServico3.TempoServico;
  if assigned(MostraServico4.Servico) then
    result := result + MostraServico4.TempoServico;
  if assigned(MostraServico5.Servico) then
    result := result + MostraServico5.TempoServico;
end;

end.

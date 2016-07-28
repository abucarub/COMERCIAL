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
  Vcl.Buttons, Vcl.DBGrids, DBGridCBN, SPA, frameBusca, Vcl.Imaging.pngimage;

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
    BuscaPessoa1: TBuscaPessoa;
    BuscaConvenio1: TBuscaConvenio;
    BuscaTabelaPreco1: TBuscaTabelaPreco;
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
    edtTempoDuracao: TMaskEdit;
    Label5: TLabel;
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
    Label2: TLabel;
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
  private
    FID_Departamento :integer;
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
    function marcaHorario :boolean;
    procedure insereHorarioGrid(spa :TSPA);
    procedure habilitaMarcacao(habilita :boolean);
  public
    { Public declarations }
  end;

var
  frmAgendamentos: TfrmAgendamentos;

implementation

uses Utilitario, TipoPessoa, ServicoAgendado;

{$R *.dfm}

procedure TfrmAgendamentos.BitBtn1Click(Sender: TObject);
begin

    //MessageDlg('Deseja realmente sair do sistema?', mtInformation,[mbOk],0);

  //quando gera o numero de parcelas correspondente ao vezes na semana, o botao gerar restantes habilita
end;

procedure TfrmAgendamentos.btnCriaHorarioClick(Sender: TObject);
begin
 if marcaHorario then
   MessageDlg('Horário criado com sucesso!', mtInformation,[mbOk],0);
end;

procedure TfrmAgendamentos.BuscaConvenio1Exit(Sender: TObject);
begin
  inherited;
  BuscaConvenio1.FrameExit(Sender);
  if assigned(BuscaConvenio1.Convenio) then
    BuscaTabelaPreco1.IDConvenio := BuscaConvenio1.Convenio.ID;
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
      if (minutos*10) >= TUtilitario.dataParaMinutos(horario.duracaoServicos) then
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
    if (minutos*10) >= TUtilitario.dataParaMinutos(horario.duracaoServicos) then
      StringGrid1.Cells[0,StringGrid1.RowCount-1] := formatDatetime('hh:mm',fimHorario) + ' às ' +
                                                     formatDatetime('hh:mm',limiteHorario) + ' DISPONÍVEL';
  end;

end;

procedure TfrmAgendamentos.FormCreate(Sender: TObject);
begin
  inherited;
  FID_Departamento := 1;
  BuscaPessoa1.Tipo := 1;    //trocar por get numerico
  BuscaTabelaPreco1.IDDepartamento := FID_Departamento;
  FPrimeiroHorarioDia := StrToTime('06:00:00');
  FUltimoHorarioDia   := StrToTime('21:00:00');
  cdsHorarios.CreateDataSet;
  habilitaMarcacao(false);
  calendario.Date := Date;
  calendarioClick(nil);
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
    Servico :TServicoAgendado;
begin
  try
    SPA := TSPA.Create;
    SPA.Data            := calendario.Date;
    SPA.Hora            := StrToTime(speHoras.Text+':'+speMinutos.Text+':00');
    SPA.ID_Pessoa       := BuscaPessoa1.Pessoa.ID;
    SPA.ID_Departamento := FID_Departamento;

    Servico := TServicoAgendado.Create;
    Servico.ID_TabelaPreco := BuscaTabelaPreco1.TabelaPreco.ID;
    SPA.ServicosAgendados.Add(Servico);
    SPA.Save;

    insereHorarioGrid(SPA);
    habilitaMarcacao(false);
    calendarioClick(nil);
  finally
    FreeAndNil(SPA);
    FreeAndNil(Servico);
  end;
end;

procedure TfrmAgendamentos.carregarHorariosCliente;
var Horario  :TSPA;
    Horarios :TObjectList<TSPA>;
begin
 try
   Horario  := TSPA.Create;
   Horarios := Horario.Horarios(BuscaPessoa1.Pessoa.ID, FID_Departamento,'');

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
  if FPrimeiroHorarioDisponivel < time then
    hora := time;

  setaHorario(hora);
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
    FUltimoHorarioDisponivel         := StrToTime(copy(StringGrid1.Cells[ACol, ARow],10,5)) - BuscaTabelaPreco1.TabelaPreco.Servico.Duracao;

    if FUltimoHorarioDisponivel > time then
      defineHorarioMinMax
    else
      habilitaMarcacao(false);
  end
  else
  begin
    habilitaMarcacao(false);
  end;
end;

end.

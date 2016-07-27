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
  Vcl.Buttons, Vcl.DBGrids, DBGridCBN, SPA, frameBusca;

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
    Shape2: TShape;
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
    btnCriaHorario: TBitBtn;
    dsServicos: TDataSource;
    cdsServicos: TClientDataSet;
    cdsServicosHORARIO: TStringField;
    Label2: TLabel;
    calendario: TJvMonthCalendar;
    Label37: TLabel;
    cdsHorariosDATA: TDateField;
    cdsHorariosHORA: TTimeField;
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
  private
    FID_Departamento :integer;
    FPrimeiroHorarioDisponivel :TTime;
    FUltimoHorarioDisponivel   :TTime;
    FPrimeiroHorarioDia :TTime;
    FUltimoHorarioDia   :TTime;
    fimHorario, limiteHorario :TTime;

    procedure CarregaSessoes(sessoes :TObjectList<TSPA>);
    procedure mostrarHorarios;
    procedure defineHorarioMinMax(textoCelula :String);
    procedure setaHorario(horario :TTime);
    function marcaHorario :boolean;
    procedure insereHorarioGrid(spa :TSPA);
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
  mostrarHorarios;
end;

procedure TfrmAgendamentos.CarregaSessoes(sessoes: TObjectList<TSPA>);
var time :TTime;
    sessao :TSPA;
    minutos,min1,min2 :integer;
    alturaLinha :integer;
    primeiroCriado :Boolean;

begin
  StringGrid1.RowCount := 1;
  StringGrid1.RowHeights[0] := 0;

  if not assigned(sessoes) then
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

  for sessao in sessoes do
  begin
    if sessao.Hora > fimHorario then
    begin
      StringGrid1.RowCount := StringGrid1.RowCount +1;
      min1 :=  TUtilitario.dataParaMinutos(sessao.Hora);
      min2 :=  TUtilitario.dataParaMinutos(fimHorario);
      minutos     := trunc((min1-min2)/10);
      alturaLinha := minutos * 6;
      StringGrid1.RowHeights[StringGrid1.RowCount-1] := alturaLinha;

      {Se o intervalo entre as sessoes (em min.) for maior que a duração do serviço selecionado, o intervalo é disponível}
      if (minutos*10) >= TUtilitario.dataParaMinutos(sessao.duracaoServicos) then
        StringGrid1.Cells[0,StringGrid1.RowCount-1] := formatDatetime('hh:mm',fimHorario) + ' às ' +
                                                       formatDatetime('hh:mm',sessao.Hora) + ' DISPONÍVEL';
    end;

    StringGrid1.RowCount := StringGrid1.RowCount +1;

    minutos     := TUtilitario.dataParaMinutos(sessao.duracaoServicos); //pega a duração do serviço pela sessao
    alturaLinha := trunc(minutos/10)*6;
    StringGrid1.RowHeights[StringGrid1.RowCount-1] := alturaLinha;
    StringGrid1.Cells[0,StringGrid1.RowCount-1]    := formatDatetime('hh:mm',sessao.Hora) + ' às ' +
                                                      formatDatetime('hh:mm',sessao.Hora + sessao.duracaoServicos) +
                                                      ' MARCADO';

    fimHorario := Sessao.Hora + sessao.duracaoServicos;
  end;

  if fimHorario < limiteHorario then
  begin
    StringGrid1.RowCount := StringGrid1.RowCount +1;
    min1 :=  TUtilitario.dataParaMinutos(limiteHorario);
    min2 :=  TUtilitario.dataParaMinutos(fimHorario);
    minutos     := trunc((min1-min2)/10);
    alturaLinha := minutos * 6;
    StringGrid1.RowHeights[StringGrid1.RowCount-1] := alturaLinha;
    if (minutos*10) >= TUtilitario.dataParaMinutos(sessao.duracaoServicos) then
      StringGrid1.Cells[0,StringGrid1.RowCount-1] := formatDatetime('hh:mm',fimHorario) + ' às ' +
                                                     formatDatetime('hh:mm',limiteHorario) + ' DISPONÍVEL';
  end;

end;

procedure TfrmAgendamentos.FormCreate(Sender: TObject);
begin
  inherited;
  BuscaPessoa1.Tipo := 1;    //trocar por get numerico
  BuscaTabelaPreco1.IDDepartamento := 1;
  FPrimeiroHorarioDia := StrToTime('06:00:00');
  FUltimoHorarioDia   := StrToTime('21:00:00');
  cdsHorarios.CreateDataSet;
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
    SPA.Data      := calendario.Date;
    SPA.Hora      := StrToTime(speHoras.Text+':'+speMinutos.Text+':00');
    SPA.ID_Pessoa := BuscaPessoa1.Pessoa.ID;

    Servico := TServicoAgendado.Create;
    Servico.ID_TabelaPreco := BuscaTabelaPreco1.TabelaPreco.ID;
    SPA.ServicosAgendados.Add(Servico);
    SPA.Save;

    insereHorarioGrid(SPA);
    speHoras.Value         := 0;
    speMinutos.Value       := 0;
    gpbHorario.Enabled     := false;
    btnCriaHorario.Enabled := false;
    calendarioClick(nil);
  finally
    FreeAndNil(SPA);
    FreeAndNil(Servico);
  end;
end;

procedure TfrmAgendamentos.mostrarHorarios;
var Sessao  :TSPA;
    Sessoes :TObjectList<TSPA>;
begin
 try
   Sessao  := TSPA.Create;
   Sessoes := Sessao.LoadList<TSPA>('WHERE DATA = '''+FormatDateTime('dd.mm.yyyy', calendario.Date)+''' order by HORA');

   CarregaSessoes(Sessoes);

 finally
   FreeAndNil(Sessao);
   FreeAndNil(Sessoes);
 end;
end;

procedure TfrmAgendamentos.defineHorarioMinMax(textoCelula: String);
//var min1, min2 :integer;
begin
{  min1 :=  TUtilitario.dataParaMinutos(FPrimeiroHorarioDia);
  min2 :=  TUtilitario.dataParaMinutos(FUltimoHorarioDia);
  showmessage(intToStr(trunc((min2-min1)/TUtilitario.dataParaMinutos(BuscaTabelaPreco1.TabelaPreco.Servico.Duracao))));
}
  FPrimeiroHorarioDisponivel       := StrToTime(copy(textoCelula,1,5));
  FUltimoHorarioDisponivel         := StrToTime(copy(textoCelula,10,5)) - BuscaTabelaPreco1.TabelaPreco.Servico.Duracao;
  lbHMinimo.Caption      := formatDateTime('hh:mm',FPrimeiroHorarioDisponivel);
  lbHMaximo.Caption      := formatDateTime('hh:mm',FUltimoHorarioDisponivel);

  setaHorario(FPrimeiroHorarioDisponivel);
end;

procedure TfrmAgendamentos.setaHorario(horario: TTime);
begin
  speHoras.Text   := formatDateTime('hh',horario);
  speMinutos.Text := copy(formatDateTime('hh:mm',horario),4,2);
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
  defineHorarioMinMax(StringGrid1.Cells[ACol, ARow]);
  gpbHorario.Enabled     := true;
  btnCriaHorario.Enabled := true;
end;

end.

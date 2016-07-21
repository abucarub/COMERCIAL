unit uAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, TipoPessoa, Generics.Collections,
  Vcl.StdCtrls, frameBuscaPessoa, frameBuscaTabelaPreco, frameBuscaConvenio,
  Vcl.ExtCtrls, frameHorarioMarcado, JvExControls, JvCalendar, Vcl.ComCtrls,
  JvExComCtrls, JvMonthCalendar, Vcl.Grids, Vcl.Samples.Calendar,
  JvDateTimePicker, JvExMask, JvToolEdit, Vcl.Mask, RxToolEdit, Data.DB,
  Datasnap.DBClient, JvTimer, JvTimerList, RxSpin, Vcl.Samples.Spin, RxCurrEdit,
  Vcl.Buttons, Vcl.DBGrids, DBGridCBN, SPA;

type
  TfrmAgendamentos = class(TfrmPadrao)
    BuscaPessoa1: TBuscaPessoa;
    BuscaConvenio1: TBuscaConvenio;
    BuscaTabelaPreco1: TBuscaTabelaPreco;
    cdsHorarios: TClientDataSet;
    calendario: TJvMonthCalendar;
    rgpHorarios: TGroupBox;
    Label2: TLabel;
    btnCriaHorario: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    speHoras: TSpinEdit;
    speMinutos: TSpinEdit;
    Label3: TLabel;
    Label1: TLabel;
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
    Label5: TLabel;
    edtCodigo: TCurrencyEdit;
    DBGridCBN1: TDBGridCBN;
    Label4: TLabel;
    Label37: TLabel;
    cdsHorariosDATA_HORA: TDateTimeField;
    cdsHorariosDIA_SEMANA: TStringField;
    dsHorarios: TDataSource;
    Shape1: TShape;
    Shape2: TShape;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnCriaHorarioClick(Sender: TObject);
    procedure calendarioClick(Sender: TObject);
  private
    FID_Departamento :integer;

    procedure CarregaSessoes(sessoes :TObjectList<TSPA>);
    procedure mostrarHorarios;
  public
    { Public declarations }
  end;

var
  frmAgendamentos: TfrmAgendamentos;

implementation

uses Utilitario;

{$R *.dfm}

procedure TfrmAgendamentos.BitBtn1Click(Sender: TObject);
begin

    //MessageDlg('Deseja realmente sair do sistema?', mtInformation,[mbOk],0);

  //quando gera o numero de parcelas correspondente ao vezes na semana, o botao gerar restantes habilita
end;

procedure TfrmAgendamentos.btnCriaHorarioClick(Sender: TObject);
begin
  inherited;
  StringGrid1.RowHeights[0] := 30;
  StringGrid1.Cells[0,0] := '06:00 às 07:00 - MARCADO';
end;

procedure TfrmAgendamentos.calendarioClick(Sender: TObject);
begin
  mostrarHorarios;
end;

procedure TfrmAgendamentos.CarregaSessoes(sessoes: TObjectList<TSPA>);
var time :TTime;
    sessao :TSPA;
    fimHorario, limiteHorario :TTime;
    minutos,m1,m2 :integer;
    alturaLinha :integer;
    primeiroCriado :Boolean;
begin
  StringGrid1.RowCount := 1;
  StringGrid1.RowHeights[0] := 0;

  if not assigned(sessoes) then
  begin
    StringGrid1.RowHeights[StringGrid1.RowCount-1] := 480;
    StringGrid1.Cells[0,StringGrid1.RowCount-1]    := 'TODOS OS HORÁRIOS DISPONÍVEIS';
    exit;
  end;

  {cada 10 min corresponde a 5px de altura da linha do stringgrid}
   fimHorario   := strToTime('06:00:00');
   limiteHorario := strToTime('21:00:00');

  for sessao in sessoes do
  begin
    if sessao.Hora > fimHorario then
    begin
      StringGrid1.RowCount := StringGrid1.RowCount +1;
      m1 :=  TUtilitario.dataParaMinutos(sessao.Hora);
      m2 :=  TUtilitario.dataParaMinutos(fimHorario);
      minutos     := trunc((m1-m2)/10);
      alturaLinha := minutos * 5;
      StringGrid1.RowHeights[StringGrid1.RowCount-1] := alturaLinha;

      //StrToDateTime('00:40:00') é igual a duração
      if (minutos*10) >= TUtilitario.dataParaMinutos(StrToDateTime('00:40:00')) then
      StringGrid1.Cells[0,StringGrid1.RowCount-1] := formatDatetime('hh:mm:ss',fimHorario) + ' às ' +
                                                     formatDatetime('hh:mm:ss',sessao.Hora) + ' DISPONÍVEL';
    end;

    StringGrid1.RowCount := StringGrid1.RowCount +1;

    minutos     := TUtilitario.dataParaMinutos(StrToDateTime('00:40:00')); //pega a duração do serviço pela sessao
    alturaLinha := trunc(minutos/10)*5;
    StringGrid1.RowHeights[StringGrid1.RowCount-1] := alturaLinha;
    StringGrid1.Cells[0,StringGrid1.RowCount-1]    := formatDatetime('hh:mm:ss',fimHorario) + ' às ' +
                                                      formatDatetime('hh:mm:ss',sessao.Hora+StrToDateTime('00:40:00')) +
                                                      ' MARCADO';

    fimHorario := Sessao.Hora + StrToDateTime('00:40:00');
  end;

  if fimHorario < limiteHorario then
  begin
    StringGrid1.RowCount := StringGrid1.RowCount +1;
    m1 :=  TUtilitario.dataParaMinutos(limiteHorario);
    m2 :=  TUtilitario.dataParaMinutos(fimHorario);
    minutos     := trunc((m1-m2)/10);
    alturaLinha := minutos * 5;
    StringGrid1.RowHeights[StringGrid1.RowCount-1] := alturaLinha;
    if (minutos*10) >= TUtilitario.dataParaMinutos(StrToDateTime('00:40:00')) then
      StringGrid1.Cells[0,StringGrid1.RowCount-1] := formatDatetime('hh:mm:ss',fimHorario) + ' às ' +
                                                     formatDatetime('hh:mm:ss',limiteHorario) + ' DISPONÍVEL';
  end;

end;

procedure TfrmAgendamentos.FormCreate(Sender: TObject);
begin
  inherited;
 // BuscaPessoa1.Tipo := tpCliente;
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
    StringGrid1.Canvas.Brush.Color := $00DCEDD6
  else
    StringGrid1.Canvas.Brush.Color := $0084A2FB;

  StringGrid1.Canvas.FillRect(Rect); // redesenha a celula
  StringGrid1.Canvas.TextOut(Rect.Left+largurac-largurat,Rect.Top+larguraCL-larguraTL, texto);

end;

end.

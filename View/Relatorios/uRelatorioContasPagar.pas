unit uRelatorioContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, framePeriodo, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.DateUtils;

type
  TfrmRelatorioContasPagar = class(TfrmPadrao)
    Panel1: TPanel;
    Shape1: TShape;
    lbTitulo: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    btnImprimir: TBitBtn;
    btnVoltar: TBitBtn;
    gpbStatus: TGroupBox;
    chkQuitadas: TCheckBox;
    chkParciais: TCheckBox;
    chkEmAberto: TCheckBox;
    GroupBox1: TGroupBox;
    Periodo1: TPeriodo;
    chkPeriodoGeral: TCheckBox;
    Shape2: TShape;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand5: TRLBand;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLLabel6: TRLLabel;
    qryContas: TFDQuery;
    dsContas: TDataSource;
    qryContasID: TIntegerField;
    qryContasTOTAL_CONTA: TBCDField;
    qryContasVALOR_PAGO: TBCDField;
    qryContasRESTANTE: TBCDField;
    qryContasNR_DOCUMENTO: TStringField;
    qryContasSTATUSCONTA: TStringField;
    qryContasID_PARCELA: TIntegerField;
    qryContasNUMERO_PARCELA: TSmallintField;
    qryContasVALOR_PARCELA: TBCDField;
    qryContasVLRPG_PARCELA: TBCDField;
    qryContasSTATUSPARCELA: TStringField;
    qryContasDT_VENCIMENTO: TDateField;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLLabel3: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    qryContasDESCRICAO: TStringField;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLBand3: TRLBand;
    RLLabel5: TRLLabel;
    RLDBText2: TRLDBText;
    RLDraw1: TRLDraw;
    qryContasRESTANTE_PARC: TFloatField;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryContasCalcFields(DataSet: TDataSet);
    procedure RLDBText12BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
  private
    procedure montaSQL;
    procedure imprimir;
  public
    { Public declarations }
  end;

var
  frmRelatorioContasPagar: TfrmRelatorioContasPagar;

implementation

uses uConnection;

{$R *.dfm}

procedure TfrmRelatorioContasPagar.btnImprimirClick(Sender: TObject);
begin
  imprimir;
end;

procedure TfrmRelatorioContasPagar.FormCreate(Sender: TObject);
begin
  inherited;
  qryContas.Connection         := TConnection.GetInstance.Conexao;
  Periodo1.dtpDataInicial.Date := StartOfTheMonth(Date);
  Periodo1.dtpDataFinal.Date   := EndOfTheMonth(Date);
end;

procedure TfrmRelatorioContasPagar.imprimir;
begin
  montaSQL;

  if qryContas.IsEmpty then
    avisar('Nenhum registro foi encontrado')
  else
    RLReport1.PreviewModal;
end;

procedure TfrmRelatorioContasPagar.montaSQL;
var condicaoPeriodo, condicaoStatus :String;
begin

  if (chkQuitadas.Checked or chkParciais.Checked or chkEmAberto.Checked) then
  begin
    condicaoStatus := IfThen(chkQuitadas.Checked,',''Q''','');
    condicaoStatus := condicaoStatus+ IfThen(chkParciais.Checked,',''P''','');
    condicaoStatus := condicaoStatus+ IfThen(chkEmAberto.Checked,',''A''','');
    condicaoStatus := ' and c.status in('+copy(condicaoStatus,2,length(condicaoStatus))+')';
  end;

  if not chkPeriodoGeral.Checked then
    condicaoPeriodo := ' and P.DT_VENCIMENTO between '+QuotedStr(StringReplace(DateToStr(Periodo1.dtpDataInicial.Date),'/','.',[rfReplaceAll, rfIgnoreCase]))+
                       ' and '+QuotedStr(StringReplace(DateToStr(Periodo1.dtpDataFinal.Date),'/','.',[rfReplaceAll, rfIgnoreCase]));

  qryContas.Close;
  qryContas.SQL.Text := 'select c.id, c.total_conta, c.valor_pago, c.nr_documento, C.descricao, '+
      ' CASE                                                                                    '+
      '   WHEN C.status = ''Q'' THEN ''QUITADA''                                                '+
      '   WHEN C.status = ''P'' THEN ''PARCIAL''                                                '+
      '   WHEN C.status = ''A'' THEN ''EM ABERTO''                                              '+
      ' END statusConta,                                                                        '+
      ' p.id id_parcela, p.numero_parcela, p.valor_parcela, p.valor_pago VLRPG_PARCELA, p.dt_vencimento, '+
      ' CASE                                                                                             '+
      '   WHEN p.status = ''Q'' THEN ''QUITADA''                                                         '+
      '   WHEN p.status = ''P'' THEN ''PARCIAL''                                                         '+
      '   WHEN p.status = ''A'' THEN ''EM ABERTO''                                                       '+
      ' END statusParcela                                                                                '+
      '  from contas c                                                                                   '+
      '  inner join parcelas p on p.id_conta = c.id                                                      '+
      '  where (c.nr_documento <> '''') and not(c.nr_documento is null) ' + condicaoStatus+ condicaoPeriodo+
      ' order by c.id, p.numero_parcela ';
  qryContas.Open;
end;

procedure TfrmRelatorioContasPagar.qryContasCalcFields(DataSet: TDataSet);
begin
  with qryContas do
  begin
    FieldByName('RESTANTE').AsBCD := FieldByName('TOTAL_CONTA').AsBCD - FieldByName('VALOR_PAGO').AsBCD;
    FieldByName('RESTANTE_PARC').AsBCD := FieldByName('VALOR_PARCELA').AsBCD - FieldByName('VLRPG_PARCELA').AsBCD;
  end;
end;

procedure TfrmRelatorioContasPagar.RLDBText12BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
var status :String;
begin
  status := Text;

  if status = 'QUITADA' then
    RLDBText12.Font.Color := $006DBC72
  else if status = 'PARCIAL' then  
    RLDBText12.Font.Color := $0042C5D7
  else if status = 'EM ABERTO' then  
    RLDBText12.Font.Color := $00E07084;      
end;

end.

unit uRelatorioContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.StrUtils, System.DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, RLReport, Vcl.StdCtrls, Vcl.Buttons, framePeriodo, Vcl.ExtCtrls, frameBusca,
  frameBuscaDepartamento, Generics.Collections, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelatorioContasReceber = class(TfrmPadrao)
    Panel1: TPanel;
    Shape1: TShape;
    lbTitulo: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    btnImprimir: TBitBtn;
    btnVoltar: TBitBtn;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    qryContas: TFDQuery;
    qryContasSTATUS: TStringField;
    qryContasID_DEPARTAMENTO: TIntegerField;
    dsContas: TDataSource;
    qryContasDEPARTAMENTO: TStringField;
    qryContasPESSOA: TStringField;
    qryContasFONE1: TStringField;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand4: TRLBand;
    RLDBText7: TRLDBText;
    RLDraw1: TRLDraw;
    RLLabel3: TRLLabel;
    qryContasTOTAL_CONTA: TBCDField;
    qryContasVALOR_PAGO: TBCDField;
    qryContasRESTANTE: TBCDField;
    RLLabel4: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDraw2: TRLDraw;
    RLBand5: TRLBand;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLDraw3: TRLDraw;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    dsContasMensal: TDataSource;
    qryContasMensal: TFDQuery;
    RLReport2: TRLReport;
    RLBand6: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLGroup2: TRLGroup;
    RLBand7: TRLBand;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLBand8: TRLBand;
    RLDBText14: TRLDBText;
    RLDraw4: TRLDraw;
    RLLabel10: TRLLabel;
    RLBand9: TRLBand;
    RLDraw5: TRLDraw;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    RLDraw6: TRLDraw;
    RLLabel11: TRLLabel;
    RLBand10: TRLBand;
    RLDBResult10: TRLDBResult;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLLabel12: TRLLabel;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    qryContasMensalANO: TSmallintField;
    qryContasMensalSERVICO: TStringField;
    qryContasMensalPRESENCA: TSmallintField;
    qryContasMensalFALTA: TSmallintField;
    qryContasMensalCANCELADO: TSmallintField;
    qryContasMensalREPOSTO: TSmallintField;
    qryContasMensalMES: TSmallintField;
    qryContasMensalPESSOA: TStringField;
    qryContasMensalFONE1: TStringField;
    qryContasMensalTOTAL_CONTA: TBCDField;
    qryContasMensalVALOR_PAGO: TBCDField;
    qryContasMensalRESTANTE: TBCDField;
    RLLabel13: TRLLabel;
    Panel3: TPanel;
    gpbStatus: TGroupBox;
    chkQuitadas: TCheckBox;
    chkParciais: TCheckBox;
    chkEmAberto: TCheckBox;
    gpbPeriodoDiario: TGroupBox;
    Periodo1: TPeriodo;
    GroupBox3: TGroupBox;
    BuscaDepartamento1: TBuscaDepartamento;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    gpbPeriodoMensal: TGroupBox;
    cmbAno: TComboBox;
    Label2: TLabel;
    Shape2: TShape;
    cmbIni: TComboBox;
    cmbFim: TComboBox;
    Label1: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure qryContasCalcFields(DataSet: TDataSet);
    procedure RLDBText13BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure RLDBText14BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure BuscaDepartamento1edtDepartamentoChange(Sender: TObject);
    procedure cmbIniChange(Sender: TObject);
    procedure cmbFimChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure qryContasMensalCalcFields(DataSet: TDataSet);
    procedure RLDBText11BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure btnVoltarClick(Sender: TObject);
    procedure RLDBText6BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
  private
    procedure montaSQL;
    procedure montaSQLMensal;

    procedure imprimirDiario;
    procedure imprimirMensal;
  public

  end;

var
  frmRelatorioContasReceber: TfrmRelatorioContasReceber;

implementation

uses uConnection;

{$R *.dfm}

procedure TfrmRelatorioContasReceber.btnImprimirClick(Sender: TObject);
begin
  if gpbPeriodoMensal.Visible then
    imprimirMensal
  else
    imprimirDiario;
end;

procedure TfrmRelatorioContasReceber.btnVoltarClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRelatorioContasReceber.BuscaDepartamento1edtDepartamentoChange(Sender: TObject);
begin
  if Assigned(BuscaDepartamento1.Departamento) then
  begin
    gpbPeriodoDiario.Visible := BuscaDepartamento1.Departamento.tipoHorarios = 'D';
    gpbStatus.Visible        := BuscaDepartamento1.Departamento.tipoHorarios = 'D';
    gpbPeriodoMensal.Visible := BuscaDepartamento1.Departamento.tipoHorarios = 'M';
  end;
end;

procedure TfrmRelatorioContasReceber.cmbFimChange(Sender: TObject);
begin
  if cmbIni.ItemIndex > cmbFim.ItemIndex then
    cmbFim.ItemIndex := cmbIni.ItemIndex;
end;

procedure TfrmRelatorioContasReceber.cmbIniChange(Sender: TObject);
begin
  if cmbIni.ItemIndex > cmbFim.ItemIndex then
    cmbFim.ItemIndex := cmbIni.ItemIndex;
end;

procedure TfrmRelatorioContasReceber.FormCreate(Sender: TObject);
begin
  qryContas.Connection       := TConnection.GetInstance.Conexao;
  qryContasMensal.Connection := TConnection.GetInstance.Conexao;

  Periodo1.dtpDataInicial.Date := StartOfTheMonth(Date);
  Periodo1.dtpDataFinal.Date   := EndOfTheMonth(Date);
end;

procedure TfrmRelatorioContasReceber.imprimirDiario;
begin
  montaSQL;

  if qryContas.IsEmpty then
    avisar('Nenhum registro foi encontrado')
  else
    RLReport1.PreviewModal;
end;

procedure TfrmRelatorioContasReceber.imprimirMensal;
begin
  montaSQLMensal;

  if qryContasMensal.IsEmpty then
    avisar('Nenhum registro foi encontrado')
  else
    RLReport2.PreviewModal;
end;

procedure TfrmRelatorioContasReceber.montaSQL;
var condicaoStatus, condicaoDepartamento :String;
begin

  if (chkQuitadas.Checked or chkParciais.Checked) then
  begin
    condicaoStatus := IfThen(chkQuitadas.Checked,',''Q''','');
    condicaoStatus := condicaoStatus+ IfThen(chkParciais.Checked,',''P''','');
    //condicaoStatus := condicaoStatus+ IfThen(chkEmAberto.Checked,',''A''','');
    condicaoStatus := ' and '+IfThen(chkEmAberto.Checked,'(','') +'c.status in ('+copy(condicaoStatus,2,length(condicaoStatus))+')';
  end;

  if chkEmAberto.Checked then
    condicaoStatus := condicaoStatus + IfThen(condicaoStatus <> '',' or ', ' and ')+
                      IfThen(condicaoStatus = '','(','')+' c.status is null)';

  if Assigned(BuscaDepartamento1.Departamento) then
    condicaoDepartamento := ' and SPA.ID_DEPARTAMENTO = '+intToStr(BuscaDepartamento1.Departamento.ID);

  qryContas.Close;
  qryContas.SQL.Text := 'select (SELECT SUM(tp.valor) from servico_agendado sa                 '+
       '  inner join tabela_preco tp on tp.id = sa.id_tabela_preco                             '+
       ' where sa.id_spa = SPA.ID) TOTAL_CONTA, iif(c.ID is null, 0, C.VALOR_PAGO) VALOR_PAGO, '+
       ' SPA.ID_DEPARTAMENTO, dp.departamento,pes.nome_razao PESSOA, pes.fone1,                '+
       ' CASE                                                                                  '+
       '  WHEN (C.ID is null)or(C.status = ''A'') THEN ''EM ABERTO''                           '+
       '  WHEN C.status = ''Q'' THEN ''QUITADA''                                               '+
       '  WHEN C.status = ''P'' THEN ''PARCIAL''                                               '+
       ' END status                                                                            '+
       '  from SPA                                                                             '+
       ' left  join CONTAS c on c.id_spa = SPA.ID                                              '+
       ' inner join departamentos dp on dp.ID = SPA.id_departamento                            '+
       ' inner join pessoas pes on pes.id = SPA.id_pessoa                                      '+
       ' where spa.gera_conta = ''S'' ' + condicaoDepartamento+ condicaoStatus;
  qryContas.Open;

end;

procedure TfrmRelatorioContasReceber.montaSQLMensal;
var condicaoMes, condicaoAno :String;
begin

  condicaoMes := ' and Extract(month from SPA.data) between '+IntToStr(cmbIni.ItemIndex+1)+' and '+IntToStr(cmbFim.ItemIndex+1);

  condicaoAno := ' and Extract(year from SPA.data) = '+cmbAno.Items[cmbAno.ItemIndex];

  qryContasMensal.Close;
  qryContasMensal.SQL.Text := 'select Extract(month from SPA.data) mes, Extract(Year from SPA.data) ano, '+
                              '  MAX((SELECT sum(tp.valor) from servico_agendado sa                      '+
                              '  inner join tabela_preco tp on tp.id = sa.id_tabela_preco                '+
                              ' where sa.id_spa = SPA.ID)) TOTAL_CONTA,                                  '+

                              ' Max((select c.valor_pago from contas c                                   '+
                              '     where c.id_cliente_mensal = cm.id                                    '+
                              '       and (Extract(Year from SPA.data)||''-''||LPAD(Extract(month from SPA.data),2,''0'')||''-''||LPAD(CAST(cm.dia_pagamento as CHAR(2)),2,''0'')) = '+
                              '           (select first 1 CAST(par.dt_vencimento as CHAR(10)) from parcelas par '+
                              '            where par.id_conta = c.id) )) VALOR_PAGO,                     '+

                              ' pes.nome_razao PESSOA, max(pes.fone1) FONE1,                             '+
                              ' max((select first 1 ser.servico from servico_agendado sa                 '+
                              '              left join tabela_preco tp on tp.id = sa.id_tabela_preco     '+
                              '              left join servicos ser on ser.id = tp.id_servico            '+
                              '              where sa.id_spa = SPA.ID)) SERVICO,                         '+
                              'CAST(sum(iif(SPA.compareceu = ''S'',1,0)) as SMALLINT)presenca,           '+
                              'CAST(sum(iif((SPA.compareceu = ''N'') and not(SPA.tipo = ''R''),1,0)) as SMALLINT)falta, '+
                              'CAST(sum(iif(SPA.tipo = ''C'',1,0)) as SMALLINT)cancelado,                '+
                              'CAST(sum(iif(SPA.tipo = ''R'',1,0)) as SMALLINT)reposto                   '+

                              ' from SPA                                                                                                      '+
                              '  inner join departamentos dp on dp.ID = SPA.id_departamento                                                   '+
                              '  inner join pessoas pes on pes.id = SPA.id_pessoa                                                             '+
                              '  left  join clientes_mensal cm on pes.id = cm.id_pessoa                                                       '+
                              '  where spa.id_departamento = 2 '+ condicaoAno + condicaoMes +
                              '  group by 1,2,5 '+
                              '  order by 2,1 ';
  qryContasMensal.Open;
end;

procedure TfrmRelatorioContasReceber.qryContasCalcFields(DataSet: TDataSet);
begin
  with qryContas do
  begin
    FieldByName('RESTANTE').AsBCD := FieldByName('TOTAL_CONTA').AsBCD - FieldByName('VALOR_PAGO').AsBCD;
  end;
end;

procedure TfrmRelatorioContasReceber.qryContasMensalCalcFields(DataSet: TDataSet);
begin
  with qryContasMensal do
  begin
    FieldByName('RESTANTE').AsBCD := FieldByName('TOTAL_CONTA').AsBCD - FieldByName('VALOR_PAGO').AsBCD;
  end;
end;

procedure TfrmRelatorioContasReceber.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if RLBand2.Color = clWhite then
    RLBand2.Color := $00F0F0F0
  else
    RLBand2.Color := clWhite;
end;

procedure TfrmRelatorioContasReceber.RLDBText11BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  if Text = '' then
    Text := '0';
end;

procedure TfrmRelatorioContasReceber.RLDBText13BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  if qryContasMensalVALOR_PAGO.AsFloat = 0 then
  begin
    Text := 'EM ABERTO';
    RLDBText13.Font.Color := $00E07084;
  end
  else if qryContasMensalVALOR_PAGO.AsFloat >= qryContasMensalTOTAL_CONTA.AsFloat then
  begin
    Text := 'QUITADA';
    RLDBText13.Font.Color := $006DBC72;
  end
  else
  begin
    Text := 'PARCIAL';
    RLDBText13.Font.Color := $0042C5D7
  end;

end;

procedure TfrmRelatorioContasReceber.RLDBText14BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  case StrToInt(Text) of
    1 : Text := 'JANEIRO';
    2 : Text := 'FEVEREIRO';
    3 : Text := 'MARÇO';
    4 : Text := 'ABRIL';
    5 : Text := 'MAIO';
    6 : Text := 'JUNHO';
    7 : Text := 'JULHO';
    8 : Text := 'AGOSTO';
    9 : Text := 'SETEMBRO';
    10: Text := 'OUTUBRO';
    11: Text := 'NOVEMBRO';
    12: Text := 'DEZEMBRO';
  end;
end;

procedure TfrmRelatorioContasReceber.RLDBText6BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
var status :String;
begin
  status := Text;

  if status = 'QUITADA' then
    RLDBText6.Font.Color := $006DBC72
  else if status = 'PARCIAL' then
    RLDBText6.Font.Color := $0042C5D7
  else if status = 'EM ABERTO' then
    RLDBText6.Font.Color := $00E07084;
end;

end.

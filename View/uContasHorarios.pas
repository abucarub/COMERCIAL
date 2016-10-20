unit uContasHorarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.Buttons, Math,
  frameBuscaDepartamento, frameBusca, frameBuscaPessoa, Datasnap.DBClient, Generics.Collections, System.StrUtils, SPA, ClienteMensal, Conta,
  uReceber, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TfrmContasHorarios = class(TfrmPadrao)
    BuscaPessoa1: TBuscaPessoa;
    BuscaDepartamento1: TBuscaDepartamento;
    btnFiltrar: TBitBtn;
    DBGridCBN1: TDBGridCBN;
    Panel2: TPanel;
    btnReceber: TBitBtn;
    btnCancelar: TBitBtn;
    Panel1: TPanel;
    Shape1: TShape;
    lbTitulo: TLabel;
    cdsHorariosDiarios: TClientDataSet;
    ds: TDataSource;
    lbProfissional: TLabel;
    cdsHorarioMensal: TClientDataSet;
    cdsHorarioMensalID: TIntegerField;
    cdsHorarioMensalPROFISSIONAL: TStringField;
    cdsHorarioMensalPRESENCAS: TSmallintField;
    cdsHorarioMensalFALTAS: TSmallintField;
    cdsHorarioMensalCANCELADOS: TSmallintField;
    cdsHorarioMensalREPOSTOS: TSmallintField;
    cdsHorarioMensalMES: TStringField;
    cdsHorarioMensalSTATUS: TStringField;
    cdsHorarioMensalANO: TStringField;
    gpbServico: TGroupBox;
    Label1: TLabel;
    lbServico: TLabel;
    Label2: TLabel;
    cdsHorarioMensalPENDENTES: TSmallintField;
    cdsHorarioMensalID_CONTA: TIntegerField;
    cdsHorarioMensalDIA_PAGAMENTO: TDateField;
    edtValorServico: TCurrencyEdit;
    cdsHorariosDiariosDATA: TDateField;
    cdsHorariosDiariosHORA: TTimeField;
    cdsHorariosDiariosCOMPARECEU: TStringField;
    cdsHorariosDiariosDEPARTAMENTO: TStringField;
    cdsHorariosDiariosPROFISSIONAL: TStringField;
    cdsHorariosDiariosID: TIntegerField;
    cdsHorariosDiariosVALOR: TFloatField;
    cdsHorariosDiariosSTATUS: TStringField;
    cdsHorariosDiariosID_CONTA: TIntegerField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtTotalConta: TCurrencyEdit;
    edtValorPago: TCurrencyEdit;
    edtValorRestante: TCurrencyEdit;
    Label7: TLabel;
    Label6: TLabel;
    edtReceber: TCurrencyEdit;
    edtTroco: TCurrencyEdit;
    cdsHorariosDiariosTG: TStringField;
    cdsHorarioMensalTG: TStringField;
    cdsHorariosDiariosVALOR_PAGO: TFloatField;
    cdsHorarioMensalVALOR: TFloatField;
    cdsHorarioMensalVALOR_PAGO: TFloatField;
    cmbMoeda: TComboBox;
    Label8: TLabel;
    gpbStatus: TGroupBox;
    chkQuitadas: TCheckBox;
    chkPendentes: TCheckBox;
    btnGeraConta: TBitBtn;
    btnAlteraValorConta: TBitBtn;
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure DBGridCBN1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BuscaDepartamento1Exit(Sender: TObject);
    procedure DBGridCBN1CellClick(Column: TColumn);
    procedure edtTotalContaChange(Sender: TObject);
    procedure edtReceberChange(Sender: TObject);
    procedure chkQuitadasClick(Sender: TObject);
    procedure btnGeraContaClick(Sender: TObject);
    procedure edtValorPagoChange(Sender: TObject);
    procedure cdsHorarioMensalAfterScroll(DataSet: TDataSet);
    procedure cdsHorariosDiariosAfterScroll(DataSet: TDataSet);
    procedure btnAlteraValorContaClick(Sender: TObject);
    procedure BuscaDepartamento1edtDepartamentoChange(Sender: TObject);
  private
    procedure mostrarHorariosDiarios(horarios :TObjectList<TSPA>);
    procedure mostrarHorarioMensal(horarioMensal :TClienteMensal);
    procedure buscarClienteMensal;
    procedure atualizaValores;
    procedure limpaValores;
    procedure gerarContaHorarioComFalta;
    procedure alteraGerarConta(id_horario :integer);
    procedure alteraValor(novoValor :real);

    function buscarHorariosMensal(dtInicial, dtFinal :TDate) :TObjectList<TSPA>;
    function buscarHorariosDiario :TObjectList<TSPA>;
    function buscaContaMensal(vencimento :TDate) :TConta;
    function buscaContaDiario(ID_SPA :integer) :TConta;
    function conferePreRequisitos :boolean;
    function informacoesNecessarias :Boolean;

    function receber :boolean;
  public
    { Public declarations }
  end;

var
  frmContasHorarios: TfrmContasHorarios;

implementation

uses Pessoa, Utilitario, Parcela, Movimento, uPesquisa, uAlteracaoValorConta;

{$R *.dfm}

procedure TfrmContasHorarios.alteraGerarConta(id_horario: integer);
var horario :TSPA;
begin
  try
    horario := TSPA.Create;
    horario.Load(id_horario);
    horario.geraConta := 'S';
    horario.Save;

    avisar('Horário incluído com sucesso');
  finally
    FreeAndNil(horario);
  end;
end;

procedure TfrmContasHorarios.alteraValor(novoValor: real);
var cds :TClientDataSet;
begin
  if cdsHorariosDiarios.IsEmpty then
    cds := cdsHorarioMensal
  else
    cds := cdsHorariosDiarios;

  cds.Edit;
  cds.FieldByName('VALOR').AsFloat := novoValor;
  cds.Post;

  atualizaValores;
end;

procedure TfrmContasHorarios.atualizaValores;
var cds :TClientDataSet;
    rec :integer;
begin
  limpaValores;

  if BuscaDepartamento1.Departamento.tipoHorarios = 'D' then
    cds := cdsHorariosDiarios
  else
    cds := cdsHorarioMensal;

  rec := cds.RecNo;
  cds.DisableControls;
  cds.First;
  while not cds.Eof do
  begin
    if cds.FieldByName('TG').AsString = 'S' then
    begin
      edtTotalConta.Value    := edtTotalConta.Value + cds.FieldByName('VALOR').AsFloat;
      edtValorPago.Value     := edtValorPago.Value + cds.FieldByName('VALOR_PAGO').AsFloat;
      edtValorRestante.Value := edtTotalConta.Value - edtValorPago.Value;
    end;

    cds.Next;
  end;
  cds.EnableControls;
  cds.RecNo := rec;
end;

procedure TfrmContasHorarios.btnGeraContaClick(Sender: TObject);
begin
  if informacoesNecessarias then
  begin
    gerarContaHorarioComFalta;
    btnFiltrar.Click;
  end;
end;

procedure TfrmContasHorarios.btnAlteraValorContaClick(Sender: TObject);
var cds :TClientDataSet;
begin
  if cdsHorariosDiarios.IsEmpty then
    cds := cdsHorarioMensal
  else
    cds := cdsHorariosDiarios;

  frmAlteracaoValorConta := TfrmAlteracaoValorConta.Create(nil);

  frmAlteracaoValorConta.edtValorAtual.Value := cds.FieldByName('VALOR').AsFloat;
  if frmAlteracaoValorConta.ShowModal = 1 then
    alteraValor(frmAlteracaoValorConta.edtNovoValor.Value);

  frmAlteracaoValorConta.Release;
  frmAlteracaoValorConta := nil;
end;

procedure TfrmContasHorarios.btnFiltrarClick(Sender: TObject);
begin
   if not informacoesNecessarias then
     exit;

   if BuscaDepartamento1.Departamento.tipoHorarios = 'D' then
     mostrarHorariosDiarios( buscarHorariosDiario )
   else
     buscarClienteMensal;

   DBGridCBN1.SetFocus;
end;

function TfrmContasHorarios.buscarHorariosDiario: TObjectList<TSPA>;
var Horario  :TSPA;
    Horarios :TObjectList<TSPA>;
begin
 try
   cdsHorariosDiarios.EmptyDataSet;
   Horario  := TSPA.Create;
   Horarios := Horario.LoadList<TSPA>('WHERE ID_PESSOA = '+ intToStr(BuscaPessoa1.Pessoa.ID) +
                                      ' and ID_DEPARTAMENTO = '+intToStr(BuscaDepartamento1.Departamento.ID) +
                                      ' and TIPO <> ''C'' '+
                                      ' and COMPARECEU in (''S'',''N'')'+
                                      ' and GERA_CONTA = ''S'' '+
                                      ' order by DATA');
   result := Horarios;
 finally
   FreeAndNil(Horario);
 end;
end;

function TfrmContasHorarios.buscarHorariosMensal(dtInicial, dtFinal :TDate) :TObjectList<TSPA>;
var Horario  :TSPA;
    Horarios :TObjectList<TSPA>;
begin
 try
   Horario  := TSPA.Create;
   Horarios := Horario.LoadList<TSPA>('WHERE ID_PESSOA = '+ intToStr(BuscaPessoa1.Pessoa.ID) +
                                      ' and ID_DEPARTAMENTO = '+intToStr(BuscaDepartamento1.Departamento.ID) +
                                      ' and DATA between '+QuotedStr(FormatDateTime('dd.mm.yyyy',dtInicial))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy',dtFinal))+
                                      ' and REPOSICAO = 0 '+ {horarios de reposicao nao sao necessarios aqui}
                                      ' order by DATA');
   result := Horarios;

 finally
   FreeAndNil(Horario);
 end;
end;

procedure TfrmContasHorarios.cdsHorarioMensalAfterScroll(DataSet: TDataSet);
begin
  btnAlteraValorConta.Enabled := cdsHorarioMensalSTATUS.AsString = 'ABERTA';
end;

procedure TfrmContasHorarios.cdsHorariosDiariosAfterScroll(DataSet: TDataSet);
begin
  btnAlteraValorConta.Enabled := cdsHorariosDiariosSTATUS.AsString = 'ABERTA';
end;

procedure TfrmContasHorarios.chkQuitadasClick(Sender: TObject);
var filtro :String;
begin
  cdsHorariosDiarios.Filtered := false;
  cdsHorarioMensal.Filtered   := false;

  if chkQuitadas.Checked or chkPendentes.Checked then
  begin
    filtro := IfThen(chkQuitadas.Checked,'''QUITADA''','');
    filtro := filtro + IfThen(chkPendentes.Checked,IfThen(filtro <> '',',','')+'''PARCIAL'', ''ABERTA''','');
    filtro := 'STATUS IN ('+filtro+')';

    cdsHorariosDiarios.Filter := filtro;
    cdsHorarioMensal.Filter   := filtro;
    cdsHorariosDiarios.Filtered := true;
    cdsHorarioMensal.Filtered   := true;
  end;

end;

function TfrmContasHorarios.conferePreRequisitos: boolean;
var cds :TClientDataSet;
begin
  if BuscaDepartamento1.Departamento.tipoHorarios = 'D' then
    cds := cdsHorariosDiarios
  else
    cds := cdsHorarioMensal;

  cds.Filtered := false;
  cds.Filter   := 'TG = ''S'' ';
  cds.Filtered := true;

  result := false;

  if edtReceber.Value = 0 then
    balaoInformacao(edtReceber,'Nenhum valor de recebimento foi informado')
  else if (cds.RecordCount > 1) and (edtReceber.Value < edtValorRestante.Value) then
    balaoInformacao(edtReceber,'Para recebimentos multiplos, o valor a receber deve ser maior que o restante à pagar')
  else if cds.RecordCount = 0 then
    balaoInformacao(DBGridCBN1,'Nenhum registro foi selecionado')
  else if cmbMoeda.ItemIndex = 0 then
    balaoInformacao(cmbMoeda,'A moeda do pagamento deve ser informada')
  else
    result := true;

  if not result then
    cds.Filtered := false;

end;

procedure TfrmContasHorarios.DBGridCBN1CellClick(Column: TColumn);
begin
  if DBGridCBN1.DataSource.DataSet.FieldByName('STATUS').AsString <> 'QUITADA' then
  begin
    DBGridCBN1.DataSource.DataSet.Edit;
    DBGridCBN1.DataSource.DataSet.FieldByName('TG').AsString := IfThen(DBGridCBN1.DataSource.DataSet.FieldByName('TG').AsString = 'S', 'N', 'S');
    DBGridCBN1.DataSource.DataSet.Post;

    atualizaValores;
  end;

  DBGridCBN1.SelectedIndex := 1;

{  if gridServicos.SelectedIndex in [0,1,3] then
     gridServicos.Options := gridServicos.Options - [dgEditing]
  else
     gridServicos.Options := gridServicos.Options + [dgEditing]; }
end;

procedure TfrmContasHorarios.DBGridCBN1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin
  With TDBGridCBN(Sender) do
  begin
    if Column.Title.Caption = 'TG' then
    begin
      Column.Title.Font.Color := clWhite;
      if DataSource.DataSet.FieldByName(Column.FieldName).AsString = 'QUITADA' then
      begin
        Canvas.Brush.Color := $009AD19D;
        Canvas.Font.Color  := $009AD19D;
      end;
    end;

    if Column.FieldName = 'STATUS' then
    begin
      if DataSource.DataSet.FieldByName(Column.FieldName).AsString = 'QUITADA' then
      begin
        Canvas.Brush.Color := $009AD19D;
      end
      else if DataSource.DataSet.FieldByName(Column.FieldName).AsString = 'ABERTA' then
      begin
        Canvas.Brush.Color := $00EFB4BE;
      end
      else if DataSource.DataSet.FieldByName(Column.FieldName).AsString = 'PARCIAL' then
      begin
        Canvas.Brush.Color := $00B4E8EF;
      end;

      Canvas.FillRect(Rect);
      DefaultDrawDataCell(Rect, columns[datacol].field, State);
    end
    else if DataSource.DataSet.FieldByName('TG').AsString = 'S' then
    begin
      if Column.FieldName <> 'TG' then
      begin
        Canvas.Brush.Color := $006BA581;
        Canvas.Font.Color  := clWhite;
      end;
    end;

    DefaultDrawDataCell(Rect, Columns[DataCol].Field, State);

    if (Column.FieldName = 'TG') and (DataSource.DataSet.FieldByName(Column.FieldName).AsString <> 'QUITADA') then
    begin
      Canvas.FillRect(Rect);
      iCheck := 0;
      if DataSource.DataSet.FieldByName('TG').AsString = 'S' then
        iCheck := DFCS_CHECKED
      else
        iCheck := 0;

      rRect := Rect;
      InflateRect(rRect,-2,-2);
      DrawFrameControl(Canvas.Handle,rRect,DFC_BUTTON, DFCS_BUTTONCHECK or iCheck);
    end;
  end;
end;

procedure TfrmContasHorarios.edtReceberChange(Sender: TObject);
begin
  if (edtReceber.Value > 0) and (edtReceber.Value > edtValorRestante.Value) then
    edtTroco.Value := edtReceber.Value - edtValorRestante.Value
  else
    edtTroco.Clear;
end;

procedure TfrmContasHorarios.edtTotalContaChange(Sender: TObject);
begin
  btnReceber.Enabled := edtTotalConta.Value > 0;

  edtValorRestante.Value := edtTotalConta.Value - edtValorPago.Value;
end;

procedure TfrmContasHorarios.edtValorPagoChange(Sender: TObject);
begin
  edtTotalConta.ReadOnly := edtValorPago.Value > 0;
end;

procedure TfrmContasHorarios.FormCreate(Sender: TObject);
begin
  inherited;
  BuscaPessoa1.Tipo      := 1;
  cdsHorarioMensal.CreateDataSet;
  cdsHorariosDiarios.CreateDataSet;
end;

procedure TfrmContasHorarios.gerarContaHorarioComFalta;
var titulo, SQL :String;
begin
  titulo := 'Horários com falta...';
  SQL    := 'Select spa.id, spa.data, spa.hora, dep.departamento, pes.nome_razao Profissional from SPA '+
            'inner join departamentos dep on dep.id = spa.id_departamento '+
            'inner join pessoas pes on pes.id = id_profissional '+
            ' where spa.id_departamento = '+intToStr(BuscaDepartamento1.Departamento.ID)+
            '   and spa.id_pessoa = '+intToStr(BuscaPessoa1.Pessoa.ID)+
            '   and spa.compareceu = ''N'' '+
            '   and spa.tipo not in(''C'',''R'')';

  frmPesquisa := TFrmPesquisa.Create(Self,SQL,titulo);
  if frmPesquisa.ShowModal = mrOk then
  begin
    alteraGerarConta(frmPesquisa.cdsRetorno.Fields[0].AsInteger);
  end;

  frmPesquisa.Release;
  frmPesquisa := nil;
end;

function TfrmContasHorarios.informacoesNecessarias: Boolean;
begin
  result := false;

  if not assigned(BuscaDepartamento1.Departamento) then
    balaoInformacao(BuscaDepartamento1.edtCodigo,'Favor informar o departamento da conta')
  else if not assigned(BuscaPessoa1.Pessoa) then
    balaoInformacao(BuscaPessoa1.edtCodigo,'Favor informar a pessoa à que se refere a conta')
  else
    result := true;
end;

procedure TfrmContasHorarios.limpaValores;
begin
  edtTotalConta.Clear;
  edtValorPago.Clear;
  edtValorRestante.Clear;
  edtTroco.Clear;
  edtReceber.Clear;
end;

procedure TfrmContasHorarios.btnReceberClick(Sender: TObject);
begin
  inherited;
  if conferePreRequisitos then
    if receber then
      btnFiltrar.Click;
end;

function TfrmContasHorarios.buscaContaDiario(ID_SPA: integer): TConta;
var Contas :TObjectList<TConta>;
begin
  result := TConta.Create;
  Contas := result.LoadList<TConta>(' WHERE ID_SPA = '+intToStr(ID_SPA));

  if assigned(Contas) then
    result := Contas.Items[0]
  else
    result := nil;
end;

function TfrmContasHorarios.buscaContaMensal(vencimento :TDate): TConta;
var Contas :TObjectList<TConta>;
begin
  result := TConta.Create;
  Contas := result.LoadList<TConta>('LEFT JOIN PARCELAS P on P.ID_CONTA = CONTAS.ID'+
                                    ' WHERE CONTAS.ID_CLIENTE_MENSAL = '+intToStr(BuscaPessoa1.Pessoa.ClienteMensal.ID)+
                                    '   AND (SELECT FIRST 1 DT_VENCIMENTO FROM PARCELAS '+
                                    '         WHERE PARCELAS.ID_CONTA = CONTAS.ID'+
                                    '        ORDER BY PARCELAS.NUMERO_PARCELA) = '+QuotedStr(formatDateTime('dd.mm.yyyy',vencimento)));
  if assigned(Contas) then
    result := Contas.Items[0]
  else
    result := nil;
end;

procedure TfrmContasHorarios.BuscaDepartamento1edtDepartamentoChange(
  Sender: TObject);
begin
  inherited;
  if assigned(BuscaDepartamento1.Departamento) then

  btnGeraConta.Enabled := BuscaDepartamento1.Departamento.tipoHorarios = 'D';
end;

procedure TfrmContasHorarios.BuscaDepartamento1Exit(Sender: TObject);
begin
  inherited;
  BuscaDepartamento1.FrameExit(Sender);
  if assigned(BuscaDepartamento1.Departamento) then
  begin
    if BuscaDepartamento1.Departamento.tipoHorarios = 'M' then
    begin
      cdsHorarioMensal.EmptyDataSet;
      ds.DataSet := cdsHorarioMensal;
    end
    else
    begin
      cdsHorariosDiarios.EmptyDataSet;
      ds.DataSet := cdsHorariosDiarios;
    end;

    limpaValores;
  end;

end;

procedure TfrmContasHorarios.buscarClienteMensal;
var horarioMensal   :TClienteMensal;
    horariosMensais :TObjectList<TClienteMensal>;
begin
 try
   cdsHorarioMensal.EmptyDataSet;
   horarioMensal   := TClienteMensal.Create;
   horariosMensais := horarioMensal.LoadList<TClienteMensal>('WHERE ID_PESSOA = '+ intToStr(BuscaPessoa1.Pessoa.ID) +
                                                             ' and ID_DEPARTAMENTO = '+intToStr(BuscaDepartamento1.Departamento.ID));

   if assigned(horariosMensais) then
     mostrarHorarioMensal(horariosMensais.Items[0])
   else
     avisar('"'+BuscaPessoa1.Pessoa.Nome+'" não não está vinculado ao departamento de "'+BuscaDepartamento1.Departamento.departamento+'".');

 finally
   FreeAndNil(horarioMensal);
   FreeAndNil(horariosMensais);
 end;
end;

procedure TfrmContasHorarios.mostrarHorarioMensal(horarioMensal: TClienteMensal);
var Horarios :TObjectList<TSPA>;
    i, presencas, faltas, cancelados, repostos, pendentes, meses :SmallInt;
    Profissional :TPessoa;
    horario :TSPA;
    dataInicial, dataFinal :TDate;
    conta :TConta;
    vencimento :TDate;
begin
  Profissional := TPessoa.create;
  Profissional.Load(horarioMensal.ID_Profissional);

  gpbServico.Visible := true;
  lbServico.Caption  := horarioMensal.TabelaPreco.Servico.Servico;
  edtValorServico.value    := horarioMensal.TabelaPreco.Valor;
  meses              := MonthsBetween(horarioMensal.Inicio, date)+1;
  dataInicial        := horarioMensal.Inicio;
  dataFinal          := EndOfTheMonth(dataInicial);

  for i := 0 to meses-1 do
  begin
    try
      Horarios  := buscarHorariosMensal(dataInicial, dataFinal);
      presencas := 0; faltas := 0; cancelados := 0; repostos := 0; pendentes := 0;

      if not assigned(Horarios) then
      begin
        avisar('"'+BuscaPessoa1.Pessoa.Nome+'" não possui contas referente ao departamento de "'+BuscaDepartamento1.Departamento.departamento+'".');
        exit;
      end;

      for horario in Horarios do
      begin
        if horario.tipo = 'C' then
          inc(cancelados)
        else if horario.tipo = 'R' then
          inc(repostos)
        else if horario.compareceu = 'S' then
          inc(presencas)
        else if horario.compareceu = 'N' then
          inc(faltas)
        else
          inc(pendentes);
      end;

      vencimento := strToDate(intToStr(horarioMensal.DiaPagamento)+'/'+copy(DateToStr(dataInicial),4,7));
      conta      := buscaContaMensal(vencimento);

      cdsHorarioMensal.Append;
      cdsHorarioMensalID.AsInteger            := horarioMensal.ID;
      cdsHorarioMensalPROFISSIONAL.AsString   := Profissional.Nome;
      cdsHorarioMensalPRESENCAS.AsInteger     := presencas;
      cdsHorarioMensalFALTAS.AsInteger        := faltas;
      cdsHorarioMensalCANCELADOS.AsInteger    := cancelados;
      cdsHorarioMensalREPOSTOS.AsInteger      := repostos;
      cdsHorarioMensalPENDENTES.AsInteger     := pendentes;
      cdsHorarioMensalMES.AsString            := TUtilitario.mesExtenso(dataInicial);
      cdsHorarioMensalANO.AsInteger           := YearOf(dataInicial);

      if assigned(conta) then
      begin
        cdsHorarioMensalSTATUS.AsString         := conta.descricaoStatus;
        cdsHorarioMensalID_CONTA.AsInteger      := conta.ID;
        cdsHorarioMensalVALOR.AsFloat           := conta.TotalConta;
        cdsHorarioMensalVALOR_PAGO.AsFloat      := conta.ValorPago;
      end
      else
      begin
        cdsHorarioMensalSTATUS.AsString         := 'ABERTA';
        cdsHorarioMensalID_CONTA.AsInteger      := 0;
        cdsHorarioMensalVALOR.AsFloat           := edtValorServico.Value;
        cdsHorarioMensalVALOR_PAGO.AsFloat      := 0;
      end;
      cdsHorarioMensalDIA_PAGAMENTO.AsDateTime:= vencimento;
      cdsHorarioMensal.Post;

      dataInicial := dataFinal+1;
      dataFinal   := EndOfTheMonth(dataInicial);

    finally
      FreeAndNil(Horarios);
    end;
  end;
end;

procedure TfrmContasHorarios.mostrarHorariosDiarios(horarios: TObjectList<TSPA>);
var horario :TSPA;
      conta :TConta;
begin
  if not assigned(horarios) then
  begin
    avisar('"'+BuscaPessoa1.Pessoa.Nome+'" não possui contas referente ao departamento de "'+BuscaDepartamento1.Departamento.departamento+'".');
    exit;
  end;

  for horario in horarios do
  begin
    conta := buscaContaDiario(horario.ID);

    cdsHorariosDiarios.Append;
    cdsHorariosDiariosID.AsInteger          := horario.ID;
    cdsHorariosDiariosDATA.AsDateTime       := horario.data;
    cdsHorariosDiariosHORA.AsDateTime       := horario.hora;
    cdsHorariosDiariosCOMPARECEU.AsString   := horario.compareceu;
    cdsHorariosDiariosDEPARTAMENTO.AsString := horario.Departamento.departamento;
    cdsHorariosDiariosPROFISSIONAL.AsString := horario.Profissional.Nome;

    if assigned(conta) then
    begin
      cdsHorariosDiariosVALOR.AsFloat      := conta.TotalConta;
      cdsHorariosDiariosSTATUS.AsString    := conta.descricaoStatus;
      cdsHorariosDiariosID_CONTA.AsInteger := conta.ID;
      cdsHorariosDiariosVALOR_PAGO.AsFloat := conta.ValorPago;
    end
    else
    begin
      cdsHorariosDiariosVALOR.AsFloat      := horario.valorServicos;
      cdsHorariosDiariosSTATUS.AsString    := 'ABERTA';
      cdsHorariosDiariosID_CONTA.AsInteger := 0;
      cdsHorariosDiariosVALOR_PAGO.AsFloat := 0;
    end;

    cdsHorariosDiarios.Post;

  end;

end;

function TfrmContasHorarios.receber :Boolean;
var pagando :Real;
    parcela :TParcela;
    movimento :TMovimento;
    Conta   :TConta;
    vVencimento :TDateTime;
    cds     :TClientDataSet;
    pagar_integral :boolean;
begin
  if BuscaDepartamento1.Departamento.tipoHorarios = 'D' then
    cds := cdsHorariosDiarios
  else
    cds := cdsHorarioMensal;

  pagar_integral := cds.RecordCount > 1;

  cds.First;
  while not cds.Eof do
  begin
    Conta := TConta.Create;
    Conta.ID := cds.FieldByName('ID_CONTA').AsInteger;

    if BuscaDepartamento1.Departamento.tipoHorarios = 'M' then
    begin
      Conta.ID_ClienteMensal := BuscaPessoa1.Pessoa.ClienteMensal.ID;
      vVencimento            := cdsHorarioMensalDIA_PAGAMENTO.AsDateTime;
    end
    else
      Conta.ID_Spa := cdsHorariosDiariosID.AsInteger;

    if not pagar_integral then
    begin
      pagando := IfThen(edtReceber.Value > edtValorRestante.Value, edtValorRestante.Value, edtReceber.Value);
      pagando := cds.FieldByName('VALOR_PAGO').AsFloat + pagando;
    end
    else
      pagando := cds.FieldByName('VALOR').AsFloat;

    Conta.TotalConta   := cds.FieldByName('VALOR').AsFloat;//como esta sendo apenas uma parcela joga direto o valor
    Conta.ValorPago    := Conta.ValorPago + pagando;
    Conta.QtdParcelas  := 1;
    Conta.DtCriacao    := IfThen(Conta.ID = 0, date, Conta.DtCriacao);

    parcela := TParcela.Create;

    if Conta.Parcelas.Count > 0 then
      parcela.ID := Conta.Parcelas.Items[0].ID;

    parcela.NumeroParcela := 1;
    parcela.ValorParcela  := cds.FieldByName('VALOR').AsFloat;
    parcela.ValorPago     := pagando;
    parcela.DtVencimento  := vVencimento;

    movimento := TMovimento.Create;

    movimento.TipoMoeda   := cmbMoeda.ItemIndex;
    movimento.ValorPago   := IfThen(edtReceber.Value > edtValorRestante.Value, edtValorRestante.Value, edtReceber.Value);
    movimento.DtPagamento := date;
    movimento.ID_Caixa    := 1;
    parcela.Movimentos.Add(movimento);

    Conta.Parcelas.Add(parcela);
    Conta.Save;

    FreeAndNil(Conta);
    cds.Next;
  end;

  avisar('Recebimento efetuado com sucesso!');

  cds.Filtered := false;
  limpaValores;
end;

end.

unit uContasExtra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, uPersistentObject, Math, System.StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Datasnap.DBClient, Datasnap.Provider, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.ComCtrls, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, Vcl.Mask, RxToolEdit,
  RxCurrEdit, Generics.Collections, framePeriodo, System.DateUtils;

type
  TfrmContasExtra = class(TfrmCadastroPadrao)
    Label3: TLabel;
    edtTotalConta: TCurrencyEdit;
    Label1: TLabel;
    edtTotalPago: TCurrencyEdit;
    edtStatus: TEdit;
    Label2: TLabel;
    memDescricaoConta: TMemo;
    Label4: TLabel;
    edtQtdeParcelas: TCurrencyEdit;
    Label5: TLabel;
    dtpVencimento: TJvDatePickerEdit;
    Label6: TLabel;
    btnGerar: TBitBtn;
    DBGrid1: TDBGrid;
    cdsParcelas: TClientDataSet;
    dsParcelas: TDataSource;
    Label7: TLabel;
    edtValorParcela: TCurrencyEdit;
    Label8: TLabel;
    edtValorPagoParcela: TCurrencyEdit;
    Label9: TLabel;
    edtReceber: TCurrencyEdit;
    btnReceber: TBitBtn;
    cdsID: TIntegerField;
    cdsNR_DOCUMENTO: TStringField;
    cdsSTATUS: TStringField;
    cdsParcelasID: TIntegerField;
    cdsParcelasNR_PARCELA: TSmallintField;
    cdsParcelasVALOR_PARCELA: TFloatField;
    cdsParcelasVALOR_PAGO: TFloatField;
    cdsParcelasSTATUS: TStringField;
    cdsParcelasVENCIMENTO: TDateField;
    Label10: TLabel;
    edtNrDocumento: TCurrencyEdit;
    Label11: TLabel;
    edtAReceber: TCurrencyEdit;
    edtTroco: TCurrencyEdit;
    Label12: TLabel;
    cdsTOTAL_CONTA: TBCDField;
    cdsVALOR_PAGO: TBCDField;
    cdsDESCRICAO: TStringField;
    GroupBox1: TGroupBox;
    Shape3: TShape;
    Label34: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    cdsVENCIMENTO: TDateField;
    btnExtornar: TBitBtn;
    cdsParcelasPAGANDO: TFloatField;
    cmbMoeda: TComboBox;
    Label13: TLabel;
    cdsParcelasMOEDA: TSmallintField;
    GroupBox2: TGroupBox;
    Shape4: TShape;
    Periodo1: TPeriodo;
    chkQuitadas: TCheckBox;
    chkParciais: TCheckBox;
    chkEmAberto: TCheckBox;
    btnFiltrar: TBitBtn;
    procedure dtpVencimentoChange(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure cdsParcelasAfterScroll(DataSet: TDataSet);
    procedure edtReceberChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtStatusChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1Enter(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure DBGListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtTotalPagoChange(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnExtornarClick(Sender: TObject);
    procedure chkQuitadasClick(Sender: TObject);
  protected
    procedure executaDepoisIncluir;override;
    procedure executaDepoisAlterar;override;

    procedure carregarDados;override;
    procedure carregarDaLista;override;
    procedure CarregarRegistro;override;
    procedure LimparCampos;override;
    procedure atualizaGrid(Obj: TPersistentObject);override;
    procedure gerarParcelas;
    procedure receberParcela;
    procedure extornarPagamento;

    function Incluir :Boolean;override;
    function Alterar :Boolean;override;
    function Salvar :TPersistentObject;override;
    function Cancelar :Boolean;override;

    function verificaObrigatorios :Boolean;override;
  end;

var
  frmContasExtra: TfrmContasExtra;

implementation

uses Conta, Parcela, Movimento;

{$R *.dfm}

{ TfrmContasExtra }

function TfrmContasExtra.Alterar: Boolean;
begin
  inherited;
end;

procedure TfrmContasExtra.atualizaGrid(Obj: TPersistentObject);
var Conta :TConta;
begin
  inherited;
  try
    Conta                     := TConta(Obj);
    cdsID.AsInteger           := Conta.ID;
    cdsNR_DOCUMENTO.AsString  := Conta.NrDocumento;
    cdsSTATUS.AsString        := Conta.Status;
    cdsDESCRICAO.AsString     := Conta.Descricao;
    cdsTOTAL_CONTA.AsFloat    := Conta.TotalConta;
    cdsVALOR_PAGO.AsFloat     := Conta.ValorPago;
    cds.Post;
  finally
    FreeAndNil(Conta);
  end;
end;

procedure TfrmContasExtra.btnFiltrarClick(Sender: TObject);
begin
  carregarDados;
end;

procedure TfrmContasExtra.btnExtornarClick(Sender: TObject);
begin
  extornarPagamento;
end;

procedure TfrmContasExtra.btnGerarClick(Sender: TObject);
begin
  if trim(dtpVencimento.Text) = '/  /' then
    balaoInformacao(dtpVencimento,'A data do vencimento deve ser informada')
  else
    gerarParcelas;
end;

procedure TfrmContasExtra.btnReceberClick(Sender: TObject);
begin
  if cmbMoeda.ItemIndex = 0 then
    balaoInformacao(cmbMoeda,'A moeda do pagamento deve ser informada')
  else
    receberParcela;
end;

function TfrmContasExtra.Cancelar: Boolean;
begin
  inherited;
  edtTotalConta.Enabled := true;
end;

procedure TfrmContasExtra.carregarDaLista;
var Conta :TConta;
    Contas :TObjectList<TConta>;
    condicaoPeriodo, condicaoStatus :String;
begin
  inherited;
  try
    Periodo1.setaSeparador('.');
    condicaoPeriodo := ' par.dt_vencimento between '''+Periodo1.dtpDataInicial.Text+''' and '''+Periodo1.dtpDataFinal.Text+''' ';
    Periodo1.setaSeparador('/');

    if not(not chkQuitadas.Checked and not chkParciais.Checked and not chkEmAberto.Checked) and
       not( chkQuitadas.Checked and chkParciais.Checked and chkEmAberto.Checked) then
    begin
      condicaoStatus := IfThen(chkQuitadas.Checked,',''Q''','');
      condicaoStatus := condicaoStatus+ IfThen(chkParciais.Checked,',''P''','');
      condicaoStatus := condicaoStatus+ IfThen(chkEmAberto.Checked,',''A''','');
      condicaoStatus := 'and par.status in ('+copy(condicaoStatus,2,length(condicaoStatus))+')';
    end;

    Conta := TConta.Create;
    Contas := Conta.LoadList<TConta>('where iif( not(select max(par.id) from parcelas par '+
                                     ' where par.id_conta = CONTAS.id and '+condicaoPeriodo+ condicaoStatus+
                                     '              ) is null, ''S'', ''N'') = ''S'' ');

    if not assigned(Contas) then
      exit;

    for Conta in Contas do
    begin
      cds.Append;
      cdsID.AsInteger           := Conta.ID;
      cdsNR_DOCUMENTO.AsString  := Conta.NrDocumento;
      cdsSTATUS.AsString        := Conta.Status;
      cdsDESCRICAO.AsString     := Conta.Descricao;
      cdsTOTAL_CONTA.AsFloat    := Conta.TotalConta;
      cdsVALOR_PAGO.AsFloat     := Conta.ValorPago;
      cdsVENCIMENTO.AsDateTime  := Conta.proximoVencimento;
      cds.Post;
    end;

  finally
   // Contas.Free;
  end;
end;

procedure TfrmContasExtra.carregarDados;
begin
  inherited;
  carregarDaLista;
{  cds.Close;
  dsp.DataSet := Conta.LoadAll;
  cds.Open;  }

  cds.Filtered := false;
  cds.Filter   := 'NR_DOCUMENTO > 0';
  cds.Filtered := true;
end;

procedure TfrmContasExtra.CarregarRegistro;
var Conta :TConta;
    Parcela :TParcela;
begin
  inherited;
  try
    Conta := TConta.Create;
    Conta.Load(cds.FieldByName('ID').AsInteger);

    edtID.Text              := IntToStr(Conta.ID);
    edtNrDocumento.Text     := Conta.NrDocumento;
    edtTotalConta.Value     := Conta.TotalConta;
    edtTotalPago.Value      := Conta.ValorPago;
    edtStatus.Text          := Conta.descricaoStatus;
    memDescricaoConta.Text  := Conta.Descricao;
    edtQtdeParcelas.Value   := Conta.QtdParcelas;

    edtQtdeParcelas.Enabled := (Conta.Status = 'A');
    dtpVencimento.Enabled   := (Conta.Status = 'A');
    btnGerar.Enabled        := (Conta.Status = 'A');

    for Parcela in Conta.Parcelas do
    begin
      if parcela.NumeroParcela = 1 then
        dtpVencimento.Date  := Parcela.DtVencimento;

      cdsParcelas.Append;
      cdsParcelasID.AsInteger          := parcela.ID;
      cdsParcelasNR_PARCELA.AsInteger  := parcela.NumeroParcela;
      cdsParcelasVALOR_PARCELA.AsFloat := parcela.ValorParcela;
      cdsParcelasVALOR_PAGO.AsFloat    := parcela.ValorPago;
      cdsParcelasSTATUS.AsString       := parcela.descricaoStatus;
      cdsParcelasVENCIMENTO.AsDateTime := parcela.DtVencimento;
      cdsParcelas.Post;
    end;

  finally
    FreeAndNil(Conta);
  end;
end;

procedure TfrmContasExtra.cdsAfterScroll(DataSet: TDataSet);
begin
  btnAlterar.Enabled := (cdsSTATUS.AsString <> 'Q');
end;

procedure TfrmContasExtra.cdsParcelasAfterScroll(DataSet: TDataSet);
begin
  edtReceber.Clear;
  edtTroco.Clear;
  edtValorParcela.Value     := cdsParcelasVALOR_PARCELA.AsFloat;
  edtValorPagoParcela.Value := cdsParcelasVALOR_PAGO.AsFloat;
  edtAReceber.Value         := edtValorParcela.Value - edtValorPagoParcela.Value;
  cmbMoeda.ItemIndex        := cdsParcelasMOEDA.AsInteger;
  edtReceber.Enabled        := (cdsParcelasVALOR_PARCELA.AsFloat > cdsParcelasVALOR_PAGO.AsFloat);
  cmbMoeda.Enabled          := (cdsParcelasVALOR_PARCELA.AsFloat > cdsParcelasVALOR_PAGO.AsFloat);
  btnExtornar.Enabled       := (cdsParcelasVALOR_PAGO.AsFloat > 0);
end;

procedure TfrmContasExtra.chkQuitadasClick(Sender: TObject);
begin
  btnFiltrar.Click;
end;

procedure TfrmContasExtra.DBGListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  With TDBGridCBN(Sender) do
  begin
    if Column.FieldName = 'STATUS' then
    begin
      if DataSource.DataSet.FieldByName('STATUS').AsString = 'Q' then
      begin
        Canvas.Brush.Color := $009AD19D;
        Canvas.Font.Color  := $009AD19D;
      end
      else if DataSource.DataSet.FieldByName('STATUS').AsString = 'A' then
      begin
        Canvas.Brush.Color := $00EFB4BE;
        Canvas.Font.Color  := $00EFB4BE;
      end
      else if DataSource.DataSet.FieldByName('STATUS').AsString = 'P' then
      begin
        Canvas.Brush.Color := $00B4E8EF;
        Canvas.Font.Color  := $00B4E8EF;
      end;

      Canvas.FillRect(Rect);
      DefaultDrawDataCell(Rect, columns[datacol].field, State);
    end;
  end;
end;

procedure TfrmContasExtra.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  With TDBGridCBN(Sender) do
  begin
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
    end;
  end;
end;

procedure TfrmContasExtra.DBGrid1Enter(Sender: TObject);
begin
  cdsParcelasAfterScroll(nil);
end;

procedure TfrmContasExtra.dtpVencimentoChange(Sender: TObject);
begin
  if dtpVencimento.Date < Date then
    balaoInformacao(dtpVencimento,'Atenção. Data de vencimento anterior a data corrente');
end;

procedure TfrmContasExtra.edtReceberChange(Sender: TObject);
begin
  if edtReceber.Value > edtAReceber.Value then
    edtTroco.Value := edtReceber.Value - edtAReceber.Value
  else
    edtTroco.Clear;

  btnReceber.Enabled := (edtReceber.Value > 0);
end;

procedure TfrmContasExtra.edtStatusChange(Sender: TObject);
begin
  case AnsiIndexStr(UpperCase(edtStatus.Text), ['ABERTA','PARCIAL','QUITADA']) of
    0 : edtStatus.Color := $00EFB4BE;
    1 : edtStatus.Color := $00B4E8EF;
    2 : edtStatus.Color := $009AD19D;
  end;
end;

procedure TfrmContasExtra.edtTotalPagoChange(Sender: TObject);
begin
  if edtTotalPago.Value = edtTotalConta.Value then
    edtStatus.Text := 'QUITADA'
  else if edtTotalPago.Value > 0 then
    edtStatus.Text := 'PARCIAL'
  else
    edtStatus.Text := 'ABERTA';
end;

procedure TfrmContasExtra.executaDepoisAlterar;
begin
  inherited;
  edtTotalConta.Enabled := false;
  dbgrid1.SetFocus;
end;

procedure TfrmContasExtra.executaDepoisIncluir;
begin
  inherited;
  if edtTotalConta.Enabled then
    edtNrDocumento.SetFocus
  else
    dbgrid1.SetFocus;
end;

procedure TfrmContasExtra.extornarPagamento;
begin
  if not confirma('Confirma extorno do pagamento da parcela Nº '+cdsParcelasNR_PARCELA.AsString+','+#13#10+
                  'no valor de R$'+formatFloat('#,0.00',cdsParcelasVALOR_PAGO.AsFloat)) then
    Exit;

  edtTotalPago.Value := edtTotalPago.Value - cdsParcelasVALOR_PAGO.AsFloat;

  cdsParcelas.Edit;
  cdsParcelasVALOR_PAGO.AsFloat := 0;
  cdsParcelasSTATUS.AsString    := 'ABERTA';
  cdsParcelas.Post;

  dbgrid1.SetFocus;
end;

procedure TfrmContasExtra.FormShow(Sender: TObject);
begin
  inherited;
  cdsParcelas.CreateDataSet;
  Periodo1.dtpDataInicial.Date := StartOfTheMonth(Date);
  Periodo1.dtpDataFinal.Date   := EndOfTheMonth(Date);
  btnFiltrar.Click;
end;

procedure TfrmContasExtra.gerarParcelas;
var i, dias :integer;
  valor, valorTotal, diferenca :Real;
begin
  dias  := 0;
  valor := RoundTo(edtTotalConta.Value / edtQtdeParcelas.AsInteger,-2);
  valorTotal := valor * edtQtdeParcelas.AsInteger;

  diferenca := edtTotalConta.Value - valorTotal;

  cdsParcelas.EmptyDataSet;
  for i := 0 to edtQtdeParcelas.AsInteger -1 do
  begin
    cdsParcelas.Append;
    cdsParcelasNR_PARCELA.AsInteger  := i+1;
    cdsParcelasVALOR_PARCELA.AsFloat := valor + IfThen((i+1)=edtQtdeParcelas.AsInteger, diferenca, 0);
    cdsParcelasSTATUS.AsString       := 'ABERTA';
    cdsParcelasVENCIMENTO.AsDateTime := dtpVencimento.Date + dias;
    cdsParcelas.Post;

    dias := dias + 30;
  end;
end;

function TfrmContasExtra.Incluir: Boolean;
begin
  inherited;
end;

procedure TfrmContasExtra.LimparCampos;
begin
  inherited;
  edtID.Text := '0';
  edtTotalConta.Clear;
  edtTotalPago.Clear;
  edtStatus.Text := 'ABERTA';
  memDescricaoConta.Clear;
  edtQtdeParcelas.Clear;
  dtpVencimento.OnChange := nil;
  dtpVencimento.Clear;
  dtpVencimento.OnChange := dtpVencimentoChange;
  edtValorPagoParcela.Clear;
  edtValorParcela.Clear;
  edtReceber.Clear;
  cdsParcelas.EmptyDataSet;
  edtNrDocumento.Clear;
end;

procedure TfrmContasExtra.receberParcela;
var valorRecebido :Real;
begin
  if edtReceber.Value > edtAReceber.Value then
    valorRecebido := edtAReceber.Value
  else
    valorRecebido := edtReceber.Value;

  cdsParcelas.Edit;
  cdsParcelasVALOR_PAGO.AsFloat := edtValorPagoParcela.Value + valorRecebido;
  cdsParcelasSTATUS.AsString    := IfThen(valorRecebido = edtAReceber.Value,'QUITADA','PARCIAL');
  cdsParcelasPAGANDO.AsFloat    := cdsParcelasPAGANDO.AsFloat + valorRecebido;
  cdsParcelasMOEDA.AsInteger    := cmbMoeda.ItemIndex;
  cdsParcelas.Post;

  edtTotalPago.Value := edtTotalPago.Value + valorRecebido;

  dbgrid1.SetFocus;
end;

function TfrmContasExtra.Salvar: TPersistentObject;
var Conta :TConta;
    Parcela :TParcela;
    movimento :TMovimento;
begin
  inherited;
  try
    Conta := TConta.Create;

    Conta.ID              := strToIntDef(edtID.Text,0);
    Conta.TotalConta      := edtTotalConta.Value;
    Conta.ValorPago       := edtTotalPago.Value;
    Conta.QtdParcelas     := cdsParcelas.RecordCount;
    Conta.Status          := edtStatus.Text[1];
    Conta.Descricao       := memDescricaoConta.Text;
    Conta.NrDocumento     := edtNrDocumento.Text;
    Conta.DtCriacao       := IfThen(Conta.ID = 0, date, Conta.DtCriacao);

    cdsParcelas.First;
    while not cdsParcelas.Eof do
    begin
      Parcela               := TParcela.Create;
      Parcela.ID            := cdsParcelasID.AsInteger;
      Parcela.NumeroParcela := cdsParcelasNR_PARCELA.AsInteger;
      Parcela.ValorParcela  := cdsParcelasVALOR_PARCELA.AsFloat;
      Parcela.ValorPago     := cdsParcelasVALOR_PAGO.AsFloat;
      Parcela.Status        := copy(cdsParcelasSTATUS.AsString,1,1);
      Parcela.DtVencimento  := cdsParcelasVENCIMENTO.AsDateTime;

      {se ja existe movimento e o valor pago é zero, está extornando}
      if (Parcela.ValorPago = 0) and assigned(Parcela.Movimentos) then
      begin
        for movimento in Parcela.Movimentos do
          movimento.Delete;
      end
      else
      begin
        movimento := TMovimento.Create;

        if cdsParcelasPAGANDO.AsFloat > 0 then
        begin
            movimento.TipoMoeda   := cmbMoeda.ItemIndex;
            movimento.ValorPago   := cdsParcelasPAGANDO.AsFloat;
            movimento.DtPagamento := date;
            movimento.ID_Caixa    := 1;
            parcela.Movimentos.Add(movimento);
        end;
      end;

      Conta.Parcelas.Add(Parcela);

      cdsParcelas.Next;
    end;

    Conta.Save;

    result := Conta;
  Except
    on e :Exception do
      avisar('Erro ao salvar Cliente'+#13#10+e.Message);
  end;
end;

function TfrmContasExtra.verificaObrigatorios: Boolean;
begin
  result := false;

  if edtTotalConta.Value <= 0 then
    balaoInformacao(edtTotalConta, 'O total da conta não foi informado')
  else if memDescricaoConta.Text = '' then
    balaoInformacao(memDescricaoConta, 'A descrição da conta não foi informada')
  else if cdsParcelas.IsEmpty then
    balaoInformacao(btnGerar, 'Nenhuma parcela foi gerada')
  else
    result := true;
end;

end.

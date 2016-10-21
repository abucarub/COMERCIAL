unit uReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.ExtCtrls, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, RxToolEdit, RxCurrEdit, Conta;

type
  TfrmReceber = class(TfrmPadrao)
    edtTotalConta: TCurrencyEdit;
    edtValorPago: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtReceber: TCurrencyEdit;
    Label7: TLabel;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel1: TPanel;
    Shape1: TShape;
    lbTitulo: TLabel;
    lbProfissional: TLabel;
    Label1: TLabel;
    edtValorRestante: TCurrencyEdit;
    Label2: TLabel;
    edtTroco: TCurrencyEdit;
    procedure edtTotalContaExit(Sender: TObject);
    procedure edtReceberChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FID_ClienteMensal :integer;
    FVencimento :TDate;
    FID_SPA :Integer;
    FConta :TConta;

    procedure buscaConta(pID_Conta :integer);

  public
    constructor create(AOwner: TComponent; const pID_Conta :integer = 0;
                                           const pID_ClienteMensal :integer = 0;
                                           const pID_SPA :integer = 0;
                                           const pVencimento :TDate = 0;
                                           valor :Real = 0); overload;
  end;

var
  frmReceber: TfrmReceber;

implementation

uses Math, Parcela;

{$R *.dfm}

{ TfrmReceber }

procedure TfrmReceber.btnCancelarClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

procedure TfrmReceber.btnSalvarClick(Sender: TObject);
var pagando :Real;
    parcela :TParcela;
begin
  if not assigned(FConta) then
    FConta := TConta.Create;

  if FID_ClienteMensal > 0 then
    FConta.ID_ClienteMensal := FID_ClienteMensal
  else
    FConta.ID_Spa := FID_SPA;

  pagando := IfThen(edtReceber.Value > edtValorRestante.Value, edtValorRestante.Value, edtReceber.Value);

  FConta.TotalConta   := edtTotalConta.Value;
  FConta.ValorPago    := FConta.ValorPago + pagando;
  FConta.QtdParcelas  := 1;

  parcela := TParcela.Create;
  parcela.NumeroParcela := 1;
  parcela.ValorParcela  := FConta.TotalConta;
  parcela.ValorPago     := FConta.ValorPago + pagando;
  parcela.DtVencimento  := FVencimento;

  FConta.Parcelas.Add(parcela);
  FConta.Save;

  self.ModalResult := mrOk;
end;

procedure TfrmReceber.buscaConta(pID_Conta :integer);
begin
  FConta := TConta.Create;
  FConta.Load(pID_Conta);

  edtTotalConta.Value     := FConta.TotalConta;
  edtValorPago.Value      := FConta.ValorPago;
  edtValorRestante.Value  := FConta.TotalConta - FConta.ValorPago;
end;

constructor TfrmReceber.create(AOwner: TComponent; const pID_Conta, pID_ClienteMensal, pID_SPA: integer; const pVencimento: TDate; valor :Real);
begin
  inherited Create(AOwner);
  FID_ClienteMensal   := pID_ClienteMensal;
  FID_SPA             := pID_SPA;
  FVencimento         := pVencimento;
//  edtVencimento.Text := DateToStr(pVencimento);
  edtTotalConta.Value := valor;
  edtValorRestante.Value := valor;
  if pID_Conta > 0 then
    buscaConta(pID_Conta);
end;

procedure TfrmReceber.edtReceberChange(Sender: TObject);
begin
  if (edtReceber.Value > 0) and (edtReceber.Value > edtValorRestante.Value) then
    edtTroco.Value := edtReceber.Value - edtValorRestante.Value;
end;

procedure TfrmReceber.edtTotalContaExit(Sender: TObject);
begin
  if edtTotalConta.Value <= 0 then
  begin
    avisar(1,'O total da conta não foi informado');
    edtTotalConta.SetFocus;
  end;
end;

end.

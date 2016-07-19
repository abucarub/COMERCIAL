unit Conta;

interface

uses uPersistentObject, uAtrib, System.SysUtils;

type
  [TABLENAME('CONTAS')]
  TConta = class(TPersistentObject)
  private
    FID_Spa: Integer;
    FTotalConta: Real;
    FValorPago: Real;
    FQtdParcelas: Integer;
    FStatus: String;
    FID_Caixa: Integer;

  public
    [FieldName('ID_SPA')]
    property ID_Spa: Integer read FID_Spa write FID_Spa;
    [FieldName('TOTAL_CONTA')]
    property TotalConta: Real read FTotalConta write FTotalConta;
    [FieldName('VALOR_PAGO')]
    property ValorPago: Real read FValorPago write FValorPago;
    [FieldName('QTD_PARCELAS')]
    property QtdParcelas: Integer read FQtdParcelas write FQtdParcelas;
    [FieldName('STATUS')]
    property Status: String read FStatus write FStatus;
    [FieldName('ID_CAIXA')]
    property ID_Caixa: Integer read FID_Caixa write FID_Caixa;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TConta }

procedure TConta.Clear;
begin
  ID := 0;
  FTotalConta  := 0;
  FValorPago   := 0;
  FQtdParcelas := 0;
  FStatus      := '';
  FID_Caixa    := 0;
end;

function TConta.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FTotalConta = 0) and
            (FValorPago = 0) and
            (FQtdParcelas = 0) and
            (FStatus = '') and
            (FID_Caixa = 0);
end;

procedure TConta.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

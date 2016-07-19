unit Parcela;

interface

uses uPersistentObject, uAtrib, System.SysUtils;

type
  [TABLENAME('PARCELAS')]
  TParcela = class(TPersistentObject)
  private
    FID_Conta: Integer;
    FNumeroParcela: Integer;
    FValorParcela: Real;
    FValorPago: Real;
    FStatus: String;

  public
    [FieldName('ID_CONTA')]
    property ID_Conta: Integer read FID_Conta write FID_Conta;
    [FieldName('NUMERO_PARCELA')]
    property NumeroParcela: Integer read FNumeroParcela write FNumeroParcela;
    [FieldName('VALOR_PARCELA')]
    property ValorParcela: Real read FValorParcela write FValorParcela;
    [FieldName('VALOR_PAGO')]
    property ValorPago: Real read FValorPago write FValorPago;
    [FieldName('STATUS')]
    property Status: String read FStatus write FStatus;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TParcela }

procedure TParcela.Clear;
begin
  ID             := 0;
  FNumeroParcela := 0;
  FValorParcela  := 0;
  FValorPago     := 0;
  FStatus        := '';
end;

function TParcela.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FNumeroParcela = 0) and
            (FValorParcela = 0) and
            (FValorPago = 0) and
            (FStatus = '');
end;

procedure TParcela.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

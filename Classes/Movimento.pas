unit Movimento;

interface

uses uPersistentObject, uAtrib, System.SysUtils;

type
  [TABLENAME('MOVIMENTOS')]
  TMovimento = class(TPersistentObject)
  private
    FID_Parcela: Integer;
    FTipoMoeda: Integer;
    FValorPago: Real;
    FDtPagamento: TDateTime;
    FID_Caixa: Integer;

  public
    [FieldName('ID_PARCELA')]
    property ID_Parcela: Integer read FID_Parcela write FID_Parcela;
    [FieldName('TIPO_MOEDA')]
    property TipoMoeda: Integer read FTipoMoeda write FTipoMoeda;
    [FieldName('VALOR_PAGO')]
    property ValorPago: Real read FValorPago write FValorPago;
    [FieldName('DT_PAGAMENTO')]
    property DtPagamento: TDateTime read FDtPagamento write FDtPagamento;
    [FieldName('ID_CAIXA')]
    property ID_Caixa: Integer read FID_Caixa write FID_Caixa;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TMovimento }

procedure TMovimento.Clear;
begin
  ID           := 0;
  FID_Parcela  := 0;
  FTipoMoeda   := 0;
  FValorPago   := 0;
  FDtPagamento := 0;
  FID_Caixa    := 0;
end;

function TMovimento.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Parcela = 0) and
            (FTipoMoeda = 0) and
            (FValorPago = 0) and
            (FDtPagamento = 0) and
            (FID_Caixa = 0);
end;

procedure TMovimento.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

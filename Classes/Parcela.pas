unit Parcela;

interface

uses uPersistentObject, uAtrib, System.SysUtils, System.StrUtils, Movimento, Generics.Collections;

type
  [TABLENAME('PARCELAS')]
  TParcela = class(TPersistentObject)
  private
    FID_Conta: Integer;
    FNumeroParcela: Integer;
    FValorParcela: Real;
    FValorPago: Real;
    FStatus: String;
    FDtVencimento: TDate;
    FdescricaoStatus: String;
    FMovimentos: TObjectList<TMovimento>;
    function GetDescricaoStatus: String;
    function GetMovimentos: TObjectList<TMovimento>;

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
    [FieldName('DT_VENCIMENTO')]
    property DtVencimento: TDate read FDtVencimento write FDtVencimento;

    [HasMany('ID_PARCELA',false,true)]
    property Movimentos: TObjectList<TMovimento> read GetMovimentos write FMovimentos;

    property descricaoStatus :String read GetDescricaoStatus;
  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
    procedure afterSave; overload; override;
  end;

implementation

{ TParcela }

procedure TParcela.Clear;
begin
  ID             := 0;
  FID_Conta      := 0;
  FNumeroParcela := 0;
  FValorParcela  := 0;
  FValorPago     := 0;
  FStatus        := '';
  FDtVencimento  := 0;
  if assigned(FMovimentos) then
    FreeAndNil(FMovimentos);
end;

procedure TParcela.afterSave;
var Movimento :TMovimento;
begin
  GetMovimentos;
  for Movimento in FMovimentos do
  begin
    Movimento.ID_Parcela := ID;
    Movimento.Save();
  end;
end;

function TParcela.GetDescricaoStatus: String;
begin
  result := IfThen(FValorPago >= FValorParcela,'QUITADA',IfThen(FValorPago > 0, 'PARCIAL', 'ABERTA'));
end;

function TParcela.GetMovimentos: TObjectList<TMovimento>;
begin
  if not assigned(FMovimentos) or (FMovimentos.Count = 0) then
    FMovimentos := self.LoadMany<TMovimento>;

  if not assigned(FMovimentos) then
    FMovimentos := TObjectList<TMovimento>.Create;

  Result := FMovimentos;
end;

function TParcela.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Conta = 0) and
            (FNumeroParcela = 0) and
            (FValorParcela = 0) and
            (FValorPago = 0) and
            (FStatus = '') and
            (FDtVencimento = 0);
end;

procedure TParcela.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

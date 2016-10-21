unit Conta;

interface

uses uPersistentObject, uAtrib, System.SysUtils, Parcela, Generics.Collections, System.StrUtils;

type
  [TABLENAME('CONTAS')]
  TConta = class(TPersistentObject)
  private
    FID_Spa: Integer;
    FTotalConta: Real;
    FValorPago: Real;
    FQtdParcelas: Integer;
    FStatus: String;
    FDescricao: String;
    FParcelas: TObjectList<TParcela>;
    FID_ClienteMensal: Integer;
    FNrDocumento: String;
    FDtCriacao: TDate;

    function GetParcelas: TObjectList<TParcela>;
    function GetStatus: String;
    function GetDescricaoStatus: String;
    function GetProximoVencimento: TDate;

  public
    [FieldName('ID_SPA')]
    property ID_Spa: Integer read FID_Spa write FID_Spa;
    [FieldName('ID_CLIENTE_MENSAL')]
    property ID_ClienteMensal: Integer read FID_ClienteMensal write FID_ClienteMensal;
    [FieldName('TOTAL_CONTA')]
    property TotalConta: Real read FTotalConta write FTotalConta;
    [FieldName('VALOR_PAGO')]
    property ValorPago: Real read FValorPago write FValorPago;
    [FieldName('QTD_PARCELAS')]
    property QtdParcelas: Integer read FQtdParcelas write FQtdParcelas;
    [FieldName('STATUS')]
    property Status: String read GetStatus write FStatus;
    [FieldName('DESCRICAO')]
    property Descricao: String read FDescricao write FDescricao;
    [FieldName('NR_DOCUMENTO')]
    property NrDocumento: String read FNrDocumento write FNrDocumento;
    [FieldName('DT_CRIACAO')]
    property DtCriacao: TDate read FDtCriacao write FDtCriacao;

    [HasMany('ID_CONTA',false,true)]
    property Parcelas: TObjectList<TParcela> read GetParcelas write FParcelas;

    property descricaoStatus :String read GetDescricaoStatus;
    property proximoVencimento :TDate read GetProximoVencimento;
  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
    procedure afterSave; overload; override;
  end;

implementation

{ TConta }

procedure TConta.afterSave;
var Parcela :TParcela;
begin
  GetParcelas;
  for Parcela in FParcelas do
  begin
    Parcela.ID_Conta := ID;
    Parcela.Save();
  end;
end;

procedure TConta.Clear;
begin
  ID := 0;
  FID_ClienteMensal := 0;
  FID_Spa           := 0;
  FTotalConta  := 0;
  FValorPago   := 0;
  FQtdParcelas := 0;
  FStatus      := '';
  FDescricao   := '';
  FNrDocumento := '';
  FDtCriacao   := 0;
  if assigned(FParcelas) then
    FreeAndNil(FParcelas);
end;

function TConta.GetDescricaoStatus: String;
begin
  result := IfThen(FValorPago = FTotalConta,'QUITADA',IfThen(FValorPago > 0, 'PARCIAL', 'ABERTA'));
end;

function TConta.GetParcelas: TObjectList<TParcela>;
begin
  if not assigned(FParcelas) then
    FParcelas := self.LoadMany<TParcela>;

  if not assigned(FParcelas) then
    FParcelas := TObjectList<TParcela>.Create;

  Result := FParcelas;
end;

function TConta.GetProximoVencimento: TDate;
var Parcela :TParcela;
begin
  result := 0;
  try
    for Parcela in Parcelas do
    begin
      if Parcela.Status <> 'Q' then
        result := Parcela.DtVencimento;

      if (FQtdParcelas = Parcela.NumeroParcela) and (result = 0) then
        result := Parcela.DtVencimento;
    end;

  finally
    FreeAndNil(Parcela);
  end;
end;

function TConta.GetStatus: String;
begin
  result := IfThen(FValorPago = FTotalConta,'Q',IfThen(FValorPago > 0, 'P', 'A'));
end;

function TConta.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (ID_Spa = 0) and
            (ID_ClienteMensal = 0) and
            (FTotalConta = 0) and
            (FValorPago = 0) and
            (FQtdParcelas = 0) and
            (FStatus = '') and
            (FDescricao = '') and
            (FNrDocumento = '') and
            (FDtCriacao = 0);
end;

procedure TConta.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

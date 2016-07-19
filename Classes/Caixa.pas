unit Caixa;

interface

uses uPersistentObject, uAtrib, System.SysUtils;

type
  [TABLENAME('CAIXA')]
  TCaixa = class(TPersistentObject)
  private
    FDataHora: TDateTime;
    FValorAbertura: Real;
    FValorFechamento: Real;

  public
    [FieldName('DATA_HORA')]
    property DataHora: TDateTime read FDataHora write FDataHora;
    [FieldName('VALOR_ABERTURA')]
    property ValorAbertura: Real read FValorAbertura write FValorAbertura;
    [FieldName('VALOR_FECHAMENTO')]
    property ValorFechamento: Real read FValorFechamento write FValorFechamento;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TCaixa }

procedure TCaixa.Clear;
begin
  ID               := 0;
  FDataHora        := 0;
  FValorAbertura   := 0;
  FValorFechamento := 0;
end;

function TCaixa.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FDataHora = 0) and
            (FValorAbertura = 0) and
            (FValorFechamento = 0);
end;

procedure TCaixa.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

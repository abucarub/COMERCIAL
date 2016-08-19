unit ClienteMensal;

interface

uses uPersistentObject, uAtrib;

type
  [Tablename('CLIENTES_MENSAL')]
  TClienteMensal = class(TPersistentObject)
  private
    FID_Pessoa: Integer;
    FSegunda: TTime;
    FTerca: TTime;
    FQuarta: TTime;
    FQuinta: TTime;
    FSexta: TTime;
    FSabado: TTime;
    FDiaPagamento: Integer;
    FDomingo: TTime;
    FInicio: TDate;

  public
    [FieldName('ID_PESSOA')]
    property ID_Pessoa: Integer read FID_Pessoa write FID_Pessoa;
    [FieldName('SEGUNDA')]
    property Segunda: TTime read FSegunda write FSegunda;
    [FieldName('TERCA')]
    property Terca: TTime read FTerca write FTerca;
    [FieldName('QUARTA')]
    property Quarta: TTime read FQuarta write FQuarta;
    [FieldName('QUINTA')]
    property Quinta: TTime read FQuinta write FQuinta;
    [FieldName('SEXTA')]
    property Sexta: TTime read FSexta write FSexta;
    [FieldName('SABADO')]
    property Sabado: TTime read FSabado write FSabado;
    [FieldName('DOMINGO')]
    property Domingo: TTime read FDomingo write FDomingo;
    [FieldName('DIA_PAGAMENTO')]
    property DiaPagamento: Integer read FDiaPagamento write FDiaPagamento;
    [FieldName('INICIO')]
    property Inicio: TDate read FInicio write FInicio;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TClienteMensal }

procedure TClienteMensal.Clear;
begin
  ID         := 0;
  FID_Pessoa := 0;
  FSegunda   := 0;
  FTerca     := 0;
  FQuarta    := 0;
  FQuinta    := 0;
  FSexta     := 0;
  FSabado    := 0;
  Fdomingo   := 0;
  FDiaPagamento := 0;
end;

function TClienteMensal.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Pessoa = 0) and
            (FSegunda = 0) and
            (FTerca = 0) and
            (FQuarta = 0) and
            (FQuinta = 0) and
            (FSexta = 0) and
            (FSabado = 0) and
            (FDomingo = 0) and
            (FDiaPagamento = 0);
end;

procedure TClienteMensal.LoadClass(const AValue: Integer);
begin
 inherited Load(AValue);
end;

end.

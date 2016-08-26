unit ClienteMensal;

interface

uses uPersistentObject, uAtrib, TabelaPreco, System.SysUtils;

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
    FID_Profissional: Integer;
    FID_Departamento: Integer;
    FID_TabelaPreco: Integer;
    FTabelaPreco: TTabelaPreco;
    function GetTabelaPreco: TTabelaPreco;

  public
    [FieldName('ID_PESSOA')]
    property ID_Pessoa: Integer read FID_Pessoa write FID_Pessoa;
    [FieldName('ID_PROFISSIONAL')]
    property ID_Profissional: Integer read FID_Profissional write FID_Profissional;
    [FieldName('ID_DEPARTAMENTO')]
    property ID_Departamento: Integer read FID_Departamento write FID_Departamento;
    [FieldName('ID_TABELA_PRECO')]
    property ID_TabelaPreco: Integer read FID_TabelaPreco write FID_TabelaPreco;
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

    [HasOne('ID_TABELA_PRECO')]
    property TabelaPreco: TTabelaPreco read GetTabelaPreco write FTabelaPreco;

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
  FID_Profissional := 0;
  FSegunda   := 0;
  FTerca     := 0;
  FQuarta    := 0;
  FQuinta    := 0;
  FSexta     := 0;
  FSabado    := 0;
  Fdomingo   := 0;
  FDiaPagamento := 0;
  FID_Departamento := 0;
  FID_TabelaPreco  := 0;
end;

function TClienteMensal.GetTabelaPreco: TTabelaPreco;
begin
  if assigned(FTabelaPreco) and (FID_TabelaPreco <> FTabelaPreco.ID) then
    FreeAndNil(FTabelaPreco);

  if not assigned(FTabelaPreco) then
    FTabelaPreco := self.LoadOne<TTabelaPreco>(ID_TabelaPreco);

  if not assigned(FTabelaPreco) then
    FTabelaPreco := TTabelaPreco.Create;

  Result := FTabelaPreco;
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
            (FDiaPagamento = 0) and
            (FID_Profissional = 0) and
            (FID_Departamento = 0) and
            (FID_TabelaPreco = 0);
end;

procedure TClienteMensal.LoadClass(const AValue: Integer);
begin
 inherited Load(AValue);
end;

end.

unit Pessoa;

interface

uses uPersistentObject, uAtrib, Endereco, Generics.Collections, System.SysUtils,
     ClienteMensal, TipoPessoa;//, SPA;

type
  [Tablename('PESSOAS')]
  TPessoa = class(TPersistentObject)
  private
    //FID: Integer;
    FCpfCnpj: String;
    FNome: String;
    FRgIe: String;
    FFone2: String;
    FFone1: String;
    FEmail: String;
    FDtCadastro :TDateTime;
    FDtNascimento :TDateTime;
    FTipo: integer;

    FEndereco: TEndereco;
    FClienteMensal: TClienteMensal;

    function GetEndereco: TEndereco;
    function GetClienteMensal: TClienteMensal;

  public
    [FieldName('NOME_RAZAO')]
    property Nome: String read FNome write FNome;
    [FieldName('CPF_CNPJ')]
    property CpfCnpj: String read FCpfCnpj write FCpfCnpj;
    [FieldName('RG_IE')]
    property RgIe: String read FRgIe write FRgIe;
    [FieldName('FONE1')]
    property Fone1: String read FFone1 write FFone1;
    [FieldName('FONE2')]
    property Fone2: String read FFone2 write FFone2;
    [FieldName('EMAIL')]
    property Email: String read FEmail write FEmail;
    [FieldName('DT_CADASTRO')]
    property DtCadastro: TDateTime read FDtCadastro write FDtCadastro;
    [FieldName('DT_NASCIMENTO')]
    property DtNascimento: TDateTime read FDtNascimento write FDtNascimento;
    [FieldName('TIPO')]
    property Tipo: integer read FTipo write FTipo;

    [HasOne('ID_PESSOA', false, true)]
    property Endereco: TEndereco read GetEndereco write FEndereco;
    [HasOne('ID_PESSOA', false, true)]
    property ClienteMensal: TClienteMensal read GetClienteMensal write FClienteMensal;

//    [HasMany('ID_SPA',false)]
//    property Horarios: TObjectList<TSPA> read GetServicosAgendados write FServicosAgendados;

  private
    destructor destroy;
    function GetTipoPessoa: TTipoPessoa;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;

  public
    property tipoPessoa :TTipoPessoa read GetTipoPessoa;
  end;

implementation

{ TCliente }

procedure TPessoa.Clear;
begin
  ID            := 0;
  FCpfCnpj      := '';
  FNome         := '';
  FRgIe         := '';
  FFone2        := '';
  FFone1        := '';
  FEmail        := '';
  FDtCadastro   := 0;
  FDtNascimento := 0;
  FTipo         := 0;
  if assigned(FEndereco) then
    FreeAndNil(FEndereco);
  if assigned(FClienteMensal) then
    FreeAndNil(FClienteMensal)
end;

destructor TPessoa.destroy;
begin
  if assigned(FEndereco) then
    FreeAndNil(FEndereco);
end;

function TPessoa.GetClienteMensal: TClienteMensal;
begin
  if not assigned(FClienteMensal) then
    FClienteMensal := self.LoadOne<TClienteMensal>;

  if not assigned(FClienteMensal) then
    FClienteMensal := TClienteMensal.Create;

  Result := FClienteMensal;
end;

function TPessoa.GetEndereco: TEndereco;
begin
  if not assigned(FEndereco) then
    FEndereco := self.LoadOne<TEndereco>;

  if not assigned(FEndereco) then
    FEndereco := TEndereco.Create;

  Result := FEndereco;
end;

 function TPessoa.GetTipoPessoa: TTipoPessoa;
begin
  result := TTipoPessoaGet.getTipoPorInteiro(self.FTipo);
end;

{
function TPessoa.GetEnderecoL: TList<TEndereco>;
begin
  if not assigned(FEnderecoL) then
    FEnderecoL := TList<TEndereco>.Create;

  Result := FEnderecoL;
end;  }

function TPessoa.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FCpfCnpj = '') and
            (FNome = '') and
            (FRgIe = '') and
            (FFone2 = '') and
            (FFone1 = '') and
            (FEmail = '') and
            (FDtCadastro = 0) and
            (FDtNascimento = 0) and
            (FTipo = 0);
end;

procedure TPessoa.LoadClass(const AValue: Integer);
begin
 // ID := AValue;
  inherited Load(AValue);
end;

end.

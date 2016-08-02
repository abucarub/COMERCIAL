unit Pessoa;

interface

uses uPersistentObject, uAtrib, Endereco, Generics.Collections, System.SysUtils;//, SPA;

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
    FDtNascimento :TDateTime;                                 criar classe alunoPilates extendendo TPessoa
    FEndereco: TEndereco;


    function GetEndereco: TEndereco;

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

    [HasOne('ID_PESSOA', false, true)]
    property Endereco: TEndereco read GetEndereco write FEndereco;
//    [HasMany('ID_SPA',false)]
//    property Horarios: TObjectList<TSPA> read GetServicosAgendados write FServicosAgendados;

  private
    destructor destroy;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
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
  if assigned(FEndereco) then
    FreeAndNil(FEndereco);
end;

destructor TPessoa.destroy;
begin
  if assigned(FEndereco) then
    FreeAndNil(FEndereco);
end;

function TPessoa.GetEndereco: TEndereco;
begin
  if not assigned(FEndereco) then
    FEndereco := self.LoadOne<TEndereco>;

  if not assigned(FEndereco) then
    FEndereco := TEndereco.Create;

  Result := FEndereco;
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
            (FDtNascimento = 0);
end;

procedure TPessoa.LoadClass(const AValue: Integer);
begin
 // ID := AValue;
  inherited Load(AValue);
end;

end.

unit Pessoa;

interface

uses uPersistentObject, uAtrib, Endereco, Generics.Collections, System.SysUtils;

type

  [Tablename('PESSOAS')]
  TPessoa = class(TPersistentObject)
  private
    FID: Integer;
    FCpfCnpj: String;
    FNome: String;
    FRgIe: String;
    FFone2: String;
    FFone1: String;
    FEmail: String;
    FEndereco: TEndereco;

    function GetEndereco: TEndereco;

  public
    [FieldName('ID', True, True)]
    property ID: Integer read FID write FID;
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

    [HasOne('ID_PESSOA')]
    property Endereco: TEndereco read GetEndereco write FEndereco;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
  end;

implementation

{ TCliente }

procedure TPessoa.Clear;
begin
  FID      := 0;
  FCpfCnpj := '';
  FNome    := '';
  FRgIe    := '';
  FFone2   := '';
  FFone1   := '';
  FEmail   := '';
  FreeAndNil(FEndereco);
end;

function TPessoa.GetEndereco: TEndereco;
begin
  if not assigned(FEndereco) then
    FEndereco := self.LoadOne<TEndereco>;

  Result := FEndereco;
end;


procedure TPessoa.LoadClass(const AValue: Integer);
begin
 // ID := AValue;
  inherited Load(AValue);
end;

end.

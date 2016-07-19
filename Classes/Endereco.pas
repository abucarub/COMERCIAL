unit Endereco;

interface

uses uPersistentObject, uAtrib, Cidade, System.SysUtils;

type

  [Tablename('ENDERECOS')]
  TEndereco = class(TPersistentObject)
  private
    FID: Integer;
    FRua: String;
    FBairro: String;
    FNumero: String;
    FComplemento: String;
    FCidade: TCidade;
    FID_Cidade: Integer;
    FID_Pessoa: Integer;

  private
    function GetCidade: TCidade;

  public
    [FieldName('ID', True, True)]
    property ID: Integer read FID write FID;
    [FieldName('RUA')]
    property Rua: String read FRua write FRua;
    [FieldName('BAIRRO')]
    property Bairro: String read FBairro write FBairro;
    [FieldName('NUMERO')]
    property Numero: String read FNumero write FNumero;
    [FieldName('COMPLEMENTO')]
    property Complemento: String read FComplemento write FComplemento;
    [FieldName('ID_CIDADE',false, false, true)]
    property ID_Cidade: Integer read FID_Cidade write FID_Cidade;
    [FieldName('ID_PESSOA',false, false, true)]
    property ID_Pessoa: Integer read FID_Pessoa write FID_Pessoa;

    [HasOne('ID_CIDADE')]
    property Cidade: TCidade read GetCidade write FCidade;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TEndereco }

procedure TEndereco.Clear;
begin
  FID           := 0;
  FRua          := '';
  FBairro       := '';
  FNumero       := '';
  FComplemento  := '';
  FID_Cidade    := 0;
  FID_Pessoa    := 0;
  if assigned(FCidade) then
    FreeAndNil(FCidade);
end;

function TEndereco.GetCidade: TCidade;
begin
  if not assigned(FCidade) and (self.FID_Cidade > 0) then
    FCidade := self.LoadOne<TCidade>(self.ID_Cidade);

  if not assigned(FCidade) then
    FCidade := TCidade.Create;

  Result := FCidade;
end;

function TEndereco.isEmpty: Boolean;
begin
  result := (FID = 0) and
            (FRua = '') and
            (FBairro = '') and
            (FNumero = '') and
            (FComplemento = '') and
            (FID_Cidade = 0) and
            (FID_Pessoa = 0);
end;

procedure TEndereco.LoadClass(const AValue: Integer);
begin
  //ID := AValue;
  inherited Load(AValue);
end;

end.

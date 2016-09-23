unit Cidade;

interface

uses uPersistentObject, uAtrib, Estado, System.SysUtils;

type

  [Tablename('CIDADES')]
  TCidade = class(TPersistentObject)
  private
    FID :Integer;
    FNome :String;
    FCep :String;
    FCodigo_ibge :Integer;
    FEstado :TEstado;
    FID_Estado: Integer;

    function GetEstado: TEstado;

  public
    [FieldName('ID', True, True)]
    property ID: Integer read FID write FID;
    [FieldName('NOME')]
    property Nome: String read FNome write FNome;
    [FieldName('CEP')]
    property Cep: String read FCep write FCep;
    [FieldName('CODIGO_IBGE')]
    property Codigo_ibge: Integer read FCodigo_ibge write FCodigo_ibge;
    [FieldName('ID_ESTADO')]
    property ID_Estado: Integer read FID_Estado write FID_Estado;

    [HasOne('ID_ESTADO')]
    property Estado: TEstado read GetEstado write FEstado;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TCidade }

procedure TCidade.Clear;
begin
  FID     := 0;
  FNome   := '';
  FCep    := '';
  FCodigo_ibge := 0;
  FID_Estado := 0;
  if assigned(FEstado) then
    FreeAndNil(FEstado);
end;

function TCidade.GetEstado: TEstado;
begin
  if not assigned(FEstado) and (self.ID_Estado > 0) then
    FEstado := self.LoadOne<TEstado>(self.ID_Estado);

  if not assigned(FEstado) then
    FEstado := TEstado.Create;

  Result := FEstado;
end;

function TCidade.isEmpty: Boolean;
begin
  result := (FID = 0) and
            (FNome = '') and
            (FCep = '') and
            (FCodigo_ibge = 0) and
            (FID_Estado = 0);
end;

procedure TCidade.LoadClass(const AValue: Integer);
begin
  //self := TCidade.Create;
  //ID := AValue;
  inherited Load(AValue);
end;

end.

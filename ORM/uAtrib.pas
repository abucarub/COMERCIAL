unit uAtrib;

interface

type
  TableName = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;
    constructor Create(const AValue: String);
  end;

  FieldName = class(TCustomAttribute)
  private
    FName: String;
    FFK: Boolean;
    FAutoInc: Boolean;
    FPK: Boolean;
  public
    property Name: String read FName write FName;
    property PK: Boolean read FPK write FPK;
    property AutoInc: Boolean read FAutoInc write FAutoInc;
    property FK: Boolean read FFK write FFK;
    constructor Create(const AValue: String; const APK: Boolean = False; const AAutoInc: Boolean = false;
                       const AFK: Boolean = False);
  end;

  TCustomRelationAttribute = class(TCustomAttribute)
  private
    FChildPropertyName: string;
    FUpgradeable: Boolean;
    FLocalProperty: Boolean;

  public
    constructor Create(const AChildPropertyName: string; const ALocalProperty: Boolean = true; const AUpgradeable: Boolean = false);
    {Nome do campo FK que identifica a classe filha }
    property ChildPropertyName: string read FChildPropertyName;
    {Determina se a classe filha é atualizável, através da classe mãe}
    property Upgradeable: boolean read FUpgradeable;
    {Determina se o campo FK é local (PK da classe filha na mãe), ou ao contrário (PK da classe mãe na filha)}
    property LocalProperty: boolean read FLocalProperty;
  end;

  HasOne = class(TCustomRelationAttribute);
  HasMany = class(TCustomRelationAttribute);

implementation

{ TableName }

constructor TableName.Create(const AValue: String);
begin
  FName := AValue;
end;

{ FieldName }

constructor FieldName.Create(const AValue: String; const APK, AAutoInc,
  AFK: Boolean);
begin
  FName := AValue;
  FPK := APK;
  FAutoInc := AAutoInc;
  FFK := AFK;
end;


{ TCustomRelationAttribute }

constructor TCustomRelationAttribute.Create(const AChildPropertyName: string;
const ALocalProperty: Boolean; const AUpgradeable: Boolean);
begin
   inherited Create;
   FChildPropertyName := AChildPropertyName;
   FLocalProperty     := ALocalProperty;
   FUpgradeable       := AUpgradeable;
end;

end.

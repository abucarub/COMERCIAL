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
    FLazyLoad: boolean;

  public
    constructor Create(const AChildPropertyName: string);
    property ChildPropertyName: string read FChildPropertyName;
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

constructor TCustomRelationAttribute.Create(const AChildPropertyName: string);
begin
   inherited Create;
   FChildPropertyName := AChildPropertyName;
end;

end.

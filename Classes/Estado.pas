unit Estado;

interface

uses uPersistentObject, uAtrib;

type
  [Tablename('ESTADOS')]
  TEstado = class(TPersistentObject)
  private
    FID :Integer;
    FSigla :String;
    FNome :String;

  public
    [FieldName('ID', True, True)]
    property ID: Integer read FID write FID;
    [FieldName('SIGLA')]
    property Sigla: String read FSigla write FSigla;
    [FieldName('NOME')]
    property Nome: String read FNome write FNome;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
  end;

implementation

{ TEstado }

procedure TEstado.Clear;
begin
  FID    := 0;
  FSigla := '';
  FNome  := '';
end;

procedure TEstado.LoadClass(const AValue: Integer);
begin
  //ID := AValue;
  inherited Load(AValue);
end;

end.

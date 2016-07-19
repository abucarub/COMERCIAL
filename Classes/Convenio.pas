unit Convenio;

interface

uses uPersistentObject, uAtrib, System.SysUtils;

type
  [TABLENAME('CONVENIOS')]
  TConvenio = class(TPersistentObject)
  private
    FConvenio: String;

  public
    [FieldName('CONVENIO')]
    property Convenio: String read FConvenio write FConvenio;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TConvenio }

procedure TConvenio.Clear;
begin
  ID        := 0;
  FConvenio := '';
end;

function TConvenio.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (Fconvenio = '');
end;

procedure TConvenio.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

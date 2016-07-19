unit Departamento;

interface

uses uPersistentObject, uAtrib, System.SysUtils;

type
  [TEBLENAME('DEPARTAMENTOS')]
  TDepartamento = class(TPersistentObject)
  private
    FDepartamento: String;

  public
    [FieldName('DEPARTAMENTO')]
    property Departamento: String read FDepartamento write FDepartamento;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TDepartamento }

procedure TDepartamento.Clear;
begin
  ID            := 0;
  FDepartamento := '';
end;

function TDepartamento.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FDepartamento = '');
end;

procedure TDepartamento.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

unit Departamento;

interface

uses uPersistentObject, uAtrib, System.SysUtils;

type
  [TABLENAME('DEPARTAMENTOS')]
  TDepartamento = class(TPersistentObject)
  private
    FDepartamento: String;
    FTipoHorarios: String;

  public
    [FieldName('DEPARTAMENTO')]
    property departamento: String read FDepartamento write FDepartamento;
    [FieldName('TIPO_HORARIOS')]
    property tipoHorarios: String read FTipoHorarios write FTipoHorarios;

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
  FTipoHorarios := '';
end;

function TDepartamento.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FDepartamento = '') and
            (FTipoHorarios = '');
end;

procedure TDepartamento.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

unit Departamento;

interface

uses uPersistentObject, uAtrib, System.SysUtils, Generics.Collections, Servico;

type
  [TABLENAME('DEPARTAMENTOS')]
  TDepartamento = class(TPersistentObject)
  private
    FDepartamento: String;
    FTipoHorarios: String;
    FServicos: TObjectList<TServico>;
    function GetServicos: TObjectList<TServico>;

  public
    [FieldName('DEPARTAMENTO')]
    property departamento: String read FDepartamento write FDepartamento;
    [FieldName('TIPO_HORARIOS')]
    property tipoHorarios: String read FTipoHorarios write FTipoHorarios;

    [HasMany('ID_DEPARTAMENTO',false,true)]
    property Servicos: TObjectList<TServico> read GetServicos write FServicos;

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

function TDepartamento.GetServicos: TObjectList<TServico>;
begin
  if not assigned(FServicos) then
    FServicos := self.LoadMany<TServico>;

  if not assigned(FServicos) then
    FServicos := TObjectList<TServico>.Create;

  Result := FServicos;
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

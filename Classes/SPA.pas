unit SPA;

interface

uses uPersistentObject, uAtrib, System.SysUtils, ServicoAgendado,
     System.Generics.Collections, Pessoa, Departamento, system.StrUtils;

type
  [TABLENAME('SPA')]
  TSPA = class(TPersistentObject)
  private
  //  FID_Agendamento: Integer;
    FID_Pessoa: Integer;
    FData: TDate;
    FHora: TTime;
    FCompareceu: String;
    FPago: String;
    FServicosAgendados: TObjectList<TServicoAgendado>;
    FPessoa: TPessoa;
    FID_Departamento: Integer;
    FDepartamento: TDepartamento;
    FProfissional: TPessoa;
    FID_Profissional: Integer;
    FTipo: String;

    function GetServicosAgendados: TObjectList<TServicoAgendado>;
    function GetDuracaoServicos: TDateTime;
    function GetPessoa: TPessoa;
    function GetDepartamento: TDepartamento;
    function GetHorarioPassado: Boolean;
    function GetProfissional: TPessoa;

  public
  {  [FieldName('ID_AGENDAMENTO')]
    property ID_Agendamento: Integer read FID_Agendamento write FID_Agendamento; }
    [FieldName('ID_PESSOA')]
    property ID_Pessoa: Integer read FID_Pessoa write FID_Pessoa;
    [FieldName('ID_DEPARTAMENTO')]
    property ID_Departamento: Integer read FID_Departamento write FID_Departamento;
    [FieldName('ID_PROFISSIONAL')]
    property ID_Profissional: Integer read FID_Profissional write FID_Profissional;
    [FieldName('DATA')]
    property data: TDate read FData write FData;
    [FieldName('HORA')]
    property hora: TTime read FHora write FHora;
    [FieldName('COMPARECEU')]
    property compareceu: String read FCompareceu write FCompareceu;
    [FieldName('PAGO')]
    property pago: String read FPago write FPago;
    [FieldName('TIPO')]
    property tipo: String read FTipo write FTipo;

    [HasOne('ID_PESSOA')]
    property Pessoa: TPessoa read GetPessoa write FPessoa;
    [HasOne('ID_FUNCIONARIO')]
    property Profissional: TPessoa read GetProfissional write FProfissional;
    [HasOne('ID_DEPARTAMENTO')]
    property Departamento: TDepartamento read GetDepartamento write FDepartamento;

    [HasMany('ID_SPA',false,true)]
    property ServicosAgendados: TObjectList<TServicoAgendado> read GetServicosAgendados write FServicosAgendados;

  public
    function Horarios(const ID_PESSOA: integer = 0; const ID_DEPARTAMENTO: integer = 0;
                      const STATUS: String = 'T';const TIPO :String = ''):TObjectList<TSPA>;

    property duracaoServicos :TDateTime read GetDuracaoServicos;
    property horarioPassado :Boolean read GetHorarioPassado;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
    procedure afterSave; overload; override;
  end;

implementation

{ TSPA }

procedure TSPA.afterSave;
var Servico :TServicoAgendado;
begin
  for Servico in FServicosAgendados do
  begin
    Servico.ID_SPA := ID;
    Servico.Save();
  end;
end;

procedure TSPA.Clear;
begin
  ID              := 0;
  FData           := 0;
  FHora           := 0;
  FCompareceu     := '';
  FPago           := '';
  Ftipo           := '';
  if assigned(FPessoa) then
    FreeAndNil(FPessoa);
  if assigned(FDepartamento) then
    FreeAndNil(FDepartamento);
  if assigned(FServicosAgendados) then
    FServicosAgendados.Free;
end;

function TSPA.GetDepartamento: TDepartamento;
begin
  if not assigned(FDepartamento) then
    FDepartamento := self.LoadOne<TDepartamento>;

  if not assigned(FDepartamento) then
    FDepartamento := TDepartamento.Create;

  Result := FDepartamento;
end;

function TSPA.GetDuracaoServicos: TDateTime;
var i :integer;
begin
  result := 0;
  for i := 0 to ServicosAgendados.Count - 1 do
    result := result + ServicosAgendados.Items[i].duracao;
end;

function TSPA.GetHorarioPassado: Boolean;
begin
  result := (self.Data < date) or ((self.Data = date)and(self.Hora < time));
end;

function TSPA.GetPessoa: TPessoa;
begin
  if not assigned(FPessoa) then
    FPessoa := self.LoadOne<TPessoa>(FID_PESSOA);

  if not assigned(FPessoa) then
    FPessoa := TPessoa.Create;

  Result := FPessoa;
end;

function TSPA.GetProfissional: TPessoa;
begin
  if not assigned(FProfissional) then
    FProfissional := self.LoadOne<TPessoa>(FID_Profissional);

  if not assigned(FProfissional) then
    FProfissional := TPessoa.Create;

  Result := FProfissional;
end;

function TSPA.GetServicosAgendados: TObjectList<TServicoAgendado>;
begin
  if not assigned(FServicosAgendados) then
    FServicosAgendados := self.LoadMany<TServicoAgendado>;

  if not assigned(FServicosAgendados) then
    FServicosAgendados := TObjectList<TServicoAgendado>.Create;

  Result := FServicosAgendados;
end;

function TSPA.Horarios(const ID_PESSOA, ID_DEPARTAMENTO: integer; const STATUS: String;
const TIPO :String): TObjectList<TSPA>;
var where :String;
begin
  where := IfThen(ID_PESSOA > 0, ' WHERE P.ID = '+intToStr(ID_PESSOA), '');

  if ID_DEPARTAMENTO > 0 then
    where := where + IfThen(where <> '',' AND ',' WHERE ')+' D.ID = '+intToStr(ID_DEPARTAMENTO);

  if STATUS <> 'T' then
    where := where + IfThen(where <> '',' AND ',' WHERE ')+' SPA.COMPARECEU = '+QuotedStr(STATUS);

  where := where + IfThen(where <> '',' AND ',' WHERE ')+' SPA.TIPO <> '+QuotedStr('C');

  result := Self.LoadList<TSPA>(' INNER JOIN PESSOAS P ON P.ID = SPA.ID_PESSOA            '+
                                ' INNER JOIN DEPARTAMENTOS D ON D.ID = SPA.ID_DEPARTAMENTO'+ where );
end;

function TSPA.isEmpty: Boolean;
begin
  result := (ID = 0) and
        //    (FID_Agendamento = 0) and
            (FData = 0) and
            (FHora = 0) and
            (FCompareceu = '') and
            (FPago = '') and
            (FTipo = '');
end;

procedure TSPA.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

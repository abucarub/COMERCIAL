unit Agendamento;

interface

uses uPersistentObject, uAtrib, Pessoa, Generics.Collections, System.SysUtils,
     Convenio, Departamento, SPA, ServicoAgendado;

type

  [TABLENAME('AGENDAMENTOS')]
  TAgendamento = class(TPersistentObject)
  private
    FID_Convenio: Integer;
    FID_Pessoa: Integer;
    FID_Departamento: Integer;
    FSegunda: TDateTime;
    FTerca: TDateTime;
    FQuarta: TDateTime;
    FQuinta: TDateTime;
    FSexta: TDateTime;
    FSabado: TDateTime;
    FVezes: TDateTime;

  private
    FPessoa: TPessoa;
    FConvenio: TConvenio;
    FDepartamento: TDepartamento;
    FSPAs: TObjectList<TSPA>;
    FServicos: TObjectList<TServicoAgendado>;

    function GetPessoa: TPessoa;
    function GetConvenio: TConvenio;
    function GetDepartamento: TDepartamento;
    function GetSPAs: TObjectList<TSPA>;
    function GetServicos: TObjectList<TServicoAgendado>;

  public
    [FieldName('ID_CONVENIO')]
    property ID_Convenio: Integer read FID_Convenio write FID_Convenio;
    [FieldName('ID_PESSOA')]
    property ID_Pessoa: Integer read FID_Pessoa write FID_Pessoa;
    [FieldName('ID_DEPARTAMENTO')]
    property ID_Departamento: Integer read FID_Departamento write FID_Departamento;
    [FieldName('SEGUNDA')]
    property Segunda: TDateTime read FSegunda write FSegunda;
    [FieldName('TERCA')]
    property Terca: TDateTime read FTerca write FTerca;
    [FieldName('QUARTA')]
    property Quarta: TDateTime read FQuarta write FQuarta;
    [FieldName('QUINTA')]
    property Quinta: TDateTime read FQuinta write FQuinta;
    [FieldName('SEXTA')]
    property Sexta: TDateTime read FSexta write FSexta;
    [FieldName('SABADO')]
    property Sabado: TDateTime read FSabado write FSabado;
    [FieldName('VEZES')]
    property Vezes: TDateTime read FVezes write FVezes;

    [HasOne('ID_PESSOA')]
    property Pessoa: TPessoa read GetPessoa write FPessoa;
    [HasOne('ID_CONVENIO')]
    property Convenio: TConvenio read GetConvenio write FConvenio;
    [HasOne('ID_DEPARTAMENTO')]
    property Departamento: TDepartamento read GetDepartamento write FDepartamento;

    [HasMany('ID_AGENDAMENTO', false, true)]
    property SPAs: TObjectList<TSPA> read GetSPAs write FSPAs;

    [HasMany('ID_AGENDAMENTO', false, true)]
    property Servicos: TObjectList<TServicoAgendado> read GetServicos write FServicos;

  private
    destructor destroy;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TAgendamento }

procedure TAgendamento.Clear;
begin
  ID               := 0;
  FID_Pessoa       := 0;
  FID_Departamento := 0;
  FSegunda         := 0;
  FTerca           := 0;
  FQuarta          := 0;
  FQuinta          := 0;
  FSexta           := 0;
  FSabado          := 0;
  FVezes           := 0;
  if assigned(FPessoa) then
    FreeAndNil(FPessoa);
end;

destructor TAgendamento.destroy;
begin
  if assigned(FPessoa) then
    FreeAndNil(FPessoa);
end;

function TAgendamento.GetConvenio: TConvenio;
begin
  if not assigned(FConvenio) then
    FConvenio := self.LoadOne<TConvenio>;

  if not assigned(FConvenio) then
    FConvenio := TConvenio.Create;

  Result := FConvenio;
end;

function TAgendamento.GetDepartamento: TDepartamento;
begin
  if not assigned(FDepartamento) then
    FDepartamento := self.LoadOne<TDepartamento>;

  if not assigned(FDepartamento) then
    FDepartamento := TDepartamento.Create;

  Result := FDepartamento;
end;

function TAgendamento.GetPessoa: TPessoa;
begin
  if not assigned(FPessoa) then
    FPessoa := self.LoadOne<TPessoa>;

  if not assigned(FPessoa) then
    FPessoa := TPessoa.Create;

  Result := FPessoa;
end;

function TAgendamento.GetServicos: TObjectList<TServicoAgendado>;
begin
  Result := FServicos;
end;

function TAgendamento.GetSPAs: TObjectList<TSPA>;
begin
  if not assigned(FSPAs) then
    FSPAs := self.LoadMany<TSPA>;

  if not assigned(FSPAs) then
    FSPAs := TObjectList<TSPA>.Create;

  Result := FSPAs;
end;

function TAgendamento.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Convenio = 0) and
            (FID_Pessoa = 0) and
            (FID_Departamento = 0) and
            (FSegunda = 0) and
            (FTerca = 0) and
            (FQuarta = 0) and
            (FQuinta = 0) and
            (FSexta = 0) and
            (FSabado = 0) and
            (FVezes = 0);
end;

procedure TAgendamento.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

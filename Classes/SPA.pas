unit SPA;

interface

uses uPersistentObject, uAtrib, System.SysUtils, ServicoAgendado,
     System.Generics.Collections, Pessoa;

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
    function GetServicosAgendados: TObjectList<TServicoAgendado>;
    function GetDuracaoServicos: TDateTime;
    function GetPessoa: TPessoa;

  public
  {  [FieldName('ID_AGENDAMENTO')]
    property ID_Agendamento: Integer read FID_Agendamento write FID_Agendamento; }
    [FieldName('ID_PESSOA')]
    property ID_Pessoa: Integer read FID_Pessoa write FID_Pessoa;
    [FieldName('DATA')]
    property Data: TDate read FData write FData;
    [FieldName('HORA')]
    property Hora: TTime read FHora write FHora;
    [FieldName('COMPARECEU')]
    property Compareceu: String read FCompareceu write FCompareceu;
    [FieldName('PAGO')]
    property Pago: String read FPago write FPago;

    [HasOne('ID_PESSOA')]
    property Pessoa: TPessoa read GetPessoa write FPessoa;
    [HasMany('ID_SPA',false,true)]
    property ServicosAgendados: TObjectList<TServicoAgendado> read GetServicosAgendados write FServicosAgendados;

  public
    property duracaoServicos :TDateTime read GetDuracaoServicos;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TSPA }

procedure TSPA.Clear;
begin
  ID              := 0;
 // FID_Agendamento := 0;
  FData           := 0;
  FHora           := 0;
  FCompareceu     := '';
  FPago           := '';
end;

function TSPA.GetDuracaoServicos: TDateTime;
var i :integer;
begin
  result := 0;
  for i := 0 to ServicosAgendados.Count - 1 do
    result := result + ServicosAgendados.Items[i].TabelaPreco.Servico.Duracao;
end;

function TSPA.GetPessoa: TPessoa;
begin
  if not assigned(FPessoa) then
    FPessoa := self.LoadOne<TPessoa>;

  if not assigned(FPessoa) then
    FPessoa := TPessoa.Create;

  Result := FPessoa;
end;

function TSPA.GetServicosAgendados: TObjectList<TServicoAgendado>;
begin
  if not assigned(FServicosAgendados) then
    FServicosAgendados := self.LoadMany<TServicoAgendado>;

  if not assigned(FServicosAgendados) then
    FServicosAgendados := TObjectList<TServicoAgendado>.Create;

  Result := FServicosAgendados;
end;

function TSPA.isEmpty: Boolean;
begin
  result := (ID = 0) and
        //    (FID_Agendamento = 0) and
            (FData = 0) and
            (FHora = 0) and
            (FCompareceu = '') and
            (FPago = '');
end;

procedure TSPA.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

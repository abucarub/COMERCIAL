unit SPA;

interface

uses uPersistentObject, uAtrib, System.SysUtils, TabelaPreco;

type
  [TABLENAME('SPA')]
  TSPA = class(TPersistentObject)
  private
    FID_Agendamento: Integer;
    FData: TDateTime;
    FHora: TDateTime;
    FCompareceu: String;
    FPago: String;
    FID_TabelaPreco: Integer;
    FTabelaPreco: TTabelaPreco;
    function GetTabelaPreco: TTabelaPreco;

  public
    [FieldName('ID_AGENDAMENTO')]
    property ID_Agendamento: Integer read FID_Agendamento write FID_Agendamento;
    [FieldName('ID_TABELA_PRECO')]
    property ID_TabelaPreco: Integer read FID_TabelaPreco write FID_TabelaPreco;
    [FieldName('DATA')]
    property Data: TDateTime read FData write FData;
    [FieldName('HORA')]
    property Hora: TDateTime read FHora write FHora;
    [FieldName('COMPARECEU')]
    property Compareceu: String read FCompareceu write FCompareceu;
    [FieldName('PAGO')]
    property Pago: String read FPago write FPago;
                                                       CRIAR AQUI HASMANY DE SERVICOAGENDADO
    [HasOne('ID_TABELA_PRECO')]            CRIAR CLASSE SERVICOAGENDADO
    property TabelaPreco: TTabelaPreco read GetTabelaPreco write FTabelaPreco;

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
  FID_Agendamento := 0;
  FID_TabelaPreco := 0;
  FData           := 0;
  FHora           := 0;
  FCompareceu     := '';
  FPago           := '';
end;

function TSPA.GetTabelaPreco: TTabelaPreco;
begin
  if not assigned(FTabelaPreco) then
    FTabelaPreco := self.LoadOne<TTabelaPreco>(FID_TabelaPreco);

  if not assigned(FTabelaPreco) then
    FTabelaPreco := TTabelaPreco.Create;

  Result := FTabelaPreco;
end;

function TSPA.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Agendamento = 0) and
            (FID_TabelaPreco = 0) and
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

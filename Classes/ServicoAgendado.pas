unit ServicoAgendado;

interface

uses uPersistentObject, uAtrib, System.SysUtils, TabelaPreco;

type
  [TABLENAME('SERVICO_AGENDADO')]
  TServicoAgendado = class(TPersistentObject)
  private
    FID_TabelaPreco: Integer;
    FID_SPA: Integer;
    FTabelaPreco: TTabelaPreco;
    FID_Departamento: Integer;
    function GetTabelaPreco: TTabelaPreco;

  public
    [FieldName('ID_SPA')]
    property ID_SPA: Integer read FID_SPA write FID_SPA;
    [FieldName('ID_TABELA_PRECO')]
    property ID_TabelaPreco: Integer read FID_TabelaPreco write FID_TabelaPreco;

    [HasOne('ID_TABELA_PRECO')]
    property TabelaPreco: TTabelaPreco read GetTabelaPreco write FTabelaPreco;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TServicoAgendado }

procedure TServicoAgendado.Clear;
begin
  ID              := 0;
  FID_SPA         := 0;
  FID_TabelaPreco := 0;
  if assigned(FTabelaPreco) then
    FreeAndNil(FTabelaPreco);
end;

function TServicoAgendado.GetTabelaPreco: TTabelaPreco;
begin
  if not assigned(FTabelaPreco) then
    FTabelaPreco := self.LoadOne<TTabelaPreco>(ID_TabelaPreco);

  if not assigned(FTabelaPreco) then
    FTabelaPreco := TTabelaPreco.Create;

  Result := FTabelaPreco;
end;

function TServicoAgendado.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_SPA = 0) and
            (FID_TabelaPreco = 0);
end;

procedure TServicoAgendado.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

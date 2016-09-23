unit TabelaPreco;

interface

uses uPersistentObject, uAtrib, System.SysUtils, Servico, Convenio;

type
  [TABLENAME('TABELA_PRECO')]
  TTabelaPreco = class(TPersistentObject)
  private
    FID_Servico: Integer;
    FID_Convenio: Integer;
    FValor: Real;
    FConvenio: TConvenio;
    FServico: TServico;

    function GetConvenio: TConvenio;
    function GetServico: TServico;

  public
    [FieldName('ID_SERVICO')]
    property ID_Servico: Integer read FID_Servico write FID_Servico;
    [FieldName('ID_CONVENIO')]
    property ID_Convenio: Integer read FID_Convenio write FID_Convenio;
    [FieldName('VALOR')]
    property Valor: Real read FValor write FValor;

    [HasOne('ID_SERVICO')]
    property Servico: TServico read GetServico write FServico;
    [HasOne('ID_CONVENIO')]
    property Convenio: TConvenio read GetConvenio write FConvenio;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TTabelaPreco }

procedure TTabelaPreco.Clear;
begin
  ID           := 0;
  FID_Servico  := 0;
  FID_Convenio := 0;
  FValor       := 0;
  if assigned(FServico) then
    FreeAndNil(FServico);
  if assigned(FConvenio) then
    FreeAndNil(FConvenio);
end;

function TTabelaPreco.GetConvenio: TConvenio;
begin
  if not assigned(FConvenio) and (self.ID_Convenio > 0) then
    FConvenio := self.LoadOne<TConvenio>(self.ID_Convenio);

  if not assigned(FConvenio) then
    FConvenio := TConvenio.Create;

  Result := FConvenio;
end;

function TTabelaPreco.GetServico: TServico;
begin
  if not assigned(FServico) and (self.ID_Servico > 0) then
    FServico := self.LoadOne<TServico>(self.ID_Servico);

  if not assigned(FServico) then
    FServico := TServico.Create;

  Result := FServico;
end;

function TTabelaPreco.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Servico = 0) and
            (FID_Convenio = 0) and
            (FValor = 0);
end;

procedure TTabelaPreco.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

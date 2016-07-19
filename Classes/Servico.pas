unit Servico;

interface

uses uPersistentObject, uAtrib, System.SysUtils;

type
  [TABLENAME('SERVICOS')]
  TServico = class(TPersistentObject)
  private
    FID_Departamento: Integer;
    FServico: String;
    FDuracao: TTime;

  public
    [FieldName('ID_DEPARTAMENTO')]
    property ID_Departamento: Integer read FID_Departamento write FID_Departamento;
    [FieldName('SERVICO')]
    property Servico: String read FServico write FServico;
    [FieldName('DURACAO')]
    property Duracao: TTime read FDuracao write FDuracao;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TServico }

procedure TServico.Clear;
begin
  ID               := 0;
  FID_Departamento := 0;
  FServico         := '';
  FDuracao         := 0;
end;

function TServico.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Departamento = 0) and
            (FServico = '') and
            (FDuracao = 0);
end;

procedure TServico.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

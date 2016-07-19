unit ServicoAgendado;

interface

uses uPersistentObject, uAtrib, System.SysUtils;

type
  [TABLENAME('SERVICO_AGENDADO')]
  TServicoAgendado = class(TPersistentObject)
  private
    FID_Tabela: Integer;
    FID_Agendamento: Integer;

  public
    [FieldName('ID_AGENDAMENTO')]
    property ID_Agendamento: Integer read FID_Agendamento write FID_Agendamento;
    [FieldName('ID_TABELA')]
    property ID_Tabela: Integer read FID_Tabela write FID_Tabela;

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
  FID_Agendamento := 0;
  FID_Tabela      := 0;
end;

function TServicoAgendado.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Agendamento = 0) and
            (FID_Tabela = 0);
end;

procedure TServicoAgendado.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

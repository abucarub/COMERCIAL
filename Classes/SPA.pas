unit SPA;

interface

uses uPersistentObject, uAtrib, System.SysUtils;

type
  [TABLENAME('SPA')]
  TSPA = class(TPersistentObject)
  private
    FID_Agendamento: Integer;
    FData_Hora: TDateTime;
    FCompareceu: String;
    FPago: String;

  public
    [FieldName('ID_AGENDAMENTO')]
    property ID_Agendamento: Integer read FID_Agendamento write FID_Agendamento;
    [FieldName('DATA_HORA')]
    property Data_Hora: TDateTime read FData_Hora write FData_Hora;
    [FieldName('COMPARECEU')]
    property Compareceu: String read FCompareceu write FCompareceu;
    [FieldName('PAGO')]
    property Pago: String read FPago write FPago;

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
  FData_Hora      := 0;
  FCompareceu     := '';
  FPago           := '';
end;

function TSPA.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Agendamento = 0) and
            (FData_Hora = 0) and
            (FCompareceu = '') and
            (FPago = '');
end;

procedure TSPA.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

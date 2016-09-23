unit DadosAdicionais;

interface

uses uPersistentObject, uAtrib, Cidade, System.SysUtils;

type

  [Tablename('DADOS_ADICIONAIS')]
  TDadosAdicionais = class(TPersistentObject)
  private
    FID: Integer;
    FID_PESSOA: Integer;
    FQueixaPrincipal: String;
    FHDA: String;
    FDiagnosticoClinico: String;
    FMedicamentos: String;
    FConduta: String;

  public
    [FieldName('ID', True, True)]
    property ID: Integer read FID write FID;
    [FieldName('ID_PESSOA',false, false, true)]
    property ID_Pessoa: Integer read FID_Pessoa write FID_Pessoa;
    [FieldName('QUEIXA_PRINCIPAL')]
    property QueixaPrincipal: String read FQueixaPrincipal write FQueixaPrincipal;
    [FieldName('HDA')]
    property HDA: String read FHDA write FHDA;
    [FieldName('DIAGNOSTICO_CLINICO')]
    property DiagnosticoClinico: String read FDiagnosticoClinico write FDiagnosticoClinico;
    [FieldName('MEDICAMENTOS')]
    property Medicamentos: String read FMedicamentos write FMedicamentos;
    [FieldName('CONDUTA')]
    property Conduta: String read FConduta write FConduta;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TDadosAdicionais }

procedure TDadosAdicionais.Clear;
begin
  FID                 := 0;
  FID_PESSOA          := 0;
  FQueixaPrincipal    := '';
  FHDA                := '';
  FDiagnosticoClinico := '';
  FMedicamentos       := '';
  FConduta            := '';
end;

function TDadosAdicionais.isEmpty: Boolean;
begin
  result := (FID = 0) and
            (FID_PESSOA = 0) and
            (FQueixaPrincipal = '') and
            (FHDA = '') and
            (FDiagnosticoClinico = '') and
            (FMedicamentos = '') and
            (FConduta = '');
end;

procedure TDadosAdicionais.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

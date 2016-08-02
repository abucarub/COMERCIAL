unit AlunoPilates;

interface

uses uPersistentObject, uAtrib;

type
  [Tablename('ALUNOS_PILATES')]
  TAlunoPilates = class(TPersistentObject)
  private
    FID_Pessoa: Integer;
    FSegunda: String;
    FTerca: String;
    FQuarta: String;
    FQuinta: String;
    FSexta: String;
    FSabado: String;
    FDiaPagamento: Integer;

  public
    [FieldName('ID_PESSOA')]
    property ID_Pessoa: Integer read FID_Pessoa write FID_Pessoa;
    [FieldName('SEGUNDA')]
    property Segunda: String read FSegunda write FSegunda;
    [FieldName('TERCA')]
    property Terca: String read FTerca write FTerca;
    [FieldName('QUARTA')]
    property Quarta: String read FQuarta write FQuarta;
    [FieldName('QUINTA')]
    property Quinta: String read FQuinta write FQuinta;
    [FieldName('SEXTA')]
    property Sexta: String read FSexta write FSexta;
    [FieldName('SABADO')]
    property Sabado: String read FSabado write FSabado;
    [FieldName('DIA_PAGAMENTO')]
    property DiaPagamento: Integer read FDiaPagamento write FDiaPagamento;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;
  end;

implementation

{ TAlunoPilates }

procedure TAlunoPilates.Clear;
begin
  ID         := 0;
  FID_Pessoa := 0;
  FSegunda   := '';
  FTerca     := '';
  FQuarta    := '';
  FQuinta    := '';
  FSexta     := '';
  FSabado    := '';
  FDiaPagamento := 0;
end;

function TAlunoPilates.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Pessoa = 0) and
            (FSegunda = '') and
            (FTerca = '') and
            (FQuarta = '') and
            (FQuinta = '') and
            (FSexta = '') and
            (FSabado = '') and
            (FDiaPagamento = 0);
end;

procedure TAlunoPilates.LoadClass(const AValue: Integer);
begin
 inherited Load(AValue);
end;

end.

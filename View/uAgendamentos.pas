unit uAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, TipoPessoa,
  Vcl.StdCtrls, frameBuscaPessoa, frameBuscaTabelaPreco, frameBuscaConvenio,
  Vcl.ExtCtrls, frameHorarioMarcado, JvExControls, JvCalendar, Vcl.ComCtrls,
  JvExComCtrls, JvMonthCalendar, Vcl.Grids, Vcl.Samples.Calendar,
  JvDateTimePicker, JvExMask, JvToolEdit, Vcl.Mask, RxToolEdit, Data.DB,
  Datasnap.DBClient, JvTimer, JvTimerList, RxSpin, Vcl.Samples.Spin, RxCurrEdit,
  Vcl.Buttons, Vcl.DBGrids;

type
  TfrmAgendamentos = class(TfrmPadrao)
    BuscaPessoa1: TBuscaPessoa;
    BuscaConvenio1: TBuscaConvenio;
    BuscaTabelaPreco1: TBuscaTabelaPreco;
    pnlHorarios: TPanel;
    HorarioMarcado1: THorarioMarcado;
    HorarioMarcado2: THorarioMarcado;
    HorarioMarcado3: THorarioMarcado;
    cdsHorarios: TClientDataSet;
    JvMonthCalendar1: TJvMonthCalendar;
    rgpHorarios: TGroupBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label4: TLabel;
    btnCriaHorario: TBitBtn;
    edtCodigo: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    speHoras: TSpinEdit;
    speMinutos: TSpinEdit;
    Label3: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FID_Departamento :integer;
  public
    { Public declarations }
  end;

var
  frmAgendamentos: TfrmAgendamentos;

implementation

{$R *.dfm}

procedure TfrmAgendamentos.BitBtn1Click(Sender: TObject);
begin
  quando gera o numero de parcelas correspondente ao vezes na semana, o botao gerar restantes habilita
end;

procedure TfrmAgendamentos.FormCreate(Sender: TObject);
begin
  inherited;
  //BuscaCliente1.Tipo := tpCliente;
end;

end.

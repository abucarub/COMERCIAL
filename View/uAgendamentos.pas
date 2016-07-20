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
  Vcl.Buttons, Vcl.DBGrids, DBGridCBN;

type
  TfrmAgendamentos = class(TfrmPadrao)
    BuscaPessoa1: TBuscaPessoa;
    BuscaConvenio1: TBuscaConvenio;
    BuscaTabelaPreco1: TBuscaTabelaPreco;
    cdsHorarios: TClientDataSet;
    JvMonthCalendar1: TJvMonthCalendar;
    rgpHorarios: TGroupBox;
    Label2: TLabel;
    btnCriaHorario: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    speHoras: TSpinEdit;
    speMinutos: TSpinEdit;
    Label3: TLabel;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label5: TLabel;
    edtCodigo: TCurrencyEdit;
    DBGridCBN1: TDBGridCBN;
    Label4: TLabel;
    Label37: TLabel;
    cdsHorariosDATA_HORA: TDateTimeField;
    cdsHorariosDIA_SEMANA: TStringField;
    dsHorarios: TDataSource;
    Shape1: TShape;
    Shape2: TShape;
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
  //quando gera o numero de parcelas correspondente ao vezes na semana, o botao gerar restantes habilita
end;

procedure TfrmAgendamentos.FormCreate(Sender: TObject);
begin
  inherited;
  //BuscaCliente1.Tipo := tpCliente;
end;

end.

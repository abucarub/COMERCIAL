unit uRec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.ExtCtrls, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TfrmContasH = class(TfrmPadrao)
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    cdsParcelas: TClientDataSet;
    dsParcelas: TDataSource;
    cdsParcelasID: TIntegerField;
    cdsParcelasID_CONTA: TIntegerField;
    cdsParcelasNUMPARCELA: TSmallintField;
    cdsParcelasVALOR: TFloatField;
    cdsParcelasVALOR_PAGO: TFloatField;
    cdsParcelasSTATUS: TStringField;
    cdsParcelasVENCIMENTO: TDateField;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasH: TfrmContasH;

implementation

{$R *.dfm}

end.

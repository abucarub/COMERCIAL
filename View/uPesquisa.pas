unit uPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, DBGridCBN, uConnection, DBClient;

type
  TfrmPesquisa = class(TfrmPadrao)
    DBGridCBN1: TDBGridCBN;
    Panel1: TPanel;
    btnCancelar: TSpeedButton;
    btnConfirmar: TSpeedButton;
    ds: TDataSource;
    pnlRodape: TPanel;
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private
    FcdsRetorno :TClientDataSet;

    procedure adicionaRemove(Identificador :Integer);

  public
    constructor Create(AOwner: TComponent; SQL :String; const titulo :String = 'Pesquisa'); overload;

    property cdsRetorno :TClientDataSet read FcdsRetorno;
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

{ TfrmPesquisa }

procedure TfrmPesquisa.adicionaRemove(Identificador: Integer);
begin
  if FcdsRetorno.Locate('ID', Identificador, []) then
    FcdsRetorno.Delete
  else begin
    FcdsRetorno.Append;
    FcdsRetorno.FieldByName('ID').AsInteger := Identificador;
    FcdsRetorno.Post;
  end;
end;

procedure TfrmPesquisa.btnCancelarClick(Sender: TObject);
begin
  inherited;
  self.ModalResult := mrCancel;
end;

procedure TfrmPesquisa.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if FcdsRetorno.IsEmpty then
     adicionaRemove( ds.DataSet.FieldByName('ID').AsInteger );

  FcdsRetorno.First;
  self.ModalResult := mrOk;
end;

constructor TfrmPesquisa.Create(AOwner: TComponent; SQL: String; const titulo: String);
begin
  self.Create(AOwner);
  FcdsRetorno := TClientDataSet.Create(nil);
  FcdsRetorno.Close;
  FcdsRetorno.FieldDefs.Clear;
  FcdsRetorno.FieldDefs.add('ID', ftInteger);
  FcdsRetorno.CreateDataSet;
  FcdsRetorno.Open;

  self.Width   := Screen.Width - 100;
  self.Height  := Screen.Height - 100;
  self.Caption := titulo;

  ds.DataSet := TConnection.GetInstance.ExecuteQuery(SQL);
  ds.DataSet.Refresh;

  pnlRodape.Caption := intToStr(ds.DataSet.RecordCount)+' registros foram encontrados';
end;

procedure TfrmPesquisa.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FcdsRetorno);
end;

procedure TfrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then begin
    key := 0;
    btnConfirmar.Click;
  end
  else if key = vk_escape then begin
    key := 0;
    btnCancelar.Click;
  end;

  inherited;
end;

procedure TfrmPesquisa.FormResize(Sender: TObject);
begin
  btnCancelar.Left  := trunc(self.Width/2)-btnCancelar.Width;
  btnConfirmar.Left := btnCancelar.Left + (btnCancelar.Width + 5);
end;

end.

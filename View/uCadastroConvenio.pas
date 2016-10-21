unit uCadastroConvenio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Vcl.StdCtrls, Datasnap.DBClient, Datasnap.Provider, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.ComCtrls, uPersistentObject;

type
  TfrmCadastroConvenio = class(TfrmCadastroPadrao)
    Label1: TLabel;
    edtConvenio: TEdit;
    cdsID: TSmallintField;
    cdsCONVENIO: TStringField;
  protected
    procedure executaDepoisIncluir;override;
    procedure executaDepoisAlterar;override;

    procedure carregarDados;override;
    procedure CarregarRegistro;override;
    procedure LimparCampos;override;
    procedure atualizaGrid(Obj: TPersistentObject);override;

    function Incluir :Boolean;override;
    function Alterar :Boolean;override;
    function Salvar :TPersistentObject;override;
    function Cancelar :Boolean;override;

    function verificaObrigatorios :Boolean;override;
  end;

var
  frmCadastroConvenio: TfrmCadastroConvenio;

implementation

uses Convenio;

{$R *.dfm}

{ TfrmCadastroConvenio }

function TfrmCadastroConvenio.Alterar: Boolean;
begin
  inherited;
end;

procedure TfrmCadastroConvenio.atualizaGrid(Obj: TPersistentObject);
var Convenio :TConvenio;
begin
  inherited;
  try
    Convenio              := TConvenio(Obj);
    cdsID.AsInteger       := Convenio.ID;
    cdsCONVENIO.AsString  := Convenio.convenio;
    cds.Post;
  finally
    FreeAndNil(Convenio);
  end;
end;

function TfrmCadastroConvenio.Cancelar: Boolean;
begin
  inherited;
end;

procedure TfrmCadastroConvenio.carregarDados;
var Convenio :TConvenio;
begin
  inherited;
  Convenio := TConvenio.Create;
  cds.Close;
  dsp.DataSet := Convenio.LoadAll;
  cds.Open;
end;

procedure TfrmCadastroConvenio.CarregarRegistro;
var Convenio :TConvenio;
begin
  inherited;
  try
    Convenio := TConvenio.Create;
    Convenio.Load(cds.FieldByName('ID').AsInteger);

    edtID.Text        := IntToStr(Convenio.ID);
    edtConvenio.Text  := Convenio.convenio;
  finally
    FreeAndNil(Convenio);
  end;
end;

procedure TfrmCadastroConvenio.executaDepoisAlterar;
begin
  inherited;
  edtConvenio.SetFocus;
end;

procedure TfrmCadastroConvenio.executaDepoisIncluir;
begin
  inherited;
  edtConvenio.SetFocus;
end;

function TfrmCadastroConvenio.Incluir: Boolean;
begin
  inherited;
end;

procedure TfrmCadastroConvenio.LimparCampos;
begin
  inherited;
  edtID.Clear;
  edtConvenio.Clear;
end;

function TfrmCadastroConvenio.Salvar: TPersistentObject;
var Convenio :TConvenio;
begin
  inherited;
  try
    Convenio := TConvenio.Create;

    Convenio.ID          := strToIntDef(edtID.Text,0);
    Convenio.convenio    := edtConvenio.Text;
    Convenio.Save;

    result := Convenio;
  Except
    on e :Exception do
      avisar(0,'Erro ao salvar Cliente'+#13#10+e.Message);
  end;
end;

function TfrmCadastroConvenio.verificaObrigatorios: Boolean;
begin
  result := false;

  if edtConvenio.Text = '' then
    balaoInformacao(edtConvenio, 'Favor informar qual o convênio')
  else
    result := true;
end;

end.

unit frameBuscaConvenio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Convenio, frameBusca, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TBuscaConvenio = class(TBusca)
    edtCodigo: TCurrencyEdit;
    edtConvenio: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
  private
    FConvenio :TConvenio;

    procedure pesquisa;override;
  protected
    procedure inicializa;override;
    procedure efetuaBusca(parametro :Variant);override;
    procedure carregar(const ID :integer = 0);override;
  public
    procedure BeforeDestruction; override;
    procedure limpa;override;

    property Convenio :TConvenio read FConvenio;
  end;

var
  BuscaConvenio: TBuscaConvenio;

implementation

{$R *.dfm}

{ TBusca1 }

procedure TBuscaConvenio.BeforeDestruction;
begin
  inherited;
  if Assigned(FConvenio) then
    FreeAndNil(FConvenio);
end;

procedure TBuscaConvenio.carregar(const ID: integer);
begin
  inherited;
  if not assigned(FConvenio) then
    FConvenio := TConvenio.Create;
  FConvenio.Load(ID);

  if not assigned(FConvenio) then
    exit;

  edtCodigo.AsInteger := FConvenio.ID;
  edtConvenio.Text    := FConvenio.convenio;
end;

procedure TBuscaConvenio.efetuaBusca(parametro: Variant);
begin
  FConvenio.Load(parametro);

  if FConvenio.ID > 0 then
  begin
    carregaDados;
    keybd_event(VK_TAB,0,0,0);
  end
  else
    Pesquisa;
end;

procedure TBuscaConvenio.FrameEnter(Sender: TObject);
begin
  inicializa;
end;

procedure TBuscaConvenio.FrameExit(Sender: TObject);
begin
  if not assigned(FConvenio) or (FConvenio.ID = 0) then
    edtCodigo.Clear;
  if assigned(FConvenio) and FConvenio.isEmpty then
    FreeAndNil(FConvenio);
end;

procedure TBuscaConvenio.inicializa;
begin
  inherited;
  if FInicializou then
    exit;

  if not assigned(FConvenio) then
    FConvenio                := TConvenio.Create;
  self.edtCodigo.OnChange  := self.edtIdChange;
  self.edtCodigo.OnEnter   := self.edtIdEnter;
  self.edtConvenio.OnEnter := self.edtEnter;
end;

procedure TBuscaConvenio.limpa;
begin
  if FcarregandoDados then
  begin
    FcarregandoDados := false;
    Exit;
  end;

  if not (TForm(self.Owner).ActiveControl = self.edtCodigo) then
    edtCodigo.Clear;
  if Assigned(FConvenio) then
    FConvenio.Clear;
  edtConvenio.Clear;
end;

procedure TBuscaConvenio.pesquisa;
var SQL, titulo :String;
begin
  titulo := 'Selecione o convênio...';
  SQL    := 'Select c.ID, c.CONVENIO from CONVENIOS c ';
  self.abrePesquisa(SQl, titulo);
end;

end.

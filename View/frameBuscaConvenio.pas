unit frameBuscaConvenio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Convenio, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TBuscaConvenio = class(TFrame)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtConvenio: TEdit;
    procedure edtConvenioEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
  private
    FConvenio :TConvenio;

    procedure efetuaBusca(parametro :Variant);
    procedure abrePesquisa;

  public
    procedure carregaDados(const ID :integer = 0);
    procedure limpa;

    property Cidade :TConvenio read FConvenio write FConvenio;
  end;

implementation

uses uPesquisa;

{$R *.dfm}

{ TFrame1 }

procedure TBuscaConvenio.abrePesquisa;
begin
  frmPesquisa := TFrmPesquisa.Create(Self,'Select c.ID, c.CONVENIO from CONVENIOS c '+
                                          'Selecione o convênio...');

  if frmPesquisa.ShowModal = mrOk then
    self.carregaDados(frmPesquisa.cdsRetorno.Fields[0].AsInteger)
  else
    limpa;

  frmPesquisa.Release;
  frmPesquisa := nil;
end;

procedure TBuscaConvenio.carregaDados(const ID: integer);
begin
  if ID > 0 then
  begin
    FConvenio := TConvenio.Create;
    FConvenio.Load(ID);
  end;

  if not assigned(FConvenio) then
    exit;

  edtCodigo.AsInteger := FConvenio.ID;
  edtConvenio.Text    := FConvenio.Convenio;
end;

procedure TBuscaConvenio.edtConvenioEnter(Sender: TObject);
begin
  efetuaBusca(edtCodigo.AsInteger);
  keybd_event(VK_TAB,0,0,0);
end;

procedure TBuscaConvenio.efetuaBusca(parametro: Variant);
begin
  FConvenio := TConvenio.Create;
  FConvenio.Load(parametro, 'CODIGO_IBGE');

  if FConvenio.ID > 0 then
  begin
    carregaDados;
  end
  else
    abrePesquisa;
end;

procedure TBuscaConvenio.FrameExit(Sender: TObject);
begin
  if not assigned(FConvenio) then
    edtCodigo.Clear;
end;

procedure TBuscaConvenio.limpa;
begin
  edtCodigo.Clear;
  edtConvenio.Clear;
  if assigned(FConvenio) then
    FreeAndNil(FConvenio);
end;

end.

unit frameBuscaTabelaPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TabelaPreco, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TBuscaTabelaPreco = class(TFrame)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtServico: TEdit;
    edtValor: TCurrencyEdit;
    Label3: TLabel;
    procedure edtServicoEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
  private
    FTabelaPreco :TTabelaPreco;
    FIDDepartamento: integer;
    FIDConvenio: integer;

    procedure efetuaBusca(parametro :Variant);
    procedure abrePesquisa;

  public
    procedure carregaDados(const ID :integer = 0);
    procedure limpa;

    property TabelaPreco    :TTabelaPreco read FTabelaPreco     write FTabelaPreco;
    property IDConvenio     :integer      read FIDConvenio      write FIDConvenio;
    property IDDepartamento :integer      read FIDDepartamento  write FIDDepartamento;
  end;

implementation

uses uPesquisa;

{$R *.dfm}

{ TBuscaTabelaPreco }

procedure TBuscaTabelaPreco.abrePesquisa;
begin
  frmPesquisa := TFrmPesquisa.Create(Self,'Select tp.ID, s.SERVICO, tp.VALOR from TEBELA_PRECO tp '+
                                          ' left join SERVICOS s on s.ID = tp.ID_SERVICO'+
                                          ' where tp.ID_CONVENIO = '+ intToStr(self.FIdConvenio)+
                                          ' and s.ID_DEPARTAMENTO = '+intToStr(self.FIdDepartamento),
                                          'Selecione a cidade desejada...');

  if frmPesquisa.ShowModal = mrOk then
    self.carregaDados(frmPesquisa.cdsRetorno.Fields[0].AsInteger)
  else
    limpa;

  frmPesquisa.Release;
  frmPesquisa := nil;
end;

procedure TBuscaTabelaPreco.carregaDados(const ID: integer);
begin
if ID > 0 then
  begin
    FTabelaPreco := TTabelaPreco.Create;
    FTabelaPreco.Load(ID);
  end;

  if not assigned(FTabelaPreco) then
    exit;

  edtCodigo.AsInteger := FTabelaPreco.ID;
  edtServico.Text     := FTabelaPreco.Servico.Servico;
  edtValor.Value      := FTabelaPreco.Valor;
end;

procedure TBuscaTabelaPreco.edtServicoEnter(Sender: TObject);
begin
  efetuaBusca(edtCodigo.AsInteger);
  keybd_event(VK_TAB,0,0,0);
end;

procedure TBuscaTabelaPreco.edtValorEnter(Sender: TObject);
begin
  keybd_event(VK_TAB,0,0,0);
end;

procedure TBuscaTabelaPreco.efetuaBusca(parametro: Variant);
begin
  FTabelaPreco := TTabelaPreco.Create;
  FTabelaPreco.Load(parametro, 'CODIGO_IBGE');

  if FTabelaPreco.ID > 0 then
  begin
    carregaDados;
  end
  else
    abrePesquisa;
end;

procedure TBuscaTabelaPreco.FrameExit(Sender: TObject);
begin
  if not assigned(FTabelaPreco) then
    edtCodigo.Clear;
end;

procedure TBuscaTabelaPreco.limpa;
begin
  edtCodigo.Clear;
  edtServico.Clear;
  edtValor.Clear;

  if assigned(FTabelaPreco) then
    FreeAndNil(FTabelaPreco);
end;

end.

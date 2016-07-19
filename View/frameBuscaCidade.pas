unit frameBuscaCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, RxToolEdit, RxCurrEdit, Cidade;

type
  TBuscaCidade = class(TFrame)
    Label1: TLabel;
    edtCodigo: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtDescricao: TEdit;
    edtEstado: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure edtDescricaoEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure edtEstadoEnter(Sender: TObject);
  private
    FCidade :TCidade;

    procedure efetuaBusca(parametro :Variant);
    procedure abrePesquisa;

  public
    procedure carregaDados(const ID :integer = 0);
    procedure limpa;

    property Cidade :TCidade read FCidade write FCidade;
  end;

implementation

uses uPesquisa;

{$R *.dfm}

procedure TBuscaCidade.abrePesquisa;
begin
  frmPesquisa := TFrmPesquisa.Create(Self,'Select cid.ID, cid.NOME, est.SIGLA UF, cid.CODIGO_IBGE from CIDADES cid '+
                                          ' left join estados est on est.ID = cid.ID_ESTADO'+
                                          ' order by est.SIGLA',
                                          'Selecione a cidade desejada...');

  if frmPesquisa.ShowModal = mrOk then
    self.carregaDados(frmPesquisa.cdsRetorno.Fields[0].AsInteger)
  else
    limpa;

  frmPesquisa.Release;
  frmPesquisa := nil;
end;

procedure TBuscaCidade.carregaDados(const ID :integer = 0);
begin
  if ID > 0 then
  begin
    FCidade := TCidade.Create;
    FCidade.Load(ID);
  end;

  if not assigned(FCidade) then
    exit;

  edtCodigo.AsInteger := FCidade.Codigo_ibge;
  edtDescricao.Text   := FCidade.Nome;
  edtEstado.Text      := FCidade.Estado.Sigla;
end;

procedure TBuscaCidade.edtDescricaoEnter(Sender: TObject);
begin
//  if edtCodigo.AsInteger > 0 then
  efetuaBusca(edtCodigo.AsInteger);
  keybd_event(VK_TAB,0,0,0);
end;

procedure TBuscaCidade.edtEstadoEnter(Sender: TObject);
begin
  keybd_event(VK_TAB,0,0,0);
end;

procedure TBuscaCidade.efetuaBusca(parametro :Variant);
begin
  FCidade := TCidade.Create;
  FCidade.Load(parametro, 'CODIGO_IBGE');

  if FCidade.ID > 0 then
  begin
    carregaDados;
  end
  else
    abrePesquisa;
end;

procedure TBuscaCidade.FrameExit(Sender: TObject);
begin
  if not assigned(FCidade) then
    edtCodigo.Clear;
end;

procedure TBuscaCidade.limpa;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtEstado.Clear;
  if assigned(FCidade) then
    FreeAndNil(FCidade);
end;

end.

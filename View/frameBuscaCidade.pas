unit frameBuscaCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBusca, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.Buttons, Cidade;

type
  TBuscaCidade = class(TBusca)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigo: TCurrencyEdit;
    edtCidade: TEdit;
    edtEstado: TEdit;
    procedure FrameExit(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
  private
    FCidade :TCidade;

    procedure pesquisa;override;
  protected
    procedure efetuaBusca(parametro :Variant);override;
    procedure inicializa;override;
  public
    procedure carregaDados(const ID :integer = 0);override;
    procedure limpa;override;

    property Cidade :TCidade read FCidade;
  end;

var
  BuscaCidade: TBuscaCidade;

implementation

{$R *.dfm}

{ TBuscaCidade }

procedure TBuscaCidade.carregaDados(const ID: integer);
begin
  inherited;
  if not assigned(FCidade) then
    FCidade := TCidade.Create;
  FCidade.Load(ID);

  if not assigned(FCidade) then
    exit;

  edtCodigo.AsInteger := FCidade.Codigo_ibge;
  edtCidade.Text      := FCidade.Nome;
  edtEstado.Text      := FCidade.Estado.Sigla;
end;

procedure TBuscaCidade.efetuaBusca(parametro: Variant);
begin
  FCidade.Load(parametro, 'CODIGO_IBGE');

  if FCidade.ID > 0 then
  begin
    carregaDados;
    keybd_event(VK_TAB,0,0,0);
  end
  else
    Pesquisa;
end;

procedure TBuscaCidade.FrameEnter(Sender: TObject);
begin
  inicializa;
end;

procedure TBuscaCidade.FrameExit(Sender: TObject);
begin
  if not assigned(FCidade) or (FCidade.ID = 0) then
    edtCodigo.Clear;
  if assigned(FCidade) and FCidade.isEmpty then
    FreeAndNil(FCidade);
end;

procedure TBuscaCidade.inicializa;
begin
  inherited;
  if FInicializou then
    exit;

  if not assigned(FCidade) then
    FCidade                := TCidade.Create;
  self.edtCodigo.OnChange  := self.edtIdChange;
  self.edtCodigo.OnEnter   := self.edtIdEnter;
  self.edtCidade.OnEnter   := self.edtEnter;
end;

procedure TBuscaCidade.limpa;
begin
  if FcarregandoDados then
  begin
    FcarregandoDados := false;
    Exit;
  end;
  
  if not (TForm(self.Owner).ActiveControl = self.edtCodigo) then
    edtCodigo.Clear;
  if Assigned(FCidade) then
    FCidade.Clear;
  edtCidade.Clear;
  edtEstado.Clear;
end;

procedure TBuscaCidade.pesquisa;
var SQL, titulo :String;
begin
  titulo := 'Selecione a cidade desejada...';
  SQL    := 'Select cid.ID, cid.NOME, est.SIGLA UF, cid.CODIGO_IBGE from CIDADES cid '+
            ' left join estados est on est.ID = cid.ID_ESTADO'+
            ' order by est.SIGLA';
  self.abrePesquisa(SQl, titulo);
end;

end.

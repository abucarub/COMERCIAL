unit frameBuscaTabelaPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBusca, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.Buttons, TabelaPreco;

type
  TBuscaTabelaPreco = class(TBusca)
    Label1: TLabel;
    Label3: TLabel;
    edtCodigo: TCurrencyEdit;
    edtServico: TEdit;
    edtValor: TCurrencyEdit;
    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
  private
    FTabelaPreco :TTabelaPreco;
    FIDDepartamento: integer;
    FIDConvenio: integer;

    procedure pesquisa;override;
  protected
    procedure efetuaBusca(parametro :Variant);override;
    procedure inicializa;override;
    procedure carregar(const ID :integer = 0);override;
  public
    procedure BeforeDestruction; override;
    procedure limpa;override;

    property TabelaPreco :TTabelaPreco read FTabelaPreco;
    property IDConvenio     :integer      read FIDConvenio      write FIDConvenio;
    property IDDepartamento :integer      read FIDDepartamento  write FIDDepartamento;
  end;

var
  BuscaTabelaPreco: TBuscaTabelaPreco;

implementation

{$R *.dfm}

{ TBuscaTabelaPreco }

procedure TBuscaTabelaPreco.BeforeDestruction;
begin
  inherited;
  if Assigned(FTabelaPreco) then
    FreeAndNil(FTabelaPreco);
end;

procedure TBuscaTabelaPreco.carregar(const ID: integer);
begin
  inherited;
  if not assigned(FTabelaPreco) then
    FTabelaPreco := TabelaPreco.Create;
  FTabelaPreco.Load(ID);

  if assigned(FTabelaPreco) and ((FTabelaPreco.Servico.ID_Departamento <> self.IDDepartamento) or (FTabelaPreco.ID_Convenio <> self.FIDConvenio))then
    FTabelaPreco.Clear
  else if assigned(FTabelaPreco) then
  begin
    edtCodigo.AsInteger := FTabelaPreco.ID;
    edtServico.Text     := FTabelaPreco.Servico.Servico;
    edtValor.Value      := FTabelaPreco.Valor;
  end;
end;

procedure TBuscaTabelaPreco.edtValorEnter(Sender: TObject);
begin
  keybd_event(VK_TAB,0,0,0);
end;

procedure TBuscaTabelaPreco.efetuaBusca(parametro: Variant);
begin
  FTabelaPreco.Load(parametro);

  if FTabelaPreco.ID > 0 then
  begin
    carregaDados(FTabelaPreco.ID);
    keybd_event(VK_TAB,0,0,0);
  end
  else
    Pesquisa;
end;

procedure TBuscaTabelaPreco.FrameEnter(Sender: TObject);
begin
  inicializa;
end;

procedure TBuscaTabelaPreco.FrameExit(Sender: TObject);
begin
  if not assigned(FTabelaPreco) or (FTabelaPreco.ID = 0) then
    edtCodigo.Clear;
  if assigned(FTabelaPreco) and FTabelaPreco.isEmpty then
    FreeAndNil(FTabelaPreco);
end;

procedure TBuscaTabelaPreco.inicializa;
begin
  inherited;
  if FInicializou then
    exit;

  if not assigned(FTabelaPreco) then
    FTabelaPreco                := TTabelaPreco.Create;
  self.edtCodigo.OnChange  := self.edtIdChange;
  self.edtCodigo.OnEnter   := self.edtIdEnter;
  self.edtServico.OnEnter  := self.edtEnter;
end;

procedure TBuscaTabelaPreco.limpa;
begin

  if FcarregandoDados then
  begin
    FcarregandoDados := false;
    Exit;
  end;

  if not (TForm(self.Owner).ActiveControl = self.edtCodigo) then
    edtCodigo.Clear;
  if Assigned(FTabelaPreco) then
    FTabelaPreco.Clear;
  edtServico.Clear;
  edtValor.Clear;
end;

procedure TBuscaTabelaPreco.pesquisa;
var SQL, titulo :String;
begin
  titulo := 'Selecione o convênio...';
  SQL    := 'Select tp.ID, s.SERVICO, tp.VALOR from TABELA_PRECO tp '+
            ' left join SERVICOS s on s.ID = tp.ID_SERVICO'+
            ' where tp.ID_CONVENIO = '+ intToStr(self.FIdConvenio)+
            ' and s.ID_DEPARTAMENTO = '+intToStr(self.FIdDepartamento);
  self.abrePesquisa(SQl, titulo);
end;

end.

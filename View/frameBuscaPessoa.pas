unit frameBuscaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBusca, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.Buttons, Pessoa;

type
  TBuscaPessoa = class(TBusca)
    Label1: TLabel;
    lbTipo: TLabel;
    edtCodigo: TCurrencyEdit;
    edtNome: TEdit;
    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
  private
    FPessoa :TPessoa;
    FTipo: integer;

    procedure pesquisa;override;
    procedure SetTipo(const Value: integer);
  protected
    procedure inicializa;override;
    procedure efetuaBusca(parametro :Variant);override;
    procedure carregar(const ID :integer = 0);override;
  public
    procedure BeforeDestruction; override;
    procedure limpa;override;

    property Pessoa :TPessoa read FPessoa;
    property Tipo   :integer read FTipo   write SetTipo;
  end;

var
  BuscaPessoa: TBuscaPessoa;

implementation

uses TipoPessoa;

{$R *.dfm}

{ TBuscaPessoa }

procedure TBuscaPessoa.BeforeDestruction;
begin
  inherited;
  if Assigned(FPessoa) then
    FreeAndNil(FPessoa);
end;

procedure TBuscaPessoa.carregar(const ID: integer);
begin
  inherited;
  if not assigned(FPessoa) then
    FPessoa := TPessoa.Create;
  FPessoa.Load(ID);

  if not assigned(FPessoa) then
    exit;

  edtCodigo.AsInteger := FPessoa.ID;
  edtNome.Text        := FPessoa.Nome;
end;

procedure TBuscaPessoa.efetuaBusca(parametro: Variant);
begin
  FPessoa.Load(parametro);

  if FPessoa.ID > 0 then
  begin
    carregaDados;
    keybd_event(VK_TAB,0,0,0);
  end
  else
    Pesquisa;
end;

procedure TBuscaPessoa.FrameEnter(Sender: TObject);
begin
  inicializa;
end;

procedure TBuscaPessoa.FrameExit(Sender: TObject);
begin
  if not assigned(FPessoa) or (FPessoa.ID = 0) then
    edtCodigo.Clear;
  if assigned(FPessoa) and FPessoa.isEmpty then
    FreeAndNil(FPessoa);
end;

procedure TBuscaPessoa.inicializa;
begin
  inherited;
  if FInicializou then
    exit;

  if not assigned(FPessoa) then
    FPessoa                := TPessoa.Create;
  self.edtCodigo.OnChange  := self.edtIdChange;
  self.edtCodigo.OnEnter   := self.edtIdEnter;
  self.edtNome.OnEnter     := self.edtEnter;
end;

procedure TBuscaPessoa.limpa;
begin
  if FcarregandoDados then
  begin
    FcarregandoDados := false;
    Exit;
  end;

  if not (TForm(self.Owner).ActiveControl = self.edtCodigo) then
    edtCodigo.Clear;
  if Assigned(FPessoa) then
    FPessoa.Clear;
  edtNome.Clear;
end;

procedure TBuscaPessoa.pesquisa;
var SQL, titulo :String;
begin
  titulo := 'Selecione a pessoa desejada...';
  SQL    := 'Select P.ID, P.NOME_RAZAO, P.CPF_CNPJ from PESSOAS P'+
            ' WHERE P.TIPO = '+IntToStr(FTipo);
  self.abrePesquisa(SQl, titulo);
end;

procedure TBuscaPessoa.SetTipo(const Value: integer);
begin
  FTipo := Value;

  lbTipo.Caption := TTipoPessoaGet.getDescricaoTipo(FTipo);
end;

end.

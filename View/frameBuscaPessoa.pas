unit frameBuscaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBusca, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.Buttons, Pessoa;

type
  TBuscaPessoa = class(TBusca)
    edtCodigo: TCurrencyEdit;
    edtNome: TEdit;
    lbTipo: TLabel;
    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
  private
    FPessoa :TPessoa;
    FTipo: integer;
    FServico: String;

    procedure pesquisa;override;
    procedure SetTipo(const Value: integer);
    function GetTipoExtenso: String;
    function GetTitulo: String;
  protected
    procedure inicializa;override;
    procedure efetuaBusca(parametro :Variant);override;
    procedure carregar(const ID :integer = 0);override;
  public
    procedure BeforeDestruction; override;
    procedure limpa;override;

    property Pessoa :TPessoa read FPessoa;
    property tipo   :integer read FTipo   write SetTipo;
    property descricaoTipo :String read GetTipoExtenso;
    property servico :String write FServico;
    property titulo :String read GetTitulo;
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

  if assigned(FPessoa) and (FPessoa.Tipo <> FTipo) then
    Pesquisa
  else if assigned(FPessoa) then
  begin
    edtCodigo.AsInteger := FPessoa.ID;
    edtNome.Text        := FPessoa.Nome;
  end;
end;

procedure TBuscaPessoa.efetuaBusca(parametro: Variant);
begin
  FPessoa.Load(parametro);

  if FPessoa.ID > 0 then
  begin
    carregaDados(FPessoa.ID);
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

function TBuscaPessoa.GetTipoExtenso: String;
begin
  result := TTipoPessoaGet.getDescricaoTipo(self.FTipo);
end;

function TBuscaPessoa.GetTitulo: String;
begin
  if (FServico = '') then
    lbTipo.Caption := 'Cliente'
  else if FServico = 'PILATES' then
    lbTipo.Caption := 'Aluno'
  else
    lbTipo.Caption := 'Paciente'
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

  //lbTipo.Caption := GetTitulo;
end;

end.

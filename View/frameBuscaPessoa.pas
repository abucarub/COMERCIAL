unit frameBuscaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Pessoa, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, RxToolEdit, RxCurrEdit, TipoPessoa;

type
  TBuscaPessoa = class(TFrame)
    Label1: TLabel;
    lbTipo: TLabel;
    edtCodigo: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtNome: TEdit;
    procedure edtNomeEnter(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
  private
    FPessoa :TPessoa;
    FTipo: integer;

    procedure efetuaBusca(parametro :Variant);
    procedure abrePesquisa;

    procedure SetTipo(const Value: integer);

  public
    procedure carregaDados(const ID :integer = 0);
    procedure limpa;

    property Pessoa :TPessoa read FPessoa write FPessoa;
    property Tipo   :integer read FTipo   write SetTipo;
  end;

implementation

uses uPesquisa;

{$R *.dfm}

{ TFrame1 }

procedure TBuscaPessoa.abrePesquisa;
begin
  if FTipo <= 0 then
    raise Exception.Create('Tipo da pessoa não foi especificado para a busca');

  frmPesquisa := TFrmPesquisa.Create(Self,'Select P.CODIGO, P.NOME_RAZAO, P.CPF_CNPJ from PESSOAS P'+
                                          'WHERE P.TIPO = '+IntToStr(FTipo),
                                          'Selecione o Pessoa desejado...');

  if frmPesquisa.ShowModal = mrOk then
    self.carregaDados(frmPesquisa.cdsRetorno.Fields[0].AsInteger)
  else
    limpa;

  frmPesquisa.Release;
  frmPesquisa := nil;
end;

procedure TBuscaPessoa.carregaDados(const ID: integer);
begin
    if ID > 0 then
  begin
    FPessoa := TPessoa.Create;
    FPessoa.Load(ID);
  end;

  if not assigned(FPessoa) then
    exit;

  edtCodigo.AsInteger := FPessoa.ID;
  edtNome.Text        := FPessoa.Nome;
end;

procedure TBuscaPessoa.CurrencyEdit1Enter(Sender: TObject);
begin
  keybd_event(VK_TAB,0,0,0);
end;

procedure TBuscaPessoa.edtNomeEnter(Sender: TObject);
begin
  efetuaBusca(edtCodigo.AsInteger);
  keybd_event(VK_TAB,0,0,0);
end;

procedure TBuscaPessoa.efetuaBusca(parametro: Variant);
begin
  FPessoa := TPessoa.Create;
  FPessoa.Load(parametro, 'CODIGO_IBGE');

  if FPessoa.ID > 0 then
  begin
    carregaDados;
  end
  else
    abrePesquisa;
end;

procedure TBuscaPessoa.limpa;
begin
  edtCodigo.Clear;
  edtNome.Clear;
  if assigned(FPessoa) then
    FreeAndNil(FPessoa);
end;

procedure TBuscaPessoa.SetTipo(const Value: integer);
begin
  FTipo := Value;

  lbTipo.Caption := TTipoPessoaGet.getDescricaoTipo(FTipo);
end;

end.

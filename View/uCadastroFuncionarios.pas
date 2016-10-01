unit uCadastroFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Datasnap.DBClient, Datasnap.Provider, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.ComCtrls, uPersistentObject, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  frameBusca, frameBuscaCidade, Vcl.Mask, System.StrUtils;

type
  TfrmCadastroFuncionarios = class(TfrmCadastroPadrao)
    cdsID: TIntegerField;
    cdsNOME_RAZAO: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtNomeRazao: TEdit;
    edtCpf: TEdit;
    edtRG: TEdit;
    edtEmail: TEdit;
    edtFone1: TMaskEdit;
    edtfone2: TMaskEdit;
    edtRua: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    memComplemento: TMemo;
    edtCadastro: TMaskEdit;
    BuscaCidade1: TBuscaCidade;
    dtpNascimento: TJvDatePickerEdit;
    Shape1: TShape;
    edtIDEndereco: TEdit;
    cdsTIPO: TSmallintField;
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
  frmCadastroFuncionarios: TfrmCadastroFuncionarios;

implementation

uses Pessoa;

{$R *.dfm}

{ TfrmCadastroFuncionarios }

function TfrmCadastroFuncionarios.Alterar: Boolean;
begin
  inherited;
end;

procedure TfrmCadastroFuncionarios.atualizaGrid(Obj: TPersistentObject);
var Cliente :TPessoa;
begin
  inherited;
  try
    Cliente                := TPessoa(Obj);
    cdsID.AsInteger        := Cliente.ID;
    cdsNOME_RAZAO.AsString := Cliente.Nome;
    cdsTIPO.AsInteger      := Cliente.Tipo;
    cds.Post;
  finally
    FreeAndNil(Cliente);
  end;
end;

function TfrmCadastroFuncionarios.Cancelar: Boolean;
begin
  inherited;
end;

procedure TfrmCadastroFuncionarios.carregarDados;
var Cliente :TPessoa;
begin
  inherited;
  Cliente := TPessoa.Create;
  cds.Close;
  dsp.DataSet := Cliente.LoadAll;
  cds.Open;
  cds.Filtered := false;
  cds.Filter   := 'TIPO = 2';
  cds.Filtered := true;
end;

procedure TfrmCadastroFuncionarios.CarregarRegistro;
var Cliente :TPessoa;
begin
  inherited;
  try
    Cliente := TPessoa.Create;
    Cliente.Load(cds.FieldByName('ID').AsInteger);

    edtID.Text         := IntToStr(Cliente.ID);
    edtNomeRazao.Text  := Cliente.Nome;
    edtCpf.Text        := Cliente.CpfCnpj;
    edtRG.Text         := Cliente.RgIe;
    edtFone1.Text      := Cliente.Fone1;
    edtFone2.Text      := Cliente.Fone2;
    edtEmail.Text      := Cliente.Email;
    edtCadastro.Text   := IfThen(Cliente.DtCadastro > 0, DateToStr(Cliente.DtCadastro), '');
    dtpNascimento.Text := IfThen(Cliente.DtNascimento > 0, DateToStr(Cliente.DtNascimento), '');

    if (Cliente.Endereco.ID > 0) then
    begin
      edtIDEndereco.Text    := IntToStr(Cliente.Endereco.ID);
      BuscaCidade1.carregaDados(Cliente.Endereco.Cidade.ID);
      edtRua.Text           := Cliente.Endereco.Rua;
      edtNumero.Text        := Cliente.Endereco.Numero;
      edtBairro.Text        := Cliente.Endereco.Bairro;
      memComplemento.Text   := Cliente.Endereco.Complemento;
    end;

  finally
    FreeAndNil(Cliente);
  end;
end;

procedure TfrmCadastroFuncionarios.executaDepoisAlterar;
begin
  inherited;
  edtNomeRazao.SetFocus;
end;

procedure TfrmCadastroFuncionarios.executaDepoisIncluir;
begin
  inherited;
  edtNomeRazao.SetFocus;
end;

function TfrmCadastroFuncionarios.Incluir: Boolean;
begin
  inherited;
  edtCadastro.Text := DateToStr(Date);
end;

procedure TfrmCadastroFuncionarios.LimparCampos;
begin
  inherited;
  edtID.Clear;
  edtNomeRazao.Clear;
  edtCpf.Clear;
  edtRG.Clear;
  edtFone1.Clear;
  edtfone2.Clear;
  edtEmail.Clear;
  edtCadastro.Text := DateToStr(Date);
  dtpNascimento.Clear;
  edtIDEndereco.Clear;
  BuscaCidade1.limpa;
  edtRua.Clear;
  edtNumero.Clear;
  edtBairro.Clear;
  memComplemento.Clear;
end;

function TfrmCadastroFuncionarios.Salvar: TPersistentObject;
var Cliente :TPessoa;
begin
  inherited;
  try
    Cliente := TPessoa.Create;

    Cliente.ID              := strToIntDef(edtID.Text,0);
    Cliente.Nome            := edtNomeRazao.Text;
    Cliente.CpfCnpj         := edtCpf.Text;
    Cliente.RgIe            := edtRG.Text;
    Cliente.Fone1           := edtFone1.Text;
    Cliente.Fone2           := edtFone2.Text;
    Cliente.Email           := edtEmail.Text;
    Cliente.DtCadastro      := StrToDateDef(edtCadastro.Text,0);

    if StringReplace(dtpNascimento.Text,' ','',[rfReplaceAll]) <> '//' then
      Cliente.DtNascimento    := dtpNascimento.Date;

    Cliente.Endereco.ID     := StrToIntDef(edtIDEndereco.Text,0);

    if assigned(BuscaCidade1.Cidade) then
      Cliente.Endereco.ID_Cidade := BuscaCidade1.Cidade.ID;
    Cliente.Endereco.Rua    := edtRua.Text;
    Cliente.Endereco.Numero := edtNumero.Text;
    Cliente.Endereco.Bairro := edtBairro.Text;
    Cliente.Endereco.Complemento := memComplemento.Text;
    Cliente.Tipo            := 2;

    Cliente.Save;

    result := Cliente;
  Except
    on e :Exception do
      avisar('Erro ao salvar Cliente'+#13#10+e.Message);
  end;
end;

function TfrmCadastroFuncionarios.verificaObrigatorios: Boolean;
begin
  inherited;
end;

end.

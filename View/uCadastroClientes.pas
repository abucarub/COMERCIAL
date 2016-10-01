unit uCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Mask, uPersistentObject, System.StrUtils, frameBusca, frameBuscaCidade, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, DBGridCBN, Datasnap.DBClient, Datasnap.Provider;

type
  TfrmCadastroClientes = class(TfrmCadastroPadrao)
    edtNomeRazao: TEdit;
    Label1: TLabel;
    edtCpf: TEdit;
    Label2: TLabel;
    edtRG: TEdit;
    Label3: TLabel;
    edtEmail: TEdit;
    Label4: TLabel;
    edtFone1: TMaskEdit;
    edtfone2: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Shape1: TShape;
    edtRua: TEdit;
    Label7: TLabel;
    edtNumero: TEdit;
    Label8: TLabel;
    edtBairro: TEdit;
    Label9: TLabel;
    memComplemento: TMemo;
    Label10: TLabel;
    Label11: TLabel;
    edtCadastro: TMaskEdit;
    Label12: TLabel;
    edtIDEndereco: TEdit;
    BuscaCidade1: TBuscaCidade;
    dtpNascimento: TJvDatePickerEdit;
    cdsID: TIntegerField;
    cdsNOME_RAZAO: TStringField;
    cdsTIPO: TSmallintField;
    TabSheet1: TTabSheet;
    memQP: TMemo;
    memHDA: TMemo;
    memDC: TMemo;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    memConduta: TMemo;
    Label16: TLabel;
    Label17: TLabel;
    memMedicamentos: TMemo;
    edtIDDadosAdicionais: TEdit;
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

  public
    { Public declarations }
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

uses Pessoa;

{$R *.dfm}

{ TfrmCadastroClientes }

function TfrmCadastroClientes.Alterar: Boolean;
begin
  inherited;
end;

procedure TfrmCadastroClientes.atualizaGrid(Obj: TPersistentObject);
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

function TfrmCadastroClientes.Cancelar: Boolean;
begin
  inherited;
end;

procedure TfrmCadastroClientes.carregarDados;
var Cliente :TPessoa;
begin
  inherited;
  Cliente := TPessoa.Create;
  cds.Close;
  dsp.DataSet := Cliente.LoadAll;
  cds.Open;
  cds.Filtered := false;
  cds.Filter   := 'TIPO = 1';
  cds.Filtered := true;
end;

procedure TfrmCadastroClientes.CarregarRegistro;
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

    if (Cliente.DadosAdicionais.ID > 0) then
    begin
      edtIDDadosAdicionais.Text := IntToStr(Cliente.DadosAdicionais.ID);
      memQP.Text                := Cliente.DadosAdicionais.QueixaPrincipal;
      memHDA.Text               := Cliente.DadosAdicionais.HDA;
      memDC.Text                := Cliente.DadosAdicionais.DiagnosticoClinico;
      memMedicamentos.Text      := Cliente.DadosAdicionais.Medicamentos;
      memConduta.Text           := Cliente.DadosAdicionais.Conduta;
    end;

  finally
    FreeAndNil(Cliente);
  end;
end;

procedure TfrmCadastroClientes.executaDepoisAlterar;
begin
  inherited;
  edtNomeRazao.SetFocus;
end;

procedure TfrmCadastroClientes.executaDepoisIncluir;
begin
  inherited;
  edtNomeRazao.SetFocus;
end;

function TfrmCadastroClientes.Incluir: Boolean;
begin
  inherited;
  edtCadastro.Text := DateToStr(Date);
end;

procedure TfrmCadastroClientes.LimparCampos;
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
  edtIDDadosAdicionais.Clear;
  memQP.Clear;
  memHDA.Clear;
  memDC.Clear;
  memMedicamentos.Clear;
  memConduta.Clear;
end;

function TfrmCadastroClientes.Salvar: TPersistentObject;
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
    Cliente.Tipo            := 1;

    Cliente.DadosAdicionais.ID                 := StrToIntDef(edtIDDadosAdicionais.Text,0);
    Cliente.DadosAdicionais.QueixaPrincipal    := memQP.Lines.Text;
    Cliente.DadosAdicionais.HDA                := memHDA.Text;
    Cliente.DadosAdicionais.DiagnosticoClinico := memDC.Text;
    Cliente.DadosAdicionais.Medicamentos       := memMedicamentos.Text;
    Cliente.DadosAdicionais.Conduta            := memConduta.Text;
    Cliente.Save;

    result := Cliente;
  Except
    on e :Exception do
      MessageBox(frmCadastroClientes.Handle,PWideChar('Erro ao salvar Cliente'+#13#10+e.Message),'Atenção', MB_ICONINFORMATION + MB_OK);
  end;
end;

function TfrmCadastroClientes.verificaObrigatorios: Boolean;
begin
  result := false;

  if length(trim(edtNomeRazao.Text)) < 5 then
  begin
    avisar('Favor informar o nome da pessoa');
    edtNomeRazao.SetFocus;
  end
  else
    result := true;
end;

end.

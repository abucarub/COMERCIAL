unit uCadastroServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, uPersistentObject, Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Datasnap.DBClient, Datasnap.Provider, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, DBGridCBN, Vcl.ComCtrls, frameBusca, frameBuscaDepartamento, frameBuscaConvenio, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TfrmCadastroServicos = class(TfrmCadastroPadrao)
    cdsID: TIntegerField;
    cdsSERVICO: TStringField;
    BuscaDepartamento1: TBuscaDepartamento;
    edtServico: TEdit;
    Label1: TLabel;
    cmbDuracao: TComboBox;
    Label2: TLabel;
    TabSheet1: TTabSheet;
    BuscaConvenio1: TBuscaConvenio;
    Label7: TLabel;
    edtValorServico: TCurrencyEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    cdsTabela: TClientDataSet;
    dsTabela: TDataSource;
    cdsTabelaID_CONVENIO: TIntegerField;
    cdsTabelaVALOR: TFloatField;
    cdsTabelaID: TIntegerField;
    cdsTabelaCONVENIO: TStringField;
    Label3: TLabel;
    lbServico: TLabel;
    cdsDURACAO: TTimeField;
    BalloonHint1: TBalloonHint;
    procedure edtServicoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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

    procedure addItemTabela(ID_tabela, ID_Convenio :integer; convenio :String; valor :Real);
  end;

var
  frmCadastroServicos: TfrmCadastroServicos;

implementation

uses Servico, TabelaPreco;

{$R *.dfm}

{ TfrmCadastroServicos }

procedure TfrmCadastroServicos.addItemTabela(ID_tabela, ID_Convenio: integer; convenio: String; valor: Real);
begin
  cdsTabela.Append;
  cdsTabelaID.AsInteger           := ID_tabela;
  cdsTabelaID_CONVENIO.AsInteger  := ID_Convenio;
  cdsTabelaCONVENIO.AsString      := convenio;
  cdsTabelaVALOR.AsFloat          := valor;
  cdsTabela.Post;
end;

function TfrmCadastroServicos.Alterar: Boolean;
begin
  inherited;
end;

procedure TfrmCadastroServicos.atualizaGrid(Obj: TPersistentObject);
var Servico :TServico;
begin
  inherited;
  try
    Servico               := TServico(Obj);
    cdsID.AsInteger       := Servico.ID;
    cdsSERVICO.AsString   := Servico.Servico;
    cdsDURACAO.AsDateTime := Servico.Duracao;
    cds.Post;
  finally
    FreeAndNil(Servico);
  end;
end;

procedure TfrmCadastroServicos.BitBtn1Click(Sender: TObject);
begin
  if BuscaConvenio1.edtConvenio.Text = '' then
  begin
    avisar('Favor selecionar um dos convênios cadastrados');
    BuscaConvenio1.edtCodigo.SetFocus;
  end
  else if edtValorServico.Value = 0 then
  begin
    avisar('Favor informar o valor do serviço, para o convênio informado');
    edtValorServico.SetFocus;
  end
  else
  begin
    addItemTabela(0, BuscaConvenio1.Convenio.ID, BuscaConvenio1.Convenio.convenio, edtValorServico.Value);
    BuscaConvenio1.limpa;
    edtValorServico.Clear;
  end;
end;

function TfrmCadastroServicos.Cancelar: Boolean;
begin
  inherited;
end;

procedure TfrmCadastroServicos.carregarDados;
var Servico :TServico;
begin
  inherited;
  Servico := TServico.Create;
  cds.Close;
  dsp.DataSet := Servico.LoadAll;
  cds.Open;
end;

procedure TfrmCadastroServicos.CarregarRegistro;
var Servico :TServico;
    Tabela   :TTabelaPreco;
    Tabelas  :TObjectList<TTabelaPreco>;
begin
  inherited;
  try
    {mostra dados servico}
    Servico := TServico.Create;
    Servico.Load(cds.FieldByName('ID').AsInteger);

    edtID.Text        := IntToStr(Servico.ID);
    edtServico.Text   := Servico.Servico;
    BuscaDepartamento1.carregaDados(Servico.ID_Departamento);
    cmbDuracao.ItemIndex := cmbDuracao.Items.IndexOf(copy(TimeToStr(Servico.Duracao),1,5));

    {mostra dados tabela de preco}
    Tabela   := TTabelaPreco.Create;
    Tabelas  := Tabela.LoadList<TTabelaPreco>('WHERE ID_SERVICO = '+intToStr(Servico.ID));
    FreeAndNil(Tabela);
    if assigned(Tabelas) then
    begin
      for Tabela in Tabelas do
        addItemTabela(Tabela.ID, Tabela.ID_Convenio, Tabela.Convenio.convenio, Tabela.Valor);
    end;
  finally
    FreeAndNil(Servico);
    FreeAndNil(Tabelas);
  end;
end;

procedure TfrmCadastroServicos.edtServicoChange(Sender: TObject);
begin
  inherited;
  lbServico.Caption := TRIM(edtServico.Text);
end;

procedure TfrmCadastroServicos.executaDepoisAlterar;
begin
  inherited;
  BuscaDepartamento1.edtCodigo.SetFocus;
end;

procedure TfrmCadastroServicos.executaDepoisIncluir;
begin
  inherited;
  BuscaDepartamento1.edtCodigo.SetFocus;
end;

procedure TfrmCadastroServicos.FormCreate(Sender: TObject);
begin
  inherited;
  cdsTabela.CreateDataSet;
end;

function TfrmCadastroServicos.Incluir: Boolean;
begin
  inherited;
end;

procedure TfrmCadastroServicos.LimparCampos;
begin
  BuscaDepartamento1.limpa;
  edtServico.Clear;
  cmbDuracao.ItemIndex := 0;
  cdsTabela.EmptyDataSet;
end;

function TfrmCadastroServicos.Salvar: TPersistentObject;
var Servico :TServico;
    Tabela  :TTabelaPreco;
begin
  inherited;
  try
    Servico := TServico.Create;

    Servico.ID              := strToIntDef(edtID.Text,0);
    Servico.ID_Departamento := BuscaDepartamento1.Departamento.ID;
    Servico.Servico         := edtServico.Text;
    Servico.Duracao         := StrToTime(cmbDuracao.Items[cmbDuracao.ItemIndex]);
    Servico.Save;

    if not cdsTabela.IsEmpty then
    begin
      cdsTabela.First;
      while not cdsTabela.Eof do
      begin
        Tabela := TTabelaPreco.Create;

        Tabela.ID          := cdsTabelaID.AsInteger;
        Tabela.ID_Servico  := Servico.ID;
        Tabela.ID_Convenio := cdsTabelaID_CONVENIO.AsInteger;
        Tabela.Valor       := cdsTabelaVALOR.AsFloat;
        Tabela.Save;

        FreeAndNil(Tabela);
        cdsTabela.Next;
      end;

    end;

    result := Servico;
  Except
    on e :Exception do
      avisar('Erro ao salvar Cliente'+#13#10+e.Message);
  end;
end;

function TfrmCadastroServicos.verificaObrigatorios: Boolean;
begin
  result := false;

  if length(trim(edtServico.Text)) < 5 then
  begin
  //  pgcDados.ActivePageIndex := 1;
    balaoInformacao(edtServico, 'Favor informar o nome do serviço');
  end
  else if BuscaDepartamento1.edtCodigo.AsInteger = 0 then
  begin
    pgcDados.ActivePageIndex := 1;
    balaoInformacao(BuscaDepartamento1.edtCodigo, 'Favor informar o departamento que o serviço pertence');
  end
  else if cmbDuracao.ItemIndex = 0 then
  begin
    pgcDados.ActivePageIndex := 1;
    balaoInformacao(cmbDuracao, 'Favor informe o tempo de duração do serviço');
  end
  else
    result := true;
end;

end.

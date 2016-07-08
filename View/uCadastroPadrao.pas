unit uCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, uPadrao, uPersistentObject;

type TStdTela = (stIncluindo, stAlterando, stSalvando ,stCancelando, stPesquisando, stNavegando);
type
  TfrmCadastroPadrao = class(TfrmPadrao)
    pgcDados: TPageControl;
    tsListagem: TTabSheet;
    tsDados: TTabSheet;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ds: TDataSource;
    qry: TFDQuery;
    edtID: TEdit;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pgcDadosChange(Sender: TObject);

  protected
    procedure carregarDados;virtual;

    procedure CarregarRegistro;virtual;
    procedure LimparCampos;virtual;
    procedure habilitaAbas(TF :Boolean);
    procedure atualizaGrid(Obj: TPersistentObject);virtual;

    function Incluir :Boolean;virtual;
    function Alterar :Boolean;virtual;
    function Salvar :TPersistentObject;virtual;
    function Cancelar :Boolean;virtual;

    function verificaObrigatorios :Boolean;virtual;

    procedure executaAntesIncluir;virtual;
    procedure executaAntesAlterar;virtual;
    procedure executaAntesSalvar;virtual;
    procedure executaAntesCancelar;virtual;

    procedure executaDepoisIncluir;virtual;
    procedure executaDepoisAlterar;virtual;
    procedure executaDepoisSalvar(Obj :TPersistentObject);virtual;
    procedure executaDepoisCancelar;virtual;

  private
    FestadoTela :TStdTela;
    FRegistroCarregado :Integer;

    procedure SetEstadoTela(const Value: TStdTela);
  public
    property estadoTela :TStdTela read FestadoTela write SetEstadoTela;
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.dfm}

{ TfrmCadastroPadrao }

function TfrmCadastroPadrao.Alterar :Boolean;
begin
  CarregarRegistro;
end;

procedure TfrmCadastroPadrao.atualizaGrid(Obj: TPersistentObject);
begin
  if StrToIntDef(edtID.Text, 0) > 0 then
    qry.Edit
  else
    qry.Append;
end;

procedure TfrmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin
  self.estadoTela := stAlterando;
end;

procedure TfrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  self.estadoTela := stCancelando;
end;

procedure TfrmCadastroPadrao.btnIncluirClick(Sender: TObject);
begin
  self.estadoTela := stIncluindo;
end;

procedure TfrmCadastroPadrao.btnSalvarClick(Sender: TObject);
begin
  self.estadoTela := stSalvando;
end;

function TfrmCadastroPadrao.Cancelar :Boolean;
begin
  LimparCampos;
end;

procedure TfrmCadastroPadrao.carregarDados;
begin
//  if not assigned(Objeto) then
//    raise Exception.Create('Objeto deve ser criado no OnCreate da classe filha.');

//  self.qry := Objeto.LoadAll;
end;

procedure TfrmCadastroPadrao.CarregarRegistro;
begin
  LimparCampos;
  FRegistroCarregado := qry.FieldByName('ID').AsInteger;
end;

procedure TfrmCadastroPadrao.executaAntesAlterar;
begin
  //CarregarRegistro;
end;

procedure TfrmCadastroPadrao.executaAntesCancelar;
begin
  //
end;

procedure TfrmCadastroPadrao.executaAntesIncluir;
begin
  LimparCampos;
end;

procedure TfrmCadastroPadrao.executaAntesSalvar;
begin
  if not verificaObrigatorios then
    exit;
end;

procedure TfrmCadastroPadrao.executaDepoisAlterar;
begin
  pgcDados.ActivePageIndex := 1;
end;

procedure TfrmCadastroPadrao.executaDepoisCancelar;
begin
  pgcDados.ActivePageIndex := 0;
  self.FestadoTela         := stNavegando;
  FRegistroCarregado       := 0;
end;

procedure TfrmCadastroPadrao.executaDepoisIncluir;
begin
  pgcDados.ActivePageIndex := 1;
end;

procedure TfrmCadastroPadrao.executaDepoisSalvar(Obj :TPersistentObject);
begin
  if not assigned(Obj) then
    Exit;

  pgcDados.ActivePageIndex := 0;
  self.FestadoTela         := stNavegando;
  FRegistroCarregado       := 0;
  atualizaGrid(Obj);
end;

procedure TfrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  pgcDados.ActivePageIndex := 0;
  estadoTela := stNavegando;
end;

procedure TfrmCadastroPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_F3) and (FestadoTela = stNavegando) then
    btnIncluir.Click
  else if (key = VK_F4) and (FestadoTela = stNavegando) then
    btnAlterar.Click
  else if (key = VK_F1) and ((FestadoTela = stNavegando)or(FestadoTela = stPesquisando)) then
    pgcDados.ActivePageIndex := 0
  else if (key = VK_F2) then
    pgcDados.ActivePageIndex := 1;

  inherited;
end;

procedure TfrmCadastroPadrao.FormShow(Sender: TObject);
begin
  carregarDados;
  ds.DataSet := self.qry;
end;

procedure TfrmCadastroPadrao.habilitaAbas(TF: Boolean);
var i :integer;
begin
  for i := 1 to pgcDados.PageCount - 1 do
    pgcDados.Pages[i].Enabled := TF;
end;

function TfrmCadastroPadrao.Incluir :Boolean;
begin
  //
end;

procedure TfrmCadastroPadrao.LimparCampos;
begin
  //
end;

procedure TfrmCadastroPadrao.pgcDadosChange(Sender: TObject);
var
  pg :TPageControl;
begin
   pg := (Sender as TPageControl);

   if  (pg.Pages[pg.ActivePageIndex] <> tsListagem) and (FRegistroCarregado <> qry.FieldByName('ID').AsInteger) then
     CarregarRegistro;
end;

function TfrmCadastroPadrao.Salvar :TPersistentObject;
begin
  result := nil;
end;

procedure TfrmCadastroPadrao.SetEstadoTela(const Value: TStdTela);
begin
  FestadoTela := Value;

  if (qry.IsEmpty) and (FestadoTela = stAlterando) then
    FestadoTela := stNavegando;

  habilitaAbas(FestadoTela in [stAlterando, stIncluindo]);

  case FestadoTela of
    stIncluindo: begin
                   executaAntesIncluir;
                   Incluir;
                   executaDepoisIncluir;
                 end;
    stAlterando: begin
                   executaAntesAlterar;
                   Alterar;
                   executaDepoisAlterar;
                  end;
    stSalvando: begin
                  executaAntesSalvar;
                  executaDepoisSalvar(Salvar);
                end;
    stCancelando: begin
                   executaAntesCancelar;
                   Cancelar;
                   executaDepoisCancelar;
                  end;
  end;

  btnIncluir.Enabled  := FestadoTela = stNavegando;
  btnAlterar.Enabled  := FestadoTela = stNavegando;
  btnCancelar.Enabled := (FestadoTela in [stIncluindo, stAlterando, stSalvando]);
  btnSalvar.Enabled   := (FestadoTela in [stIncluindo, stAlterando, stSalvando]);
end;

function TfrmCadastroPadrao.verificaObrigatorios :Boolean;
begin
  //verificar campos que devem ser obrigatoriamente preenchidos
end;

end.

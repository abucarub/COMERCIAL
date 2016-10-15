unit uBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.StrUtils, IWSystem,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, FileCtrl, ConfiguracoesBackup;

type
  TfrmBackup = class(TfrmPadrao)
    Panel1: TPanel;
    Shape1: TShape;
    lbTitulo: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    btnEfetuarBackup: TBitBtn;
    btnVoltar: TBitBtn;
    GroupBox1: TGroupBox;
    edtCaminhoBackup: TEdit;
    btnBuscaDestino: TBitBtn;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    cmbHora: TComboBox;
    cmbMinutos: TComboBox;
    rgpHabilita: TRadioGroup;
    GroupBox3: TGroupBox;
    edtData: TEdit;
    edtHora: TEdit;
    BitBtn1: TBitBtn;
    procedure btnEfetuarBackupClick(Sender: TObject);
    procedure btnBuscaDestinoClick(Sender: TObject);
    procedure rgpHabilitaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    procedure compactar;
    procedure carregaConfiguracoes(configuracoes :TConfiguracoesBackup);
    procedure salvaConfiguracoes;

    function verificaObrigatorios :Boolean;
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}

procedure TfrmBackup.BitBtn1Click(Sender: TObject);
begin
  if verificaObrigatorios then
    salvaConfiguracoes;
end;

procedure TfrmBackup.btnBuscaDestinoClick(Sender: TObject);
var Diretorio: String;
begin
 SelectDirectory(Diretorio, [sdAllowCreate, sdPerformCreate,sdPrompt],1);
 edtCaminhoBackup.Text := Diretorio;
end;

procedure TfrmBackup.btnEfetuarBackupClick(Sender: TObject);
var configuracoes :TConfiguracoesBackup;
begin
//  compactar;
  try
    configuracoes := TConfiguracoesBackup.Create;
    configuracoes.Load(1);
    configuracoes.executaBackup(Date);

    avisar('Backup criado com sucesso.');
  finally
    FreeAndNil(configuracoes);
  end;
end;

procedure TfrmBackup.btnVoltarClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmBackup.carregaConfiguracoes(configuracoes: TConfiguracoesBackup);
begin
  edtCaminhoBackup.Text := configuracoes.destino;
  cmbHora.ItemIndex     := cmbHora.Items.IndexOf(copy(TimeToStr(configuracoes.horaProgramada),1,2));
  cmbMinutos.ItemIndex  := cmbMinutos.Items.IndexOf(copy(TimeToStr(configuracoes.horaProgramada),4,2));
  rgpHabilita.ItemIndex := configuracoes.habilitado;
  edtData.Text          := IfThen(configuracoes.dataUltimoBackup = 0,'--/--/--',DateToStr(configuracoes.dataUltimoBackup));
  edtHora.Text          := IfThen(configuracoes.horaUltimoBackup = 0,'--:--',copy(TimeToStr(configuracoes.horaUltimoBackup),1,5));
  btnEfetuarBackup.Enabled := true;
end;

procedure TfrmBackup.compactar;
var cmd :String;
begin
  cmd := 'rar a '+edtCaminhoBackup.Text+'\BACKUP C:\Users\Allan\Desktop\COMERCIAL\Bin\BASE.fdb';
  WinExec( PAnsiChar(AnsiString(Cmd)), SW_HIDE);
end;

procedure TfrmBackup.FormCreate(Sender: TObject);
var configuracoes :TConfiguracoesBackup;
begin
  try
    configuracoes := TConfiguracoesBackup.Create;
    configuracoes.Load(1);

    edtCaminhoBackup.Text := gsAppPath+'backup';

    if not (configuracoes.isEmpty) then
      carregaConfiguracoes(configuracoes);
  finally
    FreeAndNil(configuracoes);
  end;

end;

procedure TfrmBackup.rgpHabilitaClick(Sender: TObject);
begin
  cmbHora.Enabled := rgpHabilita.ItemIndex = 0;
  cmbMinutos.Enabled := rgpHabilita.ItemIndex = 0;
end;

procedure TfrmBackup.salvaConfiguracoes;
var configuracoes :TConfiguracoesBackup;
begin
  try
    configuracoes := TConfiguracoesBackup.Create;
    configuracoes.Load(1);

    configuracoes.destino         := edtCaminhoBackup.Text;
    configuracoes.horaProgramada  := StrToTime(cmbHora.Items[cmbHora.ItemIndex]+':'+cmbMinutos.Items[cmbMinutos.ItemIndex]+':00');
    configuracoes.habilitado      := rgpHabilita.ItemIndex;

    configuracoes.Save;

    avisar('Salvo com sucesso');

    if not DirectoryExists(configuracoes.destino) then
      CreateDir(configuracoes.destino);


    btnEfetuarBackup.Enabled := true;
  finally
    FreeAndNil(configuracoes);
  end;
end;

function TfrmBackup.verificaObrigatorios: Boolean;
begin
  result := false;

  if edtCaminhoBackup.Text = '' then
  begin
    avisar('O destino para o backup deve ser informado');
    btnBuscaDestino.SetFocus;
  end
  else if (rgpHabilita.ItemIndex = 0) and (cmbHora.ItemIndex = 0) then
  begin
    avisar('Backup automático está habilitado, portanto deve ser informado um horário para o mesmo.');
    cmbHora.SetFocus;
  end
  else
    result := true;
end;

end.



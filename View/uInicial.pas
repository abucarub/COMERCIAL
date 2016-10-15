unit uInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, uPadrao, JvExControls, JvCalendar, JvExComCtrls, System.StrUtils, System.Math,
  JvMonthCalendar, Vcl.Grids, Vcl.Samples.Calendar, Vcl.ComCtrls,
  VclTee.TeeGDIPlus, VCLTee.TeeData, VCLTee.TeEngine, Vcl.ExtCtrls, midaslib,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series, VCLTee.GanttCh, Vcl.AppEvnts, Vcl.StdCtrls, Vcl.Imaging.pngimage, FireDAC.Phys.IBWrapper,
  FireDAC.Phys.IBBase;

type
  TfrmInicial = class(TfrmPadrao)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    FDConnection1: TFDConnection;
    Agendamentos1: TMenuItem;
    Fisioterapia1: TMenuItem;
    Image1: TImage;
    lbAgendar: TLabel;
    lbContas: TLabel;
    Image2: TImage;
    Image3: TImage;
    Contas1: TMenuItem;
    Gerenciar1: TMenuItem;
    Funcionrios1: TMenuItem;
    Convnios1: TMenuItem;
    Servios1: TMenuItem;
    Pagar1: TMenuItem;
    Relatrios1: TMenuItem;
    Contasreceber1: TMenuItem;
    Contaspagar1: TMenuItem;
    Horrioscomstatuspendente1: TMenuItem;
    FDIBBackup1: TFDIBBackup;
    Utilitrios1: TMenuItem;
    Backup1: TMenuItem;
    timerBackup: TTimer;
    GroupBox1: TGroupBox;
    lbBackup: TLabel;
    Label1: TLabel;
    Shape2: TShape;
    lbTempo: TLabel;
    Label2: TLabel;
    lbHorarioProgramado: TLabel;
    imgAtivado: TImage;
    imgDesativado: TImage;
    procedure Clientes1Click(Sender: TObject);
    procedure Fisioterapia1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image3MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Gerenciar1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Convnios1Click(Sender: TObject);
    procedure Servios1Click(Sender: TObject);
    procedure Pagar1Click(Sender: TObject);
    procedure Contasreceber1Click(Sender: TObject);
    procedure Contaspagar1Click(Sender: TObject);
    procedure Horrioscomstatuspendente1Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure timerBackupTimer(Sender: TObject);
  private
    FHoraProgramadaBackup :TTime;

    procedure verificaGeraHorariosClienteMensal;
    procedure verificaBackupGerado;
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

uses uCadastroClientes, uAgendamentos, uContasHorarios, uCadastroFuncionarios, uCadastroConvenio, uCadastroServicos,
     uContasExtra, uRelatorioContasReceber, uRelatorioContasPagar, uContasStatusPendente, uBackup, ClienteMensal, ConfiguracoesBackup;

{$R *.dfm}

procedure TfrmInicial.Backup1Click(Sender: TObject);
begin
  AbreForm(TfrmBackup, frmBackup);
  verificaBackupGerado;
end;

procedure TfrmInicial.Clientes1Click(Sender: TObject);
begin
  AbreForm(TfrmCadastroClientes, frmCadastroClientes);
end;

procedure TfrmInicial.Contaspagar1Click(Sender: TObject);
begin
  AbreForm(TfrmRelatorioContasPagar, frmRelatorioContasPagar);
end;

procedure TfrmInicial.Contasreceber1Click(Sender: TObject);
begin
  AbreForm(TfrmRelatorioContasReceber, frmRelatorioContasReceber);
end;

procedure TfrmInicial.Convnios1Click(Sender: TObject);
begin
  AbreForm(TfrmCadastroConvenio, frmCadastroConvenio);
end;

procedure TfrmInicial.Fisioterapia1Click(Sender: TObject);
begin
  AbreForm(TfrmAgendamentos, frmAgendamentos);
end;

procedure TfrmInicial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    if not confirma('Deseja realmente sair do sistema?') then
      abort;

  inherited;
end;

procedure TfrmInicial.FormShow(Sender: TObject);
begin
  verificaGeraHorariosClienteMensal;
  verificaBackupGerado;
end;

procedure TfrmInicial.Funcionrios1Click(Sender: TObject);
begin
  AbreForm(TfrmCadastroFuncionarios, frmCadastroFuncionarios);
end;

procedure TfrmInicial.Gerenciar1Click(Sender: TObject);
begin
  AbreForm(TfrmContasHorarios, frmContasHorarios);
end;

procedure TfrmInicial.Horrioscomstatuspendente1Click(Sender: TObject);
begin
  AbreForm(TfrmContasStatusPendente, frmContasStatusPendente);
end;

procedure TfrmInicial.Image2Click(Sender: TObject);
begin
  Fisioterapia1Click(nil);
end;

procedure TfrmInicial.Image2MouseEnter(Sender: TObject);
begin
  lbAgendar.Font.Color := clAqua;
end;

procedure TfrmInicial.Image2MouseLeave(Sender: TObject);
begin
  lbAgendar.Font.Color := clBlack;
end;

procedure TfrmInicial.Image3Click(Sender: TObject);
begin
  inherited;
  Gerenciar1Click(nil);
end;

procedure TfrmInicial.Image3MouseEnter(Sender: TObject);
begin
  lbContas.Font.Color := clAqua;
end;

procedure TfrmInicial.Image3MouseLeave(Sender: TObject);
begin
  lbContas.Font.Color := clBlack;
end;

procedure TfrmInicial.Pagar1Click(Sender: TObject);
begin
  AbreForm(TfrmContasExtra, frmContasExtra);
end;

procedure TfrmInicial.Servios1Click(Sender: TObject);
begin
  AbreForm(TfrmCadastroServicos, frmCadastroServicos);
end;

procedure TfrmInicial.timerBackupTimer(Sender: TObject);
var configuracoes :TConfiguracoesBackup;
begin
  if FHoraProgramadaBackup < Time then
    lbTempo.Caption := TimeToStr(FHoraProgramadaBackup + (StrToTime('23:59:59')-time))
  else
    lbTempo.Caption := TimeToStr(FHoraProgramadaBackup - Time);

  if StrToTime(lbtempo.Caption) = 0 then
  begin
    timerBackup.Enabled := false;
    configuracoes := TConfiguracoesBackup.Create;
    configuracoes.Load(1);
    configuracoes.executaBackup(Date);
  end;
end;

procedure TfrmInicial.verificaBackupGerado;
var configuracoes :TConfiguracoesBackup;
begin
  configuracoes := TConfiguracoesBackup.Create;
  configuracoes.Load(1);

  if not configuracoes.isEmpty then
  begin
    lbHorarioProgramado.Caption := TimeToStr(configuracoes.horaProgramada);
    timerBackup.Enabled   := false;
    lbTempo.Caption       := '00:00:00';
     {verificação válida apenas na primeira vez que o sistema é aberto no dia}
    if ((configuracoes.dataUltimoBackup <> configuracoes.ultimoUsoSistema) and (configuracoes.ultimoUsoSistema <> date))
    or ( (configuracoes.ultimoUsoSistema = date) and (configuracoes.horaProgramada < Time) and (configuracoes.dataUltimoBackup <> Date)) then
      configuracoes.executaBackup(configuracoes.ultimoUsoSistema);

    configuracoes.ultimoUsoSistema := Date;
    configuracoes.Save;

    lbBackup.Caption      := IfThen(configuracoes.habilitado = 0, 'Ativado', 'Desativado');
    imgAtivado.Visible    := (configuracoes.habilitado = 0);
    imgDesativado.Visible := (configuracoes.habilitado = 1);

    if (configuracoes.habilitado = 0) {and (configuracoes.horaProgramada > Time) }then
    begin
      FHoraProgramadaBackup := configuracoes.horaProgramada;
      timerBackup.Enabled   := true;
    end;
  end;
end;

procedure TfrmInicial.verificaGeraHorariosClienteMensal;
var Clientes :TClienteMensal;
begin
  try
    Clientes := TClienteMensal.Create;
    Clientes.geraHorarios;
  finally
    FreeAndNil(Clientes);
  end;
end;

end.

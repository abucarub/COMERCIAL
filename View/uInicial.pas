unit uInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, uPadrao, JvExControls, JvCalendar, JvExComCtrls,
  JvMonthCalendar, Vcl.Grids, Vcl.Samples.Calendar, Vcl.ComCtrls,
  VclTee.TeeGDIPlus, VCLTee.TeeData, VCLTee.TeEngine, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series, VCLTee.GanttCh;

type
  TfrmInicial = class(TfrmPadrao)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    FDConnection1: TFDConnection;
    Agendamentos1: TMenuItem;
    Fisioterapia1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Fisioterapia1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

uses uCadastroClientes, uAgendamentos;

{$R *.dfm}

procedure TfrmInicial.Clientes1Click(Sender: TObject);
var i :integer;
begin
  frmCadastroClientes := TfrmCadastroClientes.Create(nil);
  frmCadastroClientes.Showmodal;
  frmCadastroClientes.Release;
  frmCadastroClientes := nil;
end;

procedure TfrmInicial.Fisioterapia1Click(Sender: TObject);
begin
  frmAgendamentos := TfrmAgendamentos.Create(nil);
  frmAgendamentos.Showmodal;
  frmAgendamentos.Release;
  frmAgendamentos := nil;
end;

procedure TfrmInicial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if MessageBox(Handle, PWideChar('Deseja realmente sair do sistema?'),'',MB_YESNO+MB_SYSTEMMODAL+MB_ICONQUESTION+MB_DEFBUTTON1) = ID_NO then
    abort;

  inherited;
end;

end.

unit uInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, uPadrao;

type
  TfrmInicial = class(TfrmPadrao)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    FDConnection1: TFDConnection;
    Agendamentos1: TMenuItem;
    Fisioterapia1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Fisioterapia1Click(Sender: TObject);
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

procedure TfrmInicial.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    Case MessageDlg('Deseja realmente sair do sistema?', mtConfirmation, mbYesNo, 0) of
      IDNO : Key := 0;
    end;

  end;
  inherited;
end;

end.

unit uBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmBackup = class(TfrmPadrao)
    edtCaminhoBackup: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Shape1: TShape;
    lbTitulo: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    btnImprimir: TBitBtn;
    btnVoltar: TBitBtn;
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure compactar;
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}

procedure TfrmBackup.btnImprimirClick(Sender: TObject);
begin
  compactar;
end;

procedure TfrmBackup.compactar;
var cmd :String;
begin
  cmd := 'rar a '+edtCaminhoBackup.Text+'\BACKUP C:\Users\Allan\Desktop\COMERCIAL\Bin\BASE.fdb';
  WinExec( PAnsiChar(AnsiString(Cmd)), SW_HIDE);
end;

end.

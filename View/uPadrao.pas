unit uPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts;

type
  Tclasshelper = class(TControl)
  public
    property Color;
  end;
type
  TfrmPadrao = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    controle: TWinControl;
    CorAnterior: TColor;
    procedure  ControlColorChange(Sender: TObject);
  protected
    procedure avisar(mensagem :String);
    function  confirma(mensagem :String) :Boolean;
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

const
  CorSemFoco = clWindow;
  CorComFoco = clBlue;

{$R *.dfm}

procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
  //Screen.OnActiveControlChange := ControlColorChange;
end;

procedure TfrmPadrao.FormDestroy(Sender: TObject);
begin
//  Screen.OnActiveControlChange := nil;
end;

procedure TfrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    self.Close
  else if Key = VK_RETURN then
    keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TfrmPadrao.avisar(mensagem: String);
begin
  MessageDlg(mensagem, mtInformation,[mbOk],0);
end;

function TfrmPadrao.confirma(mensagem: String): Boolean;
begin
  result := MessageBox(Handle, PWideChar(mensagem), '', MB_YESNO+MB_SYSTEMMODAL+MB_ICONQUESTION+MB_DEFBUTTON1) = ID_YES;
end;

procedure TfrmPadrao.ControlColorChange(Sender: TObject);
begin
  if assigned(controle) then
    try
      Tclasshelper(Controle).Color := CorAnterior;
    except
    end;
      with Screen.ActiveForm do
        begin
         if ActiveControl is TWinControl then
            try
              CorAnterior := Tclasshelper(ActiveControl).Color;
              Controle := ActiveControl;
              Tclasshelper(Controle).Color := CorComFoco;
           except
           end;
        end;
end;

end.

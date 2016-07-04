unit uPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

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
  Screen.OnActiveControlChange := ControlColorChange;
end;

procedure TfrmPadrao.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure TfrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    self.Close
  else if Key = VK_RETURN then
    keybd_event(VK_TAB, 0, 0, 0);
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

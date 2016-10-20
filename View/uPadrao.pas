unit uPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.ComCtrls;

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
    procedure avisar(mensagem :String);
    function  confirma(mensagem :String) :Boolean;
    procedure balaoInformacao(componente :TWinControl; mensagem :String; const titulo :String = 'Atenção');
    procedure aguarde(mensagem :String);
    procedure fimAguarde;
    procedure AbreForm(aClasseForm: TComponentClass;var aForm);
  private
    procedure sumLeftAndTopByParents(var Left, Top :integer; componente :TWinControl);
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

uses uAguarde;

const
  CorSemFoco = clWindow;
  CorComFoco = $00E7E1A5;

{$R *.dfm}

procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
  Screen.OnActiveControlChange := ControlColorChange;
end;

procedure TfrmPadrao.AbreForm(aClasseForm: TComponentClass;var aForm);
begin
  Application.CreateForm(aClasseForm,aForm);
  try
    Tform(aForm).ShowModal;
  Finally
    FreeAndNil(Tform(aForm));
  end;
end;

procedure TfrmPadrao.FormDestroy(Sender: TObject);
begin
  if self.ClassName = 'TfrmInicial' then
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

procedure TfrmPadrao.sumLeftAndTopByParents(var Left, Top: integer; componente: TWinControl);
begin
  Left := Left + componente.Left;
  Top  := Top  + componente.Top;

  if (componente is TPageControl) then
    TPageControl(componente).ActivePageIndex := TPageControl(componente).Tag;

  if not (componente.Parent is TForm) then
  begin
    if (componente is TTabSheet) then
      componente.Parent.Tag := TTabSheet(componente).pageIndex;

    sumLeftAndTopByParents(Left, Top, componente.Parent);
  end
  else
  begin
    Left := Left + TForm(componente.Parent).Left;
    Top  := Top  + TForm(componente.Parent).Top;
  end;
end;

procedure TfrmPadrao.aguarde(mensagem: String);
begin
  frmAguarde := TfrmAguarde.Create(nil);
  frmAguarde.lbMensagem.Caption := mensagem;
  frmAguarde.gif.Animate := true;
  frmAguarde.Show;
end;

procedure TfrmPadrao.avisar(mensagem: String);
begin
  MessageDlg(mensagem, mtInformation,[mbOk],0);
end;

procedure TfrmPadrao.balaoInformacao(componente :TWinControl; mensagem :String; const titulo :String);
var point :TPoint;
    balao :TBalloonHint;
    Left, Top :integer;
begin
  Left := 0; Top := 0;
  sumLeftAndTopByParents(Left,Top,componente);

  point.X  := Left + componente.Width;
  point.Y  := Top + componente.Height;

  componente.SetFocus;

  balao             := TBalloonHint.Create(componente.Owner);
  balao.Title       := titulo;
  balao.Description := mensagem;
  balao.Delay       := 500;
  balao.HideAfter   := 4000;
  balao.ShowHint(point);
  MessageBeep(16);
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
              CorAnterior := clWhite;//Tclasshelper(ActiveControl).Color;
              Controle := ActiveControl;
              Tclasshelper(Controle).Color := CorComFoco;
           except
           end;
        end;
end;

procedure TfrmPadrao.fimAguarde;
begin
  if assigned(frmAguarde) then
  begin
    frmAguarde.gif.Animate := false;
    frmAguarde.Free;
  end;
end;

end.

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
    function  confirma(mensagem :String) :Boolean;
    procedure balaoInformacao(componente :TWinControl; mensagem :String; const titulo :String = 'Atenção');
    procedure avisar(tipoMsg :Integer; mensagem:String; const tempoEspera :integer = 0; const semAtalho :String = '');
    procedure aguarde(mensagem: String);
    procedure fimAguarde;
    procedure AbreForm(frm: TFormClass);
  private
    procedure sumLeftAndTopByParents(var Left, Top :integer; componente :TWinControl);
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

uses uAguarde, uAvisar, uConfirmacaoUsuario;

const
  CorSemFoco = clWindow;
  CorComFoco = $00E7E1A5;

{$R *.dfm}

procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
 // Screen.OnActiveControlChange := ControlColorChange;
end;

procedure TfrmPadrao.AbreForm(frm: TFormClass);
var lFrm : TForm;
begin
  lFrm := frm.Create(nil);
  lFrm.ShowModal;

  if Assigned( lFrm ) then
  begin
    lFrm.Release;
    lFrm := nil;
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

procedure TfrmPadrao.avisar(tipoMsg :Integer; mensagem:String; const tempoEspera :integer = 0; const semAtalho :String = '');
begin
  frmAvisar := TfrmAvisar.Create(self, tipoMsg, mensagem, tempoEspera, semAtalho);
  frmAvisar.ShowModal;
  frmAvisar.Release;
  frmAvisar := nil;
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
  Result := false;

  frmConfirmacaoUsuario := TfrmConfirmacaoUsuario.Create(self);
  frmConfirmacaoUsuario.memMsg.Text := mensagem;

  if frmConfirmacaoUsuario.ShowModal = mrOk then
    result := true;

  frmConfirmacaoUsuario.Release;
  frmConfirmacaoUsuario := nil;
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

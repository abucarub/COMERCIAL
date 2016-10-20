unit uAguarde;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RxAnimate, RxGIFCtrl, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmAguarde = class(TForm)
    Shape1: TShape;
    lbMensagem: TLabel;
    gif: TRxGIFAnimator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAguarde: TfrmAguarde;

implementation

{$R *.dfm}

end.

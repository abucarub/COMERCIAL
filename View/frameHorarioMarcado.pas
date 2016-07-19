unit frameHorarioMarcado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  THorarioMarcado = class(TFrame)
    lbServico: TLabel;
    lbValor: TLabel;
    Label3: TLabel;
    edtDataHora: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

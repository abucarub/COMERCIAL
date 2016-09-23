unit framePeriodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, uPadrao;

type
  TPeriodo = class(TFrame)
    dtpDataInicial: TJvDatePickerEdit;
    dtpDataFinal: TJvDatePickerEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure dtpDataInicialChange(Sender: TObject);
    procedure FrameStartDock(Sender: TObject; var DragObject: TDragDockObject);
  private
    { Private declarations }
  public
    procedure setaSeparador(char :Char);
  end;

implementation

{$R *.dfm}

procedure TPeriodo.dtpDataInicialChange(Sender: TObject);
begin
  if dtpDataInicial.Date > dtpDataFinal.Date then
    dtpDataFinal.Date := dtpDataInicial.Date;
end;

procedure TPeriodo.FrameStartDock(Sender: TObject; var DragObject: TDragDockObject);
begin
  dtpDataInicial.Date := date;
  dtpDataFinal.Date   := date;
end;

procedure TPeriodo.setaSeparador(char: Char);
begin
  dtpDataInicial.DateSeparator := char;
  dtpDataFinal.DateSeparator   := char;
end;

end.

unit frameMostraServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Servico, Vcl.Buttons;

type
  TMostraServico = class(TFrame)
    Image1: TImage;
    lbServico: TLabel;
    Label1: TLabel;
    lbTempo: TLabel;
    Shape1: TShape;
    btnLimpa: TSpeedButton;
    procedure btnLimpaClick(Sender: TObject);
  private
    FServico: TServico;
    FTempoServico: TTime;
    { Private declarations }
  public
    procedure BeforeDestruction; override;
    procedure carregaServico(codigoServico :integer; tempoServico :TTime);

    property Servico :TServico read FServico;
    property TempoServico :TTime read FTempoServico;
  end;

implementation

{$R *.dfm}

{ TMostraServico }

procedure TMostraServico.BeforeDestruction;
begin
  inherited;
  if Assigned(FServico) then
    FreeAndNil(FServico);
end;

procedure TMostraServico.btnLimpaClick(Sender: TObject);
begin
  if assigned(FServico) then
    FreeAndNil(FServico);
  FTempoServico := 0;

  lbServico.Caption := '- - -';
  lbTempo.Caption   := '00:00';
end;

procedure TMostraServico.carregaServico(codigoServico: integer; tempoServico: TTime);
begin
  self.Align := alLeft;
  FServico := TServico.Create;
  FServico.Load(codigoServico);
  FTempoServico := tempoServico;

  lbServico.Caption := FServico.Servico;
  lbTempo.Caption   := FormatDateTime('hh:mm',tempoServico)+' min';
  self.Visible      := true;
end;

end.

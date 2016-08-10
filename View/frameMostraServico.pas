unit frameMostraServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, TabelaPreco, Vcl.Buttons;

type
  TMostraServico = class(TFrame)
    Image1: TImage;
    lbServico: TLabel;
    Label1: TLabel;
    lbTempo: TLabel;
    Shape1: TShape;
    btnLimpa: TSpeedButton;
    Label2: TLabel;
    lbValor: TLabel;
    procedure btnLimpaClick(Sender: TObject);
  private
    FTabelaPreco: TTabelaPreco;
    FTempoServico: TTime;
    FValorServico: Real;
    { Private declarations }
  public
    procedure BeforeDestruction; override;
    procedure carregaServico(idTabelaPreco :integer; tempoServico :TTime; valorServico :Real);

    property TabelaPreco :TTabelaPreco read FTabelaPreco;
    property tempoServico :TTime read FTempoServico;
    property valorServico :Real read FValorServico;
  end;

implementation

{$R *.dfm}

{ TMostraServico }

procedure TMostraServico.BeforeDestruction;
begin
  inherited;
  if Assigned(FTabelaPreco) then
    FreeAndNil(FTabelaPreco);
end;

procedure TMostraServico.btnLimpaClick(Sender: TObject);
begin
  if assigned(FTabelaPreco) then
    FreeAndNil(FTabelaPreco);
  FTempoServico := 0;

  lbServico.Caption := '- - -';
  lbTempo.Caption   := '00:00';
  lbValor.Caption   := 'R$ 0,00';
end;

procedure TMostraServico.carregaServico(idTabelaPreco: integer; tempoServico: TTime; valorServico :Real);
begin
  self.Align := alLeft;
  FTabelaPreco := TTabelaPreco.Create;
  FTabelaPreco.Load(idTabelaPreco);
  FTempoServico := tempoServico;
  FValorServico := valorServico;

  lbServico.Caption := FTabelaPreco.Servico.Servico;
  lbTempo.Caption   := FormatDateTime('hh:mm',tempoServico)+' min';
  lbValor.Caption   := 'RS '+FormatFloat('#,0.00',valorServico);
  self.Visible      := true;
end;

end.

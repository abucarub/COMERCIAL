unit uAvisar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, pngimage, TipoMensagem;

type
  TfrmAvisar = class(TForm)
    panCorpo: TPanel;
    memMsg: TMemo;
    timEspera: TTimer;
    Shape3: TShape;
    imgAviso: TImage;
    Shape1: TShape;
    btnOk: TBitBtn;
    Shape2: TShape;
    imgInformacao: TImage;
    imgPergunta: TImage;
    lbAviso: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure timEsperaTimer(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure panCorpoResize(Sender: TObject);
  private
    espera    :Integer;
    FSemAtalho :Boolean;

    procedure ajustaTamanho;
    procedure configuraTela(tipoMsg :integer);
  public
    constructor Create(AOwner: TComponent; tipoMsg :Integer; mensagem: String;
                       const tempoEspera:Integer = 0;
                       const semAtalho :String = ''); overload; virtual;
  end;
  {0 - aviso    1 - alerta}
var
  frmAvisar: TfrmAvisar;

implementation

{$R *.dfm}

procedure TfrmAvisar.ajustaTamanho;
begin
  // 17 é a altura de cada linha
  self.Height := self.Height + ((memMsg.Lines.Count - trunc(memMsg.Height/17)) * 17);
  self.Height := self.Height + 17;
end;

constructor TfrmAvisar.Create(AOwner: TComponent; tipoMsg :Integer; mensagem: String;
  const tempoEspera: Integer; const semAtalho :String);
begin
  self.Create(aOwner);
  configuraTela(tipoMsg);
  self.memMsg.Text  := mensagem;
  espera            := tempoEspera;
  FSemAtalho        := (semAtalho = 'S');
end;

procedure TfrmAvisar.FormCreate(Sender: TObject);
begin
  if memMsg.Lines.Count > 2 then
    ajustaTamanho;

  if espera > 0 then begin
    timEspera.Enabled  := true;
    btnOk.Caption := '<ENTER> OK ['+intToStr(espera)+']';
  end;
end;

procedure TfrmAvisar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FSemAtalho then EXIT;
  
  if Key = VK_Return then
    btnOk.Click;
end;

procedure TfrmAvisar.timEsperaTimer(Sender: TObject);
begin
  Dec(espera);
  btnOk.Caption := '<ENTER> OK ['+intToStr(espera)+']';
  if espera = 0 then
    btnOk.Click;
end;

procedure TfrmAvisar.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvisar.configuraTela(tipoMsg: integer);
begin
  case tipoMsg of
    0: begin
         lbAviso.Caption := 'Alerta';
         imgAviso.Left      := 26;  imgAviso.Top      := 30;
         imgAviso.BringToFront;
         imgInformacao.Left := 18;  imgInformacao.Top := 22;
         imgPergunta.Left   := 10;  imgPergunta.Top   := 14;
         imgPergunta.SendToBack;
       end;
    1: begin
         lbAviso.Caption := 'Informação';
         imgAviso.Left      := 18;  imgAviso.Top      := 22;
         imgInformacao.Left := 26;  imgInformacao.Top := 30;
         imgInformacao.BringToFront;
         imgPergunta.Left   := 10;  imgPergunta.Top   := 14;
         imgPergunta.SendToBack;
       end;

    2: begin
         lbAviso.Caption := 'Atenção';
         imgAviso.Left      := 10;  imgAviso.Top      := 14;
         imgAviso.SendToBack;
         imgInformacao.Left := 18;  imgInformacao.Top := 22;
         imgPergunta.Left   := 26;  imgPergunta.Top   := 30;
         imgPergunta.BringToFront;
       end;
  end;
  shape1.SendToBack;
end;

procedure TfrmAvisar.panCorpoResize(Sender: TObject);
begin
  btnOk.Left := Trunc((panCorpo.Width / 2) - (btnOk.Width / 2));
end;

end.

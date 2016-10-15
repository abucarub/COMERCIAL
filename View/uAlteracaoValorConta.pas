unit uAlteracaoValorConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TfrmAlteracaoValorConta = class(TForm)
    edtValorAtual: TCurrencyEdit;
    Label3: TLabel;
    edtNovoValor: TCurrencyEdit;
    Label1: TLabel;
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel2: TPanel;
    Shape1: TShape;
    lbTitulo: TLabel;
    lbProfissional: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtNovoValorChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlteracaoValorConta: TfrmAlteracaoValorConta;

implementation

{$R *.dfm}

procedure TfrmAlteracaoValorConta.btnCancelarClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

procedure TfrmAlteracaoValorConta.btnConfirmarClick(Sender: TObject);
begin
  self.ModalResult := mrOk;
end;

procedure TfrmAlteracaoValorConta.edtNovoValorChange(Sender: TObject);
begin
  btnConfirmar.Enabled := edtNovoValor.Value > 0;
end;

end.

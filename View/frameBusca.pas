unit frameBusca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPersistentObject, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TBusca = class(TFrame)
    btnBusca: TBitBtn;
    procedure edtIdChange(Sender: TObject);
    procedure edtIdEnter(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure edtEnter(Sender: TObject);
  private
    FEdtId :TCustomEdit;

  protected
    FcarregandoDados :Boolean;
    FInicializou     :Boolean;

    procedure pesquisa;virtual;abstract;
    procedure abrePesquisa(SQl :String; const titulo :String = 'Pesquisa');
    procedure efetuaBusca(parametro :Variant);virtual;abstract;
    procedure inicializa;virtual;abstract;
  public
    procedure carregaDados(const ID :integer = 0);virtual;
    procedure limpa; virtual;abstract;
  end;

implementation

uses uPesquisa;

{$R *.dfm}

{ TFrame1 }

procedure TBusca.abrePesquisa(SQl: String; const titulo: String);
begin
  frmPesquisa := TFrmPesquisa.Create(Self,SQL,titulo);
  if frmPesquisa.ShowModal = mrOk then
  begin
    self.carregaDados(frmPesquisa.cdsRetorno.Fields[0].AsInteger);
    keybd_event(VK_TAB,0,0,0);
  end
  else
  begin
    self.limpa;
    FEdtId.SetFocus;
  end;

  frmPesquisa.Release;
  frmPesquisa := nil;
end;

procedure TBusca.btnBuscaClick(Sender: TObject);
begin
  Pesquisa;
end;

procedure TBusca.carregaDados(const ID: integer);
begin
  FcarregandoDados := true;
  if not FInicializou then
    inicializa;
end;

procedure TBusca.edtEnter(Sender: TObject);
begin
  efetuaBusca(FEdtId.Text);
end;

procedure TBusca.edtidChange(Sender: TObject);
begin
  limpa;
end;

procedure TBusca.edtIdEnter(Sender: TObject);
begin
  TCustomEdit(Sender).SelectAll;
  if not assigned(FEdtId) then
    FEdtId := TCustomEdit(Sender);
end;

end.

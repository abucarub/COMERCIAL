unit frameBuscaServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, RxToolEdit, RxCurrEdit, Servico;

type
  TBuscaServico = class(TFrame)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TCurrencyEdit;
    btnBusca: TBitBtn;
    edtConvenio: TEdit;
    edtValor: TCurrencyEdit;
    Label3: TLabel;
  private
    FServico :TServico;
    FIdConvenio: integer;
    FIdDepartamento: integer;

    procedure efetuaBusca(parametro :Variant);
    procedure abrePesquisa;

  public
    procedure carregaDados(const ID :integer = 0);
    procedure limpa;

    property Cidade         :TServico read FServico        write FServico;
    property IdConvenio     :integer  read FIdConvenio     write FIdConvenio;
    property IdDepartamento :integer  read FIdDepartamento write FIdDepartamento;
  end;

implementation

uses uPesquisa;

{$R *.dfm}

{ TBuscaServico }

procedure TBuscaServico.abrePesquisa;
begin
  frmPesquisa := TFrmPesquisa.Create(Self,'Select tp.ID_SERVICO, s.SERVICO, tp.VALOR from TEBELA_PRECO tp '+
                                          ' left join SERVICOS s on s.ID = tp.ID_SERVICO'+
                                          ' where tp.ID_CONVENIO = '+ intToStr(self.FIdConvenio)+' and s.ID_DEPARTAMENTO = '+intToStr(self.fi),
                                          'Selecione a cidade desejada...');

  if frmPesquisa.ShowModal = mrOk then
    self.carregaDados(frmPesquisa.cdsRetorno.Fields[0].AsInteger)
  else
    limpa;

  frmPesquisa.Release;
  frmPesquisa := nil;
end;

procedure TBuscaServico.carregaDados(const ID: integer);
begin

end;

procedure TBuscaServico.efetuaBusca(parametro: Variant);
begin

end;

procedure TBuscaServico.limpa;
begin

end;

end.

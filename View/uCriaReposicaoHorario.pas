unit uCriaReposicaoHorario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, SPA, System.StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, JvExComCtrls, JvMonthCalendar, Vcl.Mask,
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit;

type
  TfrmCriaReposicaoHorario = class(TfrmPadrao)
    Panel1: TPanel;
    Shape1: TShape;
    lbTitulo: TLabel;
    lbProfissional: TLabel;
    lbPessoa: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    edtHora: TEdit;
    edtData: TEdit;
    edtStatus: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cmbHora: TComboBox;
    cmbMinutos: TComboBox;
    Label7: TLabel;
    edtDiaSemana: TEdit;
    dtpDataReposicao: TJvDatePickerEdit;
    btnTransparencia: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dtpDataReposicaoChange(Sender: TObject);
    procedure btnTransparenciaClick(Sender: TObject);
  private
    FHorario :TSPA;

    function informacoesFornecidas :boolean;
    procedure criaReposicao;
  public
    constructor create(AOwner: TComponent; horario :TSPA); overload;
  end;

var
  frmCriaReposicaoHorario: TfrmCriaReposicaoHorario;

implementation

uses ServicoAgendado, Utilitario;

{$R *.dfm}

{ TfrmCriaReposicaoHorario }

procedure TfrmCriaReposicaoHorario.btnCancelarClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmCriaReposicaoHorario.btnSalvarClick(Sender: TObject);
begin
  if informacoesFornecidas then
    if confirma('Confirma agendamento de reposição no dia '+
                DateToStr(dtpDataReposicao.Date)+' às '+cmbHora.Items[cmbHora.ItemIndex]+cmbMinutos.Items[cmbMinutos.ItemIndex]+','+#13#10+
                'para: '+FHorario.Pessoa.Nome+#13#10+
                'com: '+Fhorario.Profissional.Nome+'?' ) then
     criaReposicao;
end;

procedure TfrmCriaReposicaoHorario.btnTransparenciaClick(Sender: TObject);
begin
  self.AlphaBlend := not self.AlphaBlend;
end;

constructor TfrmCriaReposicaoHorario.create(AOwner: TComponent; horario: TSPA);
begin
  inherited Create(AOwner);
  FHorario          := horario;
  edtHora.Text      := TimeToStr(horario.hora);
  edtDiaSemana.Text := TUtilitario.diaSemanaExtenso(horario.data);
  edtData.Text      := DateToStr(horario.data);
  edtStatus.Text    := IfThen(horario.tipo = 'C', 'CANCELADO', 'FALTA');

  lbProfissional.Caption := horario.Profissional.Nome;
  lbPessoa.Caption       := horario.Pessoa.Nome;
end;

procedure TfrmCriaReposicaoHorario.criaReposicao;
var reposicao :TSPA;
    agendado  :TServicoAgendado;
begin
  try
    reposicao := TSPA.Create;
    reposicao.ID_Pessoa       := FHorario.ID_Pessoa;
    reposicao.ID_Departamento := FHorario.ID_Departamento;
    reposicao.ID_Profissional := FHorario.ID_Profissional;
    reposicao.data            := dtpDataReposicao.Date;
    reposicao.hora            := StrToTime(cmbHora.Items[cmbHora.ItemIndex]+':'+cmbMinutos.Items[cmbMinutos.ItemIndex]);
    reposicao.reposicao       := FHorario.ID;

    agendado := TServicoAgendado.Create;
    agendado.ID_TabelaPreco := FHorario.ServicosAgendados.Items[0].ID_TabelaPreco;
    agendado.duracao        := FHorario.ServicosAgendados.Items[0].duracao;

    reposicao.ServicosAgendados.Add(agendado);

    {salva reposição}
    reposicao.Save;

    {atualiza horário como reposto}
    FHorario.tipo := 'R';
    FHorario.Save;

    avisar('Reposição criada com sucesso');
    btnCancelar.Click;
  finally
    FreeAndNil(reposicao);
  end;
end;

procedure TfrmCriaReposicaoHorario.dtpDataReposicaoChange(Sender: TObject);
begin
  if dtpDataReposicao.Date <= strToDate(edtData.Text) then
  begin
    avisar('A data de reposição deve ser maior que a data do horário a ser reposto');
    dtpDataReposicao.OnChange := nil;
    dtpDataReposicao.Clear;
    dtpDataReposicao.OnChange := dtpDataReposicaoChange;
    dtpDataReposicao.SetFocus;
  end;
end;

procedure TfrmCriaReposicaoHorario.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FHorario);
  self.Release;
  self := nil;
end;

function TfrmCriaReposicaoHorario.informacoesFornecidas: boolean;
begin
  result := false;

  if dtpDataReposicao.Date = strToDate('30/12/1899') then
  begin
    avisar('A data da reposição não foi informada');
    dtpDataReposicao.SetFocus;
  end
  else if cmbHora.ItemIndex = 0 then
  begin
    avisar('O horário da reposição não foi informado');
    cmbHora.SetFocus;
  end
  else
    result := true;
end;

end.

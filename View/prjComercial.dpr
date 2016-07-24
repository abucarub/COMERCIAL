program prjComercial;

uses
  Vcl.Forms,
  uInicial in 'uInicial.pas' {frmInicial},
  uAtrib in '..\ORM\uAtrib.pas',
  uCFG in '..\ORM\uCFG.pas',
  uConnection in '..\ORM\uConnection.pas',
  uPersistentObject in '..\ORM\uPersistentObject.pas',
  uCadastroPadrao in 'uCadastroPadrao.pas' {frmCadastroPadrao},
  Pessoa in '..\Classes\Pessoa.pas',
  uPadrao in 'uPadrao.pas' {frmPadrao},
  Vcl.Themes,
  Vcl.Styles,
  uCadastroClientes in 'uCadastroClientes.pas' {frmCadastroClientes},
  Endereco in '..\Classes\Endereco.pas',
  Cidade in '..\Classes\Cidade.pas',
  Estado in '..\Classes\Estado.pas',
  uPesquisa in 'uPesquisa.pas' {frmPesquisa},
  Agendamento in '..\Classes\Agendamento.pas',
  Convenio in '..\Classes\Convenio.pas',
  Departamento in '..\Classes\Departamento.pas',
  SPA in '..\Classes\SPA.pas',
  ServicoAgendado in '..\Classes\ServicoAgendado.pas',
  Conta in '..\Classes\Conta.pas',
  Caixa in '..\Classes\Caixa.pas',
  Parcela in '..\Classes\Parcela.pas',
  Movimento in '..\Classes\Movimento.pas',
  uAgendamentos in 'uAgendamentos.pas' {frmAgendamentos},
  TipoPessoa in '..\Classes\TIPOS\TipoPessoa.pas',
  Servico in '..\Classes\Servico.pas',
  TabelaPreco in '..\Classes\TabelaPreco.pas',
  frameHorarioMarcado in 'frameHorarioMarcado.pas' {HorarioMarcado: TFrame},
  Utilitario in '..\Classes\Utilitario.pas',
  frameBusca in 'frameBusca.pas' {Busca: TFrame},
  frameBuscaConvenio in 'frameBuscaConvenio.pas' {BuscaConvenio: TFrame},
  frameBuscaPessoa in 'frameBuscaPessoa.pas' {BuscaPessoa: TFrame},
  frameBuscaTabelaPreco in 'frameBuscaTabelaPreco.pas' {BuscaTabelaPreco: TFrame},
  frameBuscaCidade in 'frameBuscaCidade.pas' {BuscaCidade: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
 // TStyleManager.TrySetStyle('Sky');
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.Run;
end.
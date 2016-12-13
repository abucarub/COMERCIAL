unit ClienteMensal;

interface

uses uPersistentObject, uAtrib, TabelaPreco, System.SysUtils, Generics.Collections, System.DateUtils;

type
  [Tablename('CLIENTES_MENSAL')]
  TClienteMensal = class(TPersistentObject)
  private
    FID_Pessoa: Integer;
    FSegunda: TTime;
    FTerca: TTime;
    FQuarta: TTime;
    FQuinta: TTime;
    FSexta: TTime;
    FSabado: TTime;
    FDiaPagamento: Integer;
    FDomingo: TTime;
    FInicio: TDate;
    FID_Profissional: Integer;
    FID_Departamento: Integer;
    FID_TabelaPreco: Integer;
    FTabelaPreco: TTabelaPreco;
    FUltimaGeracao :TDate;
    function GetTabelaPreco: TTabelaPreco;

  public
    [FieldName('ID_PESSOA')]
    property ID_Pessoa: Integer read FID_Pessoa write FID_Pessoa;
    [FieldName('ID_PROFISSIONAL')]
    property ID_Profissional: Integer read FID_Profissional write FID_Profissional;
    [FieldName('ID_DEPARTAMENTO')]
    property ID_Departamento: Integer read FID_Departamento write FID_Departamento;
    [FieldName('ID_TABELA_PRECO')]
    property ID_TabelaPreco: Integer read FID_TabelaPreco write FID_TabelaPreco;
    [FieldName('SEGUNDA')]
    property segunda: TTime read FSegunda write FSegunda;
    [FieldName('TERCA')]
    property terca: TTime read FTerca write FTerca;
    [FieldName('QUARTA')]
    property quarta: TTime read FQuarta write FQuarta;
    [FieldName('QUINTA')]
    property quinta: TTime read FQuinta write FQuinta;
    [FieldName('SEXTA')]
    property sexta: TTime read FSexta write FSexta;
    [FieldName('SABADO')]
    property sabado: TTime read FSabado write FSabado;
    [FieldName('DOMINGO')]
    property domingo: TTime read FDomingo write FDomingo;
    [FieldName('DIA_PAGAMENTO')]
    property diaPagamento: Integer read FDiaPagamento write FDiaPagamento;
    [FieldName('INICIO')]
    property inicio: TDate read FInicio write FInicio;
    [FieldName('ULTIMA_GERACAO')]
    property ultimaGeracao: TDate read FUltimaGeracao write FUltimaGeracao;

    [HasOne('ID_TABELA_PRECO')]
    property TabelaPreco: TTabelaPreco read GetTabelaPreco write FTabelaPreco;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;

  public
    procedure geraHorarios;
    procedure criaHorario(clienteMensal :TClienteMensal; dia :TDate; hora :TTime);
    function existeHorarioCriado(clienteMensal :TClienteMensal; dia :TDate) :Boolean;
    class function getIDTabelaPrecoClienteMensal(IDPessoa, IDDepartamento, IDProfissional: integer): Integer;
  end;

implementation

uses Utilitario, SPA, uConnection, ServicoAgendado, Departamento;

{ TClienteMensal }

procedure TClienteMensal.Clear;
begin
  ID         := 0;
  FID_Pessoa := 0;
  FID_Profissional := 0;
  FSegunda   := 0;
  FTerca     := 0;
  FQuarta    := 0;
  FQuinta    := 0;
  FSexta     := 0;
  FSabado    := 0;
  Fdomingo   := 0;
  FDiaPagamento := 0;
  FID_Departamento := 0;
  FInicio    := 0;
  FID_TabelaPreco  := 0;
  FUltimaGeracao := 0;
end;

class function TClienteMensal.getIDTabelaPrecoClienteMensal(IDPessoa, IDDepartamento, IDProfissional: integer): Integer;
var ClienteMensal :TClienteMensal;
    Clientes      :TObjectList<TClienteMensal>;
begin
 try
   ClienteMensal  := TClienteMensal.Create;
   Clientes       := ClienteMensal.LoadList<TClienteMensal>( ' WHERE ID_PESSOA = '+intToStr(IDPessoa)+
                                                             '   AND ID_DEPARTAMENTO = '+intToStr(IDDepartamento)+
                                                             '   AND ID_PROFISSIONAL = '+intToStr(IDProfissional));
   result         := Clientes.Items[0].ID_TabelaPreco;

 finally
   FreeAndNil(ClienteMensal);
   FreeAndNil(Clientes);
 end;
end;

procedure TClienteMensal.criaHorario(clienteMensal :TClienteMensal; dia :TDate; hora :TTime);
var horario :TSPA;
    servicoAgendado :TServicoAgendado;
    departamento    :TDepartamento;
begin
  if existeHorarioCriado(clienteMensal, dia) then
    exit;

  horario := TSPA.Create;
  horario.ID_Pessoa        := clienteMensal.FID_Pessoa;
  horario.ID_Departamento  := clienteMensal.ID_Departamento;
  horario.ID_Profissional  := clienteMensal.ID_Profissional;
  horario.data             := dia;
  horario.hora             := hora;

  departamento := TDepartamento.Create;
  departamento.Load(clienteMensal.ID_Departamento);

  servicoAgendado         := nil;
  servicoAgendado         := TServicoAgendado.Create;
  servicoAgendado.ID_TabelaPreco := TClienteMensal.getIDTabelaPrecoClienteMensal(horario.ID_Pessoa, horario.ID_Departamento, horario.ID_Profissional);
  servicoAgendado.duracao := departamento.Servicos.Items[0].Duracao;
  horario.ServicosAgendados.Add(servicoAgendado);

  horario.Save;
end;

function TClienteMensal.existeHorarioCriado(clienteMensal :TClienteMensal; dia :TDate): Boolean;
var horario :TSPA;
    horarios :TObjectList<TSPA>;
begin
  try
    horario  := TSPA.Create;
    horarios := horario.LoadList<TSPA>('WHERE ID_PESSOA = '+IntToStr(self.ID_Pessoa)+
                                       '  AND ID_PROFISSIONAL = '+IntToStr(Self.ID_Profissional)+
                                       '  AND ID_DEPARTAMENTO = '+IntToStr(Self.ID_Departamento)+
                                       '  AND DATA = '+TUtilitario.dataParaParametro(dia)+
                                       '  AND REPOSICAO = 0'); //reposição é referente a um outro horario então não conta
    result := assigned(horarios);
  finally
    FreeAndNil(horario);
    FreeAndNil(horarios);
  end;
end;

procedure TClienteMensal.geraHorarios;
const  dias  :array[1..7] of string = ('SEGUNDA-FEIRA','TERÇA-FEIRA','QUARTA-FEIRA','QUINTA-FEIRA','SEXTA-FEIRA','SÁBADO','DOMINGO');
var ClientesMensais :TObjectList<TClienteMensal>;
    dia, mes, ano :Word;
    ClienteMensal :TClienteMensal;
    inicioGeracao :TDate;
    fimGeracao    :TDate;
begin
  try
  try
    TConnection.GetInstance.Conexao.TxOptions.AutoCommit := false;

    ClientesMensais := self.LoadList<TClienteMensal>;

    if not Assigned(ClientesMensais) then
      exit;

    for ClienteMensal in ClientesMensais do
    begin
      {data da ultima geracao >= ao primeiro dia do mes corrente significa que a geracao esta atualizada}
      while not (ClienteMensal.ultimaGeracao >= StartOfTheMonth(date)) do
      begin
        if ClienteMensal.ultimaGeracao = 0 then
          inicioGeracao := ClienteMensal.inicio
        else
          inicioGeracao := IncMonth(StartOfTheMonth(ClienteMensal.ultimaGeracao),1);

        fimGeracao := EndOfTheMonth(inicioGeracao);

        while inicioGeracao <= fimGeracao do
        begin
          if (ClienteMensal.segunda > 0) and (TUtilitario.diaSemanaExtenso(inicioGeracao) = dias[1]) then
            criaHorario(Clientemensal, inicioGeracao, ClienteMensal.segunda)
          else if (ClienteMensal.terca > 0) and (TUtilitario.diaSemanaExtenso(inicioGeracao) = dias[2]) then
            criaHorario(Clientemensal, inicioGeracao, ClienteMensal.terca)
          else if (ClienteMensal.quarta > 0) and (TUtilitario.diaSemanaExtenso(inicioGeracao) = dias[3]) then
            criaHorario(Clientemensal, inicioGeracao, ClienteMensal.quarta)
          else if (ClienteMensal.quinta > 0) and (TUtilitario.diaSemanaExtenso(inicioGeracao) = dias[4]) then
            criaHorario(Clientemensal, inicioGeracao, ClienteMensal.quinta)
          else if (ClienteMensal.sexta > 0) and (TUtilitario.diaSemanaExtenso(inicioGeracao) = dias[5]) then
            criaHorario(Clientemensal, inicioGeracao, ClienteMensal.sexta)
          else if (ClienteMensal.sabado > 0) and (TUtilitario.diaSemanaExtenso(inicioGeracao) = dias[6]) then
            criaHorario(Clientemensal, inicioGeracao, ClienteMensal.sabado)
          else if (ClienteMensal.domingo > 0) and (TUtilitario.diaSemanaExtenso(inicioGeracao) = dias[7]) then
            criaHorario(Clientemensal, inicioGeracao, ClienteMensal.domingo);

          inicioGeracao := inicioGeracao +1;
        end;

        ClienteMensal.ultimaGeracao := inicioGeracao-1;
        ClienteMensal.Save;
      end;
    end;

    TConnection.GetInstance.Conexao.Commit;
  Except
    on e :Exception do
    begin
      TConnection.GetInstance.Conexao.Rollback;
      raise Exception.Create('Erro ao gerar horários mensais');
    end;
  end;

  finally
    TConnection.GetInstance.Conexao.TxOptions.AutoCommit := true;
    FreeAndNil(ClientesMensais);
  end;
end;

function TClienteMensal.GetTabelaPreco: TTabelaPreco;
begin
  if assigned(FTabelaPreco) and (FID_TabelaPreco <> FTabelaPreco.ID) then
    FreeAndNil(FTabelaPreco);

  if not assigned(FTabelaPreco) then
    FTabelaPreco := self.LoadOne<TTabelaPreco>(ID_TabelaPreco);

  if not assigned(FTabelaPreco) then
    FTabelaPreco := TTabelaPreco.Create;

  Result := FTabelaPreco;
end;

function TClienteMensal.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FID_Pessoa = 0) and
            (FSegunda = 0) and
            (FTerca = 0) and
            (FQuarta = 0) and
            (FQuinta = 0) and
            (FSexta = 0) and
            (FSabado = 0) and
            (FDomingo = 0) and
            (FDiaPagamento = 0) and
            (FID_Profissional = 0) and
            (FID_Departamento = 0) and
            (FID_TabelaPreco = 0) and
            (FInicio = 0) and
            (FUltimaGeracao = 0);
end;

procedure TClienteMensal.LoadClass(const AValue: Integer);
begin
 inherited Load(AValue);
end;

end.

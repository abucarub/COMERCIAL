unit ConfiguracoesBackup;

interface

uses uPersistentObject, uAtrib, System.SysUtils, System.StrUtils, IWSystem, Winapi.Windows, dialogs, ShellAPI ;

type
  [TABLENAME('CONFIGURACOES_BACKUP')]
  TConfiguracoesBackup = class(TPersistentObject)
  private
    FHoraProgramada: TTime;
    FUltimoUsoSistema: TDate;
    FDestino: String;
    FDataUltimoBackup: TDate;
    FHoraUltimoBackup: TTime;
    FHabilitado: SmallInt;

  public
    [FieldName('DESTINO')]
    property destino: String read FDestino write FDestino;
    [FieldName('HORA_PROGRAMADA')]
    property horaProgramada: TTime read FHoraProgramada write FHoraProgramada;
    [FieldName('DATA_ULTIMO_BACKUP')]
    property dataUltimoBackup: TDate read FDataUltimoBackup write FDataUltimoBackup;
    [FieldName('HORA_ULTIMO_BACKUP')]
    property horaUltimoBackup: TTime read FHoraUltimoBackup write FHoraUltimoBackup;
    [FieldName('ULTIMO_USO_SISTEMA')]
    property ultimoUsoSistema: TDate read FUltimoUsoSistema write FUltimoUsoSistema;
    [FieldName('HABILITADO')]
    property habilitado: SmallInt read FHabilitado write FHabilitado;

  public
    procedure LoadClass(const AValue: Integer);
    procedure Clear; override;
    function isEmpty :Boolean; overload; override;

  public
    procedure executaBackup(dia :TDate);
  end;

implementation

uses Utilitario, uConnection;

{ TConfiguracoesBackup }

procedure TConfiguracoesBackup.Clear;
begin
  ID := 0;
  FDestino := '';
  FHoraProgramada := 0;
  FDataUltimoBackup := 0;
  FHoraUltimoBackup := 0;
  FUltimoUsoSistema := 0;
end;

procedure TConfiguracoesBackup.executaBackup(dia :TDate);
var pastaSistema :String;
    gbak :String;
    destinoBackup :String;
    nomeArquivo :String;
    comando :String;
    caminhoBase :String;
    parametros :String;
    destinoPadrao :String;
begin
  destinoPadrao := gsAppPath+'backup';
  gbak          := 'gbak';
  parametros    := '-b -t -USER SYSDBA -PASSWORD masterkey ';

  if DirectoryExists(self.destino) then
    destinoBackup := self.destino
  else
    destinoBackup := destinoPadrao;

  nomeArquivo   := TUtilitario.diaSemanaExtenso(dia)+'.fbk';
  pastaSistema  := gsAppPath;
  caminhoBase   := TConnection.GetInstance.Conexao.Params.Database;
  comando       := (parametros+caminhoBase+' '+destinoBackup+'\'+nomeArquivo);

  ShellExecute(0, 'open', PChar(pastaSistema+gbak), PChar(comando), '', SW_HIDE);

  self.dataUltimoBackup := Date;
  self.horaUltimoBackup := Time;
  self.Save;
end;

function TConfiguracoesBackup.isEmpty: Boolean;
begin
  result := (ID = 0) and
            (FDestino = '') and
            (FHoraProgramada = 0) and
            (FDataUltimoBackup = 0) and
            (FHoraUltimoBackup = 0) and
            (FUltimoUsoSistema = 0);
end;

procedure TConfiguracoesBackup.LoadClass(const AValue: Integer);
begin
  inherited Load(AValue);
end;

end.

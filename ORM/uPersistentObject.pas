{No LoadOne, quando é passado a FK, é 1-1. Do contrário, é 1-N
 1-1 (um para 1) = está definido quando a tabela mãe possui a FK da tabela filha
 1-N (um para muitos) = está definido quando a tabela filha que possui a FK da tabela mãe
 }
unit uPersistentObject;

interface

uses
  Rtti,Variants,Classes,FireDAC.Comp.Client, dialogs, uAtrib,
  FireDAC.VCLUI.Wait, FireDAC.DApt, uConnection,SysUtils, Generics.Collections,
  System.StrUtils;

type
  TPersistentObject = class
  private
    FSQL: WideString;
    FID: Integer;

    {retorna o valor de uma determinada propriedade}
    function GetValue(const ARTP: TRttiProperty; const AFK: Boolean): String;
    {seta um valor pra determinada propriedade}
    procedure SetValue(P: TRttiProperty; S: Variant);

    {busca os nomes dos atributos e os valores contidos nas propriedades da classe passada por parametro}
    procedure GetAttAndValuePK(var atributos, valores :array of String; RTT: TRttiType);
    function GetTableName(RTT: TRttiType):String;
    function getInstancia(Ctx: TRttiContext; RTT: TRttiType; const parameters: array of TValue) : TObject;

  public
    property CustomSQL: WideString read FSQL write FSQL;

    [FieldName('ID', True, True)]
    property ID :integer read FID write FID;

    function Insert(const attName :String = ''; const propValue :String = ''): Boolean;
    function Update: Boolean;
    function Delete: Boolean;
    function Save(const attName :String = ''; const propValue :String = ''): Boolean;

    function isEmpty :Boolean; overload; virtual;
    {Load na classe corrente}
    //procedure Load(const AValue: Integer); overload; virtual; abstract;
    function Load(parametro :variant; const atributo :String = 'ID'): Boolean; overload;

    procedure Clear; virtual; abstract;

    {retorna a instancia de uma classe (ja preenchida - Load), atraves de seu tipo e chave primaria (PK)}
    function LoadSubclassByPK<T:class>(PK :integer) :T;

    {retorna uma query com todos os registros cadastrados correspondente a classe}
    procedure LoadAll(qry :TFDQuery);
    {retorna uma instancia, do tipo da classe passada por parametro, sendo essa classe "Detalhe" (Mestre-Detalhe)}
    function LoadOne<T:class>(const FK :Integer = 0): T;
    {retorna uma lista de instancias, do tipo da classe passada por parametro, sendo essa lista "Detalhe" (Mestre-Detalhe)}
    function LoadMany<T:class> : TObjectList<T>;

    function LoadList<T:class>(where :String) :TObjectList<T>;

    {busca o nome do atributo (field), da propriedade, cujo tipo é o mesmo da classe T, passada por parametro }
    procedure buscaFK<T:class>(var campoFK :String);
    {cria uma instancia e a retorna}
    class function CreateInstance(instanceType: TRttiInstanceType; constructorMethod: TRttiMethod;
                                  const arguments: array of TValue): TObject;

  end;

implementation

uses ServicoAgendado;

{ TPersintentObject }

procedure TPersistentObject.buscaFK<T>(var campoFK: String);
var
  Ctx: TRttiContext;
  RTT: TRttiType;
  RTP: TRttiProperty;
  Att: TCustomAttribute;
begin
  Ctx := TRttiContext.Create;
  RTT := CTX.GetType(ClassType);

  for RTP in RTT.GetProperties do
    begin
       for Att in RTP.GetAttributes do
       begin
         if (Att is HasOne) or (Att is HasMany) then
         begin
           if pos('>',RTP.PropertyType.ToString) > 0 then
           begin
             if pos(Tclass(T).ClassName+'>', RTP.PropertyType.ToString) > 0 then
             begin
               campoFK := FieldName(ATT).Name;
               exit;
             end;
           end
           else
           begin
             if Tclass(T).ClassName = RTP.PropertyType.ToString then
             begin
               campoFK := FieldName(ATT).Name;
               exit;
             end;
           end;
         end;
       end;
    end;
end;

class function TPersistentObject.CreateInstance(instanceType: TRttiInstanceType;
  constructorMethod: TRttiMethod; const arguments: array of TValue): TObject;
var
  classType: TClass;
begin
  classType := instanceType.MetaclassType;
  Result    := classType.NewInstance;
  constructorMethod.Invoke(Result, arguments);
end;

function TPersistentObject.Delete: Boolean;
begin

end;

procedure TPersistentObject.GetAttAndValuePK(var atributos, valores :array of String; RTT: TRttiType);
var
  RTP: TRttiProperty;
  Att: TCustomAttribute;
  index: integer;
begin
  index := 0;
  for RTP in RTT.GetProperties do
    begin
       for Att in RTP.GetAttributes do
       begin
         if Att is FieldName then
         begin
           if (FieldName(ATT).PK) then
           begin
             atributos[index] := FieldName(ATT).Name;
             valores[index]   := GetValue(RTP,FieldName(ATT).FK);
             inc(index);
           end;
         end;
       end;
    end;
end;

function TPersistentObject.getInstancia(Ctx: TRttiContext; RTT: TRttiType; const parameters: array of TValue): TObject;
var
  metRtti : TRttiMethod;
  instancia: TRttiInstanceType;
begin
  instancia:= (CTX.FindType(RTT.QualifiedName) as TRttiInstanceType);
  metRtti  := instancia.GetMethod('Create');

  result   := self.CreateInstance(instancia, metRtti, parameters);
end;

function TPersistentObject.GetTableName(RTT: TRttiType): String;
var Att: TCustomAttribute;
begin
  try
    for Att in RTT.GetAttributes do
      begin
        if Att is TableName then
          result := TableName(ATT).Name;
      end;

      if result = '' then
        raise Exception.Create('Atributo "tablename" não encontrado');

  Except
    on e :Exception do
      raise Exception.Create(e.Message)
  end;
end;

function TPersistentObject.GetValue(const ARTP: TRttiProperty;
  const AFK: Boolean): String;
begin
  case ARTP.PropertyType.TypeKind of
    tkUnknown, tkInteger,
    tkInt64: Result := ARTP.GetValue(Self).ToString;
    tkEnumeration: Result := IntToStr(Integer(ARTP.GetValue(Self).AsBoolean));
    tkChar, tkString,
    tkWChar, tkLString,
    tkWString, tkUString: Result := QuotedStr(ARTP.GetValue(Self).ToString);
    tkFloat: begin
               if ARTP.PropertyType.Name = 'TDateTime' then
                 Result := QuotedStr(FormatDateTime('dd.mm.yyyy hh:mm:ss', FloatToDateTime(ARTP.GetValue(Self).AsCurrency)))
               else if ARTP.PropertyType.Name = 'TDate' then
                 Result := QuotedStr(FormatDateTime('dd.mm.yyyy', FloatToDateTime(ARTP.GetValue(Self).AsCurrency)))
               else if ARTP.PropertyType.Name = 'TTime' then
                 Result := QuotedStr(FormatDateTime('hh:mm:ss', FloatToDateTime(ARTP.GetValue(Self).AsCurrency)))
               else
                 Result := StringReplace(FormatFloat('0.00',ARTP.GetValue(Self).AsCurrency)
                                                           ,FormatSettings.DecimalSeparator,'.',[rfReplaceAll,rfIgnoreCase]);


              end;
  end;

  if (AFK) and (Result = '0') then
    Result := 'null';
end;

function TPersistentObject.Insert(const attName :String; const propValue :String): Boolean;
var
  Ctx: TRttiContext;
  RTT: TRttiType;
  RTP: TRttiProperty;
  Att: TCustomAttribute;
  SQL,
  Field,
  Value,
  FieldID,
  NomeTabela,Error: String;
  Qry: TFDQuery;
  i: Integer;
  classe :TRttiInstanceType;
  mClass :TObject;

begin
  Field := '';
  Value := '';
  TConnection.GetInstance.BeginTrans;
  Ctx := TRttiContext.Create;
  try
    try
      RTT := CTX.GetType(ClassType);

      NomeTabela := GetTableName(RTT);
      SQL := 'INSERT INTO ' + NomeTabela;

      for RTP in RTT.GetProperties do
      begin
         for Att in RTP.GetAttributes do
         begin
           if Att is FieldName then
           begin
             if not (FieldName(ATT).AutoInc) then {Auto incremento não pode entrar no insert}
             begin
               Field := Field + FieldName(ATT).Name + ',';

               if (FieldName(ATT).Name = attName) then
                 Value := Value + propValue + ','
               else
                 Value := Value + GetValue(RTP,FieldName(ATT).FK) + ',';
             end
             else
               FieldID := FieldName(ATT).Name;
           end;
         end;
      end;

      Field := Copy(Field,1,Length(Field)-1);
      Value := Copy(Value,1,Length(Value)-1);

      SQL := SQL + ' (' + Field + ') VALUES (' + Value + ')';

      if Trim(CustomSQL) <> '' then
        SQL := CustomSQL;

      Result := TConnection.GetInstance.Execute(SQL,Error);

      if Result then
      begin
        SQL := 'SELECT MAX(' + FieldID + ') FROM ' + NomeTabela;// + ' ORDER BY ' + FieldID + ' DESC';

        Qry := TConnection.GetInstance.ExecuteQuery(SQL);

        for RTP in RTT.GetProperties do
        begin
           for Att in RTP.GetAttributes do
           begin
             if (Att is FieldName) and (FieldName(ATT).AutoInc) then
             begin
               RTP.SetValue(Self,TValue.FromVariant(qry.Fields[0].AsInteger));
             end;
           end;
        end;

        for RTP in RTT.GetProperties do
        begin
           for Att in RTP.GetAttributes do
           begin
             if (Att is HasOne) and (HasOne(Att).Upgradeable) and assigned((RTP.GetValue(Self).AsObject as TPersistentObject))
             and not (RTP.GetValue(Self).AsObject as TPersistentObject).isEmpty then
               (RTP.GetValue(Self).AsObject as TPersistentObject).Save(HasOne(Att).ChildPropertyName, qry.Fields[0].AsString)

             else if (Att is HasMany) and (HasMany(Att).Upgradeable) and not ((RTP.GetValue(Self).AsType<TObjectList<TServicoAgendado>> as TObjectList<TServicoAgendado>).Count <= 0) then
             begin
               classe := ctx.FindType('ServicoAgendado.TServicoAgendado').AsInstance;
               mClass := ((RTP.GetValue(Self).AsObject as TObjectList<TObject>).Items[i] as classe.MetaclassType);

               for i := 0 to (RTP.GetValue(Self).AsObject as TObjectList<TServicoAgendado>).Count - 1 do
                 (((RTP.GetValue(Self).AsObject as TObjectList<TServicoAgendado>).Items[i] as classe.MetaclassType) as TPersistentObject).Save(HasMany(Att).ChildPropertyName, qry.Fields[0].AsString);
             end;
           end;
        end;

      end
      else
          raise Exception.Create('Erro ao inserir.'+#13#10+Error);

    finally
      CustomSQL := '';
      TConnection.GetInstance.Commit;
      CTX.Free;
    end;
  Except
    on e :Exception do
    begin
      TConnection.GetInstance.Rollback;
      MessageDlg('Erro ao salvar.'+#13#10+e.Message, mtInformation,[mbOk],0);
    end;
  end;
end;

function TPersistentObject.isEmpty: Boolean;
begin
  raise Exception.Create('Método isEmpty deve ser implementado');
end;

function TPersistentObject.Load(parametro :variant; const atributo :String): Boolean;
var
  Ctx: TRttiContext;
  RTT: TRttiType;
  RTTAux :TRttiType;
  RTP: TRttiProperty;
  Att: TCustomAttribute;
  SQL, Where : String;
  i :integer;
  attsPK: array[1..3] of String;
  valuesPK: array[1..3] of String;
  Reader: TFDQuery;
begin
  Result := True;
  Ctx := TRttiContext.Create;
  try
    RTT := CTX.GetType(ClassType);

    SQL := 'SELECT * FROM ' + GetTableName(RTT);

  {  GetAttAndValuePK(attsPK, valuesPK, RTT);

    for i := 1 to 3 do
    begin
       if attsPK[i] = '' then
         break;

       Where := Where + Ifthen(Trim(where)='','',' AND ') + attsPK[i] + ' = ' + valuesPK[i];
    end; }

    { se parametro for string, coloca entre aspas}
    if VarIsStr(parametro) then
    begin
      if parametro = '' then
        parametro := '0';

      parametro := QuotedStr(parametro);
    end;

    Where := atributo + ' = ' + VarToStr(parametro);

    SQL := SQL + ' WHERE ' + Where;

    if Trim(CustomSQL) <> '' then
      SQL := CustomSQL;

    Reader := TConnection.GetInstance.ExecuteQuery(SQL);

    if (Assigned(Reader)) and (Reader.RecordCount > 0) then
    begin
      { percorre o query e vai preenchendo as propriedades da classe }
      with Reader do
      begin
        First;
        while not EOF do
        begin
          for RTP in RTT.GetProperties do
          begin
             for Att in RTP.GetAttributes do
             begin
               if Att is FieldName then
               begin
                 if Assigned(FindField(FieldName(ATT).Name)) then
                   SetValue(RTP,FieldByName(FieldName(ATT).Name).Value);
               end;
             end;
          end;
          Next;
        end;
      end;
    end
    else
      Result := False;

  finally
    CustomSQL := '';

    CTX.Free;
  end;
end;

procedure TPersistentObject.LoadAll(qry :TFDQuery);
var
  Ctx: TRttiContext;
  RTT: TRttiType;
  Att: TCustomAttribute;
  SQl :String;
begin
  Ctx := TRttiContext.Create;
  try
    RTT := CTX.GetType(ClassType);

    SQL := 'SELECT * FROM ' + GetTableName(RTT);

    qry.Close;
    qry.Connection := TConnection.GetInstance.Conexao;
    qry.SQL.Text   := SQL;
    qry.Open;

    //Result := TConnection.GetInstance.ExecuteQuery(SQL);
  finally
    Ctx.Free;
  end;
end;

function TPersistentObject.LoadList<T>(where: String): TObjectList<T>;
var
  Ctx: TRttiContext;
  RTT: TRttiType;
  Att: TCustomAttribute;
  SQl :String;
  reader: TFDQuery;
begin
  Result := nil;
  Ctx    := TRttiContext.Create;
  try
    RTT := CTX.GetType(ClassType);

    SQL := 'SELECT ID FROM ' + GetTableName(RTT) +
           ' '+where;
    try
      Reader := TConnection.GetInstance.ExecuteQuery(SQL);
    Except
      on e :Exception do
        raise Exception.Create('Erro ao selecionar registros.'+#13#10+e.Message);
    end;

    if (Assigned(Reader)) and (Reader.RecordCount > 0) then
    begin
      Result := TObjectList<T>.Create(true);

      with Reader do
      begin
        First;
        while not EOF do
        begin
          Result.Add( getInstancia(Ctx, RTT, []) );

          TPersistentObject(Result.items[Result.count-1]).Load( FieldByName('ID').Value );

          Next;
        end;
      end;
    end;

  finally
    Ctx.Free;
  end;
end;

function TPersistentObject.LoadMany<T>: TObjectList<T>;
var
  Ctx: TRttiContext;
  RTT: TRttiType;
  fieldFK, PKClasseMaster: String;
  Att: TCustomAttribute;
  RTP: TRttiProperty;
  SQL, condicao: String;
  attsPK: array[1..3] of String;
  valuesPK: array[1..3] of String;
  reader: TFDQuery;
begin
  Result := nil;
  Ctx := TRttiContext.Create;
  try
    buscaFK<T>(fieldFK);

    RTT := CTX.GetType(ClassType);

    GetAttAndValuePK(attsPK, valuesPK, RTT);

    PKClasseMaster := valuesPK[1];

    RTT := CTX.GetType(T);

    SQL := 'SELECT ID FROM ' + GetTableName(RTT) + ' WHERE ' + fieldFK + ' = ' + PKClasseMaster;

    Reader := TConnection.GetInstance.ExecuteQuery(SQL);

    if (Assigned(Reader)) and (Reader.RecordCount > 0) then
    begin
      Result := TObjectList<T>.Create(true);

      with Reader do
      begin
        First;
        while not EOF do
        begin
          Result.Add( getInstancia(Ctx, RTT, []) );

          TPersistentObject(Result.items[Result.count-1]).Load( FieldByName('ID').Value );

          Next;
        end;
      end;
    end;

  finally
     Ctx.Free;
  end;
end;

function TPersistentObject.LoadOne<T>(const FK :Integer = 0): T;
var
  Ctx: TRttiContext;
  RTT: TRttiType;
  fieldPK, fieldFK, PKClasseMae: String;
  Att: TCustomAttribute;
  SQL, condicao: String;
  attsPK: array[1..3] of String;
  valuesPK: array[1..3] of String;
  reader: TFDQuery;
begin
  Ctx := TRttiContext.Create;
  try
    { Se não for passado uma chave por parametro (significando FK da classe mãe),
    é buscado o campo na classe filha, que corresponde a PK na classe mãe }
    if FK = 0 then
      buscaFK<T>(fieldFK)
    else
      fieldPK := 'ID'; {"ID" é a nomenclatura fixa para o campo PK}

    RTT := CTX.GetType(ClassType);
    GetAttAndValuePK(attsPK, valuesPK, RTT);

    PKClasseMae := valuesPK[1];

    RTT := CTX.GetType(T);

    SQL := 'SELECT ID FROM ' + GetTableName(RTT) +
           ' WHERE ' + IfThen(fieldPK = '',fieldFK, fieldPK) + ' = '
                     + IfThen(FK = 0, PKClasseMae, IntToStr(FK));

    Reader := TConnection.GetInstance.ExecuteQuery(SQL);

    if (Assigned(Reader)) and (Reader.RecordCount > 0) then
    begin
      with Reader do
      begin
        First;

        Result := T( getInstancia(Ctx, RTT, []) );

        TPersistentObject(Result).Load( FieldByName('ID').Value );
      end;
    end;

  finally
     Ctx.Free;
  end;
end;

function TPersistentObject.LoadSubclassByPK<T>(PK: integer): T;
var
  Ctx: TRttiContext;
  RTT: TRttiType;
  Att: TCustomAttribute;
  SQL, condicao: String;
  reader: TFDQuery;
begin
  Ctx := TRttiContext.Create;
  try
    RTT := CTX.GetType(T);

    SQL := 'SELECT ID FROM ' + GetTableName(RTT);

    condicao := ' ID = ' + intToStr(PK);

    SQL := SQL + ' WHERE ' + condicao;

    Reader := TConnection.GetInstance.ExecuteQuery(SQL);

    if (Assigned(Reader)) and (Reader.RecordCount > 0) then
    begin
      with Reader do
      begin
        First;

        Result := T( getInstancia(Ctx, RTT, []) );

        TPersistentObject(Result).Load( FieldByName('ID').Value );
      end;
    end;

  finally
    Ctx.Free;
  end;
end;

function TPersistentObject.Save(const attName :String; const propValue :String): Boolean;
begin
  if self.FID > 0 then
    self.Update
  else
    self.Insert(attName, propValue);
end;

procedure TPersistentObject.SetValue(P: TRttiProperty; S: Variant);
var
  V: TValue;
  w: Word;
begin
  w := VarType(S);
  case w of
    271: v := StrToFloat(S); {smallmoney}
    272: v := StrToDateTime(S); {smalldatetime}
    3: v := StrToInt(S);
    else
    begin
      P.SetValue(Self,TValue.FromVariant(S));
      exit;
    end;
  end;
  p.SetValue(Self,v);
end;

function TPersistentObject.Update: Boolean;
var
  Ctx: TRttiContext;
  RTT: TRttiType;
  RTP: TRttiProperty;
  Att: TCustomAttribute;
  SQL,
  Field,
  Where,
  Error,
  ID: String;
begin
  Field := '';
  Ctx := TRttiContext.Create;
  try
  try
    RTT := CTX.GetType(ClassType);

    SQL := 'UPDATE ' + GetTableName(RTT) + ' SET';

    for RTP in RTT.GetProperties do
    begin
       for Att in RTP.GetAttributes do
       begin
         if Att is FieldName then
         begin
           if (not (FieldName(ATT).AutoInc)) and (not (FieldName(ATT).PK)) then {Auto incremento não pode entrar no update}
           begin
             Field := Field + FieldName(ATT).Name + ' = ' + GetValue(RTP,FieldName(ATT).FK) + ',';
           end
           else if (FieldName(ATT).PK) then
           begin
             Where := Where + Ifthen(Trim(where)='','',' AND ') + FieldName(ATT).Name + ' = ' + GetValue(RTP,FieldName(ATT).FK);
             ID    := GetValue(RTP,FieldName(ATT).FK);
           end;
         end;
       end;
    end;

    Field := Copy(Field,1,Length(Field)-1);

    SQL := SQL + ' ' + Field + ' WHERE ' + Where;

    if Trim(CustomSQL) <> '' then
      SQL := CustomSQL;

    Result := TConnection.GetInstance.Execute(SQL,Error);

    if Result then
      for RTP in RTT.GetProperties do
      begin
         for Att in RTP.GetAttributes do
         begin
           if (Att is HasOne) and (HasOne(Att).Upgradeable) and assigned((RTP.GetValue(Self).AsObject as TPersistentObject))
           and not (RTP.GetValue(Self).AsObject as TPersistentObject).isEmpty then
             (RTP.GetValue(Self).AsObject as TPersistentObject).Save(HasOne(Att).ChildPropertyName, ID);

             {if (RTP.GetValue(Self).AsObject as TPersistentObject).ID > 0 then
               (RTP.GetValue(Self).AsObject as TPersistentObject).Update
             else
               (RTP.GetValue(Self).AsObject as TPersistentObject).Insert; }
         end;
      end;

    if not Result then
      raise Exception.Create(Error);

  Except
    on e:Exception do
    begin
      TConnection.GetInstance.Rollback;
      MessageDlg('Erro ao salvar.'+#13#10+e.Message, mtInformation,[mbOk],0);
    end;
  end;
  finally
    CustomSQL := '';
    CTX.Free;
  end;
end;

end.

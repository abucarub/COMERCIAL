unit Utilitario;

interface

uses System.SysUtils, System.StrUtils, System.DateUtils;

type
  TUtilitario = class
  public
    class function horaParaMinutos(data :TDateTime) :integer;
    class function minutosParaHora(minutos :integer) :TTime;
    class function diaSemanaExtenso(data :TDateTime) :String;
    class function numeroDiaSemana(diaSemana :String) :integer;
    class function somenteNumeros(texto :String):String;
    class function mesExtenso(data :TDate) :String;
  end;

implementation

{ TUtilitario }

class function TUtilitario.horaParaMinutos(data: TDateTime): integer;
begin
  result := (StrToInt(Copy(formatDateTime('hh:mm:ss',data),1,2))*60) + StrToInt(Copy(formatDateTime('hh:mm:ss',data),4,2))
end;

class function TUtilitario.mesExtenso(data: TDate): String;
var mes :integer;
begin
  mes := monthOf(data);
  case mes of
    1 : result := 'JANEIRO';
    2 : result := 'FEVEREIRO';
    3 : result := 'MARÇO';
    4 : result := 'ABRIL';
    5 : result := 'MAIO';
    6 : result := 'JUNHO';
    7 : result := 'JULHO';
    8 : result := 'AGOSTO';
    9 : result := 'SETEMBRO';
    10: result := 'OUTUBRO';
    11: result := 'NOVEMBRO';
    12: result := 'DEZEMBRO';
  end;
end;

class function TUtilitario.minutosParaHora(minutos: integer): TTime;
var
  hr, min : Integer;
begin
  hr := 0;
  while minutos >= 60 do begin
    minutos := minutos - 60;
    hr := hr + 1;
  end;
  min := minutos;
  Result := StrToTime(FormatFloat('00:', hr) + FormatFloat('00', min));
end;

class function TUtilitario.diaSemanaExtenso(data: TDateTime): String;
{Retorna dia da semana}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String[13];
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terça-feira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
  NoDia := DayOfWeek(Data);
  result := AnsiUpperCase(DiaDasemana[NoDia]);
end;

class function TUtilitario.numeroDiaSemana(diaSemana: String): integer;
begin
  case AnsiIndexStr(ANSIUpperCase(diaSemana), ['SEGUNDA','TERÇA','QUARTA','QUINTA','SEXTA','SÁBADO','DOMINGO']) of
  0 : result := 1;
  1 : result := 2;
  2 : result := 3;
  3 : result := 4;
  4 : result := 5;
  5 : result := 6;
  6 : result := 7;
end;
end;

class function TUtilitario.somenteNumeros(texto: String): String;
var
  I : Byte;
begin
   Result := '';
   for I := 1 To Length(texto) do
       if texto[I] In ['0'..'9'] Then
            Result := Result + texto[I];
end;

end.

unit Utilitario;

interface

uses System.SysUtils;

type
  TUtilitario = class
  public
    class function dataParaMinutos(data :TDateTime) :integer;
    class function diaSemanaExtenso(data :TDateTime) :String;
  end;

implementation

{ TUtilitario }

class function TUtilitario.dataParaMinutos(data: TDateTime): integer;
begin
  result := (StrToInt(Copy(formatDateTime('hh:mm:ss',data),1,2))*60) + StrToInt(Copy(formatDateTime('hh:mm:ss',data),4,2))
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

end.

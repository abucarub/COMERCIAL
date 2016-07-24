unit Utilitario;

interface

uses System.SysUtils;

type
  TUtilitario = class
  public
    class function dataParaMinutos(date :TDateTime) :integer;
  end;

implementation

{ TUtilitario }

class function TUtilitario.dataParaMinutos(date: TDateTime): integer;
begin
  result := (StrToInt(Copy(formatDateTime('hh:mm:ss',date),1,2))*60) + StrToInt(Copy(formatDateTime('hh:mm:ss',date),4,2))
end;

end.

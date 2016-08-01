unit TipoPessoa;

interface

uses System.SysUtils;

type TTipoPessoa = (tpCliente=1, tpProfissional=2);

type
  TTipoPessoaGet = class
  public
    class function getDescricaoTipo(tipo :integer) :String;
  end;

implementation

{ TTipoPessoaGet }

class function TTipoPessoaGet.getDescricaoTipo(tipo: integer): String;
begin
  case tipo of
    1 : result := 'Cliente';
    2 : result := 'Profissional';
    else
      raise Exception.Create('Tipo de pessoa inválido');
  end;
end;

end.

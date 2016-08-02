unit TipoPessoa;

interface

uses System.SysUtils;

type TTipoPessoa = (tpCliente=1, tpProfissional=2);

type
  TTipoPessoaGet = class
  public
    class function getDescricaoTipo(tipo :integer) :String;
    class function getTipoPorInteiro(idTipo :integer) :TTipoPessoa;
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

class function TTipoPessoaGet.getTipoPorInteiro(idTipo: integer): TTipoPessoa;
begin
  case idTipo of
    1 : result := tpCliente;
    2 : result := tpProfissional;
  end;
end;

end.

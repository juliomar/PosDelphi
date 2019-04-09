unit Pattern.Decorator.TratamentoErro;

interface

uses
  Pattern.Decorator;

type
  { Concrete Decorator }
  TTratamentoErroDecorator = class(TDecorator)
  protected
    function ObterDadosExcecao: string; override;
  end;

implementation

uses
  SysUtils, Vcl.Forms;

function TTratamentoErroDecorator.ObterDadosExcecao: string;
begin
  result := inherited ObterDadosExcecao;

  if pos('is not a valid integer value',result) > 0 then
    result := result + 'Valor retornado não é inteiro. Verifique!';
end;

end.

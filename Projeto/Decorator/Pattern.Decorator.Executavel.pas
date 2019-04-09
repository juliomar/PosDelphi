unit Pattern.Decorator.Executavel;

interface

uses
  Pattern.Decorator;

type
  { Concrete Decorator }
  TExecutavelDecorator = class(TDecorator)
  protected
    function ObterDadosExcecao: string; override;
  end;

implementation

uses
  SysUtils, Windows, Registry, Vcl.Forms;

function TExecutavelDecorator.ObterDadosExcecao: string;
begin
  result := inherited ObterDadosExcecao;

  result := result + 'Caminho: '+  Application.ExeName;
end;

end.

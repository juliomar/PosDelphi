unit Pattern.Decorator.DataHora;

interface

uses
  Pattern.Decorator;

type
  { Concrete Decorator }
  TDataHoraDecorator = class(TDecorator)
  protected
    function ObterDadosExcecao: string; override;
  end;

implementation

uses
  SysUtils, Vcl.Forms;

function TDataHoraDecorator.ObterDadosExcecao: string;
begin
  result := inherited ObterDadosExcecao;

  result := result + 'Data/Hora Evento: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
end;

end.

unit Unit2;

interface

uses
  SysUtils, Controls, Graphics;

type
  TComunicado = class
  private
    FDescricao: string;
    FAssinadoPor: string;
  public
    function Clonar: TComunicado;
    property Descricao: string read FDescricao write FDescricao;
    property AssinadoPor: string read FAssinadoPor write FAssinadoPor;
  end;

implementation


function TComunicado.Clonar: TComunicado;
var
  NovoComunicado: TComunicado;
begin
  NovoComunicado := TComunicado.Create;
  NovoComunicado.Descricao := Self.Descricao;
  NovoComunicado.AssinadoPor := Self.AssinadoPor;
  result := NovoComunicado;
end;

end.


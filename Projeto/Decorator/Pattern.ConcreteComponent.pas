unit Pattern.ConcreteComponent;

interface

uses
  SysUtils, Pattern.Component;

type
  { Concrete Component }
  TLogExcecao = class(TInterfacedObject, ILogExcecao)
  private
    Excecao: Exception;

    function ObterDadosExcecao: string;
  public
    constructor Create(Excecao: Exception);
  end;

implementation

constructor TLogExcecao.Create(Excecao: Exception);
begin
  Self.Excecao := Excecao;
end;

function TLogExcecao.ObterDadosExcecao: string;
begin
  // retorna o erro
  result := 'Erro: ' + Excecao.Message;
end;

end.

unit Model.Cadastro.Interfaces;

interface
uses
  System.Generics.Collections,
  entity.pessoa;

type
  iModelCadastroPessoa = interface
    ['{8C4F7201-54A9-4016-9457-CEF7F190EC40}']
    function Pessoa: iModelCadastroPessoa;
    function GetListaPessoa : TObjectList<TPessoa>;
  end;

implementation


end.

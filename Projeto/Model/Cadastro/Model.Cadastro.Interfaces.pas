unit Model.Cadastro.Interfaces;

interface
uses
  entity.pessoa,
  Model.Iterator.Interfaces;

type
  iModelCadastro<T> = interface
    ['{8C4F7201-54A9-4016-9457-CEF7F190EC40}']
    function getLista: iIterator<T>;
  end;

implementation


end.

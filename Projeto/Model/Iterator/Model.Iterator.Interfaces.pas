unit Model.Iterator.Interfaces;

interface
uses
  System.Generics.Collections;

type
  TTipoLista = (tpLista, tpListaObjetos);

  iIterator<T> = interface
    ['{F58ADF29-83D8-402D-8121-F618CFAAC31E}']
    function temProximo : boolean;
    function Proximo : T;
    function Adicionar(Value : TObject) : iIterator<T>;
  end;

  iListasFactory<T> = interface
    ['{D428ED98-206A-401B-A58B-057C33CD3D90}']
    function getIterator : iIterator<T>;
  end;

implementation

end.

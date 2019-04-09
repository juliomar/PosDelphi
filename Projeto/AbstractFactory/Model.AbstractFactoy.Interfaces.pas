unit Model.AbstractFactoy.Interfaces;

interface

type

  inomeDoCurso = interface
    ['{68206AD3-F2B1-4E1D-9778-40033572D3B8}']
    function nome: string;
  end;

  iFactory = interface
    ['{F2FAEEE2-756E-447C-8ACC-D653ABA8BF67}']
    function NomeDoCurso: inomeDoCurso;
  end;

implementation

end.

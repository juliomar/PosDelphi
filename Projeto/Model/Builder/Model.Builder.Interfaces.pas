unit Model.Builder.Interfaces;

interface

  uses
    Model.Builder.Product;

    type
      IBuilder = interface

      procedure BuildCabecalho;
      procedure BuildDetalhes;
      procedure BuildRodape;

      function getRelatorio : TProduct;

    end;
implementation

end.

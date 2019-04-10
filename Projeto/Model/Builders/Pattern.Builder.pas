unit Pattern.Builder;

interface

uses
  Pattern.Product;

type
  { Builder }
  IBuilder = interface

	 // Metodos para criar as "partes" do objeto complexo
	 procedure BuildCabecalho;
	 procedure BuildDetalhes;
	 procedure BuildRodape;

	 // Funcao que retorna o "produto" pronto
	 function GetRelatorio: TProduct;
  end;

implementation

end.

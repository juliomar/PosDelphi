unit Model.Builder.ConcretBuilder;

interface

  uses
    System.Generics.Collections,
    entity.pessoa,
    Model.Builder.Product,
    Model.Builder.Interfaces,
    Model.Iterator.Interfaces,
    VCL.Grids;

    Type
      TConcretBuilder = class(TInterfacedObject, IBuilder)

      private
        FProduct : TProduct;
        FDados : Olevariant;
        FLista : TStringGrid;
        FQtdeRegistros : integer;

      public
        constructor Create(ALista: TStringGrid);
        destructor destroy; override;

        procedure BuildCabecalho;
        procedure BuildDetalhes;
        procedure BuildRodape;

        function getRelatorio : TProduct;

    end;

implementation

    uses
      System.SysUtils,
      DataSnap.DBClient;
{ TConcretBuilder }

procedure TConcretBuilder.BuildCabecalho;
begin
  FProduct.Adicionar('<html><head><meta charset="utf-8">');

  // Importação das bibliotecas do Bootstrap
  FProduct.Adicionar('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">');
  FProduct.Adicionar('<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>');

  FProduct.Adicionar('</head>');
  FProduct.Adicionar('<div class="container">');
  FProduct.Adicionar('<div class="panel panel-default">');
  FProduct.Adicionar('<div class="panel-heading">');
  FProduct.Adicionar('<h1 align="center">UNOESC - PÓS EM DELPHI</h1>');
  FProduct.Adicionar('<h4>Relatório de Pessoas</h4>');
  FProduct.Adicionar('<h4>' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + '</h4>');
  FProduct.Adicionar('</div>');
end;

procedure TConcretBuilder.BuildDetalhes;
var
  i : integer;
begin
  i := 1;
  // Preenche o conteúdo HTML referente à tabela de registros
  FProduct.Adicionar('<table class="table table-fixed">');
  FProduct.Adicionar('<thead><tr>');
  FProduct.Adicionar('<th class="col-xs-2">ID</th>');
  FProduct.Adicionar('<th class="col-xs-8">Matricula</th>');
  FProduct.Adicionar('<th class="col-xs-2">Nome</th>');
  FProduct.Adicionar('</tr></thead><tbody>');

  while i <= FLista.RowCount -1 do
  begin
    FProduct.Adicionar('<tr>');
    FProduct.Adicionar('<td class="col-xs-2">' + FLista.Cells[0, i] + '</td>');
    FProduct.Adicionar('<td class="col-xs-2">' + FLista.Cells[5, i] + '</td>');
    FProduct.Adicionar('<td class="col-xs-2">' + FLista.Cells[2, i] + '</td>');
    FProduct.Adicionar('</tr>');

    // Incrementa a variável de quantidade de registros
    Inc(FQtdeRegistros);
    inc(i);
  end;
  // Fecha o HTML da tabela
  FProduct.Adicionar('</tbody></table></div></div>');

end;

procedure TConcretBuilder.BuildRodape;
begin
    // Preenche o conteúdo HTML referente ao rodapé
  FProduct.Adicionar('<div id="footer">');
  FProduct.Adicionar('<div class="container">');
  FProduct.Adicionar('<p class="text-center">Qtde de Registros: ' + IntToStr(FQtdeRegistros)+ '</p>');
  FProduct.Adicionar('</div></div></body></html>');
end;

constructor TConcretBuilder.Create(ALista: TStringGrid);
begin
  FQtdeRegistros := 0;

  FLista := ALista;

  // Cria a instância do Product
  FProduct := TProduct.Create;
end;

destructor TConcretBuilder.destroy;
begin
  //FreeAndNil(FProduct);
  inherited;
end;

function TConcretBuilder.getRelatorio: TProduct;
begin
  result := FProduct;
end;

end.

unit Model.Exportador.Interfaces;

interface

  type
  IExportador = interface
    procedure ExportarDados(const Dados: olevariant);
  end;

implementation

end.

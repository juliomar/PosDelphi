unit Pattern.Facade.Exportar.Alunos;
{
  Criado por Anderson de Oliveira Furtilho
}

interface
  uses
    Model.Exportador.Interfaces,
    Model.Exportador.Alunos,
    Model.Exportador.FormatoHTML,
    Model.Exportador.FormatoXLS,
    Datasnap.DBClient,
    System.SysUtils;
type
  TFacadeExportarAlunos = class
    public
      {Façade para executar o exportar dados dos alunos em formato HTML e XLS}
      procedure ExportaTodosAlunosTodosFormatos(Cds: TClientDataSet);
  end;

implementation

{ TFacadeExportarAlunos }

procedure TFacadeExportarAlunos.ExportaTodosAlunosTodosFormatos(Cds: TClientDataSet);
var
  ExportadorXLS, ExportadorHTML: IExportador;
begin
  ExportadorXLS := TExportadorAlunos.Create(TFormatoXLS.Create);
  ExportadorHTML := TExportadorAlunos.Create(TFormatoHTML.Create);
  ExportadorXLS.ExportarDados(Cds.Data);
  ExportadorHTML.ExportarDados(Cds.Data);
end;

end.

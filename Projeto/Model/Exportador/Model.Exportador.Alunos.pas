unit Model.Exportador.Alunos;

interface

uses
  Model.Exportador.Interfaces, Model.Exportador.InterfaceFormato, Model.Exportador.FormatoHTML;

type
  TExportadorAlunos = class(TInterfacedObject, IExportador)
  private
    Formato: IFormato;
    procedure EscreverCabecalho;
  public
    constructor Create(Formato: IFormato);
    procedure ExportarDados(const Dados: olevariant);
  end;

implementation

uses
  SysUtils, DBClient;

{ TExportadorAlunos }

constructor TExportadorAlunos.Create(Formato: IFormato);
begin
  Self.Formato := Formato;
end;

procedure TExportadorAlunos.EscreverCabecalho;
begin
  Formato.DesenharCabecalho('Id');
  Formato.DesenharCabecalho('Nome');
  Formato.DesenharCabecalho('Sobrenome');
  Formato.DesenharCabecalho('Matricula');
  Formato.DesenharCabecalho('Email');
  Formato.DesenharCabecalho('Telefone');
  Formato.DesenharCabecalho('Sexo');
  Formato.DesenharCabecalho('Data de Nascimento');
end;

procedure TExportadorAlunos.ExportarDados(const Dados: olevariant);
var
  cdsDados: TClientDataSet;
  nContador: integer;
begin
  EscreverCabecalho;
  cdsDados := TClientDataSet.Create(nil);
  contadorDeRegistrosGlobalHTML :=0;
  try
    cdsDados.Data := Dados;
    cdsDados.First;
    while not cdsDados.Eof do
    begin

      Formato.PularLinha;
      for nContador := 0 to Pred(cdsDados.Fields.Count) do
        Formato.ExportarCampo(cdsDados.Fields[nContador].AsString);
        contadorDeRegistrosGlobalHTML := contadorDeRegistrosGlobalHTML + 1;
        cdsDados.Next;
    end;
    Formato.SalvarArquivo('Clientes');
  finally

    FreeAndNil(cdsDados);

  end;
end;

end.

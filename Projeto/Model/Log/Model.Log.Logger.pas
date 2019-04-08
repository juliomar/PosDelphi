unit Model.Log.Logger;

interface

type
  TLog = class
  private
    // variável que aponta para o arquivo de log
    ArquivoLog: TextFile;

    // o construtor é declarado como privado
    // pois o método principal é "ObterInstancia"
    constructor Create;
  public
    // método principal do Singleton
    class function ObterInstancia: TLog;

    // método chamado pelo "Create" indiretamente
    class function NewInstance: TObject; override;

    // método para registrar o texto do parâmetro no arquivo de log
    procedure RegistrarLog(const Texto: string);
  end;

var
  Instancia: TLog;

implementation

uses
  Forms, SysUtils;

{ TLoggerSingleton }

constructor TLog.Create;
var
  DiretorioAplicacao: string;
begin
  // associa o aquivo "Log.txt" que está na pasta do projeto
  DiretorioAplicacao := ExtractFilePath(Application.ExeName);
  AssignFile(ArquivoLog, DiretorioAplicacao + 'Log.txt');

  // se o arquivo não existir, é criado
  if not FileExists(DiretorioAplicacao + 'Log.txt') then
  begin
    Rewrite(ArquivoLog);
    CloseFile(ArquivoLog);
  end;
end;

class function TLog.NewInstance: TObject;
begin
  // se já houver uma instância, ela é retornada
  // caso contrário, o objeto é instanciado antes de ser retornado

  if not Assigned(Instancia) then
  begin
    // chama a função "NewInstance" da herança (TObject)
    Instancia := TLog(inherited NewInstance);
  end;

  result := Instancia;
end;

class function TLog.ObterInstancia: TLog;
begin
  // chama o método Create, que cria (uma única vez) e retorna a instância
  result := TLog.Create;
end;

procedure TLog.RegistrarLog(const Texto: string);
begin
  // abre o arquivo de log para edição
  Append(ArquivoLog);

  // escreve o texto no arquivo de log
  WriteLn(ArquivoLog, Texto);

  // fecha o arquivo
  CloseFile(ArquivoLog);
end;

initialization

finalization
  // libera o Singleton da memória
  FreeAndNil(Instancia);

end.

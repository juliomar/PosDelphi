{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit Model.Conexao;

interface

uses
  System.SysUtils, System.Classes,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite,
  FireDAC.Comp.UI,
  FireDAC.Comp.Client,
  firedac.Comp.ScriptCommands,

  Data.DB,

  ormbr.factory.Interfaces,
  ormbr.factory.FireDAC,

  ormbr.types.database,
  ormbr.ddl.commands,
  ormbr.database.compare,
  ormbr.database.interfaces,
  ormbr.modeldb.compare,
  /// orm injection dependency
  ormbr.container.dataset.interfaces,
  ormbr.container.fdmemtable,

  // será necessário adicionar para cada banco os uses abaixo
  ormbr.dml.generator.sqlite,
  ormbr.ddl.generator.sqlite,
  ormbr.metadata.sqlite;

type
  TdmConexao = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate (Sender: TObject);
    procedure FDConnection1BeforeConnect (Sender: TObject);
  private
    { Private declarations }

    class var FConn : IDBConnection;
    oManager: TModelDbCompare;
    function Builder: boolean;
    function ArquivoVazio(ANomeArquivo : string) : Boolean;
  public
    { Public declarations }
    class function New: TdmConexao;
    class function Conn: IDBConnection;
  end;

var
  dmConexao: TdmConexao;

implementation

uses
  dialogs, System.Generics.Defaults;
{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdmConexao }

function TdmConexao.Builder: boolean;
//var
//  cDDL    : TDDLCommand;
//  lComados: TStringBuilder;
begin
try
  oManager := TModelDbCompare.Create (FConn);
//  oManager.CommandsAutoExecute := False;
  if (ArquivoVazio('database.db3')) then
    oManager.BuildDatabase;
finally
  FreeAndNil(oManager);
end;
//  lComados := TStringBuilder.Create;
//  for cDDL in oManager.GetCommandList do
//    lComados.AppendLine (cDDL.Command);
//  lComados.Free;

end;

class function TdmConexao.Conn: IDBConnection;
begin
  Result := FConn;
end;

procedure TdmConexao.DataModuleCreate (Sender: TObject);
begin
  FConn := TFactoryFireDac.Create (FDConnection1,dnSQLite);
    // dnMSSQL, dnMySQL, dnFirebird, dnSQLite, dnInterbase, dnDB2,
    // dnOracle, dnInformix, dnPostgreSQL, dnADS, dnASA,
    // dnAbsoluteDB, dnMongoDB


  Builder;
end;

procedure TdmConexao.FDConnection1BeforeConnect (Sender: TObject);
begin
  // FDConnection1.Params.Values['Database'] := ExtractFilePath(ParamStr(0))+ 'database.db3';
end;

class function TdmConexao.New: TdmConexao;
begin
if not assigned(dmConexao) then
  dmconexao := Self.Create(nil);
Result := dmconexao;
end;

function TdmConexao.ArquivoVazio(ANomeArquivo: string): Boolean;
var
myFile : File;
begin
  AssignFile(myFile, ANomeArquivo);
  Reset(myFile);

  // Se arquivo for vazio
  if EOF(myFile) then
    Result := true
  else
    Result := false;

  // Close the file
  CloseFile(myFile);
end;

initialization
//
finalization
FreeAndNil(dmConexao);


end.

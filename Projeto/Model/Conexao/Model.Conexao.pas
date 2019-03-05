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
  Data.DB,
  FireDAC.Comp.Client,
  firedac.Comp.ScriptCommands,

  Model.Conexao.Interfaces,

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
  TdmConexao = class(
    TDataModule,
    iModelConexao)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate (Sender: TObject);
    procedure FDConnection1BeforeConnect (Sender: TObject);
  private
    { Private declarations }
    FConn   : IDBConnection;
    oManager: TModelDbCompare;
    function Builder: boolean;
    function Conn: IDBConnection;
  public
    { Public declarations }
    class function New: iModelConexao;
  end;

var
  dmConexao: TdmConexao;

implementation

uses
  dialogs;
{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdmConexao }

function TdmConexao.Builder: boolean;
var
  cDDL    : TDDLCommand;
  lComados: TStringBuilder;
begin
  oManager := TModelDbCompare.Create (FConn);
  // oManager.CommandsAutoExecute := False;
  oManager.BuildDatabase;

//  lComados := TStringBuilder.Create;
//  for cDDL in oManager.GetCommandList do
//    lComados.AppendLine (cDDL.Command);
//  lComados.Free;

end;

function TdmConexao.Conn: IDBConnection;
begin
  Result := FConn;
end;

procedure TdmConexao.DataModuleCreate (Sender: TObject);
begin
  FConn := TFactoryFireDac.Create (FDConnection1,
    // dnMSSQL, dnMySQL, dnFirebird, dnSQLite, dnInterbase, dnDB2,
    // dnOracle, dnInformix, dnPostgreSQL, dnADS, dnASA,
    // dnAbsoluteDB, dnMongoDB
    dnSQLite);

  Builder;
end;

procedure TdmConexao.FDConnection1BeforeConnect (Sender: TObject);
begin
  // FDConnection1.Params.Values['Database'] := ExtractFilePath(ParamStr(0))+ 'database.db3';
end;

class function TdmConexao.New: iModelConexao;
begin
  Result := Self.Create (nil);
end;

end.

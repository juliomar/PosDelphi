{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}

unit Model.Conexao.Interfaces;

interface

uses
  ormbr.factory.Interfaces;

type
  iModelConexao = interface
    [ '{DC7C4704-9FAB-4382-AC34-C4156FC3D934}' ]
    function Conn: IDBConnection;
  end;

implementation

end.

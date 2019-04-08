{*******************************************************}
{                                                       }
{       Projeto Teste P�s-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit Login.AbstractFactory;

interface

uses
  Login.Types;

type
  IFactoryLogin = interface
  ['{37C5B3FF-A35E-4073-B72B-720E348880A0}']
    function ValidarLogin(aNroMatricula: Integer; aSenha: String): TRetornoLogin;
  end;

implementation

end.

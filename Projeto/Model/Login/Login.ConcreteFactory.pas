{*******************************************************}
{                                                       }
{       Projeto Teste P�s-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit Login.ConcreteFactory;

interface

uses
  Login.AbstractFactory, Login.Types;

type
  TFactoryLogin = class
  public
    class function InstanciarLogin(aTipoUsuario: TTipoUsuario): IFactoryLogin;
  end;

implementation

{ TFactoryLogin }

uses
  Login.Aluno, Login.Professor;

class function TFactoryLogin.InstanciarLogin(
  aTipoUsuario: TTipoUsuario): IFactoryLogin;
begin
  case aTipoUsuario of
    tuAluno     : Result := TLoginAluno.Create;
    tuProfessor : Result := TLoginProfessor.Create;
  end;
end;

end.

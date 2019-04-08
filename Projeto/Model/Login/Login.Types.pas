{*******************************************************}
{                                                       }
{       Projeto Teste P�s-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit Login.Types;

interface

type
  TTipoUsuario = (tuAluno = 0, tuProfessor = 1);

  TRetornoLogin = record
    Valido: Boolean;
    Mensagem: String;
    procedure Clear;
  end;

implementation

{ TRetornoLogin }

procedure TRetornoLogin.Clear;
begin
  Valido   := False;
  Mensagem := '';
end;

end.

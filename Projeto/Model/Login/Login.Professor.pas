{*******************************************************}
{                                                       }
{       Projeto Teste P�s-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit Login.Professor;

interface

uses
  Login.AbstractFactory, Login.Types;

type
  TLoginProfessor = class(TInterfacedObject, IFactoryLogin)
  public
    function ValidarLogin(aNroMatricula: Integer; aSenha: String): TRetornoLogin;
  end;

implementation

uses
  Entity.Pessoa, ormbr.container.fdmemtable, ormbr.container.dataset.interfaces,
  Model.Conexao, System.SysUtils, FireDAC.Comp.Client, Login.UsuarioLogado;

{ TLoginProfessor }

function TLoginProfessor.ValidarLogin(aNroMatricula: Integer; aSenha: String): TRetornoLogin;
var
  oContainerPess: IContainerDataSet<TPessoa>;
  oDataSetPess: TFDMemTable;
begin
  Result.Clear;
  oDataSetPess := TFDMemTable.Create(nil);
  try
    oContainerPess := TContainerFDMemTable<TPessoa>.Create(TdmConexao.New.Conn, oDataSetPess);
    oContainerPess.OpenWhere('matricula = ' + aNroMatricula.ToString);

    if oContainerPess.DataSet.FieldByName('id').AsInteger <= 0 then
    begin
      Result.Valido := False;
      Result.Mensagem := 'Professor não cadastrado.';
    end
    else
    if oContainerPess.DataSet.FieldByName('senha').AsString <> aSenha then
    begin
      Result.Valido := False;
      Result.Mensagem := 'Senha incorreta.'
    end
    else
    begin
      Result.Valido := True;

      TUsuarioLogado.GetInstance.Id := oContainerPess.DataSet.FieldByName('id').AsInteger;
      TUsuarioLogado.GetInstance.NomeCompleto :=
        Format('%s %s', [oContainerPess.DataSet.FieldByName('nome').AsString,
                         oContainerPess.DataSet.FieldByName('sobrenome').AsString]);
      TUsuarioLogado.GetInstance.DataHoraLogin := Now;
      TUsuarioLogado.GetInstance.TipoUsuario := tuAluno;
    end;
  finally
    FreeAndNil(oDataSetPess);
  end;
end;

end.

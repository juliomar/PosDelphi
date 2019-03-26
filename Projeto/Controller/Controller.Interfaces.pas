{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit Controller.Interfaces;

interface

uses
  Model.Cadastro.Interfaces,
  Model.Iterator.Interfaces;

type
  iControllerCadastro<T> = interface
    ['{F916E922-D040-4374-AFF9-FB8BF0ED3918}']
    function Entidade   : iModelCadastro<T>;
  end;

implementation

end.

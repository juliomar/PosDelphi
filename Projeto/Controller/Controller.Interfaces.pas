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
  Model.Cadastro.Interfaces;

type

  iControllerCadastroPessoa = interface
    ['{F916E922-D040-4374-AFF9-FB8BF0ED3918}']
    function Pessoa : iModelCadastroPessoa;
  end;

implementation

end.

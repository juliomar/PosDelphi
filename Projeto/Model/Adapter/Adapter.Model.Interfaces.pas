unit Adapter.Model.Interfaces;

interface

uses
  System.Generics.Collections;

type
  TItens = record
    ID: integer;
    Matricula: integer;
    Nome: String;
    Sobrenome: String;
  end;

  iControllerItens = interface
  ['{8D465AFA-8C69-4723-9118-08D88FC70F26}']
    function Add(Value: TItens) : iControllerItens;
    function Itens: TList<TItens>;
  end;

  iModelItens = interface
    ['{13A1B85E-71A7-4E29-963C-191894630F55}']
  function Add(Value: iModelItens) : iModelItens;
  function Itens: TList<iModelItens>;
  function GetID: integer;
  function GetMatricula: integer;
  function GetNome: string;
  function GetSobrenome: string;
  function SetID(Value: integer) : iModelItens;
  function SetMatricula(Value: integer) : iModelItens;
  function SetNome(Value: string) : iModelItens;
  function SetSobrenome(Value: string) : iModelItens;
  end;

implementation

end.

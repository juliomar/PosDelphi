unit Adapter.Controller.Itens;

interface

uses Adapter.Model.Interfaces, System.Generics.Collections;

type
  TControllerItens = class(TInterfacedObject, iControllerItens)
  private
    FModelItens: iModelItens;
  public
  constructor Create;
  destructor Destroy; override;
  class function New : iControllerItens;
  function Add(Value: TItens) : iControllerItens;
  function Itens: TList<TItens>;
end;


implementation

uses
  System.SysUtils, Adapter.Model.Itens;

{ TControllerItens }

function TControllerItens.Add(Value: TItens): iControllerItens;
begin
  FModelItens.Add(
    TModelItens.New
    .SetID(Value.ID)
    .SetMatricula(Value.Matricula)
    .SetNome(Value.Nome)
    .SetSobrenome(Value.Sobrenome)
  );
end;

constructor TControllerItens.Create;
begin
  FModelItens:= TModelItens.New;
end;

destructor TControllerItens.Destroy;
begin
  FreeAndNil(FModelItens);
  inherited;
end;

function TControllerItens.Itens: TList<TItens>;
var
  I: integer;
  Item: TItens;
begin
  Result:= TList<TItens>.Create;
  for I := 0 to Pred(FModelItens.Itens.Count) do
    begin
      Item.ID:= FModelItens.Itens[I].GetID;
      Item.Matricula:= FModelItens.Itens[I].GetMatricula;
      Item.Nome:= FModelItens.Itens[I].GetNome;
      Item.Sobrenome:= FModelItens.Itens[I].GetSobrenome;
    end;
end;

class function TControllerItens.New: iControllerItens;
begin
  Result:= Self.Create;
end;

end.

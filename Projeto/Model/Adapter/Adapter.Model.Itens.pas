unit Adapter.Model.Itens;

interface
uses Adapter.Model.Interfaces, System.Generics.Collections;

type
  TModelItens = class(TInterfacedObject, iModelItens)
  private
    FLista: TList<iModelItens>;
    FID: integer;
    FMattricula: integer;
    FNome: string;
    FSobrenome: string;
  public

  constructor Create;
  destructor Destroy; override;
  class function New : iModelItens;
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

uses
  System.SysUtils;



{ TModelItens }

function TModelItens.Add(Value: iModelItens): iModelItens;
begin
  Result:= Self;
  FLista.Add(Value);
end;

constructor TModelItens.Create;
begin
  FLista:= TList<iModelItens>.Create;
end;

destructor TModelItens.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TModelItens.GetID: integer;
begin
  Result:= FID;
end;

function TModelItens.GetMatricula: integer;
begin
  Result:= FMattricula;
end;

function TModelItens.GetNome: string;
begin
  Result:= FNome;
end;

function TModelItens.GetSobrenome: string;
begin
  Result:= FSobrenome;
end;

function TModelItens.Itens: TList<iModelItens>;
begin
  Result:= FLista;
end;

class function TModelItens.New: iModelItens;
begin
  Result:= Self.Create;
end;

function TModelItens.SetID(Value: integer): iModelItens;
begin
  Result:= Self;
  FID:= Value;
end;

function TModelItens.SetMatricula(Value: integer): iModelItens;
begin
  Result:= Self;
  FMattricula:= Value;
end;

function TModelItens.SetNome(Value: string): iModelItens;
begin
  Result:= Self;
  FNome:= Value;
end;

function TModelItens.SetSobrenome(Value: string): iModelItens;
begin
  Result:= Self;
  FSobrenome:= Value;
end;

end.

unit Model.Lista.ObjectList;

interface

uses
  System.Generics.Collections,

  Model.Iterator.Interfaces;

type
  TModelListaObjectListIterator<T : class, constructor> = class(TInterfacedObject, iIterator<T>)
  private
    FListaDeObjetos: TObjectList<T>;
    FIndice        : Integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iIterator<T>;
    function temProximo : boolean;
    function Proximo : T;
    function Adicionar(Value : TObject) : iIterator<T>;
  end;

implementation

{ TModelListaObjectListIterator<T> }

function TModelListaObjectListIterator<T>.Adicionar(
  Value: TObject): iIterator<T>;
begin
  Result := Self;
  if Assigned(FListaDeObjetos) then
    FListaDeObjetos.Free;
  FListaDeObjetos := TObjectList<T>(Value);
  FIndice := 0;
end;

constructor TModelListaObjectListIterator<T>.Create;
begin
  FListaDeObjetos := TObjectList<T>.Create;
end;

destructor TModelListaObjectListIterator<T>.Destroy;
begin
  FListaDeObjetos.free;
  inherited;
end;

class function TModelListaObjectListIterator<T>.New: iIterator<T>;
begin
  Result := Self.Create;
end;

function TModelListaObjectListIterator<T>.Proximo: T;
begin
  Result := FListaDeObjetos[FIndice];
  Inc(FIndice);
end;

function TModelListaObjectListIterator<T>.temProximo: boolean;
begin
  Result := not (FIndice = FListaDeObjetos.Count);
end;

end.

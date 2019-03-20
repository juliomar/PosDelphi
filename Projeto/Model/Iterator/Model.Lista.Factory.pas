unit Model.Lista.Factory;

interface

uses
  System.Generics.Collections,

  Model.Iterator.Interfaces;

type
  TModelListaFactory<T : class, constructor> = class(TInterfacedObject, iListasFactory<T>)
  private
    FTipoLista : TTipoLista;
  public
    constructor Create(aTipoLista : TTipoLista);
    destructor Destroy; override;
    class function New(aTipoLista : TTipoLista): iListasFactory<T>;
    function getIterator : iIterator<T>;
  end;

implementation

uses
  Model.Lista.List,
  Model.Lista.ObjectList;

{ TModelListaFactory<T> }

constructor TModelListaFactory<T>.Create(aTipoLista : TTipoLista);
begin
  FTipoLista := aTipoLista;
end;

destructor TModelListaFactory<T>.Destroy;
begin

  inherited;
end;

function TModelListaFactory<T>.getIterator: iIterator<T>;
begin
case FTipoLista of
  tpLista       : Result := TModelListaListIterator<T>.New;
  tpListaObjetos: Result := TModelListaObjectListIterator<T>.New;
end;
end;

class function TModelListaFactory<T>.New(aTipoLista : TTipoLista): iListasFactory<T>;
begin
  Result := Self.Create(aTipoLista);
end;

end.

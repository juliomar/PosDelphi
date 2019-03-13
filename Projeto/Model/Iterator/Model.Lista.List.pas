unit Model.Lista.List;

interface

uses
  System.Generics.Collections,

  Model.Iterator.Interfaces;

type
  TModelListaListIterator<T : class, constructor> = class(TInterfacedObject,iIterator<T>)
  private
    FLista  : TList<T>;
    FIndice : Integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iIterator<T>;
    function temProximo : boolean;
    function Proximo : T;
    function Adicionar(Value : TObject) : iIterator<T>;

  end;

implementation

{ TModelListaListIterator }

function TModelListaListIterator<T>.Adicionar(Value: TObject): iIterator<T>;
begin
  Result := Self;
  if Assigned(FLista) then
    FLista.Free;
  FLista := TList<T>(Value);
  FIndice := 0;
end;

constructor TModelListaListIterator<T>.Create;
begin
  FLista := TList<T>.Create;
end;

destructor TModelListaListIterator<T>.Destroy;
var
  FObjeto : T;
begin
  for FObjeto in FLista do
  begin
    FObjeto.free;
  end;
  FLista.Free;
  inherited;
end;

class function TModelListaListIterator<T>.New: iIterator<T>;
begin
  Result := Self.Create;
end;

function TModelListaListIterator<T>.Proximo: T;
begin
  Result := FLista[FIndice];
  Inc(FIndice);
end;

function TModelListaListIterator<T>.temProximo: boolean;
begin
  Result := not (FIndice = FLista.Count);
end;

end.

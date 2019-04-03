unit Model.Iterator;

interface

uses
  System.Generics.Collections,
  Model.Iterator.Interfaces;

type
  TModelIterator<T : class> = class(TInterfacedObject, iIterator<T>)
  private
     FLista        : TList<T>;
     FListaObjetos : TObjectList<T>;
     FIndice       : Integer;
  public
    constructor Create(aTipoLista : TTipoLista);
    destructor Destroy; override;
    class function New(aTipoLista : TTipoLista): iIterator<T>;
    function temProximo: boolean;
    function Proximo: T;
    function Adicionar(Value : TObject): iIterator<T>;
  end;

implementation

{ TModelIterator }

function TModelIterator<T>.Adicionar(Value : TObject): iIterator<T>;
begin
  Result := Self;
  FLista := TList<T>(Value);
  FIndice := 0;
end;

constructor TModelIterator<T>.Create(aTipoLista : TTipoLista);
begin
  FIndice := 0;
  case aTipoLista of
    tpLista: TList<T>.Create;
    tpListaObjetos: TObjectList<T>.Create;
  end;
end;

destructor TModelIterator<T>.Destroy;
begin

  inherited;
end;

class function TModelIterator<T>.New(aTipoLista : TTipoLista): iIterator<T>;
begin
  Result := Self.Create(aTipoLista);
end;

function TModelIterator<T>.Proximo: T;
begin
  Result := FLista[FIndice];
  Inc(FIndice);
end;

function TModelIterator<T>.temProximo: boolean;
begin
  Result := not (FIndice = FLista.Count);
end;

end.

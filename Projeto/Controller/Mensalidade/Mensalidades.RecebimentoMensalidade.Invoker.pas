unit Mensalidades.RecebimentoMensalidade.Invoker;

interface

uses
  Mensalidades.Interfaces, System.Generics.Collections, System.SysUtils;

type
  TRecebimentoMensalidadeInvoker = class(TInterfacedObject, IInvoker)
  private
    FListaComandos : TList<ICommand>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New:IInvoker;
    function Add(Value : ICommand):IInvoker;
    function Execute : IInvoker;
  end;

implementation

{ TRecebimentoMensalidadeInvoker }

function TRecebimentoMensalidadeInvoker.Add(Value: ICommand): IInvoker;
begin
  Result := Self;
  FListaComandos.Add(Value);
end;

constructor TRecebimentoMensalidadeInvoker.Create;
begin
  FListaComandos := TList<ICommand>.Create;
end;

destructor TRecebimentoMensalidadeInvoker.Destroy;
begin
  FreeAndNil(FListaComandos);
  inherited;
end;

function TRecebimentoMensalidadeInvoker.Execute: IInvoker;
var
  I : Integer;
begin
  Result := Self;
  for I := 0 to Pred(FListaComandos.Count) do
    FListaComandos[I].Execute;
end;

class function TRecebimentoMensalidadeInvoker.New: IInvoker;
begin
  Result := Self.Create;
end;

end.

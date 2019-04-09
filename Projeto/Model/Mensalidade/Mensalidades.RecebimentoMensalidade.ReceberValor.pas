unit Mensalidades.RecebimentoMensalidade.ReceberValor;

interface

uses
  Mensalidades.Interfaces;

type
  TRecebimentoMensalidadeReceberValor = class(TInterfacedObject, ICommand)
    private
      FParent : IRecebimentoMensalidade;
    public
      constructor Create(aParent : IRecebimentoMensalidade);
      destructor Destroy;override;
      class function New(aParent : IRecebimentoMensalidade):ICommand;
      function Execute:ICommand;
  end;

implementation

{ TRecebimentoMensalidadeReceberValor }

constructor TRecebimentoMensalidadeReceberValor.Create(aParent : IRecebimentoMensalidade);
begin
  FParent := aParent;
end;

destructor TRecebimentoMensalidadeReceberValor.Destroy;
begin

  inherited;
end;

function TRecebimentoMensalidadeReceberValor.Execute: ICommand;
begin
  Result := Self;
  FParent.ReceberValor;
end;

class function TRecebimentoMensalidadeReceberValor.New(aParent : IRecebimentoMensalidade): ICommand;
begin
  Result := Self.Create(aParent);
end;

end.

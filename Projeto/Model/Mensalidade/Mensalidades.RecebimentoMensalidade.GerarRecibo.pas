unit Mensalidades.RecebimentoMensalidade.GerarRecibo;

interface

uses
  Mensalidades.Interfaces;

type
  TRecebimentoMensalidadeGerarRecibo = class(TInterfacedObject, ICommand)
    private
      FParent : IRecebimentoMensalidade;
    public
      constructor Create(aParent : IRecebimentoMensalidade);
      destructor Destroy;override;
      class function New(aParent : IRecebimentoMensalidade):ICommand;
      function Execute:ICommand;
  end;

implementation

{ TRecebimentoMensalidadeGerarRecibo }

constructor TRecebimentoMensalidadeGerarRecibo.Create(aParent : IRecebimentoMensalidade);
begin
  FParent := aParent;
end;

destructor TRecebimentoMensalidadeGerarRecibo.Destroy;
begin

  inherited;
end;

function TRecebimentoMensalidadeGerarRecibo.Execute: ICommand;
begin
  Result := Self;
  FParent.GerarRecibo;
end;

class function TRecebimentoMensalidadeGerarRecibo.New(aParent : IRecebimentoMensalidade): ICommand;
begin
  Result := Self.Create(aParent);
end;

end.

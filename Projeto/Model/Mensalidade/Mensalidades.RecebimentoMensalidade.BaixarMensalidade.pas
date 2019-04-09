unit Mensalidades.RecebimentoMensalidade.BaixarMensalidade;

interface

uses
  Mensalidades.Interfaces;

type
  TRecebimentoMensalidadeBaixarMensalidade = class(TInterfacedObject, ICommand)
    private
      FParent : IRecebimentoMensalidade;
      FLancamento : Integer;
    public
      constructor Create(aParent : IRecebimentoMensalidade; aLancamento : Integer);
      destructor Destroy;override;
      class function New(aParent : IRecebimentoMensalidade; aLancamento : Integer):ICommand;
      function Execute:ICommand;
  end;

implementation

{ TRecebimentoMensalidadeBaixarMensalidade }

constructor TRecebimentoMensalidadeBaixarMensalidade.Create(aParent : IRecebimentoMensalidade; aLancamento : Integer);
begin
  FParent := aParent;
  FLancamento := aLancamento;
end;

destructor TRecebimentoMensalidadeBaixarMensalidade.Destroy;
begin

  inherited;
end;

function TRecebimentoMensalidadeBaixarMensalidade.Execute: ICommand;
begin
  Result := Self;
  FParent.BaixarMensalidade(FLancamento);
end;

class function TRecebimentoMensalidadeBaixarMensalidade.New(aParent : IRecebimentoMensalidade; aLancamento : Integer): ICommand;
begin
  Result := Self.Create(aParent, aLancamento);
end;

end.

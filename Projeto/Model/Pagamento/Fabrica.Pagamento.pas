unit Fabrica.Pagamento;

interface

uses
  Interfaces.Pagamento;

type
  TFabricaPagamento = class(TInterfacedObject, IFactoryMethod)
    function ConsultarPagamento(const Pagamento: string): ITipoPagamento;
  end;

implementation

uses
  Tipo.Pagamento;

function TFabricaPagamento.ConsultarPagamento(const Pagamento: string): ITipoPagamento;
begin
  if Pagamento = 'Mensal ( Normal )' then
    result := TPrazoMensalNormal.Create
  else if Pagamento = 'Mensal ( Parceladão )' then
    result := TPrazoMensalParceladao.Create
end;

end.

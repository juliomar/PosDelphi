unit Interfaces.Pagamento;

interface

type
  ITipoPagamento = interface
    function ConsultarDescricao: string;
    function ConsultarJuros: string;
  end;

  IFactoryMethod = interface
    function ConsultarPagamento(const Prazo: string): ITipoPagamento;
  end;
implementation

end.

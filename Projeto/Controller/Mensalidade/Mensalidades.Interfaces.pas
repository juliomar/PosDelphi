unit Mensalidades.Interfaces;

interface

type
  ICommand = interface
    ['{17E5B817-499E-4247-AB6B-D715F0E403EC}']
    function Execute:ICommand;
  end;

  IInvoker = interface
    ['{5B41E723-DB41-4282-A6AD-8C2B2B9BA575}']
    function Add(Value : ICommand):IInvoker;
    function Execute : IInvoker;
  end;

  IRecebimentoMensalidade = interface
    ['{FB42417C-E637-4AE5-A8A2-D1453DD06116}']
    function ReceberValor: IRecebimentoMensalidade;
    function BaixarMensalidade(aLancamento: Integer): IRecebimentoMensalidade;
    function GerarRecibo:IRecebimentoMensalidade;
  end;

  IRecebimentoMensalidadeView = interface
    ['{585BB3CE-217F-4E84-93C6-36CE89CC734C}']
    function QuitarMensalidade(aLancamento : Integer) : IRecebimentoMensalidadeView;
  end;



implementation

end.

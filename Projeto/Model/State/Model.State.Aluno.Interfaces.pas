unit Model.State.Aluno.Interfaces;

interface

type
  iState<t> = interface;
  iItemOperacaoes = interface;

  iItem = interface
    ['{2FA38521-9128-49F7-87F6-8736BA74D958}']
    function State : iState<iItemOperacaoes>;
    function Operacoes : iItemOperacaoes;
  end;

  iItemOperacaoes = interface
    function Vender : iItemOperacaoes;
    function Cancelar : iItemOperacaoes;
    function Desconto : iItemOperacaoes;
    function Devolver : iItemOperacaoes;
  end;

  iState<t> = interface
    function SetState(Value : t) : t;
  end;



implementation

end.

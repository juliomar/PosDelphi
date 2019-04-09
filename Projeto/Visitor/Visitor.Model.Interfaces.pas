unit Visitor.Model.Interfaces;

interface

type
  ivisitor = interface;
  iVisitable = interface;

  iItem = interface
    ['{15E3D2AE-88BF-4139-B59F-D6E1BDF866BE}']
    function SetPrecoUnitario(Value: Currency): iItem;
    function PrecoUnitario: Currency;
    function Regras: iVisitable;
  end;

  iItemRegras = interface
    ['{BBF4BC7D-6C50-401C-91F0-C4A62AEB77B0}']
    function PrecoDeVenda: Currency;
    function PrecoPromocao: Currency;
    function Visitor: ivisitor;
  end;

  ivisitor = interface
    ['{1410100D-47BE-4C6F-A63E-D320B6AABD11}']
    function Visit(Value: iItem): iItemRegras;
  end;

  iVisitable = interface
    ['{6AB87DC7-715A-4980-8625-C3DDAC86150C}']
    function Accept(Value: ivisitor): iItemRegras;
  end;

implementation

end.

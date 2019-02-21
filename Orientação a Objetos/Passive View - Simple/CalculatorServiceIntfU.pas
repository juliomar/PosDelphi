unit CalculatorServiceIntfU;

interface

type
  ICalculatorService = interface
    ['{AFBF5C89-AFCA-4A5E-85A2-C4EAEF70D50E}']
    function DoSum(const a,b: int32): int32;
    function DoDiff(const a,b: int32): int32;
    function DoMul(const a,b: int32): int32;
    function DoDiv(const a,b: Extended): Extended;
  end;

implementation

end.

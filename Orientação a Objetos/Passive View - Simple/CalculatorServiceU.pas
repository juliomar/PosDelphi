unit CalculatorServiceU;

interface

uses
  Classes, CalculatorServiceIntfU;

type
  TCalculatorService = class(TInterfacedObject, ICalculatorService)
  protected
    function DoSum(const a,b: int32): int32;
    function DoDiff(const a,b: int32): int32;
    function DoMul(const a,b: int32): int32;
    function DoDiv(const a,b: Extended): Extended;
  end;

implementation

uses
  SysUtils;

{ TCalculatorService }

function TCalculatorService.DoDiff(const a, b: int32): int32;
begin
  Result := a-b;
end;

function TCalculatorService.DoDiv(const a, b: Extended): Extended;
begin
  if b=0 then
    raise EZeroDivide.Create('Div by 0');
  Result := a / b;
end;

function TCalculatorService.DoMul(const a, b: int32): int32;
begin
  Result := a*b;
end;

function TCalculatorService.DoSum(const a, b: int32): int32;
begin
  Result := a+b;
end;

end.

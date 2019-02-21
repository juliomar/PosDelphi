unit CalculatorServiceMockU;

interface

uses
  PascalMock, CalculatorServiceIntfU;

type
  TCalculatorServiceMock = class(TMock, ICalculatorService)
    function DoSum(const a,b: int32): int32;pascal;
    function DoDiff(const a,b: int32): int32;pascal;
    function DoMul(const a,b: int32): int32;pascal;
    function DoDiv(const a,b: Extended): Extended;pascal;
    procedure ResetMockData; override;
  end;

implementation

{ TCalculatorServiceMock }

function TCalculatorServiceMock.DoDiff(const a, b: int32): int32;
begin
  Result := self.AddCall('DoDiff').WithParams([a,b]).ReturnValue;
end;

function TCalculatorServiceMock.DoDiv(const a, b: Extended): Extended;
begin
  Result := self.AddCall('DoDiv').WithParams([a,b]).ReturnValue;
end;

function TCalculatorServiceMock.DoMul(const a, b: int32): int32;
begin
  Result := self.AddCall('DoMul').WithParams([a,b]).ReturnValue;
end;

function TCalculatorServiceMock.DoSum(const a, b: int32): int32;
begin
  Result := AddCall('DoSum').WithParams([a,b]).ReturnValue;
end;

procedure TCalculatorServiceMock.ResetMockData;
begin
  inherited;

end;

end.

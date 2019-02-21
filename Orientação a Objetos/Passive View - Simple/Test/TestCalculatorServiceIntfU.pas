unit TestCalculatorServiceIntfU;

interface

uses
  TestFramework, CalculatorServiceIntfU;

type
  TestICalculatorService = class(TTestCase)
  strict private
    FICalculatorService: ICalculatorService;
  public
    procedure SetUp; override;
    procedure TearDown; override;
    procedure TestDivByZero;
  published
    procedure TestDoSum;
    procedure TestDoDiff;
    procedure TestDoMul;
    procedure TestDoDiv;
  end;

implementation

uses
  CalculatorServiceU, SysUtils;

procedure TestICalculatorService.SetUp;
begin
  FICalculatorService := TCalculatorService.Create;
end;

procedure TestICalculatorService.TearDown;
begin
  FICalculatorService := nil;
end;

procedure TestICalculatorService.TestDoSum;
begin
  CheckEquals(10, FICalculatorService.DoSum(0, 10));
  CheckEquals(10, FICalculatorService.DoSum(10, 0));
  CheckEquals(-10, FICalculatorService.DoSum(-10, 0));
  CheckEquals(10, FICalculatorService.DoSum(-10, +20));
  CheckEquals(-30, FICalculatorService.DoSum(-10, -20));
  CheckEquals(-2, FICalculatorService.DoSum(-1, -1));
end;

procedure TestICalculatorService.TestDivByZero;
begin
  CheckEquals(0, FICalculatorService.DoDiv(10, 0));
end;

procedure TestICalculatorService.TestDoDiff;
begin
  CheckEquals(-10, FICalculatorService.DoDiff(0, 10));
  CheckEquals(10, FICalculatorService.DoDiff(10, 0));
  CheckEquals(-10, FICalculatorService.DoDiff(-10, 0));
  CheckEquals(-30, FICalculatorService.DoDiff(-10, +20));
  CheckEquals(10, FICalculatorService.DoDiff(-10, -20));
  CheckEquals(0, FICalculatorService.DoDiff(-1, -1));
end;

procedure TestICalculatorService.TestDoMul;
begin
  CheckEquals(0, FICalculatorService.DoMul(0, 10));
  CheckEquals(0, FICalculatorService.DoMul(10, 0));
  CheckEquals(0, FICalculatorService.DoMul(-10, 0));
  CheckEquals(-200, FICalculatorService.DoMul(-10, +20));
  CheckEquals(200, FICalculatorService.DoMul(-10, -20));
  CheckEquals(1, FICalculatorService.DoMul(-1, -1));
end;

procedure TestICalculatorService.TestDoDiv;
begin
  CheckEquals(0, FICalculatorService.DoDiv(0, 10));
  CheckEquals(-0.5, FICalculatorService.DoDiv(-10, +20));
  CheckEquals(0.5, FICalculatorService.DoDiv(-10, -20));
  CheckEquals(1, FICalculatorService.DoDiv(-1, -1));
  CheckException(TestDivByZero, EZeroDivide);
end;

initialization
  RegisterTest(TestICalculatorService.Suite);
end.



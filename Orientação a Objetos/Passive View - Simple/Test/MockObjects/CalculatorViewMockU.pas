unit CalculatorViewMockU;

interface

uses
  PascalMock, CalculatorViewIntfU, Generics.Collections, StdCtrls, GUIControlsIntf, EditIntf, SelectableListIntf,
  CommonTypes;

type
  TCalculatorViewMock = class(TMock, ICalculatorView)
  private
    FFirstOperand: IGUIEdit;
    FSecondOperand: IGUIEdit;
    FGetOperator: IGUISelectableList;
    FCalcResult: IGUIEdit;
    FError: IGUIEdit;
    function CalcResult: IGUIEdit;
  public
    constructor Create;
    procedure ResetMockData; override;
  published
    function FirstOperand: String;
    function SecondOperand: String;
    procedure SetFirstOperand(Value: string);
    procedure SetSecondOperand(Value: string);
    function GetOperator: IGUISelectableList;
    procedure SetCalcResult(const Value: String);
    procedure SetCalcResultReadOnly(const Value: Boolean);
    function Error: IGUIEdit;
  end;

implementation


{ TCalculatorViewMock }

function TCalculatorViewMock.CalcResult: IGUIEdit;
begin
  Result := AddCall('CalcResult').ReturnValueAsInterface as IGUIEdit;
end;

constructor TCalculatorViewMock.Create;
begin
  inherited;
end;

function TCalculatorViewMock.Error: IGUIEdit;
begin
  Result := AddCall('Error').ReturnValueAsInterface as IGUIEdit;
end;

function TCalculatorViewMock.FirstOperand: String;
begin
  Result := AddCall('FirstOperand').ReturnValue;
end;

function TCalculatorViewMock.GetOperator: IGUISelectableList;
begin
  Result := AddCall('GetOperator').ReturnValueAsInterface as IGUISelectableList;
end;

procedure TCalculatorViewMock.ResetMockData;
begin
  inherited;

end;

function TCalculatorViewMock.SecondOperand: String;
begin
  Result := AddCall('SecondOperand').ReturnValue;
end;

procedure TCalculatorViewMock.SetCalcResult(const Value: String);
begin
  AddCall('SetCalcResult').WithParams([Value]);
end;

procedure TCalculatorViewMock.SetCalcResultReadOnly(const Value: Boolean);
begin
  AddCall('SetCalcResultReadOnly');
end;

procedure TCalculatorViewMock.SetFirstOperand(Value: string);
begin
  AddCall('SetFirstOperand');
end;

procedure TCalculatorViewMock.SetSecondOperand(Value: string);
begin
  AddCall('SetSecondOperand');
end;

end.

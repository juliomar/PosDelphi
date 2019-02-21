unit CalculatorViewIntfU;

interface

uses
  Classes, GUIControlsIntf;

type
  ICalculatorView = interface
    ['{471E3657-C6CE-49A3-BCB4-8FA6AF611DAD}']
    function FirstOperand: IGUIEdit;
    function SecondOperand: IGUIEdit;
    function GetOperator: IGUISelectableList;
    function CalcResult: IGUIEdit;
    function Error: IGUIEdit;
  end;

implementation

end.

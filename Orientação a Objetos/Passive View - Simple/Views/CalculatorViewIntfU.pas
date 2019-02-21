{*******************************************************}
{                                                       }
{           Copyright (c) 2009 Daniele Teti             }
{           www.danieleteti.it                          }
{           d.teti@bittime.it                           }
{                                                       }
{*******************************************************}


unit CalculatorViewIntfU;

interface

uses
  Classes, GUIControlsIntf;

type
  ICalculatorView = interface
    ['{471E3657-C6CE-49A3-BCB4-8FA6AF611DAD}']
    function FirstOperand: String;
    function SecondOperand: String;
    procedure SetFirstOperand(Value :String);
    procedure SetSecondOperand(Value :String);
    function GetOperator: IGUISelectableList;
    procedure SetCalcResult(const Value: String);
    procedure SetCalcResultReadOnly(const Value: Boolean);
    function Error: IGUIEdit;
  end;

implementation

end.

program PassiveViewSimpleTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  TestCalculatorServiceIntfU in 'TestCalculatorServiceIntfU.pas',
  CalculatorServiceIntfU in '..\Services\CalculatorServiceIntfU.pas',
  CalculatorServiceU in '..\Services\CalculatorServiceU.pas',
  TestCalculatorPresenterIntfU in 'TestCalculatorPresenterIntfU.pas',
  CalculatorPresenterIntfU in '..\Presenters\CalculatorPresenterIntfU.pas',
  CalculatorViewIntfU in '..\Views\CalculatorViewIntfU.pas',
  CalculatorServiceMockU in 'MockObjects\CalculatorServiceMockU.pas',
  CalculatorViewMockU in 'MockObjects\CalculatorViewMockU.pas',
  CalculatorPresenterU in '..\Presenters\CalculatorPresenterU.pas',
  EditIntf in '..\ControlsViews\EditIntf.pas',
  GUIControlsIntf in '..\ControlsViews\GUIControlsIntf.pas',
  SelectableListIntf in '..\ControlsViews\SelectableListIntf.pas',
  SelectableListIntfMockU in 'MockObjects\SelectableListIntfMockU.pas',
  CommonTypes in '..\CommonTypes.pas',
  EditIntfMockU in 'MockObjects\EditIntfMockU.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
end.


program PascalMockTestPrj;
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
{$ifdef FASTMM}
  FastMM4,
{$endif}
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  PascalMockExampleTest in 'PascalMockExampleTest.pas',
  PascalMockTests in 'PascalMockTests.pas',
  PascalMock in '..\PascalMock.pas',
  VariantsUtil in '..\VariantsUtil.pas',
  NoRefCountObject in '..\NoRefCountObject.pas',
  PascalMockDUnit in '..\PascalMockDUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
end.


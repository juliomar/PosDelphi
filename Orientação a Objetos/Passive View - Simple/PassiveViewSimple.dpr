program PassiveViewSimple;

uses
  Forms,
  CalculatorViewU in 'Views\CalculatorViewU.pas' {frmCalculatorView},
  CalculatorPresenterU in 'Presenters\CalculatorPresenterU.pas',
  CalculatorServiceU in 'Services\CalculatorServiceU.pas',
  CalculatorServiceIntfU in 'Services\CalculatorServiceIntfU.pas',
  CalculatorPresenterIntfU in 'Presenters\CalculatorPresenterIntfU.pas',
  CalculatorViewIntfU in 'Views\CalculatorViewIntfU.pas',
  EditIntf in 'ControlsViews\EditIntf.pas',
  SelectableListIntf in 'ControlsViews\SelectableListIntf.pas',
  GUIControlsIntf in 'ControlsViews\GUIControlsIntf.pas',
  CommonTypes in 'CommonTypes.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalculatorView, frmCalculatorView);
  Application.Run;
end.

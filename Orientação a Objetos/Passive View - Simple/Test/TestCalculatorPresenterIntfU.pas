unit TestCalculatorPresenterIntfU;

interface

uses
  EditIntfMockU, SelectableListIntfMockU, TestFramework, CalculatorServiceIntfU, CalculatorPresenterU, CalculatorPresenterIntfU,
  CalculatorServiceMockU, CalculatorViewMockU, PascalMock, PascalMockDUnit;

type
  TestICalculatorPresenter = class(TMockObjectTestCase)
  private
    FCalculatorPresenter: ICalculatorPresenter;
    FMockCalculatorService: TCalculatorServiceMock;
    FMockCalculatorView: TCalculatorViewMock;
    FMockOperator: TGUISelectableListMock;
    FMockError: TGuiEditMock;
    //Run all verify methods on Mock Objects
    procedure RunVerify;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure testDoSimpleSum;
    procedure testDoSimpleDiff;
    procedure testDoSimpleMul;
    procedure testDoSimpleDiv;
    procedure testDoDivWithDivByZeroException;
  end;

implementation

uses
  SysUtils, CalculatorViewIntfU, GUIControlsIntf, SelectableListIntf,
  Generics.Collections, CommonTypes;

{ TestICalculatorPresenter }

procedure TestICalculatorPresenter.RunVerify;
begin
  FMockOperator.Verify('Operand');
  FMockError.Verify('Error Edit');
  FMockCalculatorView.Verify('CalculatorView');
  FMockCalculatorService.Verify('CalculatorService');

  //Reset Mocks
  FMockCalculatorView.ResetMockData;
  FMockCalculatorService.ResetMockData;
  FMockOperator.ResetMockData;
  FMockError.ResetMockData;
end;

procedure TestICalculatorPresenter.SetUp;
begin
  FMockOperator := TGUISelectableListMock.Create;
  FMockOperator.Expects('Clear');
  FMockOperator.Expects('AddPair', 4);
  FMockOperator.Expects('SetValue');

  FMockError := TGuiEditMock.Create;
  FMockError.Expects('SetReadOnly').WithParams([true]);
  FMockError.Expects('SetVisible').WithParams([false]);

  FMockCalculatorService := TCalculatorServiceMock.Create;

  FMockCalculatorView := TCalculatorViewMock.Create;
  FMockCalculatorView.Expects('SetFirstOperand');
  FMockCalculatorView.Expects('SetSecondOperand');
  FMockCalculatorView.Expects('GetOperator').Returns(FMockOperator as IGUISelectableList);
  FMockCalculatorView.Expects('SetCalcResultReadOnly');
  FMockCalculatorView.Expects('Error').Returns(FMockError as IGUIEdit);

  FCalculatorPresenter := TCalculatorPresenter.Create(FMockCalculatorView as ICalculatorView, FMockCalculatorService as ICalculatorService);

  RunVerify;
end;

procedure TestICalculatorPresenter.TearDown;
begin
  FMockOperator.Free;
  FMockError.Free;
end;

procedure TestICalculatorPresenter.testDoDivWithDivByZeroException;
begin
  //Setting up View Mocks
  FMockOperator.Expects('GetSelected').Returns(TSSKeyValue.CreateNew('/','div'));
  FMockError.Expects('SetVisible').WithParams([true]);
  FMockError.Expects('SetText').WithParams([Ignored]);
  FMockCalculatorView.Expects('GetOperator').Returns(FMockOperator as IGUISelectableList);
  FMockCalculatorView.Expects('FirstOperand').Returns('10');
  FMockCalculatorView.Expects('SecondOperand').Returns('0');
  FMockCalculatorView.Expects('Error').Returns(FMockError as IGUIEdit);

  //Setting up Service Mock
  FMockCalculatorService.Expects('DoDiv').Raises(EDivByZero);

  //Exec Presenter Method to test
  FCalculatorPresenter.DoCalc;

  //Verify Mocks
  RunVerify;
end;

procedure TestICalculatorPresenter.testDoSimpleDiff;
begin
  //Setting up View Mocks
  FMockOperator.Expects('GetSelected').Returns(TSSKeyValue.CreateNew('-','diff'));

  FMockError.Expects('SetVisible').WithParams([false]);
  FMockCalculatorView.Expects('GetOperator').Returns(FMockOperator as IGUISelectableList);
  FMockCalculatorView.Expects('FirstOperand').Returns('1');
  FMockCalculatorView.Expects('SecondOperand').Returns('2');
  FMockCalculatorView.Expects('SetCalcResult');
  FMockCalculatorView.Expects('Error').Returns(FMockError as IGUIEdit);

  //Setting up Service Mock
  FMockCalculatorService.Expects('DoDiff').WithParams([1,2]).Returns(-1);

  //Exec Presenter Method to test
  FCalculatorPresenter.DoCalc;

  //Verify Mocks
  RunVerify;
end;

procedure TestICalculatorPresenter.testDoSimpleDiv;
begin
  //Setting up View Mocks
  FMockOperator.Expects('GetSelected').Returns(TSSKeyValue.CreateNew('/','div'));
  FMockError.Expects('SetVisible').WithParams([false]);


  FMockCalculatorView.Expects('GetOperator').Returns(FMockOperator as IGUISelectableList);
  FMockCalculatorView.Expects('FirstOperand').Returns('10');
  FMockCalculatorView.Expects('SecondOperand').Returns('3');
  FMockCalculatorView.Expects('SetCalcResult');
  FMockCalculatorView.Expects('Error').Returns(FMockError as IGUIEdit);

  //Setting up Service Mock
  FMockCalculatorService.Expects('DoDiv').WithParams([10,3]).Returns(3.33);

  //Exec Presenter Method to test
  FCalculatorPresenter.DoCalc;

  //Verify Mocks
  RunVerify;
end;

procedure TestICalculatorPresenter.testDoSimpleMul;
begin
  //Setting up View Mocks
  FMockOperator.Expects('GetSelected').Returns(TSSKeyValue.CreateNew('*','mul'));
  FMockCalculatorView.Expects('GetOperator').Returns(FMockOperator as IGUISelectableList);
  FMockCalculatorView.Expects('FirstOperand').Returns('10');
  FMockCalculatorView.Expects('SecondOperand').Returns('2');
  FMockCalculatorView.Expects('SetCalcResult');
  FMockCalculatorView.Expects('Error').Returns(FMockError as IGUIEdit);
  FMockError.Expects('SetVisible').WithParams([false]);

  //Setting up Service Mock
  FMockCalculatorService.Expects('DoMul').WithParams([10,2]).Returns(20);

  //Exec Presenter Method to test
  FCalculatorPresenter.DoCalc;

  //Verify Mocks
  RunVerify;
end;

procedure TestICalculatorPresenter.testDoSimpleSum;
begin
  //Setting up View Mocks
  FMockCalculatorView.Expects('GetOperator').Returns(FMockOperator as IGUISelectableList);
  FMockCalculatorView.Expects('FirstOperand').Returns('1');
  FMockCalculatorView.Expects('SecondOperand').Returns('2');
  FMockCalculatorView.Expects('SetCalcResult');
  FMockCalculatorView.Expects('Error').Returns(FMockError as IGUIEdit);

  FMockOperator.Expects('GetSelected').Returns(TSSKeyValue.CreateNew('+','add'));
  FMockError.Expects('SetVisible').WithParams([false]);

  //Setting up Service Mock
  FMockCalculatorService.Expects('DoSum').WithParams([1,2]).Returns(3);

  //Exec Presenter Method to test
  FCalculatorPresenter.DoCalc;

  //Verify Mocks
  RunVerify;
end;


initialization
  RegisterTest(TestICalculatorPresenter.Suite);


end.

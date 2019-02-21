unit CalculatorPresenterU;

interface

uses
  CalculatorPresenterIntfU, CalculatorViewIntfU, CalculatorServiceIntfU;

type
  TCalculatorPresenter = class(TInterfacedObject, ICalculatorPresenter)
  private
    FCalculatorView: ICalculatorView;
    FCalculatorService: ICalculatorService;
  protected
    procedure DoCalc;
    procedure InitView;
  public
    constructor Create(CalculatorView: ICalculatorView);
  end;

implementation

uses CalculatorServiceU, SysUtils, Classes;

{ TCalculatorPresenter }

constructor TCalculatorPresenter.Create(CalculatorView: ICalculatorView);
begin
  inherited Create;
  FCalculatorService := TCalculatorService.Create;
  FCalculatorView := CalculatorView;
  InitView;
end;

procedure TCalculatorPresenter.DoCalc;
var
  R: string;
begin
  try
    case FCalculatorView.GetOperator.GetValue[1] of
      '+': FCalculatorView.CalcResult.SetTextAsinteger(FCalculatorService.DoSum(FCalculatorView.FirstOperand.GetAsInteger, FCalculatorView.SecondOperand.GetAsInteger));
      '-': FCalculatorView.CalcResult.SetTextAsInteger(FCalculatorService.DoDiff(FCalculatorView.FirstOperand.GetAsInteger, FCalculatorView.SecondOperand.GetAsInteger));
      '*': FCalculatorView.CalcResult.SetTextAsInteger(FCalculatorService.DoMul(FCalculatorView.FirstOperand.GetAsInteger, FCalculatorView.SecondOperand.GetAsInteger));
      '/': FCalculatorView.CalcResult.SetTextAsFloat(FCalculatorService.DoDiv(FCalculatorView.FirstOperand.GetAsInteger, FCalculatorView.SecondOperand.GetAsInteger));
      else
        raise Exception.Create('Not valid operator');
    end;
    FCalculatorView.Error.SetVisible(false);
  except
    on E:Exception do
    begin
      FCalculatorView.Error.SetVisible(true).SetText(E.Message);
    end;
  end;
end;

procedure TCalculatorPresenter.InitView;
begin
  //Initialize view using internal DSL on GUI Interfaces
  FCalculatorView.GetOperator.AddPair('+','Add').AddPair('-','Sub').AddPair('*','Mul').AddPair('/','Div').SetValue('+');
  FCalculatorView.FirstOperand.SetTextAsinteger(0);
  FCalculatorView.SecondOperand.SetTextAsinteger(0);
  FCalculatorView.CalcResult.SetReadOnly(true);
  FCalculatorView.Error.SetReadOnly(true).SetVisible(false);
end;

end.

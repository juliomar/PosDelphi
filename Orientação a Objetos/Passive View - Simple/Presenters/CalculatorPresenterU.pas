{*******************************************************}
{                                                       }
{           Copyright (c) 2009 Daniele Teti             }
{           www.danieleteti.it                          }
{           d.teti@bittime.it                           }
{                                                       }
{*******************************************************}


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
    constructor Create(CalculatorView: ICalculatorView); overload;
    constructor Create(CalculatorView: ICalculatorView; CalculatorService: ICalculatorService); overload;
  end;

implementation

uses CalculatorServiceU, SysUtils, Classes, GUIControlsIntf;

{ TCalculatorPresenter }

constructor TCalculatorPresenter.Create(CalculatorView: ICalculatorView);
begin
  inherited Create;
  FCalculatorService := TCalculatorService.Create;
  FCalculatorView := CalculatorView;
  InitView;
end;

constructor TCalculatorPresenter.Create(CalculatorView: ICalculatorView;
  CalculatorService: ICalculatorService);
begin
  inherited Create;
  FCalculatorService := CalculatorService;
  FCalculatorView := CalculatorView;
  InitView;
end;

procedure TCalculatorPresenter.DoCalc;
var
  i: integer;
  x: Extended;
  ExErr: IGUIEdit;
  Res: Extended;
begin
  try
    case FCalculatorView.GetOperator.GetSelected.GetKey[1] of
      '+': FCalculatorView.SetCalcResult(IntToStr(
              FCalculatorService.DoSum(
                StrToInt(FCalculatorView.FirstOperand),
                StrToInt(FCalculatorView.SecondOperand))));

      '-': FCalculatorView.SetCalcResult(IntToStr(
            FCalculatorService.DoDiff(
              StrToInt(FCalculatorView.FirstOperand),
              StrToInt(FCalculatorView.SecondOperand))));

      '*': FCalculatorView.SetCalcResult(IntToStr(
            FCalculatorService.DoMul(
              StrToInt(FCalculatorView.FirstOperand),
              StrToInt(FCalculatorView.SecondOperand))));

      '/':
      begin
        FCalculatorView.SetCalcResult(FloatToStrF(
          FCalculatorService.DoDiv(
            StrToInt(FCalculatorView.FirstOperand),
            StrToInt(FCalculatorView.SecondOperand))
          , ffFixed, 10,2));
      end
      else
        raise Exception.Create('Not valid operator');
    end;
    FCalculatorView.Error.SetVisible(false);
  except
    on E: Exception do
    begin
      ExErr := FCalculatorView.Error;
      ExErr.SetVisible(true);
      ExErr.SetText('Error: ' + E.Message);
    end;
  end;
end;

procedure TCalculatorPresenter.InitView;
var
  Op: IGUISelectableList;
  Er: IGUIEdit;
begin
  //Initialize view
  FCalculatorView.SetFirstOperand('0');
  FCalculatorView.SetSecondOperand('0');


  Op := FCalculatorView.GetOperator;
  Op.Clear;
  Op.AddPair('+','Add');
  Op.AddPair('-','Sub');
  Op.AddPair('*','Mul');
  Op.AddPair('/','Div');
  Op.SetValue('+');


  FCalculatorView.SetCalcResultReadOnly(true);

  Er := FCalculatorView.Error;
  Er.SetReadOnly(true);
  Er.SetVisible(false);
end;

end.

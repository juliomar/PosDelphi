unit CalculatorViewU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CalculatorPresenterIntfU, CalculatorViewIntfU, GUIControlsIntf;

type
  TfrmCalculatorView = class(TForm, ICalculatorView)
    EditFirstOp: TEdit;
    EditSecondOp: TEdit;
    ComboOperators: TComboBox;
    Button1: TButton;
    Label2: TLabel;
    EditResult: TEdit;
    EditError: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  protected
    IFirstOperand, ISecondOperand, ICalcResult, IError: IGUIEdit;
    IOperators: IGUISelectableList;
    FPresenter: ICalculatorPresenter;
    function FirstOperand: IGUIEdit;
    function SecondOperand: IGUIEdit;
    function GetOperator: IGUISelectableList;
    function Error: IGUIEdit;
    function CalcResult: IGUIEdit;
  end;

var
  frmCalculatorView: TfrmCalculatorView;

implementation

uses CalculatorPresenterU, EditIntf, SelectableListIntf;

{$R *.dfm}

{ TForm3 }

procedure TfrmCalculatorView.Button1Click(Sender: TObject);
begin
  FPresenter.DoCalc;
end;

function TfrmCalculatorView.CalcResult: IGUIEdit;
begin
  Result := ICalcResult;
end;

function TfrmCalculatorView.Error: IGUIEdit;
begin
  Result := IError;
end;

function TfrmCalculatorView.FirstOperand: IGUIEdit;
begin
  Result := IFirstOperand;
end;

procedure TfrmCalculatorView.FormCreate(Sender: TObject);
begin
  //Link controls with related interface
  IFirstOperand := TGUIEdit.Create(EditFirstOp);
  ISecondOperand := TGUIEdit.Create(EditSecondOp);
  ICalcResult := TGUIEdit.Create(EditResult);
  IOperators := TGUISelectableList.Create(ComboOperators);
  IError := TGUIEdit.Create(EditError);

  //link view and presenter
  FPresenter := TCalculatorPresenter.Create(Self);
end;

function TfrmCalculatorView.GetOperator: IGUISelectableList;
begin
  Result := IOperators;
end;

function TfrmCalculatorView.SecondOperand: IGUIEdit;
begin
  Result := ISecondOperand;
end;

end.



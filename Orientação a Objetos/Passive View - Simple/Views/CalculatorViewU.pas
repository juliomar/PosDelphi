{*******************************************************}
{                                                       }
{           Copyright (c) 2009 Daniele Teti             }
{           www.danieleteti.it                          }
{           d.teti@bittime.it                           }
{                                                       }
{*******************************************************}

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
    IError: IGUIEdit;
    IOperators: IGUISelectableList;
    FPresenter: ICalculatorPresenter;
    function FirstOperand: string;
    function SecondOperand: string;
    procedure SetFirstOperand(Value: string);
    procedure SetSecondOperand(Value: string);
    function GetOperator: IGUISelectableList;
    function Error: IGUIEdit;
    procedure SetCalcResult(const Value: String);
    procedure SetCalcResultReadOnly(const Value: Boolean);
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

function TfrmCalculatorView.Error: IGUIEdit;
begin
  Result := IError;
end;

function TfrmCalculatorView.FirstOperand: string;
begin
  Result := EditFirstOp.Text;
end;

procedure TfrmCalculatorView.FormCreate(Sender: TObject);
begin
  //Link controls with related interface
  IOperators := TGUISelectableList.Create(ComboOperators);
  IError := TGUIEdit.Create(EditError);

  //link view and presenter
  //In this version VIEW know PRESENTER
  FPresenter := TCalculatorPresenter.Create(Self);
end;

function TfrmCalculatorView.GetOperator: IGUISelectableList;
begin
  Result := IOperators;
end;

function TfrmCalculatorView.SecondOperand: string;
begin
  Result := EditSecondOp.Text;
end;

procedure TfrmCalculatorView.SetCalcResult(const Value: String);
begin
  EditResult.Text := Value;
end;

procedure TfrmCalculatorView.SetCalcResultReadOnly(const Value: Boolean);
begin
  EditResult.ReadOnly := Value;
end;

procedure TfrmCalculatorView.SetFirstOperand(Value: string);
begin
  EditFirstOp.Text := Value;
end;

procedure TfrmCalculatorView.SetSecondOperand(Value: string);
begin
  EditSecondOp.Text := Value;
end;

end.



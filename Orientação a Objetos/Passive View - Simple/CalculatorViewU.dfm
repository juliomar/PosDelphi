object frmCalculatorView: TfrmCalculatorView
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Passive View - Sample 01'
  ClientHeight = 95
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 247
    Top = 19
    Width = 8
    Height = 13
    Caption = '='
  end
  object EditFirstOp: TEdit
    Left = 16
    Top = 16
    Width = 65
    Height = 21
    TabOrder = 0
  end
  object EditSecondOp: TEdit
    Left = 176
    Top = 16
    Width = 65
    Height = 21
    TabOrder = 1
  end
  object ComboOperators: TComboBox
    Left = 96
    Top = 16
    Width = 65
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
  object Button1: TButton
    Left = 16
    Top = 56
    Width = 65
    Height = 25
    Caption = 'Do Calc'
    TabOrder = 3
    OnClick = Button1Click
  end
  object EditResult: TEdit
    Left = 261
    Top = 16
    Width = 65
    Height = 21
    TabOrder = 4
  end
  object EditError: TEdit
    Left = 96
    Top = 58
    Width = 230
    Height = 19
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
  end
end

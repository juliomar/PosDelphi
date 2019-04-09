object fTela: TfTela
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consultar de CEP'
  ClientHeight = 175
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbCEP: TLabel
    Left = 56
    Top = 24
    Width = 23
    Height = 13
    Caption = 'CEP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbCidade: TLabel
    Left = 40
    Top = 142
    Width = 41
    Height = 13
    Caption = 'Cidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbBairro: TLabel
    Left = 44
    Top = 116
    Width = 37
    Height = 13
    Caption = 'Bairro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbLogradouro: TLabel
    Left = 13
    Top = 89
    Width = 68
    Height = 13
    Caption = 'Logradouro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EditCidade: TEdit
    Left = 86
    Top = 137
    Width = 249
    Height = 21
    Color = 13828095
    ReadOnly = True
    TabOrder = 5
  end
  object EditBairro: TEdit
    Left = 86
    Top = 112
    Width = 249
    Height = 21
    Color = 13828095
    ReadOnly = True
    TabOrder = 4
  end
  object btnViaCEP: TBitBtn
    Left = 86
    Top = 47
    Width = 119
    Height = 25
    Caption = 'Consultar (Servidor I)'
    TabOrder = 1
    OnClick = btnViaCEPClick
  end
  object btnCorreios: TBitBtn
    Left = 216
    Top = 47
    Width = 119
    Height = 25
    Caption = 'Consultar (Servidor II)'
    TabOrder = 2
    OnClick = btnCorreiosClick
  end
  object EditCEP: TMaskEdit
    Left = 86
    Top = 20
    Width = 73
    Height = 21
    EditMask = '99999-999;0;_'
    MaxLength = 9
    TabOrder = 0
    Text = ''
  end
  object EditLogradouro: TEdit
    Left = 86
    Top = 86
    Width = 249
    Height = 21
    Color = 13828095
    ReadOnly = True
    TabOrder = 3
  end
end

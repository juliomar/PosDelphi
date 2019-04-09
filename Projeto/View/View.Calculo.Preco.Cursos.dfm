object FrmPrecoDeCursos: TFrmPrecoDeCursos
  Left = 0
  Top = 0
  Caption = 'Valor dos Cursos'
  ClientHeight = 261
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 29
    Width = 73
    Height = 13
    Caption = 'Tipo De Venda:'
  end
  object Label2: TLabel
    Left = 312
    Top = 29
    Width = 102
    Height = 13
    Caption = 'Valor Total Do Curso:'
  end
  object Edit1: TEdit
    Left = 312
    Top = 48
    Width = 193
    Height = 21
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 48
    Width = 257
    Height = 21
    ItemIndex = 0
    TabOrder = 1
    Text = 'Venda Simples'
    Items.Strings = (
      'Venda Simples'
      'Venda Com Bolsa')
  end
  object BtnValorSimples: TButton
    Left = 40
    Top = 104
    Width = 241
    Height = 25
    Caption = 'Valor Simples'
    TabOrder = 2
    OnClick = BtnValorSimplesClick
  end
  object BtnValorDesconto: TButton
    Left = 40
    Top = 152
    Width = 241
    Height = 25
    Caption = 'Valor Desconto'
    TabOrder = 3
    OnClick = BtnValorDescontoClick
  end
end

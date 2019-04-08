object Pagamento: TPagamento
  Left = 0
  Top = 0
  Caption = 'Pagamento'
  ClientHeight = 356
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 87
    Height = 13
    Caption = 'Forma pagamento'
  end
  object cmbPagamento: TComboBox
    Left = 8
    Top = 27
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'cmbPagamento'
    OnChange = cmbPagamentoChange
    Items.Strings = (
      'Mensal ( Normal )'
      'Mensal ( Parcelad'#227'o )')
  end
  object Memo1: TMemo
    Left = 200
    Top = 0
    Width = 347
    Height = 356
    Align = alRight
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end

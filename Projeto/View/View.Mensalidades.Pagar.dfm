object FMensalidadePagar: TFMensalidadePagar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pagar Mensalidade'
  ClientHeight = 62
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 120
    Height = 13
    Caption = 'Selecione um lan'#231'amento'
  end
  object cbLancamentos: TComboBox
    Left = 8
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
  end
  object btnPagar: TBitBtn
    Left = 159
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Pagar'
    TabOrder = 1
    OnClick = btnPagarClick
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 8
  end
end

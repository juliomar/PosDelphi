object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de Comunicados'
  ClientHeight = 299
  ClientWidth = 687
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
  object ListBox1: TListBox
    Left = 8
    Top = 143
    Width = 590
    Height = 129
    ItemHeight = 13
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 590
    Height = 129
    TabOrder = 1
    Visible = False
    object lblDescricao: TLabel
      Left = 16
      Top = 16
      Width = 122
      Height = 13
      Caption = 'Descri'#231#227'o do Comunicado'
    end
    object lblAssinarPor: TLabel
      Left = 16
      Top = 72
      Width = 127
      Height = 13
      Caption = 'Comunicado Assinado Por:'
    end
    object txtDescricao: TEdit
      Left = 15
      Top = 35
      Width = 562
      Height = 21
      TabOrder = 0
    end
    object txtAssinadoPor: TEdit
      Left = 16
      Top = 91
      Width = 561
      Height = 21
      TabOrder = 1
    end
  end
  object btnNovo: TButton
    Left = 604
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 2
    OnClick = btnNovoClick
  end
  object btnCopiar: TButton
    Left = 604
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Copiar'
    TabOrder = 3
    OnClick = btnCopiarClick
  end
end

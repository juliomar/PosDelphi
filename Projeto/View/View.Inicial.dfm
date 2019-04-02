object frmTelaDeInicio: TfrmTelaDeInicio
  Left = 0
  Top = 0
  Caption = 'Tela Inicial'
  ClientHeight = 473
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 442
    TabOrder = 0
    object BtnTelaPrincipal: TButton
      Left = 168
      Top = 240
      Width = 121
      Height = 81
      Caption = 'Alunos'
      TabOrder = 0
      OnClick = BtnTelaPrincipalClick
    end
    object BtnCursos: TButton
      Left = 440
      Top = 240
      Width = 121
      Height = 81
      Caption = 'Cursos'
      TabOrder = 1
      OnClick = BtnCursosClick
    end
  end
  object StatusBarTelaInicial: TStatusBar
    Left = 0
    Top = 448
    Width = 768
    Height = 25
    Panels = <
      item
        Width = 50
      end>
  end
  object TimerTelaInicial: TTimer
    OnTimer = TimerTelaInicialTimer
    Left = 448
    Top = 448
  end
end

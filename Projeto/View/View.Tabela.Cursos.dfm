object FrmCurso: TFrmCurso
  Left = 0
  Top = 0
  Caption = 'Tabela Curso'
  ClientHeight = 369
  ClientWidth = 800
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
    Width = 163
    Height = 29
    Caption = 'Tabela  cursos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGridProfessor: TDBGrid
    Left = 8
    Top = 64
    Width = 777
    Height = 273
    GradientEndColor = clGray
    GradientStartColor = clSilver
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 336
    Width = 800
    Height = 33
    Panels = <
      item
        Width = 50
      end>
  end
  object DataSourceCursos: TDataSource
    DataSet = ClientDataSet1
    Left = 64
    Top = 176
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 184
  end
  object Timer1: TTimer
    Left = 456
    Top = 344
  end
end

object frmCurso: TfrmCurso
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
  object STGridCurso: TStringGrid
    Left = 8
    Top = 64
    Width = 777
    Height = 273
    TabOrder = 2
    ColWidths = (
      64
      64
      64
      64
      64)
  end
  object DBGridCurso: TDBGrid
    Left = 8
    Top = 64
    Width = 777
    Height = 273
    DataSource = DataSourceCursos
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
    DataSet = ClientDataSetCurso
    Left = 64
    Top = 176
  end
  object Timer1: TTimer
    Left = 456
    Top = 344
  end
  object ClientDataSetCurso: TClientDataSet
    PersistDataPacket.Data = {
      870000009619E0BD010000001800000004000000000003000000870002696404
      000100000000001244657363726963616F20446F20437572736F010049000000
      0100055749445448020002003C00094E6F746120456E61640800040000000000
      144172656120446F20436F6E686563696D656E746F0100490000000100055749
      445448020002003C000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 256
    object ClientDataSetCursoid: TIntegerField
      FieldName = 'id'
    end
    object ClientDataSetCursoDescricaoDoCurso: TStringField
      FieldName = 'Descricao Do Curso'
      Size = 60
    end
    object ClientDataSetCursoNotaEnad: TFloatField
      FieldName = 'Nota Enad'
    end
    object ClientDataSetCursoAreaDoConhecimento: TStringField
      FieldName = 'Area Do Conhecimento'
      Size = 60
    end
  end
end

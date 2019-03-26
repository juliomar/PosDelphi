object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 504
  ClientWidth = 906
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
  object STGridPessoa: TStringGrid
    Left = 0
    Top = 422
    Width = 906
    Height = 82
    Align = alBottom
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
    Visible = False
  end
  object DBGridClientes: TDBGrid
    Left = 0
    Top = 104
    Width = 906
    Height = 284
    Align = alBottom
    DataSource = DataSourceClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sobrenome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Matricula'
        Visible = True
      end>
  end
  object pnConsulta: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 900
    Height = 95
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 96
      Height = 13
      Caption = 'Campos p/ pesquisa'
    end
    object Label2: TLabel
      Left = 159
      Top = 14
      Width = 73
      Height = 13
      Caption = 'Texto Pesquisa'
    end
    object Label3: TLabel
      Left = 375
      Top = 14
      Width = 96
      Height = 13
      Caption = 'Op'#231#245'es de pesquisa'
    end
    object cbCampo: TComboBox
      Left = 8
      Top = 32
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object editTextoPesquisa: TEdit
      Left = 159
      Top = 32
      Width = 210
      Height = 21
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 375
      Top = 32
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object btnPesquisar: TButton
      Left = 526
      Top = 30
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 3
    end
    object edtNome: TLabeledEdit
      Left = 8
      Top = 74
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      Color = clSkyBlue
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'NOME'
      TabOrder = 4
    end
    object edtSobrenome: TLabeledEdit
      Left = 135
      Top = 74
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      Color = clSkyBlue
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'SOBRENOME'
      TabOrder = 5
    end
    object EdtMatricula: TLabeledEdit
      Left = 262
      Top = 74
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      Color = clSkyBlue
      EditLabel.Width = 58
      EditLabel.Height = 13
      EditLabel.Caption = 'MATR'#205'CULA'
      TabOrder = 6
    end
    object Button1: TButton
      Left = 389
      Top = 74
      Width = 217
      Height = 21
      Caption = 'SALVAR ESTADO (Pattern Memento)  ---->'
      TabOrder = 7
      OnClick = Button1Click
    end
    object ListBox1: TListBox
      Left = 612
      Top = 0
      Width = 281
      Height = 95
      Color = clSkyBlue
      ItemHeight = 13
      TabOrder = 8
      OnClick = ListBox1Click
    end
  end
  object pnAcoes: TPanel
    Left = 0
    Top = 388
    Width = 906
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object BitBtnExportarAlunosXLS: TBitBtn
      Left = 77
      Top = 4
      Width = 120
      Height = 25
      Caption = 'Exportar para XLS'
      TabOrder = 0
      OnClick = BitBtnExportarAlunosXLSClick
    end
    object BitBtnExportarAlunosHTML: TBitBtn
      Left = 197
      Top = 3
      Width = 120
      Height = 25
      Caption = 'Exportar para HTML'
      TabOrder = 1
      OnClick = BitBtnExportarAlunosHTMLClick
    end
    object btnEditar: TButton
      Left = 2
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
    end
  end
  object ClientDataSetClientes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Sobrenome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Matricula'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    IndexFieldNames = 'Id'
    Params = <>
    StoreDefs = True
    Left = 92
    Top = 166
    object ClientDataSetClientesId: TIntegerField
      FieldName = 'Id'
    end
    object ClientDataSetClientesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ClientDataSetClientesSobrenome: TStringField
      FieldName = 'Sobrenome'
      Size = 50
    end
    object ClientDataSetClientesMatricula: TStringField
      FieldName = 'Matricula'
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = ClientDataSetClientes
    Left = 204
    Top = 166
  end
end

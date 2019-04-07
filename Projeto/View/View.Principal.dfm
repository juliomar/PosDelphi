object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 484
  ClientWidth = 906
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
  object STGridPessoa: TStringGrid
    Left = 0
    Top = 402
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
    Top = 79
    Width = 906
    Height = 289
    Align = alClient
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
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Matricula'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 120
        Visible = True
      end>
  end
  object pnConsulta: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 900
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 96
      Height = 13
      Caption = 'Campos p/ pesquisa'
    end
    object Label2: TLabel
      Left = 159
      Top = 21
      Width = 73
      Height = 13
      Caption = 'Texto Pesquisa'
    end
    object Label3: TLabel
      Left = 375
      Top = 21
      Width = 96
      Height = 13
      Caption = 'Op'#231#245'es de pesquisa'
    end
    object cbCampo: TComboBox
      Left = 8
      Top = 39
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object editTextoPesquisa: TEdit
      Left = 159
      Top = 39
      Width = 210
      Height = 21
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 375
      Top = 39
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object btnPesquisar: TButton
      Left = 526
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 3
    end
  end
  object pnAcoes: TPanel
    Left = 0
    Top = 368
    Width = 906
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 362
    object BitBtnExportarAlunosXLS: TBitBtn
      Left = 80
      Top = 4
      Width = 120
      Height = 25
      Caption = 'Exportar para XLS'
      TabOrder = 0
      OnClick = BitBtnExportarAlunosXLSClick
    end
    object BitBtnExportarAlunosHTML: TBitBtn
      Left = 203
      Top = 4
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
    object btn_State: TButton
      Left = 327
      Top = 4
      Width = 170
      Height = 25
      Caption = 'Padr'#227'o de Projeto - State '
      TabOrder = 3
      OnClick = btn_StateClick
    end
  end
  object ClientDataSetClientes: TClientDataSet
    PersistDataPacket.Data = {
      950000009619E0BD010000001800000005000000000003000000950002496404
      00010000000000044E6F6D650100490000000100055749445448020002003200
      09536F6272656E6F6D650100490000000100055749445448020002003200094D
      6174726963756C61010049000000010005574944544802000200140006537461
      74757301004900000001000557494454480200020001000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftInteger
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
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 1
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
    object ClientDataSetClientesStatus: TStringField
      FieldName = 'Status'
      OnGetText = ClientDataSetClientesStatusGetText
      Size = 1
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = ClientDataSetClientes
    Left = 204
    Top = 166
  end
end

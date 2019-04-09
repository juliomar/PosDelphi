object FMensalidades: TFMensalidades
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Minhas Mensalidades'
  ClientHeight = 310
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnLancamento: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnLancamento'
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      729
      105)
    object BitBtn1: TBitBtn
      Left = 606
      Top = 38
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Carregar Sel.'
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object edtCodigo: TLabeledEdit
      Left = 16
      Top = 27
      Width = 121
      Height = 21
      EditLabel.Width = 106
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'digo do lan'#231'amento'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 606
      Top = 65
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Gravar'
      TabOrder = 6
      OnClick = BitBtn2Click
    end
    object edtLancamento: TLabeledEdit
      Left = 143
      Top = 27
      Width = 121
      Height = 21
      EditLabel.Width = 76
      EditLabel.Height = 13
      EditLabel.Caption = 'Dt. Lan'#231'amento'
      TabOrder = 1
    end
    object edtAluno: TLabeledEdit
      Left = 270
      Top = 27
      Width = 146
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Aluno'
      TabOrder = 2
    end
    object edtPago: TCheckBox
      Left = 433
      Top = 29
      Width = 97
      Height = 17
      Caption = 'Pago'
      TabOrder = 3
    end
    object BitBtn3: TBitBtn
      Left = 606
      Top = 11
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Novo'
      TabOrder = 4
      OnClick = BitBtn3Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 105
    Width = 729
    Height = 205
    Align = alClient
    DataSource = dsMensalidades
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dsMensalidades: TDataSource
    DataSet = FDMensalidade
    Left = 312
    Top = 152
  end
  object FDMensalidade: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 352
    Top = 152
  end
end

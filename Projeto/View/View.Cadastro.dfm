object ViewCadastro: TViewCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'ViewCadastro'
  ClientHeight = 477
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 119
    Top = 123
    Width = 32
    Height = 13
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 303
    Top = 123
    Width = 65
    Height = 13
    Caption = 'Sobrenome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 487
    Top = 123
    Width = 66
    Height = 13
    Caption = 'Nascimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 15
    Top = 123
    Width = 69
    Height = 13
    Caption = 'N'#186' Matr'#237'cula'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 15
    Top = 77
    Width = 78
    Height = 13
    Caption = 'Tipo Cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 575
    Top = 123
    Width = 28
    Height = 13
    Caption = 'Sexo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 15
    Top = 169
    Width = 30
    Height = 13
    Caption = 'Email'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl8: TLabel
    Left = 303
    Top = 169
    Width = 49
    Height = 13
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Pnl1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 59
    Align = alTop
    TabOrder = 8
    object btnNovo: TButton
      Left = 15
      Top = 9
      Width = 81
      Height = 38
      Caption = 'Novo'
      TabOrder = 1
      OnClick = btnNovoClick
    end
    object btn1: TButton
      Left = 102
      Top = 9
      Width = 81
      Height = 38
      Caption = 'Salvar'
      TabOrder = 0
    end
    object btnFechar: TButton
      Left = 638
      Top = 9
      Width = 81
      Height = 38
      Cancel = True
      Caption = 'Fechar'
      TabOrder = 2
      TabStop = False
      OnClick = btnFecharClick
    end
  end
  object grp1: TGroupBox
    Left = 0
    Top = 224
    Width = 729
    Height = 253
    Align = alBottom
    Caption = ' Cursos '
    TabOrder = 9
    object lbl9: TLabel
      Left = 15
      Top = 27
      Width = 55
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl10: TLabel
      Left = 287
      Top = 27
      Width = 111
      Height = 13
      Caption = #193'rea Conhecimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 471
      Top = 27
      Width = 63
      Height = 13
      Caption = 'Nota Enade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edt1: TEdit
      Left = 15
      Top = 46
      Width = 266
      Height = 21
      TabOrder = 0
    end
    object Edt2: TEdit
      Left = 287
      Top = 46
      Width = 177
      Height = 21
      TabOrder = 1
    end
    object Edt3: TEdit
      Left = 471
      Top = 46
      Width = 106
      Height = 21
      TabOrder = 2
    end
    object btnAdd: TButton
      Left = 595
      Top = 42
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 3
    end
    object STGridCursos: TStringGrid
      Left = 2
      Top = 75
      Width = 725
      Height = 176
      Align = alBottom
      ColCount = 1
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 4
      ColWidths = (
        64)
      RowHeights = (
        24)
    end
  end
  object EdtNome: TEdit
    Left = 119
    Top = 142
    Width = 177
    Height = 21
    TabOrder = 2
  end
  object EdtSobreNome: TEdit
    Left = 303
    Top = 142
    Width = 177
    Height = 21
    TabOrder = 3
  end
  object EdtDataNascimento: TMaskEdit
    Left = 487
    Top = 142
    Width = 82
    Height = 21
    EditMask = '99/99/9999'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object EdtMatricula: TEdit
    Left = 15
    Top = 142
    Width = 98
    Height = 21
    TabOrder = 1
  end
  object CmbTipoCadastro: TComboBox
    Left = 15
    Top = 96
    Width = 154
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 0
    OnChange = CmbTipoCadastroChange
  end
  object CmbSexo: TComboBox
    Left = 575
    Top = 142
    Width = 106
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 5
  end
  object EdtEmail: TEdit
    Left = 15
    Top = 188
    Width = 282
    Height = 21
    TabOrder = 6
  end
  object EdtTelefone: TEdit
    Left = 303
    Top = 188
    Width = 138
    Height = 21
    TabOrder = 7
  end
end

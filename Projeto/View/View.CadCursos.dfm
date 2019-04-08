object FrmCadCursos: TFrmCadCursos
  Left = 0
  Top = 0
  Caption = 'Cadastro do Cursos'
  ClientHeight = 274
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TLabel
    Left = 25
    Top = 34
    Width = 3
    Height = 13
  end
  object Label1: TLabel
    Left = 25
    Top = 21
    Width = 79
    Height = 13
    Caption = 'C'#243'digo do Curso'
  end
  object Label2: TLabel
    Left = 27
    Top = 69
    Width = 73
    Height = 13
    Caption = 'Nome do Curso'
  end
  object Label3: TLabel
    Left = 25
    Top = 116
    Width = 69
    Height = 13
    Caption = 'Data do In'#237'cio '
  end
  object Label4: TLabel
    Left = 152
    Top = 116
    Width = 79
    Height = 13
    Caption = 'Data do T'#233'rmino'
  end
  object Label5: TLabel
    Left = 279
    Top = 116
    Width = 67
    Height = 13
    Caption = 'Regime Letivo'
  end
  object Label6: TLabel
    Left = 27
    Top = 166
    Width = 87
    Height = 13
    Caption = 'Situa'#231#227'o do Curso'
  end
  object Label7: TLabel
    Left = 152
    Top = 168
    Width = 30
    Height = 13
    Caption = 'Turma'
  end
  object Label8: TLabel
    Left = 279
    Top = 168
    Width = 146
    Height = 13
    Caption = 'Forma Participa'#231#227'o dos Alunos'
  end
  object Label9: TLabel
    Left = 27
    Top = 208
    Width = 56
    Height = 13
    Caption = 'Curso Ativo'
  end
  object Label10: TLabel
    Left = 152
    Top = 208
    Width = 70
    Height = 13
    Caption = 'Valor do Curso'
  end
  object Edit1: TEdit
    Left = 25
    Top = 40
    Width = 79
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 27
    Top = 88
    Width = 402
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 25
    Top = 135
    Width = 112
    Height = 21
    Date = 43561.000000000000000000
    Time = 0.767391307868820100
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker
    Left = 152
    Top = 135
    Width = 113
    Height = 21
    Date = 43561.000000000000000000
    Time = 0.767652233793342000
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 279
    Top = 137
    Width = 145
    Height = 21
    TabOrder = 4
    Text = 'ComboBox1'
  end
  object ComboBox2: TComboBox
    Left = 27
    Top = 185
    Width = 110
    Height = 21
    TabOrder = 5
    Text = 'ComboBox2'
  end
  object ComboBox3: TComboBox
    Left = 152
    Top = 185
    Width = 112
    Height = 21
    TabOrder = 6
    Text = 'ComboBox3'
  end
  object ComboBox4: TComboBox
    Left = 279
    Top = 185
    Width = 145
    Height = 21
    TabOrder = 7
    Text = 'ComboBox4'
  end
  object Edit3: TEdit
    Left = 27
    Top = 225
    Width = 89
    Height = 21
    TabOrder = 8
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 152
    Top = 225
    Width = 131
    Height = 21
    TabOrder = 9
    Text = 'Edit4'
  end
  object Button1: TButton
    Left = 449
    Top = 21
    Width = 100
    Height = 25
    Caption = 'Incluir'
    TabOrder = 10
  end
  object Button2: TButton
    Left = 452
    Top = 98
    Width = 100
    Height = 25
    Caption = 'Alterar'
    TabOrder = 11
  end
  object Button3: TButton
    Left = 452
    Top = 139
    Width = 100
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 12
  end
  object Button4: TButton
    Left = 453
    Top = 183
    Width = 99
    Height = 25
    Caption = 'Excluir'
    TabOrder = 13
  end
  object Button5: TButton
    Left = 453
    Top = 221
    Width = 99
    Height = 25
    Caption = 'Sair'
    TabOrder = 14
  end
  object DBNavigator1: TDBNavigator
    Left = 451
    Top = 59
    Width = 100
    Height = 25
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    TabOrder = 15
  end
end

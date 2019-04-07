object frm_ModelState: Tfrm_ModelState
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Status do Aluno'
  ClientHeight = 143
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_status: TLabel
    Left = 16
    Top = 80
    Width = 74
    Height = 33
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btn_ativo: TButton
    Left = 8
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Ativo'
    TabOrder = 0
    OnClick = btn_ativoClick
  end
  object btn_inativo: TButton
    Left = 92
    Top = 26
    Width = 75
    Height = 25
    Caption = 'Inativo'
    TabOrder = 1
    OnClick = btn_inativoClick
  end
  object btn_matriculado: TButton
    Left = 173
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Matriculado'
    TabOrder = 2
    OnClick = btn_matriculadoClick
  end
  object btn_cancelar: TButton
    Left = 254
    Top = 25
    Width = 123
    Height = 25
    Caption = 'Cancelar Matr'#237'cula'
    TabOrder = 3
    OnClick = btn_cancelarClick
  end
  object btn_sair: TButton
    Left = 302
    Top = 91
    Width = 75
    Height = 25
    Caption = 'Sair'
    ModalResult = 1
    TabOrder = 4
  end
end

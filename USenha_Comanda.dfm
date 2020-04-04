object frmSenha_Comanda: TfrmSenha_Comanda
  Left = 384
  Top = 264
  Width = 661
  Height = 172
  Caption = 'frmSenha_Comanda'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 34
    Top = 16
    Width = 54
    Height = 16
    Alignment = taRightJustify
    Caption = 'Usu'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 304
    Top = 16
    Width = 178
    Height = 13
    Caption = 'Informe o usu'#225'rio e pressione ENTER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edtUsuario: TEdit
    Left = 90
    Top = 8
    Width = 199
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyDown = edtUsuarioKeyDown
  end
  object pnlSenha: TPanel
    Left = 0
    Top = 43
    Width = 645
    Height = 90
    Color = clSilver
    TabOrder = 1
    Visible = False
    object Label3: TLabel
      Left = 41
      Top = 16
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Caption = 'Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 214
      Top = 13
      Width = 122
      Height = 16
      Alignment = taRightJustify
      Caption = 'Confirma a Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object edtSenha: TEdit
      Left = 90
      Top = 8
      Width = 111
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
    end
    object edtConfirmaSenha: TEdit
      Left = 338
      Top = 5
      Width = 111
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
    object btnConfirmar: TNxButton
      Left = 96
      Top = 48
      Width = 87
      Height = 24
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TNxButton
      Left = 184
      Top = 48
      Width = 87
      Height = 24
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
end

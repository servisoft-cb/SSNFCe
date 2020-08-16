object FormPrincipal: TFormPrincipal
  Left = 372
  Top = 126
  Width = 460
  Height = 87
  Caption = 'Gaveta'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbEmpresa: TRxLabel
    Left = 5
    Top = 4
    Width = 434
    Height = 40
    Alignment = taCenter
    AutoSize = False
    Caption = 'Abrindo Gaveta... aguarde!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Impact'
    Font.Style = []
    ParentFont = False
    ShadowColor = 15195349
    ShadowPos = spRightBottom
    Transparent = True
  end
  object ACBrPosPrinter: TACBrPosPrinter
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    ControlePorta = True
    Left = 78
    Top = 13
  end
end

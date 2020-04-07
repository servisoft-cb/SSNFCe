object frmTelaTipoDescontoItem: TfrmTelaTipoDescontoItem
  Left = 489
  Top = 262
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Tipo de desconto'
  ClientHeight = 175
  ClientWidth = 310
  Color = 14731440
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = vvlr_
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 310
    Height = 175
    Align = alClient
    Color = clActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.0.1.0'
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    FullHeight = 0
    object EditDesconto: TCurrencyEdit
      Left = 81
      Top = 110
      Width = 147
      Height = 33
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyDown = EditDescontoKeyDown
    end
    object rdgDescontoUnitario: TcxRadioGroup
      Left = 1
      Top = 1
      OnFocusChanged = rdgDescontoUnitarioFocusChanged
      Align = alTop
      Alignment = alTopCenter
      Caption = 'Desconto Unit'#225'rio'
      ParentColor = False
      ParentFont = False
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = 'R$'
        end
        item
          Caption = '%'
        end
        item
          Caption = 'Pagar'
        end>
      ItemIndex = 0
      Style.BorderColor = clWindowFrame
      Style.Color = clBlue
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -20
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Blue'
      Style.Shadow = False
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.BorderStyle = ebsOffice11
      StyleDisabled.Color = clBlue
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleDisabled.TextStyle = [fsBold]
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Blue'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Blue'
      TabOrder = 1
      Height = 83
      Width = 308
    end
  end
end

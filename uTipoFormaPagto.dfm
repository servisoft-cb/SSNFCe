object frmTelaTipoFormaPagto: TfrmTelaTipoFormaPagto
  Left = 410
  Top = 261
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Forma Pagto'
  ClientHeight = 170
  ClientWidth = 434
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 170
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
    object rdgTipoFormaPagto: TcxRadioGroup
      Left = 1
      Top = 1
      Align = alTop
      Alignment = alTopCenter
      Caption = 'Forma Pagamento'
      ParentColor = False
      ParentFont = False
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = 'Vista'
          Value = 'V'
        end
        item
          Caption = 'Prazo'
          Value = 'P'
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
      TabOrder = 0
      Height = 96
      Width = 432
    end
  end
end

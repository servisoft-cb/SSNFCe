object fCartao: TfCartao
  Left = 385
  Top = 234
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'fCartao'
  ClientHeight = 87
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 87
    Align = alClient
    TabOrder = 0
    object pnlCartao: TPanel
      Left = 1
      Top = 1
      Width = 650
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 20
        Width = 233
        Height = 36
        Caption = 'Mesa ou Cart'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 271
        Top = 23
        Width = 217
        Height = 33
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = CurrencyEdit1KeyDown
      end
      object pnlFechar: TPanel
        Left = 623
        Top = 0
        Width = 27
        Height = 65
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 27
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Panel2Click
        end
      end
    end
  end
end

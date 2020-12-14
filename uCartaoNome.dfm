object fCartaoNome: TfCartaoNome
  Left = 385
  Top = 234
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'fCartao Nome'
  ClientHeight = 74
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 74
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
      object Label2: TLabel
        Left = 57
        Top = 13
        Width = 200
        Height = 36
        Caption = 'Nome Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object pnlFechar: TPanel
        Left = 623
        Top = 0
        Width = 27
        Height = 65
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
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
      object edtNome: TEdit
        Left = 272
        Top = 15
        Width = 329
        Height = 28
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
end

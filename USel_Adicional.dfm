object frmSel_Adicional: TfrmSel_Adicional
  Left = 327
  Top = 103
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmSel_Adicional'
  ClientHeight = 531
  ClientWidth = 932
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TAdvPanel
    Left = 0
    Top = 0
    Width = 932
    Height = 490
    Align = alClient
    BevelWidth = 10
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
    object ProgressBar1: TProgressBar
      Left = 10
      Top = 463
      Width = 912
      Height = 17
      Align = alBottom
      TabOrder = 0
      Visible = False
    end
    object AdvSmoothPanel1: TAdvSmoothPanel
      Left = 10
      Top = 10
      Width = 912
      Height = 453
      Cursor = crDefault
      Caption.Location = plTopCenter
      Caption.HTMLFont.Charset = DEFAULT_CHARSET
      Caption.HTMLFont.Color = clWindowText
      Caption.HTMLFont.Height = -11
      Caption.HTMLFont.Name = 'Tahoma'
      Caption.HTMLFont.Style = []
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -21
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.ColorStart = 11563548
      Caption.ColorEnd = 10446362
      Caption.Line = False
      Caption.TextRendering = tClearType
      Fill.Color = 16445929
      Fill.ColorTo = 15587527
      Fill.ColorMirror = 15587527
      Fill.ColorMirrorTo = 16773863
      Fill.GradientMirrorType = gtVertical
      Fill.BorderColor = 14922381
      Fill.BorderWidth = 3
      Fill.Rounding = 10
      Fill.ShadowColor = clBlack
      Fill.ShadowOffset = 10
      Fill.GlowGradientColor = clAqua
      Version = '1.0.9.0'
      Align = alClient
      TabOrder = 1
      object NxPanel2: TNxPanel
        Left = 0
        Top = 0
        Width = 435
        Height = 429
        BackgroundStyle = pbTransparent
        BorderPen.Width = 0
        Caption = 'NxPanel2'
        UseDockManager = False
        ParentBackground = False
        TabOrder = 0
        object NxPanel1: TNxPanel
          Left = 0
          Top = 0
          Width = 435
          Height = 41
          AdaptiveColors = False
          Align = alTop
          BackgroundStyle = pbVertGradient
          BorderPen.Color = clBlue
          BorderPen.Width = 0
          Caption = 'Adicionais'
          Color = 10921638
          ColorScheme = csBlue2010
          UseDockManager = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2565927
          Font.Height = -27
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsItalic]
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object smdbgridAdicional: TSMDBGrid
          Left = 0
          Top = 41
          Width = 435
          Height = 388
          Align = alClient
          Ctl3D = False
          DataSource = dmCupomFiscal.dsProduto_Adicional
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -20
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = smdbgridAdicionalKeyDown
          Flat = True
          Bands.Strings = (
            '')
          BandsFont.Charset = DEFAULT_CHARSET
          BandsFont.Color = clWindowText
          BandsFont.Height = -11
          BandsFont.Name = 'MS Sans Serif'
          BandsFont.Style = []
          Groupings = <>
          GridStyle.Style = gsCustom
          GridStyle.OddColor = clWindow
          GridStyle.EvenColor = clWindow
          TitleHeight.PixelCount = 24
          FooterColor = clBtnFace
          ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 28
          DefaultRowHeight = 32
          ScrollBars = ssHorizontal
          ColCount = 3
          RowCount = 1
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME_MATERIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Title.Caption = 'Nome'
              Width = 248
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_VENDA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              Width = 109
              Visible = True
            end>
        end
      end
      object NxPanel3: TNxPanel
        Left = 432
        Top = 0
        Width = 18
        Height = 433
        AdaptiveColors = False
        BackgroundStyle = pbVertGradient
        Color = 8454016
        UseDockManager = False
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
      end
      object NxPanel4: TNxPanel
        Left = 455
        Top = 1
        Width = 435
        Height = 429
        BackgroundStyle = pbTransparent
        BorderPen.Width = 0
        Caption = 'NxPanel2'
        UseDockManager = False
        ParentBackground = False
        TabOrder = 2
        object NxPanel5: TNxPanel
          Left = 0
          Top = 0
          Width = 435
          Height = 41
          AdaptiveColors = False
          Align = alTop
          BackgroundStyle = pbHorzGradient
          BorderPen.Color = clBlue
          BorderPen.Width = 0
          Color = 4227200
          ColorScheme = csBlue2010
          UseDockManager = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsItalic]
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object smdbgridConsumo: TSMDBGrid
          Left = 0
          Top = 41
          Width = 435
          Height = 388
          Align = alClient
          Ctl3D = False
          DataSource = dmCupomFiscal.dsProduto_Consumo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -20
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = smdbgridConsumoKeyDown
          Flat = True
          Bands.Strings = (
            'TESTE')
          BandsFont.Charset = DEFAULT_CHARSET
          BandsFont.Color = clWindowText
          BandsFont.Height = -11
          BandsFont.Name = 'MS Sans Serif'
          BandsFont.Style = []
          Groupings = <>
          GridStyle.Style = gsCustom
          GridStyle.OddColor = clWindow
          GridStyle.EvenColor = clWindow
          TitleHeight.PixelCount = 24
          FooterColor = clBtnFace
          ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 28
          DefaultRowHeight = 32
          ScrollBars = ssHorizontal
          ColCount = 3
          RowCount = 1
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME_MATERIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Title.Caption = 'Nome'
              Width = 280
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_VENDA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              Width = 90
              Visible = True
            end>
        end
      end
    end
  end
  object pnlConfirmar: TNxPanel
    Left = 0
    Top = 490
    Width = 932
    Height = 41
    Cursor = crHandPoint
    AdaptiveColors = False
    Align = alBottom
    BackgroundStyle = pbHorzGradient
    BorderPen.Color = clBlue
    BorderPen.Width = 0
    Caption = 'Confirmar (F10)'
    Color = clLime
    ColorScheme = csBlue2010
    UseDockManager = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsItalic]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    OnClick = pnlConfirmarClick
  end
end

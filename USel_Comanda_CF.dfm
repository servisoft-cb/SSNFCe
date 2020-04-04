object frmSel_Comanda_CF: TfrmSel_Comanda_CF
  Left = 347
  Top = 74
  Width = 864
  Height = 621
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'frmSel_Comanda_CF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 848
    Height = 30
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label4: TLabel
      Left = 20
      Top = 13
      Width = 48
      Height = 14
      Alignment = taRightJustify
      Caption = 'Cart'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 232
      Top = 8
      Width = 174
      Height = 13
      Caption = 'Informe o cart'#227'o e pressione ENTER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ceNumCartao: TCurrencyEdit
      Left = 73
      Top = 5
      Width = 152
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = ceNumCartaoKeyDown
    end
  end
  object gridItens: TSMDBGrid
    Left = 0
    Top = 304
    Width = 848
    Height = 278
    TabStop = False
    Align = alClient
    DataSource = dmCupomFiscal.dsComandaItem_Rel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = False
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 20
    ScrollBars = ssHorizontal
    ColCount = 6
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PRODUTO'
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO_NOME'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 393
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_UNITARIO'
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL'
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 277
    Width = 848
    Height = 27
    Align = alTop
    Color = clSilver
    TabOrder = 1
    object Label7: TLabel
      Left = 21
      Top = 2
      Width = 225
      Height = 24
      Alignment = taCenter
      Caption = 'PRODUTOS .................'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 30
    Width = 848
    Height = 247
    Align = alTop
    Color = 16744448
    TabOrder = 3
    object gbxVendedor: TRzGroupBox
      Left = 408
      Top = 1
      Width = 439
      Height = 245
      Align = alRight
      BorderColor = clNavy
      BorderInner = fsButtonUp
      BorderOuter = fsBump
      Caption = ' Comandas Selecionados '
      Ctl3D = True
      FlatColor = clNavy
      FlatColorAdjustment = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      VisualStyle = vsGradient
      object RxLabel1: TRxLabel
        Left = 200
        Top = 0
        Width = 150
        Height = 18
        Caption = ' Vlr. Selecionado: 0 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object SMDBGrid2: TSMDBGrid
        Left = 5
        Top = 21
        Width = 429
        Height = 195
        TabStop = False
        Align = alClient
        Ctl3D = False
        DataSource = dmCupomFiscal.dsmCupom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = SMDBGrid2DblClick
        Flat = True
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 19
        ScrollBars = ssHorizontal
        ColCount = 2
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CARTAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 16384
            Font.Height = -15
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Cart'#227'o'
            Title.Color = 8454016
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_TOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 16384
            Font.Height = -15
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Title.Color = 8454016
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 113
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 5
        Top = 216
        Width = 429
        Height = 24
        Align = alBottom
        BevelOuter = bvNone
        Color = 16777088
        TabOrder = 1
        object btnExcluir: TNxButton
          Left = 333
          Top = 1
          Width = 120
          Height = 22
          Cursor = crHandPoint
          Hint = 'Exclui cart'#227'o selecionado'
          Caption = 'E&xcluir'
          Color = 16777088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          GlyphSpacing = 5
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Transparent = True
          OnClick = btnExcluirClick
        end
        object NxButton1: TNxButton
          Left = 212
          Top = 1
          Width = 120
          Height = 22
          Cursor = crHandPoint
          Caption = '&Confirmar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 0
          Transparent = True
          OnClick = NxButton1Click
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 377
      Height = 245
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object gridComanda: TSMDBGrid
        Left = 27
        Top = 0
        Width = 350
        Height = 245
        TabStop = False
        Align = alClient
        Ctl3D = False
        DataSource = dmCupomFiscal.dsComandaRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = gridComandaDblClick
        Flat = True
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
        WidthOfIndicator = 27
        DefaultRowHeight = 19
        ScrollBars = ssHorizontal
        ColCount = 4
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_CARTAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Color = 11796479
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 83
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTEMISSAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Color = 11796479
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_TOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Color = 11796479
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 106
            Visible = True
          end>
      end
      object btnInserir: TRzBitBtn
        Left = 0
        Top = 0
        Width = 27
        Height = 245
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'S E L E C I O N A R'
        Color = 16759929
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnInserirClick
      end
    end
  end
end

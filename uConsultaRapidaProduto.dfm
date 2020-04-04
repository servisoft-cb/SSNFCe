object frmConsultaRapidaProduto: TfrmConsultaRapidaProduto
  Left = 51
  Top = 71
  Width = 1366
  Height = 632
  Caption = 'Consulta Rapida de Produto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object scrollPrincipal: TScrollBox
    Left = 150
    Top = 0
    Width = 1050
    Height = 593
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 0
    object lblProduto: TRxLabel
      Left = 0
      Top = 0
      Width = 1050
      Height = 45
      Align = alTop
      Alignment = taCenter
      Caption = 'Consulta Produtos'
      Color = clAppWorkSpace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -37
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShadowColor = clBtnText
      ShadowPos = spRightBottom
    end
    object pnlCabecalho: TAdvPanel
      Left = 0
      Top = 45
      Width = 1050
      Height = 71
      Align = alTop
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
      object RxLabel1: TRxLabel
        Left = 56
        Top = 19
        Width = 142
        Height = 23
        Caption = 'Descri'#231#227'o (F3)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsItalic]
        ParentFont = False
        ShadowColor = clBackground
        ShadowPos = spRightBottom
      end
      object RxLabel2: TRxLabel
        Left = 309
        Top = 19
        Width = 149
        Height = 23
        Caption = 'Refer'#234'ncia (F4)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsItalic]
        ParentFont = False
        ShadowColor = clBackground
        ShadowPos = spRightBottom
      end
      object RxLabel4: TRxLabel
        Left = 816
        Top = 19
        Width = 109
        Height = 23
        Caption = 'Grupo (F6)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsItalic]
        ParentFont = False
        ShadowColor = clBackground
        ShadowPos = spRightBottom
      end
      object RxLabel3: TRxLabel
        Left = 563
        Top = 19
        Width = 174
        Height = 23
        Caption = 'C'#243'digo Barra (F5)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsItalic]
        ParentFont = False
        ShadowColor = clBackground
        ShadowPos = spRightBottom
      end
      object edtDescricao: TEdit
        Left = 56
        Top = 43
        Width = 241
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = edtDescricaoKeyDown
      end
      object edtReferencia: TEdit
        Left = 309
        Top = 43
        Width = 241
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyDown = edtReferenciaKeyDown
      end
      object edtCodigoBarra: TEdit
        Left = 563
        Top = 43
        Width = 241
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyDown = edtCodigoBarraKeyDown
      end
      object comboGrupo: TRxDBLookupCombo
        Left = 816
        Top = 43
        Width = 201
        Height = 27
        DropDownCount = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = dmCupomFiscal.dsGrupo
        ParentFont = False
        TabOrder = 3
        OnKeyDown = comboGrupoKeyDown
      end
    end
    object pnlPrincipal: TAdvPanel
      Left = 0
      Top = 133
      Width = 1050
      Height = 386
      Align = alTop
      BevelWidth = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
      object gridProduto: TSMDBGrid
        Left = 10
        Top = 10
        Width = 1030
        Height = 366
        Align = alClient
        BorderStyle = bsNone
        DataSource = dmCupomFiscal.dsConsProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = gridProdutoDblClick
        OnKeyDown = gridProdutoKeyDown
        Flat = False
        BandsFont.Charset = DEFAULT_CHARSET
        BandsFont.Color = clWindowText
        BandsFont.Height = -11
        BandsFont.Name = 'MS Sans Serif'
        BandsFont.Style = []
        Groupings = <>
        GridStyle.Style = gsMSMoney
        GridStyle.OddColor = 16776176
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'gridProdutos'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 9
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Title.Color = clMoneyGreen
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = clMoneyGreen
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = clMoneyGreen
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 390
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_VENDA'
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o Venda'
            Title.Color = clMoneyGreen
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_BARRA'
            Title.Alignment = taCenter
            Title.Caption = 'Cod.Barra'
            Title.Color = clMoneyGreen
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Unidade'
            Title.Color = clMoneyGreen
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE'
            Title.Alignment = taCenter
            Title.Caption = 'Estoque'
            Title.Color = clMoneyGreen
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_NCM'
            Title.Alignment = taCenter
            Title.Caption = 'NCM'
            Title.Color = clMoneyGreen
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
    object pnlDivisao: TAdvPanel
      Left = 0
      Top = 116
      Width = 1050
      Height = 17
      Align = alTop
      BevelOuter = bvNone
      Color = clAppWorkSpace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
    end
  end
  object scrollEsquerda: TScrollBox
    Left = 0
    Top = 0
    Width = 150
    Height = 593
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 1
  end
  object scrollDiretia: TScrollBox
    Left = 1200
    Top = 0
    Width = 150
    Height = 593
    Align = alRight
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 2
  end
end

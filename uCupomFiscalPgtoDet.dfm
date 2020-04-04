object frmCupomFiscalPgtoDet: TfrmCupomFiscalPgtoDet
  Left = 365
  Top = 47
  Width = 691
  Height = 602
  Caption = 'frmCupomFiscalPgtoDet'
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
  object scrollEsquerda: TScrollBox
    Left = 0
    Top = 0
    Width = 57
    Height = 564
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 0
  end
  object scrollDiretia: TScrollBox
    Left = 613
    Top = 0
    Width = 62
    Height = 564
    Align = alRight
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 1
  end
  object scrollPrincipal: TScrollBox
    Left = 57
    Top = 0
    Width = 556
    Height = 564
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 2
    object lblProduto: TRxLabel
      Left = 0
      Top = 0
      Width = 556
      Height = 45
      Align = alTop
      Alignment = taCenter
      Caption = 'Pagamentos'
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
      Width = 556
      Height = 57
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
        Left = 7
        Top = 18
        Width = 210
        Height = 23
        Caption = 'Condi'#231#227'o Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsItalic]
        ParentFont = False
        ShadowColor = clBackground
        ShadowPos = spRightBottom
      end
      object comboCondicaoPagto: TRxDBLookupCombo
        Left = 221
        Top = 11
        Width = 298
        Height = 31
        DropDownCount = 8
        EscapeClear = False
        DataField = 'ID_CONDPGTO'
        DataSource = dmCupomFiscal.dsCupomFiscal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = dmCupomFiscal.dsCondPgto
        ParentFont = False
        TabOrder = 0
        OnChange = comboCondicaoPagtoChange
      end
    end
    object pnlPrincipal: TAdvPanel
      Left = 0
      Top = 119
      Width = 556
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
      object gridParcelas: TSMDBGrid
        Left = 10
        Top = 10
        Width = 536
        Height = 366
        Align = alClient
        BorderStyle = bsNone
        DataSource = dmCupomFiscal.dsCupom_Parc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold]
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
        DefaultRowHeight = 20
        ScrollBars = ssHorizontal
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'PARCELA'
            Title.Alignment = taCenter
            Title.Caption = 'Parcela'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVENCIMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Dt Vencimento'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_VENCIMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr Vencimento'
            Width = 126
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_COBRANCA'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo Cobran'#231'a'
            Width = 120
            Visible = True
          end>
      end
    end
    object pnlDivisao: TAdvPanel
      Left = 0
      Top = 102
      Width = 556
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
    object btCancelar: TNxButton
      Left = 285
      Top = 512
      Width = 187
      Height = 39
      Caption = 'Ca&ncelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 3
      TabStop = False
      Transparent = True
      OnClick = btCancelarClick
    end
    object btConfirmar: TNxButton
      Left = 94
      Top = 512
      Width = 187
      Height = 39
      Hint = 'Grava e finaliza a venda'
      Cancel = True
      Caption = '&Confirmar (F10)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlyphSpacing = 5
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Transparent = True
      OnClick = btConfirmarClick
    end
  end
end

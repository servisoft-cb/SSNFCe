object fCupomFiscalPgto: TfCupomFiscalPgto
  Left = 191
  Top = 156
  Width = 1131
  Height = 557
  BorderIcons = [biSystemMenu]
  Caption = 'fCupomFiscalPgto - Pagamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TAdvPanel
    Left = 0
    Top = 0
    Width = 1115
    Height = 468
    Align = alClient
    BevelOuter = bvNone
    Color = 16645114
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -31
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.0.1.0'
    AutoHideChildren = False
    BorderColor = 16765615
    Caption.Color = 16575452
    Caption.ColorTo = 16571329
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'Verdana'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 16643051
    HoverColor = clBlack
    HoverFontColor = clBlack
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = 13542013
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 7485192
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 16575452
    StatusBar.ColorTo = 16571329
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    FullHeight = 0
    object Label1: TLabel
      Left = 324
      Top = 403
      Width = 169
      Height = 43
      Alignment = taRightJustify
      Caption = 'Produtos:'
      Color = 16643051
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -36
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label17: TLabel
      Left = 56
      Top = 421
      Width = 114
      Height = 23
      Alignment = taRightJustify
      Caption = 'Perc. Juros:'
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object DBText1: TDBText
      Left = 504
      Top = 402
      Width = 203
      Height = 42
      Alignment = taCenter
      Color = 16643051
      DataField = 'VLR_PRODUTOS'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -36
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
    end
    object grCliente: TJvGroupBox
      Left = 13
      Top = 299
      Width = 609
      Height = 47
      Caption = 'Cliente'
      Color = 16643051
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object btnCliente: TSpeedButton
        Left = 99
        Top = 16
        Width = 24
        Height = 24
        Glyph.Data = {
          DE020000424DDE02000000000000B60000002800000016000000170000000100
          08000000000028020000C30E0000C30E0000200000000000000000FF0000FFFF
          FF0080808000C0C0C00000000000FF000000FFFF00000000FF0000FFFF0045CA
          BF004B737F00D0B4B400CC625700FF31310000CEFF000079FF000029FF005E5E
          FF00BDBDFF00502B2D0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101010101
          0101010101010101010101010101010100000103030303030303030303030303
          0303030404040301000001030303030303030303030303030303040701070401
          0000010303030303030303030303030303040701010704010000010303030303
          0303030303030303040701010707040100000103030303030303030303030304
          0701010707040301000001030303030303030303030304070101070704030301
          0000010303030303030303030304070101070704030303010000010303030303
          0303030304070101070704030303030100000103030303030303030404040307
          0704030303030301000001030303030304040404040404070403030303030301
          0000010303030404060106010104040403030303030303010000010303040106
          0106010101010403030303030303030100000103030406010601060106010403
          0303030303030301000001030406010601010106010601040303030303030301
          0000010304010601060106010601010403030303030303010000010304060106
          0106010601060104030303030303030100000103040106010601060106010104
          0303030303030301000001030304010601010106010604030303030303030301
          0000010303040601060106010601040303030303030303010000010303030404
          0101010604040303030303030303030100000103030303030404040403030303
          0303030303030301000001010101010101010101010101010101010101010101
          0000}
        OnClick = btnClienteClick
      end
      object edtCodigoCliente: TDBEdit
        Left = 8
        Top = 16
        Width = 89
        Height = 24
        TabStop = False
        DataField = 'ID_CLIENTE'
        DataSource = dmCupomFiscal.dsCupomFiscal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = edtCodigoClienteExit
      end
      object edtNomeCliente: TEdit
        Left = 128
        Top = 16
        Width = 457
        Height = 24
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object pnlPagamentos: TAdvPanel
      Left = 8
      Top = 1
      Width = 619
      Height = 238
      BevelOuter = bvNone
      Color = 16645114
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -31
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 1
      UseDockManager = True
      Version = '2.0.1.0'
      AutoHideChildren = False
      BorderColor = 16765615
      Caption.Color = 16575452
      Caption.ColorTo = 16571329
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clBlack
      Caption.Font.Height = -11
      Caption.Font.Name = 'Verdana'
      Caption.Font.Style = []
      Caption.GradientDirection = gdVertical
      Caption.Indent = 2
      Caption.ShadeLight = 255
      CollapsColor = clNone
      CollapsDelay = 0
      ColorTo = 16643051
      HoverColor = clBlack
      HoverFontColor = clBlack
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = 13542013
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = 7485192
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 16575452
      StatusBar.ColorTo = 16571329
      StatusBar.GradientDirection = gdVertical
      Styler = AdvPanelStyler1
      FullHeight = 0
      object Label6: TLabel
        Left = 8
        Top = 70
        Width = 228
        Height = 18
        Caption = 'Pagamentos Selecionados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 5
        Width = 109
        Height = 18
        Caption = 'Pagamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 147
        Top = 5
        Width = 46
        Height = 18
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 334
        Top = 5
        Width = 211
        Height = 18
        Caption = 'Pagamentos Dispon'#237'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object edtPagamento: TAdvEdit
        Left = 8
        Top = 23
        Width = 122
        Height = 40
        EditAlign = eaCenter
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -19
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
        Text = 'ter'
        Visible = True
        OnKeyDown = edtPagamentoKeyDown
        Version = '2.8.6.1'
      end
      object gridPagamentosDisponiveis: TDBGrid
        Left = 334
        Top = 23
        Width = 278
        Height = 207
        TabStop = False
        Color = clSilver
        DataSource = dmCupomFiscal.dsTipoCobranca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -12
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold, fsItalic]
        OnDblClick = gridPagamentosDisponiveisDblClick
        OnKeyDown = gridPagamentosDisponiveisKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Alignment = taCenter
            Width = 218
            Visible = True
          end>
      end
      object gridPagamento: TSMDBGrid
        Left = 8
        Top = 87
        Width = 285
        Height = 142
        TabStop = False
        Ctl3D = False
        DataSource = dsPagamentosSelecionados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = 7485192
        TitleFont.Height = -12
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold, fsItalic]
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
        ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 18
        ScrollBars = ssHorizontal
        ColCount = 3
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Alignment = taCenter
            Width = 164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Title.Alignment = taCenter
            Width = 100
            Visible = True
          end>
      end
      object edtValorPagamento: TAdvEdit
        Left = 145
        Top = 23
        Width = 150
        Height = 40
        EditAlign = eaRight
        EditType = etFloat
        Precision = 2
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -19
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        Visible = True
        OnKeyDown = edtValorPagamentoKeyDown
        Version = '2.8.6.1'
      end
    end
    object ceJuros: TCurrencyEdit
      Left = 179
      Top = 412
      Width = 96
      Height = 32
      AutoSize = False
      DisplayFormat = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Visible = False
      OnExit = ceJurosExit
    end
    object Edit1: TEdit
      Left = 658
      Top = 354
      Width = 57
      Height = 46
      TabStop = False
      TabOrder = 3
      Visible = False
    end
    object grVendedor: TJvGroupBox
      Left = 13
      Top = 351
      Width = 609
      Height = 48
      Caption = 'Vendedor'
      Color = 16643051
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 4
      object btnVendedor: TSpeedButton
        Left = 99
        Top = 18
        Width = 24
        Height = 24
        Glyph.Data = {
          DE020000424DDE02000000000000B60000002800000016000000170000000100
          08000000000028020000C30E0000C30E0000200000000000000000FF0000FFFF
          FF0080808000C0C0C00000000000FF000000FFFF00000000FF0000FFFF0045CA
          BF004B737F00D0B4B400CC625700FF31310000CEFF000079FF000029FF005E5E
          FF00BDBDFF00502B2D0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101010101
          0101010101010101010101010101010100000103030303030303030303030303
          0303030404040301000001030303030303030303030303030303040701070401
          0000010303030303030303030303030303040701010704010000010303030303
          0303030303030303040701010707040100000103030303030303030303030304
          0701010707040301000001030303030303030303030304070101070704030301
          0000010303030303030303030304070101070704030303010000010303030303
          0303030304070101070704030303030100000103030303030303030404040307
          0704030303030301000001030303030304040404040404070403030303030301
          0000010303030404060106010104040403030303030303010000010303040106
          0106010101010403030303030303030100000103030406010601060106010403
          0303030303030301000001030406010601010106010601040303030303030301
          0000010304010601060106010601010403030303030303010000010304060106
          0106010601060104030303030303030100000103040106010601060106010104
          0303030303030301000001030304010601010106010604030303030303030301
          0000010303040601060106010601040303030303030303010000010303030404
          0101010604040303030303030303030100000103030303030404040403030303
          0303030303030301000001010101010101010101010101010101010101010101
          0000}
        OnClick = btnVendedorClick
      end
      object edtCodigoVendedor: TDBEdit
        Left = 8
        Top = 18
        Width = 89
        Height = 24
        TabStop = False
        DataField = 'ID_VENDEDOR'
        DataSource = dmCupomFiscal.dsCupomFiscal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edtNomeVendedor: TEdit
        Left = 128
        Top = 18
        Width = 457
        Height = 24
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object AdvPanel1: TAdvPanel
      Left = 744
      Top = 9
      Width = 261
      Height = 425
      BevelOuter = bvNone
      Color = 16645114
      TabOrder = 5
      UseDockManager = True
      Version = '2.0.1.0'
      AutoHideChildren = False
      BorderColor = 16765615
      Caption.Color = 16575452
      Caption.ColorTo = 16571329
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clBlack
      Caption.Font.Height = -11
      Caption.Font.Name = 'Verdana'
      Caption.Font.Style = []
      Caption.GradientDirection = gdVertical
      Caption.Indent = 2
      Caption.ShadeLight = 255
      CollapsColor = clNone
      CollapsDelay = 0
      ColorTo = 16643051
      HoverColor = clBlack
      HoverFontColor = clBlack
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = 13542013
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = 7485192
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 16575452
      StatusBar.ColorTo = 16571329
      StatusBar.GradientDirection = gdVertical
      Styler = AdvPanelStyler1
      FullHeight = 0
      object pnlTotal: TAdvPanel
        Left = 0
        Top = 0
        Width = 261
        Height = 84
        Align = alTop
        BevelOuter = bvNone
        Color = 16645114
        TabOrder = 0
        UseDockManager = True
        Version = '2.0.1.0'
        AutoHideChildren = False
        BorderColor = 16765615
        Caption.Color = 16575452
        Caption.ColorTo = 16571329
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clBlack
        Caption.Font.Height = -11
        Caption.Font.Name = 'Verdana'
        Caption.Font.Style = []
        Caption.GradientDirection = gdVertical
        Caption.Indent = 2
        Caption.ShadeLight = 255
        CollapsColor = clNone
        CollapsDelay = 0
        ColorTo = 16643051
        HoverColor = clBlack
        HoverFontColor = clBlack
        ShadowColor = clBlack
        ShadowOffset = 0
        StatusBar.BorderColor = 13542013
        StatusBar.BorderStyle = bsSingle
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = 7485192
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        StatusBar.Color = 16575452
        StatusBar.ColorTo = 16571329
        StatusBar.GradientDirection = gdVertical
        Styler = AdvPanelStyler1
        FullHeight = 0
        object Label15: TLabel
          Left = 0
          Top = 0
          Width = 261
          Height = 25
          Align = alTop
          Caption = 'Total:'
          Color = 16643051
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3683329
          Font.Height = -20
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object edtTotal: TDBEdit
          Left = 0
          Top = 25
          Width = 262
          Height = 60
          TabStop = False
          BiDiMode = bdLeftToRight
          Color = 12633514
          DataField = 'VLR_TOTAL'
          DataSource = dmCupomFiscal.dsCupomFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3683329
          Font.Height = -43
          Font.Name = 'Verdana'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object pnlDesconto: TAdvPanel
        Left = 0
        Top = 84
        Width = 261
        Height = 84
        Align = alTop
        BevelOuter = bvNone
        Color = 16645114
        TabOrder = 1
        UseDockManager = True
        Version = '2.0.1.0'
        AutoHideChildren = False
        BorderColor = 16765615
        Caption.Color = 16575452
        Caption.ColorTo = 16571329
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clBlack
        Caption.Font.Height = -11
        Caption.Font.Name = 'Verdana'
        Caption.Font.Style = []
        Caption.GradientDirection = gdVertical
        Caption.Indent = 2
        Caption.ShadeLight = 255
        CollapsColor = clNone
        CollapsDelay = 0
        ColorTo = 16643051
        HoverColor = clBlack
        HoverFontColor = clBlack
        ShadowColor = clBlack
        ShadowOffset = 0
        StatusBar.BorderColor = 13542013
        StatusBar.BorderStyle = bsSingle
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = 7485192
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        StatusBar.Color = 16575452
        StatusBar.ColorTo = 16571329
        StatusBar.GradientDirection = gdVertical
        Styler = AdvPanelStyler1
        FullHeight = 0
        object Label8: TLabel
          Left = 0
          Top = 0
          Width = 261
          Height = 25
          Align = alTop
          Caption = 'Desconto:'
          Color = 16643051
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3683329
          Font.Height = -20
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object edtDesconto: TDBEdit
          Left = 0
          Top = 24
          Width = 262
          Height = 60
          TabStop = False
          Color = 12633514
          DataField = 'VLR_DESCONTO'
          DataSource = dmCupomFiscal.dsCupomFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -43
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object pnlTroca: TAdvPanel
        Left = 0
        Top = 168
        Width = 261
        Height = 84
        Align = alTop
        BevelOuter = bvNone
        Color = 16645114
        TabOrder = 2
        UseDockManager = True
        Version = '2.0.1.0'
        AutoHideChildren = False
        BorderColor = 16765615
        Caption.Color = 16575452
        Caption.ColorTo = 16571329
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clBlack
        Caption.Font.Height = -11
        Caption.Font.Name = 'Verdana'
        Caption.Font.Style = []
        Caption.GradientDirection = gdVertical
        Caption.Indent = 2
        Caption.ShadeLight = 255
        CollapsColor = clNone
        CollapsDelay = 0
        ColorTo = 16643051
        HoverColor = clBlack
        HoverFontColor = clBlack
        ShadowColor = clBlack
        ShadowOffset = 0
        StatusBar.BorderColor = 13542013
        StatusBar.BorderStyle = bsSingle
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = 7485192
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        StatusBar.Color = 16575452
        StatusBar.ColorTo = 16571329
        StatusBar.GradientDirection = gdVertical
        Styler = AdvPanelStyler1
        FullHeight = 0
        object lblVlr_Troca: TLabel
          Left = 0
          Top = 0
          Width = 261
          Height = 25
          Align = alTop
          Caption = 'Troca:'
          Color = 16643051
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3683329
          Font.Height = -20
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object edtVlr_Troca: TDBEdit
          Left = -1
          Top = 24
          Width = 262
          Height = 60
          TabStop = False
          Color = 12633514
          Ctl3D = True
          DataField = 'VLR_TROCA'
          DataSource = dmCupomFiscal.dsCupomFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -43
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object pnlRecebido: TAdvPanel
        Left = 0
        Top = 252
        Width = 261
        Height = 84
        Align = alTop
        BevelOuter = bvNone
        Color = 16645114
        TabOrder = 3
        UseDockManager = True
        Version = '2.0.1.0'
        AutoHideChildren = False
        BorderColor = 16765615
        Caption.Color = 16575452
        Caption.ColorTo = 16571329
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clBlack
        Caption.Font.Height = -11
        Caption.Font.Name = 'Verdana'
        Caption.Font.Style = []
        Caption.GradientDirection = gdVertical
        Caption.Indent = 2
        Caption.ShadeLight = 255
        CollapsColor = clNone
        CollapsDelay = 0
        ColorTo = 16643051
        HoverColor = clBlack
        HoverFontColor = clBlack
        ShadowColor = clBlack
        ShadowOffset = 0
        StatusBar.BorderColor = 13542013
        StatusBar.BorderStyle = bsSingle
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = 7485192
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        StatusBar.Color = 16575452
        StatusBar.ColorTo = 16571329
        StatusBar.GradientDirection = gdVertical
        Styler = AdvPanelStyler1
        FullHeight = 0
        object lblRecebido: TLabel
          Left = 0
          Top = 0
          Width = 261
          Height = 25
          Align = alTop
          Caption = 'Recebido:'
          Color = 16643051
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7300393
          Font.Height = -20
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object edtVlrRecebido: TDBEdit
          Left = -1
          Top = 24
          Width = 262
          Height = 60
          TabStop = False
          Color = 12633514
          DataField = 'VLR_RECEBIDO'
          DataSource = dmCupomFiscal.dsCupomFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7300393
          Font.Height = -43
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object pnlTroco: TAdvPanel
        Left = 0
        Top = 336
        Width = 261
        Height = 84
        Align = alTop
        BevelOuter = bvNone
        Color = 16645114
        TabOrder = 4
        UseDockManager = True
        Version = '2.0.1.0'
        AutoHideChildren = False
        BorderColor = 16765615
        Caption.Color = 16575452
        Caption.ColorTo = 16571329
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clBlack
        Caption.Font.Height = -11
        Caption.Font.Name = 'Verdana'
        Caption.Font.Style = []
        Caption.GradientDirection = gdVertical
        Caption.Indent = 2
        Caption.ShadeLight = 255
        CollapsColor = clNone
        CollapsDelay = 0
        ColorTo = 16643051
        HoverColor = clBlack
        HoverFontColor = clBlack
        ShadowColor = clBlack
        ShadowOffset = 0
        StatusBar.BorderColor = 13542013
        StatusBar.BorderStyle = bsSingle
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = 7485192
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        StatusBar.Color = 16575452
        StatusBar.ColorTo = 16571329
        StatusBar.GradientDirection = gdVertical
        Styler = AdvPanelStyler1
        FullHeight = 0
        object Label5: TLabel
          Left = 0
          Top = 0
          Width = 261
          Height = 25
          Align = alTop
          Caption = 'Troco:'
          Color = 16643051
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3683329
          Font.Height = -20
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object edtTroco: TDBEdit
          Left = 0
          Top = 24
          Width = 262
          Height = 60
          TabStop = False
          Color = 12633514
          Ctl3D = True
          DataField = 'VLR_TROCO'
          DataSource = dmCupomFiscal.dsCupomFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3683329
          Font.Height = -43
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object rdgEnviaNFce: TcxRadioGroup
      Left = 16
      Top = 232
      TabStop = False
      Caption = 'Envia NFCe (F9)'
      ParentFont = False
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Sim'
        end
        item
          Caption = 'N'#227'o'
        end>
      ItemIndex = 1
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 7485192
      Style.Font.Height = -12
      Style.Font.Name = 'Verdana'
      Style.Font.Style = [fsBold, fsItalic]
      Style.IsFontAssigned = True
      TabOrder = 6
      Visible = False
      Height = 51
      Width = 285
    end
  end
  object pnlBotton: TAdvPanel
    Left = 0
    Top = 468
    Width = 1115
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Color = 16645114
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -31
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Version = '2.0.1.0'
    AutoHideChildren = False
    BorderColor = 16765615
    Caption.Color = 16575452
    Caption.ColorTo = 16571329
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'Verdana'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 16643051
    HoverColor = clBlack
    HoverFontColor = clBlack
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = 13542013
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 7485192
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 16575452
    StatusBar.ColorTo = 16571329
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    FullHeight = 0
    object btConfirmar: TNxButton
      Left = 190
      Top = 8
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
      TabOrder = 0
      TabStop = False
      Transparent = True
      OnClick = btConfirmarClick
    end
    object btCancelar: TNxButton
      Left = 377
      Top = 8
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
      TabOrder = 1
      TabStop = False
      Transparent = True
      OnClick = btCancelarClick
    end
    object btGaveta: TNxButton
      Left = 564
      Top = 8
      Width = 187
      Height = 39
      Caption = '&Gaveta (F8)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 2
      TabStop = False
      Transparent = True
      OnClick = btGavetaClick
    end
  end
  object AdvPanelStyler1: TAdvPanelStyler
    Tag = 0
    Settings.AnchorHint = False
    Settings.AutoHideChildren = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = 16765615
    Settings.BorderShadow = False
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = 16575452
    Settings.Caption.ColorTo = 16571329
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clBlack
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'Verdana'
    Settings.Caption.Font.Style = []
    Settings.Caption.GradientDirection = gdVertical
    Settings.Caption.Indent = 2
    Settings.Caption.ShadeLight = 255
    Settings.Collaps = False
    Settings.CollapsColor = clNone
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = 16645114
    Settings.ColorTo = 16643051
    Settings.ColorMirror = clNone
    Settings.ColorMirrorTo = clNone
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = 7485192
    Settings.Font.Height = -31
    Settings.Font.Name = 'Verdana'
    Settings.Font.Style = [fsBold, fsItalic]
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clBlack
    Settings.HoverFontColor = clBlack
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderColor = 13542013
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = 7485192
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 16575452
    Settings.StatusBar.ColorTo = 16571329
    Settings.StatusBar.GradientDirection = gdVertical
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Style = psWindows7
    Left = 1045
    Top = 17
  end
  object mPagamentosSelecionados: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'TIPO'
    Params = <>
    BeforeDelete = mPagamentosSelecionadosBeforeDelete
    Left = 104
    Top = 150
    Data = {
      650000009619E0BD0100000018000000040000000000030000006500044E6F6D
      6501004900000001000557494454480200020014000556616C6F720800040000
      0000000249640400010000000000045469706F01004900000001000557494454
      480200020001000000}
    object mPagamentosSelecionadosNome: TStringField
      DisplayWidth = 20
      FieldName = 'Nome'
    end
    object mPagamentosSelecionadosValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = 'R$ ,,0.00'
    end
    object mPagamentosSelecionadosId: TIntegerField
      FieldName = 'Id'
    end
    object mPagamentosSelecionadosTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
  end
  object dsPagamentosSelecionados: TDataSource
    DataSet = mPagamentosSelecionados
    Left = 136
    Top = 150
  end
  object mTotalPagamentos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TIPO'
    Params = <>
    Left = 104
    Top = 193
    object mTotalPagamentosValor: TFloatField
      FieldName = 'Valor'
    end
    object mTotalPagamentosTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object mTotalPagamentosId: TIntegerField
      FieldName = 'Id'
    end
  end
  object mReciboTroca: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 145
    Data = {
      500000009619E0BD01000000180000000300000000000300000050000949445F
      52656369626F040001000000000009566C725F546F74616C0800040000000000
      09566C725F557361646F08000400000000000000}
    object mReciboTrocaID_Recibo: TIntegerField
      FieldName = 'ID_Recibo'
    end
    object mReciboTrocaVlr_Total: TFloatField
      FieldName = 'Vlr_Total'
    end
    object mReciboTrocaVlr_Usado: TFloatField
      FieldName = 'Vlr_Usado'
    end
  end
end

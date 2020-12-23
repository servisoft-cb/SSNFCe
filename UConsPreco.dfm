object frmConsPreco: TfrmConsPreco
  Left = 392
  Top = 260
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmConsPreco'
  ClientHeight = 433
  ClientWidth = 760
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 253
    Width = 760
    Height = 180
    Align = alBottom
    Ctl3D = False
    DataSource = dsEstoque_Serv
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 3
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME_INTERNO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Filial'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 367
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Estoque'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 109
        Visible = True
      end>
  end
  object pnlPrincipal: TAdvPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 253
    Align = alClient
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
    object ProgressBar1: TProgressBar
      Left = 10
      Top = 226
      Width = 740
      Height = 17
      Align = alBottom
      TabOrder = 0
      Visible = False
    end
    object AdvSmoothPanel1: TAdvSmoothPanel
      Left = 10
      Top = 10
      Width = 740
      Height = 216
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
      object Label3: TLabel
        Left = 373
        Top = 148
        Width = 340
        Height = 35
        AutoSize = False
        Caption = 'Estoque: 0'
        Color = 3683329
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label4: TLabel
        Left = 36
        Top = 34
        Width = 171
        Height = 32
        Caption = 'C'#243'd. Barra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 20
        Top = 102
        Width = 693
        Height = 33
        AutoSize = False
        Color = 3683329
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -25
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel
        Left = 20
        Top = 148
        Width = 340
        Height = 35
        AutoSize = False
        Caption = 'Pre'#231'o: 0'
        Color = 3683329
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label5: TLabel
        Left = 213
        Top = 72
        Width = 334
        Height = 13
        Caption = 'Digite 0 antes do c'#243'digo para pesquisar por ID. (Ex.: 089)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Edit3: TEdit
        Left = 212
        Top = 26
        Width = 309
        Height = 38
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyDown = Edit3KeyDown
      end
    end
  end
  object qParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT P.usa_cod_barras,'
      '  (SELECT MAX(P2.usa_cod_ref)'
      '     FROM cupomfiscal_parametros P2) USA_COD_REF,'
      '  (SELECT USA_NFCE_LOCAL'
      '     FROM PARAMETROS_GERAL ) USA_NFCE_LOCAL'
      'FROM PARAMETROS P')
    SQLConnection = dmDatabase.scoDados
    Left = 96
    Top = 176
    object qParametrosUSA_COD_BARRAS: TStringField
      FieldName = 'USA_COD_BARRAS'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_COD_REF: TStringField
      FieldName = 'USA_COD_REF'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_NFCE_LOCAL: TStringField
      FieldName = 'USA_NFCE_LOCAL'
      FixedChar = True
      Size = 1
    end
  end
  object sdsEstoque_Serv: TSQLDataSet
    CommandText = 
      'select EA.QTD, F.NOME_INTERNO, EA.FILIAL '#13#10'from ESTOQUE_ATUAL EA' +
      #13#10'inner join FILIAL F on EA.FILIAL = F.ID'#13#10'where EA.ID_PRODUTO =' +
      ' :ID_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoServidor
    Left = 248
    Top = 192
  end
  object dspEstoque_Serv: TDataSetProvider
    DataSet = sdsEstoque_Serv
    Left = 280
    Top = 192
  end
  object cdsEstoque_Serv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoque_Serv'
    Left = 312
    Top = 192
    object cdsEstoque_ServQTD: TFMTBCDField
      FieldName = 'QTD'
      Precision = 15
      Size = 6
    end
    object cdsEstoque_ServNOME_INTERNO: TStringField
      FieldName = 'NOME_INTERNO'
      Size = 30
    end
    object cdsEstoque_ServFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
  end
  object dsEstoque_Serv: TDataSource
    DataSet = cdsEstoque_Serv
    Left = 352
    Top = 192
  end
end

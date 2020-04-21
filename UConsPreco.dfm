object frmConsPreco: TfrmConsPreco
  Left = 385
  Top = 194
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmConsPreco'
  ClientHeight = 331
  ClientWidth = 541
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 331
    Align = alClient
    Color = 7300393
    TabOrder = 0
    object Label3: TLabel
      Left = 12
      Top = 120
      Width = 517
      Height = 24
      AutoSize = False
      Caption = 'Estoque: 0'
      Color = 3683329
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 28
      Top = 18
      Width = 72
      Height = 13
      Caption = 'C'#243'd. Barra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 12
      Top = 66
      Width = 517
      Height = 24
      AutoSize = False
      Color = 3683329
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 93
      Width = 517
      Height = 24
      AutoSize = False
      Caption = 'Pre'#231'o: 0'
      Color = 3683329
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 32
      Top = 40
      Width = 334
      Height = 13
      Caption = 'Digite 0 antes do c'#243'digo para pesquisar por ID. (Ex.: 089)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Edit3: TEdit
      Left = 106
      Top = 10
      Width = 197
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyDown = Edit3KeyDown
    end
    object SMDBGrid1: TSMDBGrid
      Left = 1
      Top = 160
      Width = 539
      Height = 170
      Align = alBottom
      Ctl3D = False
      DataSource = dsEstoque_Serv
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
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
    Left = 32
    Top = 56
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

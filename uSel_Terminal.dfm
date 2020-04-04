object frmSel_Terminal: TfrmSel_Terminal
  Left = 468
  Top = 195
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Selecionar o Terminal'
  ClientHeight = 462
  ClientWidth = 460
  Color = clMoneyGreen
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
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 0
    Width = 460
    Height = 462
    Align = alClient
    Ctl3D = False
    DataSource = dsTerminal
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
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
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Color = 8454016
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Title.Color = 8454016
        Width = 162
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SERIE'
        Title.Alignment = taCenter
        Title.Caption = 'S'#233'rie'
        Title.Color = 8454016
        Width = 52
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FILIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Filial'
        Title.Color = 8454016
        Visible = True
      end>
  end
  object sdsTerminal: TSQLDataSet
    CommandText = 
      'select C.ID, C.NOME, C.SERIE, C.INATIVO, C.FILIAL'#13#10'from CUPOMFIS' +
      'CAL_TERMINAL C'#13#10'where (C.FILIAL = :FILIAL or :FILIAL = 0) and'#13#10' ' +
      '     C.INATIVO = '#39'N'#39'   '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoServidor
    Left = 72
    Top = 104
  end
  object dspTerminal: TDataSetProvider
    DataSet = sdsTerminal
    Left = 104
    Top = 104
  end
  object cdsTerminal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTerminal'
    Left = 136
    Top = 104
    object cdsTerminalID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object cdsTerminalNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsTerminalSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsTerminalINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsTerminalFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dsTerminal: TDataSource
    DataSet = cdsTerminal
    Left = 168
    Top = 104
  end
end

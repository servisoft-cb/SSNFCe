object frmComparar_Cupom: TfrmComparar_Cupom
  Left = 263
  Top = 117
  Width = 928
  Height = 480
  Caption = 'frmComparar_Cupom'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 73
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 38
      Top = 14
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 14
      Top = 34
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Inicial:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 219
      Top = 34
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Final:'
      Transparent = True
    end
    object btnConsultar: TNxButton
      Left = 394
      Top = 19
      Width = 136
      Height = 27
      Caption = 'Consultar'
      TabOrder = 0
      OnClick = btnConsultarClick
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 63
      Top = 6
      Width = 320
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME_INTERNO'
      LookupSource = dsFilial
      ParentCtl3D = False
      TabOrder = 1
    end
    object DtInicial: TNxDatePicker
      Left = 63
      Top = 26
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '27/04/2021'
      HideFocus = False
      Date = 44313.000000000000000000
      NoneCaption = 'None'
      TodayCaption = 'Today'
    end
    object DtFinal: TNxDatePicker
      Left = 263
      Top = 26
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '27/04/2021'
      HideFocus = False
      Date = 44313.000000000000000000
      NoneCaption = 'None'
      TodayCaption = 'Today'
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 73
    Width = 912
    Height = 327
    Align = alClient
    Ctl3D = False
    DataSource = dsAuxiliar
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = SMDBGrid1TitleClick
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
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 40
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Diferenca'
        Title.Alignment = taCenter
        Title.Caption = 'Diferen'#231'a'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMCUPOM_Local'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMCUPOM_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE_Local'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEMISSAO_Local'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEMISSAO_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_PRODUTOS_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_PRODUTOS_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_DESCONTO_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_DESCONTO_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TROCA_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TROCA_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_RECIBO_TROCA_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_RECIBO_TROCA_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_RECIBO_USADO_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_RECIBO_USADO_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TROCA_USADA_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TROCA_USADA_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_VALE_USADO_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_VALE_USADO_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_CASHBACK_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_CASHBACK_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_CASHBACK_USADO_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_CASHBACK_USADO_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NFECHAVEACESSO_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NFECHAVEACESSO_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NFEPROTOCOLO_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NFEPROTOCOLO_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_Servidor'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CLIENTE_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_VENDEDOR_Servidor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cliente_OK'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente esta no Servidor'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vendedor_OK'
        Title.Alignment = taCenter
        Title.Caption = 'Vendedor esta no Servidor'
        Width = 101
        Visible = True
      end>
  end
  object NxPanel2: TNxPanel
    Left = 0
    Top = 400
    Width = 912
    Height = 41
    Align = alBottom
    UseDockManager = False
    ParentBackground = False
    TabOrder = 2
    object Shape1: TShape
      Left = 409
      Top = 4
      Width = 29
      Height = 16
      Brush.Color = clRed
    end
    object Label4: TLabel
      Left = 442
      Top = 4
      Width = 241
      Height = 13
      Caption = 'N'#227'o esta no Servidor ou Possue diferen'#231'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Shape2: TShape
      Left = 409
      Top = 21
      Width = 29
      Height = 16
      Brush.Color = 8454143
    end
    object Label5: TLabel
      Left = 442
      Top = 22
      Width = 279
      Height = 13
      Caption = 'Campo Com a diferen'#231'a do Local para o Servidor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object NxButton2: TNxButton
      Left = 46
      Top = 7
      Width = 307
      Height = 28
      Caption = 'Reenviar para o Servidor (Selecionados)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = NxButton2Click
    end
  end
  object sdsCupom: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select C.ID, C.NUMCUPOM, C.SERIE, C.TIPO, C.DTEMISSAO, coalesce(' +
      'C.VLR_PRODUTOS, 0) VLR_PRODUTOS,'#13#10'       coalesce(C.VLR_TOTAL, 0' +
      ') VLR_TOTAL, coalesce(C.VLR_DESCONTO, 0) VLR_DESCONTO, coalesce(' +
      'C.VLR_TROCA, 0) VLR_TROCA,'#13#10'       coalesce(C.VLR_RECIBO_TROCA, ' +
      '0) VLR_RECIBO_TROCA, coalesce(C.VLR_RECIBO_USADO, 0) VLR_RECIBO_' +
      'USADO,'#13#10'       coalesce(C.VLR_TROCA_USADA, 0) VLR_TROCA_USADA, c' +
      'oalesce(C.VLR_VALE_USADO, 0) VLR_VALE_USADO,'#13#10'       coalesce(C.' +
      'VLR_CASHBACK, 0) VLR_CASHBACK, coalesce(C.VLR_CASHBACK_USADO, 0)' +
      ' VLR_CASHBACK_USADO, C.NFECHAVEACESSO,'#13#10'       C.NFEPROTOCOLO, C' +
      '.ID_CLIENTE, C.ID_VENDEDOR'#13#10'from CUPOMFISCAL C'#13#10'where C.DTEMISSA' +
      'O between :DATA1 and :DATA2 and'#13#10'      C.FILIAL = :FILIAL   '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 113
    Top = 39
  end
  object dspCupom: TDataSetProvider
    DataSet = sdsCupom
    Left = 146
    Top = 34
  end
  object cdsCupom: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCupom'
    Left = 175
    Top = 32
    object cdsCupomID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCupomNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
    object cdsCupomSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsCupomTIPO: TStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsCupomDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsCupomVLR_PRODUTOS: TFloatField
      FieldName = 'VLR_PRODUTOS'
    end
    object cdsCupomVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsCupomVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object cdsCupomVLR_TROCA: TFloatField
      FieldName = 'VLR_TROCA'
    end
    object cdsCupomVLR_RECIBO_TROCA: TFloatField
      FieldName = 'VLR_RECIBO_TROCA'
    end
    object cdsCupomVLR_RECIBO_USADO: TFloatField
      FieldName = 'VLR_RECIBO_USADO'
    end
    object cdsCupomVLR_TROCA_USADA: TFloatField
      FieldName = 'VLR_TROCA_USADA'
    end
    object cdsCupomVLR_VALE_USADO: TFloatField
      FieldName = 'VLR_VALE_USADO'
    end
    object cdsCupomVLR_CASHBACK: TFloatField
      FieldName = 'VLR_CASHBACK'
    end
    object cdsCupomVLR_CASHBACK_USADO: TFloatField
      FieldName = 'VLR_CASHBACK_USADO'
    end
    object cdsCupomNFECHAVEACESSO: TStringField
      FieldName = 'NFECHAVEACESSO'
      Size = 44
    end
    object cdsCupomNFEPROTOCOLO: TStringField
      FieldName = 'NFEPROTOCOLO'
      Size = 45
    end
    object cdsCupomID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsCupomID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
  end
  object dsCupom: TDataSource
    DataSet = cdsCupom
    Left = 232
    Top = 49
  end
  object sdsCupom_Servidor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select C.ID, C.NUMCUPOM, C.SERIE, C.TIPO, C.DTEMISSAO, coalesce(' +
      'C.VLR_PRODUTOS, 0) VLR_PRODUTOS,'#13#10'       coalesce(C.VLR_TOTAL, 0' +
      ') VLR_TOTAL, coalesce(C.VLR_DESCONTO, 0) VLR_DESCONTO, coalesce(' +
      'C.VLR_TROCA, 0) VLR_TROCA,'#13#10'       coalesce(C.VLR_RECIBO_TROCA, ' +
      '0) VLR_RECIBO_TROCA, coalesce(C.VLR_RECIBO_USADO, 0) VLR_RECIBO_' +
      'USADO,'#13#10'       coalesce(C.VLR_TROCA_USADA, 0) VLR_TROCA_USADA, c' +
      'oalesce(C.VLR_VALE_USADO, 0) VLR_VALE_USADO,'#13#10'       coalesce(C.' +
      'VLR_CASHBACK, 0) VLR_CASHBACK, coalesce(C.VLR_CASHBACK_USADO, 0)' +
      ' VLR_CASHBACK_USADO, C.NFECHAVEACESSO,'#13#10'       C.NFEPROTOCOLO, C' +
      '.ID_CLIENTE, C.ID_VENDEDOR'#13#10'from CUPOMFISCAL C'#13#10'where C.DTEMISSA' +
      'O between :DATA1 and :DATA2 and'#13#10'      C.FILIAL = :FILIAL   '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoServidor
    Left = 418
    Top = 35
  end
  object dspCupom_Servidor: TDataSetProvider
    DataSet = sdsCupom_Servidor
    Left = 451
    Top = 40
  end
  object cdsCupom_Servidor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCupom_Servidor'
    Left = 488
    Top = 22
    object cdsCupom_ServidorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCupom_ServidorNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
    object cdsCupom_ServidorSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsCupom_ServidorTIPO: TStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsCupom_ServidorDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsCupom_ServidorVLR_PRODUTOS: TFloatField
      FieldName = 'VLR_PRODUTOS'
    end
    object cdsCupom_ServidorVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsCupom_ServidorVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object cdsCupom_ServidorVLR_TROCA: TFloatField
      FieldName = 'VLR_TROCA'
    end
    object cdsCupom_ServidorVLR_RECIBO_TROCA: TFloatField
      FieldName = 'VLR_RECIBO_TROCA'
    end
    object cdsCupom_ServidorVLR_RECIBO_USADO: TFloatField
      FieldName = 'VLR_RECIBO_USADO'
    end
    object cdsCupom_ServidorVLR_TROCA_USADA: TFloatField
      FieldName = 'VLR_TROCA_USADA'
    end
    object cdsCupom_ServidorVLR_VALE_USADO: TFloatField
      FieldName = 'VLR_VALE_USADO'
    end
    object cdsCupom_ServidorVLR_CASHBACK: TFloatField
      FieldName = 'VLR_CASHBACK'
    end
    object cdsCupom_ServidorVLR_CASHBACK_USADO: TFloatField
      FieldName = 'VLR_CASHBACK_USADO'
    end
    object cdsCupom_ServidorNFECHAVEACESSO: TStringField
      FieldName = 'NFECHAVEACESSO'
      Size = 44
    end
    object cdsCupom_ServidorNFEPROTOCOLO: TStringField
      FieldName = 'NFEPROTOCOLO'
      Size = 45
    end
    object cdsCupom_ServidorID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsCupom_ServidorID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
  end
  object dsCupom_Servidor: TDataSource
    DataSet = cdsCupom_Servidor
    Left = 538
    Top = 22
  end
  object mAuxiliar: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Local'
        DataType = ftInteger
      end
      item
        Name = 'NUMCUPOM_Local'
        DataType = ftInteger
      end
      item
        Name = 'SERIE_Local'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TIPO_Local'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DTEMISSAO_Local'
        DataType = ftDate
      end
      item
        Name = 'VLR_PRODUTOS_Local'
        DataType = ftFloat
      end
      item
        Name = 'VLR_TOTAL_Local'
        DataType = ftFloat
      end
      item
        Name = 'VLR_DESCONTO_Local'
        DataType = ftFloat
      end
      item
        Name = 'VLR_TROCA_Local'
        DataType = ftFloat
      end
      item
        Name = 'VLR_RECIBO_TROCA_Local'
        DataType = ftFloat
      end
      item
        Name = 'VLR_RECIBO_USADO_Local'
        DataType = ftFloat
      end
      item
        Name = 'VLR_TROCA_USADA_Local'
        DataType = ftFloat
      end
      item
        Name = 'VLR_VALE_USADO_Local'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CASHBACK_Local'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CASHBACK_USADO_Local'
        DataType = ftFloat
      end
      item
        Name = 'NFECHAVEACESSO_Local'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'NFEPROTOCOLO_Local'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ID_Servidor'
        DataType = ftInteger
      end
      item
        Name = 'NUMCUPOM_Servidor'
        DataType = ftInteger
      end
      item
        Name = 'SERIE_Servidor'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TIPO_Servidor'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DTEMISSAO_Servidor'
        DataType = ftDate
      end
      item
        Name = 'VLR_PRODUTOS_Servidor'
        DataType = ftFloat
      end
      item
        Name = 'VLR_TOTAL_Servidor'
        DataType = ftFloat
      end
      item
        Name = 'VLR_DESCONTO_Servidor'
        DataType = ftFloat
      end
      item
        Name = 'VLR_TROCA_Servidor'
        DataType = ftFloat
      end
      item
        Name = 'VLR_RECIBO_TROCA_Servidor'
        DataType = ftFloat
      end
      item
        Name = 'VLR_RECIBO_USADO_Servidor'
        DataType = ftFloat
      end
      item
        Name = 'VLR_TROCA_USADA_Servidor'
        DataType = ftFloat
      end
      item
        Name = 'VLR_VALE_USADO_Servidor'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CASHBACK_Servidor'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CASHBACK_USADO_Servidor'
        DataType = ftFloat
      end
      item
        Name = 'NFECHAVEACESSO_Servidor'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'NFEPROTOCOLO_Servidor'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Diferenca'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Campo_Diferenca'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cliente_OK'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Vendedor_OK'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ID_CLIENTE_Servidor'
        DataType = ftInteger
      end
      item
        Name = 'ID_VENDEDOR_Servidor'
        DataType = ftInteger
      end
      item
        Name = 'ID_CLIENTE_Local'
        DataType = ftInteger
      end
      item
        Name = 'ID_VENDEDOR_Local'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnNewRecord = mAuxiliarNewRecord
    Left = 730
    Top = 104
    Data = {
      0E0500009619E0BD01000000180000002A0000000000030000000E050849445F
      4C6F63616C04000100000000000E4E554D4355504F4D5F4C6F63616C04000100
      000000000B53455249455F4C6F63616C01004900000001000557494454480200
      020003000A5449504F5F4C6F63616C0100490000000100055749445448020002
      0003000F4454454D495353414F5F4C6F63616C040006000000000012564C525F
      50524F4455544F535F4C6F63616C08000400000000000F564C525F544F54414C
      5F4C6F63616C080004000000000012564C525F444553434F4E544F5F4C6F6361
      6C08000400000000000F564C525F54524F43415F4C6F63616C08000400000000
      0016564C525F52454349424F5F54524F43415F4C6F63616C0800040000000000
      16564C525F52454349424F5F555341444F5F4C6F63616C080004000000000015
      564C525F54524F43415F55534144415F4C6F63616C080004000000000014564C
      525F56414C455F555341444F5F4C6F63616C080004000000000012564C525F43
      4153484241434B5F4C6F63616C080004000000000018564C525F434153484241
      434B5F555341444F5F4C6F63616C0800040000000000144E4645434841564541
      434553534F5F4C6F63616C0100490000000100055749445448020002002C0012
      4E464550524F544F434F4C4F5F4C6F63616C0100490000000100055749445448
      020002002D000B49445F5365727669646F720400010000000000114E554D4355
      504F4D5F5365727669646F7204000100000000000E53455249455F5365727669
      646F7201004900000001000557494454480200020003000D5449504F5F536572
      7669646F720100490000000100055749445448020002000300124454454D4953
      53414F5F5365727669646F72040006000000000015564C525F50524F4455544F
      535F5365727669646F72080004000000000012564C525F544F54414C5F536572
      7669646F72080004000000000015564C525F444553434F4E544F5F5365727669
      646F72080004000000000012564C525F54524F43415F5365727669646F720800
      04000000000019564C525F52454349424F5F54524F43415F5365727669646F72
      080004000000000019564C525F52454349424F5F555341444F5F536572766964
      6F72080004000000000018564C525F54524F43415F55534144415F5365727669
      646F72080004000000000017564C525F56414C455F555341444F5F5365727669
      646F72080004000000000015564C525F434153484241434B5F5365727669646F
      7208000400000000001B564C525F434153484241434B5F555341444F5F536572
      7669646F720800040000000000174E4645434841564541434553534F5F536572
      7669646F720100490000000100055749445448020002002C00154E464550524F
      544F434F4C4F5F5365727669646F720100490000000100055749445448020002
      002D00094469666572656E636101004900000001000557494454480200020001
      000F43616D706F5F4469666572656E6361010049000000010005574944544802
      00020032000A436C69656E74655F4F4B01004900000001000557494454480200
      02001E000B56656E6465646F725F4F4B01004900000001000557494454480200
      02001E001349445F434C49454E54455F5365727669646F720400010000000000
      1449445F56454E4445444F525F5365727669646F720400010000000000104944
      5F434C49454E54455F4C6F63616C04000100000000001149445F56454E444544
      4F525F4C6F63616C04000100000000000000}
    object mAuxiliarID_Local: TIntegerField
      FieldName = 'ID_Local'
    end
    object mAuxiliarNUMCUPOM_Local: TIntegerField
      FieldName = 'NUMCUPOM_Local'
    end
    object mAuxiliarSERIE_Local: TStringField
      FieldName = 'SERIE_Local'
      Size = 3
    end
    object mAuxiliarTIPO_Local: TStringField
      FieldName = 'TIPO_Local'
      Size = 3
    end
    object mAuxiliarDTEMISSAO_Local: TDateField
      FieldName = 'DTEMISSAO_Local'
    end
    object mAuxiliarVLR_PRODUTOS_Local: TFloatField
      FieldName = 'VLR_PRODUTOS_Local'
    end
    object mAuxiliarVLR_TOTAL_Local: TFloatField
      FieldName = 'VLR_TOTAL_Local'
    end
    object mAuxiliarVLR_DESCONTO_Local: TFloatField
      FieldName = 'VLR_DESCONTO_Local'
    end
    object mAuxiliarVLR_TROCA_Local: TFloatField
      FieldName = 'VLR_TROCA_Local'
    end
    object mAuxiliarVLR_RECIBO_TROCA_Local: TFloatField
      FieldName = 'VLR_RECIBO_TROCA_Local'
    end
    object mAuxiliarVLR_RECIBO_USADO_Local: TFloatField
      FieldName = 'VLR_RECIBO_USADO_Local'
    end
    object mAuxiliarVLR_TROCA_USADA_Local: TFloatField
      FieldName = 'VLR_TROCA_USADA_Local'
    end
    object mAuxiliarVLR_VALE_USADO_Local: TFloatField
      FieldName = 'VLR_VALE_USADO_Local'
    end
    object mAuxiliarVLR_CASHBACK_Local: TFloatField
      FieldName = 'VLR_CASHBACK_Local'
    end
    object mAuxiliarVLR_CASHBACK_USADO_Local: TFloatField
      FieldName = 'VLR_CASHBACK_USADO_Local'
    end
    object mAuxiliarNFECHAVEACESSO_Local: TStringField
      FieldName = 'NFECHAVEACESSO_Local'
      Size = 44
    end
    object mAuxiliarNFEPROTOCOLO_Local: TStringField
      FieldName = 'NFEPROTOCOLO_Local'
      Size = 45
    end
    object mAuxiliarID_Servidor: TIntegerField
      FieldName = 'ID_Servidor'
    end
    object mAuxiliarNUMCUPOM_Servidor: TIntegerField
      FieldName = 'NUMCUPOM_Servidor'
    end
    object mAuxiliarSERIE_Servidor: TStringField
      FieldName = 'SERIE_Servidor'
      Size = 3
    end
    object mAuxiliarTIPO_Servidor: TStringField
      FieldName = 'TIPO_Servidor'
      Size = 3
    end
    object mAuxiliarDTEMISSAO_Servidor: TDateField
      FieldName = 'DTEMISSAO_Servidor'
    end
    object mAuxiliarVLR_PRODUTOS_Servidor: TFloatField
      FieldName = 'VLR_PRODUTOS_Servidor'
    end
    object mAuxiliarVLR_TOTAL_Servidor: TFloatField
      FieldName = 'VLR_TOTAL_Servidor'
    end
    object mAuxiliarVLR_DESCONTO_Servidor: TFloatField
      FieldName = 'VLR_DESCONTO_Servidor'
    end
    object mAuxiliarVLR_TROCA_Servidor: TFloatField
      FieldName = 'VLR_TROCA_Servidor'
    end
    object mAuxiliarVLR_RECIBO_TROCA_Servidor: TFloatField
      FieldName = 'VLR_RECIBO_TROCA_Servidor'
    end
    object mAuxiliarVLR_RECIBO_USADO_Servidor: TFloatField
      FieldName = 'VLR_RECIBO_USADO_Servidor'
    end
    object mAuxiliarVLR_TROCA_USADA_Servidor: TFloatField
      FieldName = 'VLR_TROCA_USADA_Servidor'
    end
    object mAuxiliarVLR_VALE_USADO_Servidor: TFloatField
      FieldName = 'VLR_VALE_USADO_Servidor'
    end
    object mAuxiliarVLR_CASHBACK_Servidor: TFloatField
      FieldName = 'VLR_CASHBACK_Servidor'
    end
    object mAuxiliarVLR_CASHBACK_USADO_Servidor: TFloatField
      FieldName = 'VLR_CASHBACK_USADO_Servidor'
    end
    object mAuxiliarNFECHAVEACESSO_Servidor: TStringField
      FieldName = 'NFECHAVEACESSO_Servidor'
      Size = 44
    end
    object mAuxiliarNFEPROTOCOLO_Servidor: TStringField
      FieldName = 'NFEPROTOCOLO_Servidor'
      Size = 45
    end
    object mAuxiliarDiferenca: TStringField
      FieldName = 'Diferenca'
      Size = 1
    end
    object mAuxiliarCampo_Diferenca: TStringField
      FieldName = 'Campo_Diferenca'
      Size = 50
    end
    object mAuxiliarCliente_OK: TStringField
      FieldName = 'Cliente_OK'
      Size = 30
    end
    object mAuxiliarVendedor_OK: TStringField
      FieldName = 'Vendedor_OK'
      Size = 30
    end
    object mAuxiliarID_CLIENTE_Servidor: TIntegerField
      FieldName = 'ID_CLIENTE_Servidor'
    end
    object mAuxiliarID_VENDEDOR_Servidor: TIntegerField
      FieldName = 'ID_VENDEDOR_Servidor'
    end
    object mAuxiliarID_CLIENTE_Local: TIntegerField
      FieldName = 'ID_CLIENTE_Local'
    end
    object mAuxiliarID_VENDEDOR_Local: TIntegerField
      FieldName = 'ID_VENDEDOR_Local'
    end
  end
  object dsAuxiliar: TDataSource
    DataSet = mAuxiliar
    Left = 766
    Top = 103
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'select F.ID, F.NOME, F.NOME_INTERNO'#13#10'from FILIAL F  '#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 407
    Top = 167
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 443
    Top = 168
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial'
    Left = 470
    Top = 166
    object cdsFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsFilialNOME_INTERNO: TStringField
      FieldName = 'NOME_INTERNO'
      Size = 30
    end
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 528
    Top = 168
  end
  object qCliente_Servidor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT 1 EXISTE FROM PESSOA'
      'WHERE CODIGO = :CODIGO')
    SQLConnection = dmDatabase.scoServidor
    Left = 661
    Top = 188
    object qCliente_ServidorEXISTE: TIntegerField
      FieldName = 'EXISTE'
      Required = True
    end
  end
end

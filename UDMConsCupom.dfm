object DMConsCupom: TDMConsCupom
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 397
  Top = 268
  Height = 421
  Width = 618
  object sdsConsTroca: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select T.ID, T.ITEM, T.ID_CUPOM, T.ID_CUPOM_TROCA, T.ITEM_TROCA,' +
      ' T.NUM_CUPOM_TROCA, T.QTD, T.VLR_UNITARIO, T.VLR_TOTAL,'#13#10'       ' +
      'C.NUMCUPOM, C.DTEMISSAO, T.ID_PRODUTO, P.NOME NOME_PRODUTO, P.RE' +
      'FERENCIA, t.serie_troca, C.serie'#13#10'from CUPOMFISCAL_TROCA T'#13#10'inne' +
      'r join CUPOMFISCAL C on T.ID_CUPOM = C.ID'#13#10'inner join PRODUTO P ' +
      'on T.ID_PRODUTO = P.ID'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 8
  end
  object dspConsTroca: TDataSetProvider
    DataSet = sdsConsTroca
    Left = 104
    Top = 8
  end
  object cdsConsTroca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsTroca'
    Left = 144
    Top = 8
    object cdsConsTrocaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsTrocaITEM: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsTrocaID_CUPOM: TIntegerField
      DisplayLabel = 'ID Cupom'
      FieldName = 'ID_CUPOM'
    end
    object cdsConsTrocaID_CUPOM_TROCA: TIntegerField
      DisplayLabel = 'ID Cupom Troca'
      FieldName = 'ID_CUPOM_TROCA'
    end
    object cdsConsTrocaITEM_TROCA: TIntegerField
      DisplayLabel = 'Item Troca'
      FieldName = 'ITEM_TROCA'
    end
    object cdsConsTrocaNUM_CUPOM_TROCA: TIntegerField
      DisplayLabel = 'N'#186' Cupom Troca'
      FieldName = 'NUM_CUPOM_TROCA'
    end
    object cdsConsTrocaQTD: TFloatField
      DisplayLabel = 'Qtde.'
      FieldName = 'QTD'
    end
    object cdsConsTrocaVLR_UNITARIO: TFloatField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      FieldName = 'VLR_UNITARIO'
    end
    object cdsConsTrocaVLR_TOTAL: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'VLR_TOTAL'
    end
    object cdsConsTrocaNUMCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom'
      FieldName = 'NUMCUPOM'
    end
    object cdsConsTrocaDTEMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'DTEMISSAO'
    end
    object cdsConsTrocaID_PRODUTO: TIntegerField
      DisplayLabel = 'ID Produto'
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsTrocaNOME_PRODUTO: TStringField
      DisplayLabel = 'Nome Produto'
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsTrocaREFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'REFERENCIA'
    end
    object cdsConsTrocaSERIE_TROCA: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE_TROCA'
      Size = 3
    end
    object cdsConsTrocaSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 3
    end
  end
  object dsConsTroca: TDataSource
    DataSet = cdsConsTroca
    Left = 184
    Top = 8
  end
  object frxReport1: TfrxReport
    Version = '5.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintMode = pmSplit
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42671.419546678200000000
    ReportOptions.LastChange = 42811.391278831020000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 176
    Top = 120
  end
  object frxCupom_Cons: TfrxDBDataset
    UserName = 'frxCupom_Cons'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NUMCUPOM=NUMCUPOM'
      'DTEMISSAO=DTEMISSAO'
      'VLR_TOTAL=VLR_TOTAL'
      'CANCELADO=CANCELADO'
      'FILIAL=FILIAL'
      'CPF=CPF'
      'ID_TIPOCOBRANCA=ID_TIPOCOBRANCA'
      'NUM_CARTAO=NUM_CARTAO'
      'TIPO=TIPO'
      'NFEAMBIENTE=NFEAMBIENTE'
      'NFECHAVEACESSO=NFECHAVEACESSO'
      'NFEPROTOCOLO=NFEPROTOCOLO'
      'NFEVERSAO=NFEVERSAO'
      'NFERECIBO=NFERECIBO'
      'TIPO_ATENDIMENTO=TIPO_ATENDIMENTO'
      'TIPO_IMPRESSAO_NFCE=TIPO_IMPRESSAO_NFCE'
      'TIPO_ENVIONFE=TIPO_ENVIONFE'
      'NFEPROTOCOLO_CANCELADA=NFEPROTOCOLO_CANCELADA'
      'NFEFINALIDADE=NFEFINALIDADE'
      'NFEDENEGADA=NFEDENEGADA'
      'SERIE=SERIE'
      'DINHEIRO=DINHEIRO'
      'NOME_TIPOCOBRANCA=NOME_TIPOCOBRANCA'
      'QTD_PESSOA=QTD_PESSOA'
      'ID_FECHAMENTO=ID_FECHAMENTO'
      'DTFECHAMENTO=DTFECHAMENTO'
      'CLIENTE_NOME=CLIENTE_NOME'
      'CLIENTE_FONE=CLIENTE_FONE'
      'CLIENTE_ENDERECO=CLIENTE_ENDERECO'
      'CLIENTE_OBS=CLIENTE_OBS'
      'HREMISSAO=HREMISSAO'
      'VENDEDOR=VENDEDOR'
      'ESTOQUE_OK=ESTOQUE_OK'
      'FINANCEIRO_OK=FINANCEIRO_OK'
      'DTORIGINAL=DTORIGINAL'
      'VLR_TROCA=VLR_TROCA')
    BCDToCurrency = False
    Left = 176
    Top = 168
  end
  object sdsConsRecibo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select REC.ID, REC.ID_CUPOM, REC.ID_CUPOM_USADO, REC.DATA, REC.H' +
      'ORA, REC.VALOR,'#13#10'REC.USADO, REC.ITEM_CUPOM, REC.TIPO, C.NUMCUPOM' +
      ', C.SERIE, C.TIPO TIPO_CUPOM, C.DTEMISSAO,'#13#10'C2.NUMCUPOM NUMCUPOM' +
      '_USADO, C2.SERIE SERIE_USADO, C2.TIPO TIPO_USADO, C2.DTEMISSAO D' +
      'TEMISSAO_USADO,'#13#10'       case'#13#10'         when REC.TIPO = '#39'V'#39' then ' +
      #39'Vale Presente'#39#13#10'         else '#39'Recibo'#39#13#10'       end DESC_TIPO'#13#10'f' +
      'rom CUPOMFISCAL_RECT REC'#13#10'inner join CUPOMFISCAL C on REC.ID_CUP' +
      'OM = C.ID'#13#10'left join CUPOMFISCAL C2 on REC.ID_CUPOM_USADO = C2.I' +
      'D'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 288
    Top = 24
  end
  object dspConsRecibo: TDataSetProvider
    DataSet = sdsConsRecibo
    Left = 328
    Top = 24
  end
  object cdsConsRecibo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsRecibo'
    Left = 368
    Top = 24
    object cdsConsReciboID: TIntegerField
      DisplayLabel = 'N'#186' Recibo'
      FieldName = 'ID'
      Required = True
    end
    object cdsConsReciboID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
    end
    object cdsConsReciboID_CUPOM_USADO: TIntegerField
      FieldName = 'ID_CUPOM_USADO'
    end
    object cdsConsReciboDATA: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DATA'
    end
    object cdsConsReciboHORA: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
    end
    object cdsConsReciboVALOR: TFloatField
      DisplayLabel = 'Vlr. Recibo'
      FieldName = 'VALOR'
    end
    object cdsConsReciboUSADO: TStringField
      DisplayLabel = 'Usado'
      FieldName = 'USADO'
      FixedChar = True
      Size = 1
    end
    object cdsConsReciboITEM_CUPOM: TIntegerField
      DisplayLabel = 'Item Cupom'
      FieldName = 'ITEM_CUPOM'
    end
    object cdsConsReciboTIPO: TStringField
      DisplayLabel = 'Tipo Rec.'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsConsReciboNUMCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom Emiss'#227'o'
      FieldName = 'NUMCUPOM'
    end
    object cdsConsReciboSERIE: TStringField
      DisplayLabel = 'S'#233'rie Cupom'
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsConsReciboTIPO_CUPOM: TStringField
      DisplayLabel = 'Tipo Cupom'
      FieldName = 'TIPO_CUPOM'
      Size = 3
    end
    object cdsConsReciboDTEMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'DTEMISSAO'
    end
    object cdsConsReciboNUMCUPOM_USADO: TIntegerField
      DisplayLabel = 'N'#186' Cupom Troca'
      FieldName = 'NUMCUPOM_USADO'
    end
    object cdsConsReciboSERIE_USADO: TStringField
      DisplayLabel = 'S'#233'rie Troca'
      FieldName = 'SERIE_USADO'
      Size = 3
    end
    object cdsConsReciboTIPO_USADO: TStringField
      DisplayLabel = 'Tipo Cupom'
      FieldName = 'TIPO_USADO'
      Size = 3
    end
    object cdsConsReciboDTEMISSAO_USADO: TDateField
      DisplayLabel = 'Dt. Troca'
      FieldName = 'DTEMISSAO_USADO'
    end
    object cdsConsReciboDESC_TIPO: TStringField
      DisplayLabel = 'Tipo Recibo'
      FieldName = 'DESC_TIPO'
      Required = True
      FixedChar = True
      Size = 13
    end
  end
  object dsConsRecibo: TDataSource
    DataSet = cdsConsRecibo
    Left = 408
    Top = 24
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select F.ID, F.NOME, F.NOME_INTERNO, F.CNPJ_CPF'#13#10'from FILIAL F'#13#10 +
      'where F.INATIVO = '#39'N'#39'   '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 312
    Top = 144
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 352
    Top = 144
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME_INTERNO'
    Params = <>
    ProviderName = 'dspFilial'
    Left = 392
    Top = 144
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
    object cdsFilialCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 432
    Top = 144
  end
  object frxConsRecibo: TfrxDBDataset
    UserName = 'frxConsRecibo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ID_CUPOM=ID_CUPOM'
      'ID_CUPOM_USADO=ID_CUPOM_USADO'
      'DATA=DATA'
      'HORA=HORA'
      'VALOR=VALOR'
      'USADO=USADO'
      'ITEM_CUPOM=ITEM_CUPOM'
      'TIPO=TIPO'
      'NUMCUPOM=NUMCUPOM'
      'SERIE=SERIE'
      'TIPO_CUPOM=TIPO_CUPOM'
      'DTEMISSAO=DTEMISSAO'
      'NUMCUPOM_USADO=NUMCUPOM_USADO'
      'SERIE_USADO=SERIE_USADO'
      'TIPO_USADO=TIPO_USADO'
      'DTEMISSAO_USADO=DTEMISSAO_USADO'
      'DESC_TIPO=DESC_TIPO')
    DataSource = dsConsRecibo
    BCDToCurrency = False
    Left = 456
    Top = 24
  end
end

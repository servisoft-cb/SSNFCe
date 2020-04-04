object DMConsCupom: TDMConsCupom
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 397
  Top = 268
  Height = 344
  Width = 516
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
end

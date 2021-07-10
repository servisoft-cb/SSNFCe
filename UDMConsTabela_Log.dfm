object DMConsTabela_Log: TDMConsTabela_Log
  OldCreateOrder = False
  Left = 286
  Top = 252
  Height = 315
  Width = 685
  object sdsTabelas: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select RDB$RELATION_NAME NOME'#13#10'from RDB$RELATIONS'#13#10'where RDB$SYS' +
      'TEM_FLAG = 0 and'#13#10'      RDB$RELATION_NAME like '#39'%_LOG%'#39'   '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 88
    Top = 32
  end
  object dspTabelas: TDataSetProvider
    DataSet = sdsTabelas
    Left = 128
    Top = 32
  end
  object cdsTabelas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabelas'
    Left = 168
    Top = 32
    object cdsTabelasNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 31
    end
  end
  object dsTabelas: TDataSource
    DataSet = cdsTabelas
    Left = 208
    Top = 32
  end
  object sdsLog: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select ID, ID_TERMINAL, TIPO, 0 NUMCUPOM, 0 FILIAL, '#39' '#39' TIPO_CUP' +
      'OM'#13#10'from CUPOMFISCAL_LOG  '#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 392
    Top = 64
  end
  object dspLog: TDataSetProvider
    DataSet = sdsLog
    Left = 432
    Top = 64
  end
  object cdsLog: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLog'
    Left = 472
    Top = 64
    object cdsLogID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLogID_TERMINAL: TIntegerField
      FieldName = 'ID_TERMINAL'
      Required = True
    end
    object cdsLogTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object cdsLogNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
      Required = True
    end
    object cdsLogFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdsLogTIPO_CUPOM: TStringField
      FieldName = 'TIPO_CUPOM'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsLog: TDataSource
    DataSet = cdsLog
    Left = 512
    Top = 64
  end
end

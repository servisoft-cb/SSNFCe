object DMUsuario: TDMUsuario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 492
  Top = 246
  Height = 379
  Width = 506
  object sdsUsuario: TSQLDataSet
    CommandText = 
      'select U.uciduser, u.ucusername, u.uclogin, u.senhahash'#13#10'from UC' +
      'TABUSERS U'#13#10'where U.UCLOGIN = :UCLOGIN   '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UCLOGIN'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 72
    object sdsUsuarioUCIDUSER: TIntegerField
      FieldName = 'UCIDUSER'
    end
    object sdsUsuarioUCUSERNAME: TStringField
      FieldName = 'UCUSERNAME'
      Size = 30
    end
    object sdsUsuarioUCLOGIN: TStringField
      FieldName = 'UCLOGIN'
      Size = 30
    end
    object sdsUsuarioSENHAHASH: TStringField
      FieldName = 'SENHAHASH'
      Size = 100
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = sdsUsuario
    Left = 112
    Top = 72
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'UCLOGIN'
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 144
    Top = 72
    object cdsUsuarioUCIDUSER: TIntegerField
      FieldName = 'UCIDUSER'
    end
    object cdsUsuarioUCUSERNAME: TStringField
      FieldName = 'UCUSERNAME'
      Size = 30
    end
    object cdsUsuarioUCLOGIN: TStringField
      FieldName = 'UCLOGIN'
      Size = 30
    end
    object cdsUsuarioSENHAHASH: TStringField
      FieldName = 'SENHAHASH'
      Size = 100
    end
  end
  object dsUsuario: TDataSource
    DataSet = cdsUsuario
    Left = 176
    Top = 72
  end
end

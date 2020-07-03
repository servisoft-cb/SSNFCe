object fCupomCliente: TfCupomCliente
  Left = 361
  Top = 161
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'fCupomCliente'
  ClientHeight = 444
  ClientWidth = 638
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 403
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.0.1.0'
    AutoHideChildren = False
    BorderColor = clGray
    BorderShadow = True
    Caption.Color = clWhite
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.Indent = 4
    Caption.ShadeLight = 255
    Caption.ShadeType = stRMetal
    CollapsColor = clBtnFace
    CollapsDelay = 0
    ColorTo = 15000804
    HoverColor = clBlack
    HoverFontColor = clBlack
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clWhite
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14606046
    StatusBar.ColorTo = 11119017
    Styler = dmCupomFiscal.AdvPanelStyler1
    URLColor = clTeal
    FullHeight = 0
    object Label1: TLabel
      Left = 70
      Top = 44
      Width = 65
      Height = 18
      Alignment = taRightJustify
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 98
      Top = 72
      Width = 37
      Height = 18
      Alignment = taRightJustify
      Caption = 'CPF:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 54
      Top = 94
      Width = 81
      Height = 18
      Alignment = taRightJustify
      Caption = 'Endere'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 33
      Top = 210
      Width = 102
      Height = 18
      Alignment = taRightJustify
      Caption = 'Observa'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblAtendimento: TLabel
      Left = 27
      Top = 242
      Width = 153
      Height = 18
      Alignment = taRightJustify
      Caption = 'Tipo Atendimento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblTransportadora: TLabel
      Left = 49
      Top = 265
      Width = 131
      Height = 18
      Alignment = taRightJustify
      Caption = 'Transportadora:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 89
      Top = 16
      Width = 46
      Height = 18
      Alignment = taRightJustify
      Caption = 'Fone:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object edtCliente: TDBEdit
      Left = 142
      Top = 36
      Width = 343
      Height = 26
      CharCase = ecUpperCase
      DataField = 'CLIENTE_NOME'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtCpf: TDBEdit
      Left = 142
      Top = 64
      Width = 177
      Height = 26
      CharCase = ecUpperCase
      DataField = 'CPF'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object mmEndereco: TDBMemo
      Left = 142
      Top = 92
      Width = 369
      Height = 113
      DataField = 'CLIENTE_ENDERECO'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Vwe'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object mmObs: TDBMemo
      Left = 142
      Top = 207
      Width = 369
      Height = 98
      DataField = 'CLIENTE_OBS'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Vwe'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object comboAtendimento: TRxDBComboBox
      Left = 184
      Top = 234
      Width = 303
      Height = 26
      Style = csDropDownList
      DataField = 'TIPO_ATENDIMENTO'
      DataSource = dmCupomFiscal.dsCupomFiscal
      EnableValues = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ItemHeight = 18
      Items.Strings = (
        'Opera'#231#227'o presencial'
        'NFC-e em opera'#231#227'o com entrega em domic'#237'lio')
      ParentFont = False
      TabOrder = 6
      Values.Strings = (
        '1'
        '4')
      OnExit = comboAtendimentoExit
    end
    object comboTransportadora: TRxDBLookupCombo
      Left = 184
      Top = 261
      Width = 303
      Height = 23
      DropDownCount = 8
      DataField = 'ID_TRANSPORTADORA'
      DataSource = dmCupomFiscal.dsCupomFiscal
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME'
      LookupSource = dmCupomFiscal.dsTransp
      TabOrder = 7
    end
    object BitBtn1: TBitBtn
      Left = 486
      Top = 36
      Width = 25
      Height = 25
      Hint = 'Procura cadastro'
      Caption = 'F6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object edtTelefone: TAdvMaskEdit
      Left = 142
      Top = 8
      Width = 154
      Height = 27
      Color = clWindow
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnExit = edtTelefoneExit
      OnKeyDown = edtTelefoneKeyDown
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clWindow
      FocusBorder = False
      FocusFontColor = clBlack
      LabelAlwaysEnabled = False
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '2.8.6.1'
    end
    object pnlGrid: TAdvPanel
      Left = 0
      Top = 328
      Width = 638
      Height = 75
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 8
      UseDockManager = True
      Visible = False
      Version = '2.0.1.0'
      AutoHideChildren = False
      BorderColor = clGray
      BorderShadow = True
      Caption.Color = clWhite
      Caption.ColorTo = clNone
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clBlack
      Caption.Font.Height = -11
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.Indent = 4
      Caption.ShadeLight = 255
      Caption.ShadeType = stRMetal
      CollapsColor = clBtnFace
      CollapsDelay = 0
      ColorTo = 15000804
      HoverColor = clBlack
      HoverFontColor = clBlack
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = clWhite
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clBlack
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 14606046
      StatusBar.ColorTo = 11119017
      Styler = dmCupomFiscal.AdvPanelStyler1
      URLColor = clTeal
      FullHeight = 0
      object gridDados: TSMDBGrid
        Left = 0
        Top = 0
        Width = 638
        Height = 75
        Align = alClient
        DataSource = dsClientes
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = gridDadosDblClick
        Flat = False
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
            Expanded = False
            FieldName = 'CLIENTE_NOME'
            Title.Alignment = taCenter
            Width = 155
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE_FONE'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE_ENDERECO'
            Title.Alignment = taCenter
            Width = 253
            Visible = True
          end>
      end
    end
  end
  object AdvPanel2: TAdvPanel
    Left = 0
    Top = 403
    Width = 638
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Version = '2.0.1.0'
    AutoHideChildren = False
    BorderColor = clGray
    BorderShadow = True
    Caption.Color = clWhite
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.Indent = 4
    Caption.ShadeLight = 255
    Caption.ShadeType = stRMetal
    CollapsColor = clBtnFace
    CollapsDelay = 0
    ColorTo = 15000804
    HoverColor = clBlack
    HoverFontColor = clBlack
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clWhite
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14606046
    StatusBar.ColorTo = 11119017
    Styler = dmCupomFiscal.AdvPanelStyler1
    URLColor = clTeal
    FullHeight = 0
    object btConfirmar: TNxButton
      Left = 94
      Top = 5
      Width = 187
      Height = 30
      Caption = '&Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 0
      Transparent = True
      OnClick = btConfirmarClick
    end
    object brCancelar: TNxButton
      Left = 329
      Top = 5
      Width = 187
      Height = 30
      Caption = 'Ca&ncelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 1
      TabStop = False
      Transparent = True
      OnClick = brCancelarClick
    end
  end
  object sdsClientes: TSQLDataSet
    CommandText = 
      'SELECT DISTINCT CLIENTE_NOME, CLIENTE_FONE, CLIENTE_ENDERECO, CP' +
      'F, CLIENTE_OBS'#13#10'FROM CUPOMFISCAL'#13#10'WHERE CLIENTE_FONE LIKE :F1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'F1'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 336
    Top = 8
  end
  object dspClientes: TDataSetProvider
    DataSet = sdsClientes
    Left = 368
    Top = 8
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 400
    Top = 8
    object cdsClientesCLIENTE_NOME: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'CLIENTE_NOME'
      Size = 30
    end
    object cdsClientesCLIENTE_FONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CLIENTE_FONE'
    end
    object cdsClientesCPF: TStringField
      DisplayWidth = 12
      FieldName = 'CPF'
      Size = 18
    end
    object cdsClientesCLIENTE_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'CLIENTE_ENDERECO'
      Size = 120
    end
    object cdsClientesCLIENTE_OBS: TStringField
      FieldName = 'CLIENTE_OBS'
      Size = 250
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 432
    Top = 8
  end
end

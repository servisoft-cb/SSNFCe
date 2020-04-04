object frmCupom_Troca: TfrmCupom_Troca
  Left = 343
  Top = 73
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCupom_Troca'
  ClientHeight = 524
  ClientWidth = 963
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
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 106
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Produto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 164
      Top = 51
      Width = 64
      Height = 13
      Caption = 'N'#186' Cupom'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 313
      Top = 51
      Width = 34
      Height = 13
      Caption = 'S'#233'rie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 379
      Top = 51
      Width = 34
      Height = 13
      Caption = 'Qtde.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 528
      Top = 51
      Width = 78
      Height = 13
      Caption = 'Vlr. Unit'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 676
      Top = 51
      Width = 59
      Height = 13
      Caption = 'Vlr. Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 16
      Top = 51
      Width = 70
      Height = 13
      Caption = 'ID Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblNome: TLabel
      Left = 222
      Top = 11
      Width = 595
      Height = 18
      AutoSize = False
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object btnConfirmar: TNxButton
      Left = 856
      Top = 10
      Width = 75
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = btnConfirmarClick
    end
    object Edit1: TEdit
      Left = 72
      Top = 6
      Width = 145
      Height = 32
      BevelEdges = []
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnEnter = Edit1Enter
      OnKeyDown = Edit1KeyDown
    end
    object ceNumCupom: TCurrencyEdit
      Left = 164
      Top = 66
      Width = 145
      Height = 31
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      Color = 11579568
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnEnter = ceNumCupomEnter
      OnKeyDown = ceNumCupomKeyDown
    end
    object edtSerie: TEdit
      Left = 313
      Top = 65
      Width = 63
      Height = 32
      TabStop = False
      BevelEdges = []
      BorderStyle = bsNone
      Color = 11579568
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 379
      Top = 66
      Width = 145
      Height = 31
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DecimalPlaces = 3
      DisplayFormat = '0.000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      Value = 1.000000000000000000
      OnExit = CurrencyEdit1Exit
      OnKeyDown = CurrencyEdit1KeyDown
    end
    object ceVlr_Unitario: TCurrencyEdit
      Left = 528
      Top = 66
      Width = 145
      Height = 31
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DecimalPlaces = 4
      DisplayFormat = '0.000#'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      OnExit = ceVlr_UnitarioExit
      OnKeyDown = ceVlr_UnitarioKeyDown
    end
    object ceVlr_Total: TCurrencyEdit
      Left = 676
      Top = 66
      Width = 145
      Height = 31
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DisplayFormat = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      OnEnter = ceVlr_TotalEnter
      OnExit = ceVlr_TotalExit
      OnKeyDown = ceVlr_TotalKeyDown
    end
    object ceID_Produto: TCurrencyEdit
      Left = 16
      Top = 66
      Width = 145
      Height = 31
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      Color = 11579568
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object btnExcluir: TNxButton
      Left = 856
      Top = 42
      Width = 75
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = btnExcluirClick
    end
    object btnCancelar: TNxButton
      Left = 856
      Top = 74
      Width = 75
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = btnCancelarClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 130
    Width = 963
    Height = 394
    Align = alClient
    Ctl3D = False
    DataSource = dmCupomFiscal.dsCupom_Troca
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
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
    ColCount = 11
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16757606
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16757606
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_CUPOM_TROCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16757606
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE_TROCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'S'#233'rie Troca'
        Title.Color = 16757606
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM_TROCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16757606
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16757606
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16757606
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_UNITARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16757606
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16757606
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clNome_Produto'
        Title.Alignment = taCenter
        Title.Caption = 'Produto'
        Title.Color = 16757606
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 282
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 106
    Width = 963
    Height = 24
    Align = alTop
    TabOrder = 2
    object lblObs: TLabel
      Left = 21
      Top = 4
      Width = 5
      Height = 16
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end

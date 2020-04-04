object frmCadProduto_Consumo: TfrmCadProduto_Consumo
  Left = 292
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro dos Itens'
  ClientHeight = 193
  ClientWidth = 773
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
  object Panel3: TPanel
    Left = 0
    Top = 159
    Width = 773
    Height = 34
    Align = alBottom
    Color = 8404992
    TabOrder = 1
    object BitBtn4: TBitBtn
      Left = 393
      Top = 5
      Width = 98
      Height = 25
      Caption = '(F10) Ca&ncelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
    end
    object BitBtn1: TBitBtn
      Left = 291
      Top = 5
      Width = 98
      Height = 25
      Caption = '&Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 159
    Align = alClient
    Color = clMoneyGreen
    TabOrder = 0
    TabStop = True
    object Label4: TLabel
      Left = 79
      Top = 92
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtd. Consumo:'
    end
    object Label10: TLabel
      Left = 51
      Top = 47
      Width = 97
      Height = 13
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia/Material:'
    end
    object Label1: TLabel
      Left = 106
      Top = 70
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidade:'
    end
    object Label2: TLabel
      Left = 428
      Top = 83
      Width = 140
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtd. Por Unidade do Produto:'
    end
    object Label12: TLabel
      Left = 410
      Top = 24
      Width = 124
      Height = 13
      Caption = 'F2 para pesquisar Material'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblID: TLabel
      Left = 135
      Top = 25
      Width = 14
      Height = 13
      Alignment = taRightJustify
      Caption = 'ID:'
    end
    object DBEdit2: TDBEdit
      Left = 150
      Top = 84
      Width = 152
      Height = 21
      DataField = 'QTD_CONSUMO'
      DataSource = dmCadProduto.dsProduto_Consumo
      TabOrder = 4
      OnExit = DBEdit2Exit
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 303
      Top = 39
      Width = 329
      Height = 21
      DropDownCount = 8
      DataField = 'ID_MATERIAL'
      DataSource = dmCadProduto.dsProduto_Consumo
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = dmCadProduto.dsMaterial
      TabOrder = 2
      OnEnter = RxDBLookupCombo2Enter
      OnExit = RxDBLookupCombo2Exit
    end
    object DBEdit3: TDBEdit
      Left = 570
      Top = 75
      Width = 107
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'QTD_UNIDADE'
      DataSource = dmCadProduto.dsProduto_Consumo
      ReadOnly = True
      TabOrder = 5
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 150
      Top = 39
      Width = 152
      Height = 21
      DropDownCount = 8
      DataField = 'ID_MATERIAL'
      DataSource = dmCadProduto.dsProduto_Consumo
      LookupField = 'ID'
      LookupDisplay = 'REFERENCIA'
      LookupSource = dmCadProduto.dsMaterial
      TabOrder = 1
      OnEnter = RxDBLookupCombo1Enter
      OnExit = RxDBLookupCombo1Exit
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 150
      Top = 61
      Width = 104
      Height = 21
      DropDownCount = 8
      DataField = 'UNIDADE'
      DataSource = dmCadProduto.dsProduto_Consumo
      LookupField = 'UNIDADE'
      LookupDisplay = 'UNIDADE'
      LookupSource = dmCadProduto.dsUnidade
      TabOrder = 3
      OnEnter = RxDBLookupCombo2Enter
    end
    object dbedtID: TDBEdit
      Left = 150
      Top = 17
      Width = 107
      Height = 21
      Color = clWhite
      DataField = 'ID_MATERIAL'
      DataSource = dmCadProduto.dsProduto_Consumo
      TabOrder = 0
      OnEnter = dbedtIDEnter
      OnExit = dbedtIDExit
    end
  end
end

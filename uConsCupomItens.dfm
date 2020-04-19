object frmConsCupomItens: TfrmConsCupomItens
  Left = 170
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Itens Cupons'
  ClientHeight = 533
  ClientWidth = 1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1091
    Height = 60
    Align = alTop
    TabOrder = 0
    object dbtDataEmissao: TDBText
      Left = 112
      Top = 3
      Width = 84
      Height = 14
      DataField = 'DTEMISSAO'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 4
      Width = 82
      Height = 13
      Caption = 'Data Emiss'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 205
      Top = 4
      Width = 82
      Height = 13
      Caption = 'Hora Emiss'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtHoraEmissao: TDBText
      Left = 293
      Top = 3
      Width = 65
      Height = 14
      DataField = 'HREMISSAO'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 41
      Top = 19
      Width = 65
      Height = 13
      Caption = 'N'#250'm NFCe:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtNumCupom: TDBText
      Left = 112
      Top = 19
      Width = 65
      Height = 14
      DataField = 'NUMCUPOM'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 456
      Top = 4
      Width = 72
      Height = 13
      Caption = 'Chave Acesso:'
    end
    object dbtChaveAcesso: TDBText
      Left = 536
      Top = 3
      Width = 345
      Height = 14
      DataField = 'NFECHAVEACESSO'
      DataSource = dmCupomFiscal.dsCupomFiscal
    end
    object Label5: TLabel
      Left = 480
      Top = 20
      Width = 48
      Height = 13
      Caption = 'Protocolo:'
    end
    object dbtProtocolo: TDBText
      Left = 536
      Top = 19
      Width = 153
      Height = 14
      DataField = 'NFEPROTOCOLO'
      DataSource = dmCupomFiscal.dsCupomFiscal
    end
    object Label6: TLabel
      Left = 253
      Top = 20
      Width = 34
      Height = 13
      Caption = 'S'#233'rie:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtSerie: TDBText
      Left = 293
      Top = 19
      Width = 65
      Height = 14
      DataField = 'SERIE'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 53
      Top = 34
      Width = 53
      Height = 13
      Caption = 'Terminal:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtTerminal: TDBText
      Left = 112
      Top = 34
      Width = 65
      Height = 14
      DataField = 'TERMINAL_ID'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 491
      Top = 35
      Width = 37
      Height = 13
      Caption = 'Recibo:'
    end
    object dbtRecibo: TDBText
      Left = 537
      Top = 34
      Width = 153
      Height = 14
      DataField = 'NFERECIBO'
      DataSource = dmCupomFiscal.dsCupomFiscal
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 60
    Width = 1091
    Height = 473
    ActivePage = TS_Itens
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    FixedDimension = 19
    object TS_Itens: TRzTabSheet
      Caption = 'Itens'
      object pnlPrincipal: TPanel
        Left = 0
        Top = 0
        Width = 1087
        Height = 450
        Align = alClient
        TabOrder = 0
        object gridConsulta: TSMDBGrid
          Left = 1
          Top = 1
          Width = 1085
          Height = 324
          Align = alClient
          Ctl3D = False
          DataSource = dmCupomFiscal.dsCupom_Itens
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 0
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
          GridStyle.Style = gsAquaBlue
          GridStyle.OddColor = 16774361
          GridStyle.EvenColor = 16768959
          TitleHeight.PixelCount = 24
          FooterColor = clBtnFace
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'gridConsulta'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 15
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'ITEM'
              Title.Alignment = taCenter
              Title.Caption = 'Item'
              Title.Color = 11992940
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_PRODUTO'
              Title.Alignment = taCenter
              Title.Caption = 'Cod.Produto'
              Title.Color = 11992940
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_PRODUTO'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Produto'
              Title.Color = 11992940
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD'
              Title.Alignment = taCenter
              Title.Caption = 'Qtde'
              Title.Color = 11992940
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERC_ICMS'
              Title.Alignment = taCenter
              Title.Caption = '% ICMS'
              Title.Color = 11992940
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_UNITARIO'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr Unit'#225'rio'
              Title.Color = 11992940
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'clValorTotalDesconto'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr Desconto'
              Title.Color = 11992940
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASE_ICMS'
              Title.Alignment = taCenter
              Title.Caption = 'Base ICMS'
              Title.Color = 11992940
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_ICMS'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr ICMS'
              Title.Color = 11992940
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_TOTAL'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr Total'
              Title.Color = 11992940
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_DESCONTO'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Desconto'
              Title.Color = 11992940
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_DESCONTORATEIO'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Desconto Rateio'
              Title.Color = 11992940
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASE_ICMSSUBST_RET'
              Title.Alignment = taCenter
              Title.Caption = 'Base ICMS Ret. Ant.'
              Title.Color = 11992940
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_ICMSSUBST_RET'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. ICMS retido ant.'
              Title.Color = 11992940
              Visible = True
            end>
        end
        object pnlTroca: TPanel
          Left = 1
          Top = 325
          Width = 1085
          Height = 124
          Align = alBottom
          TabOrder = 1
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 1083
            Height = 122
            Align = alClient
            Caption = ' Itens de Troca '
            TabOrder = 0
            object SMDBGrid1: TSMDBGrid
              Left = 2
              Top = 15
              Width = 1079
              Height = 105
              Align = alClient
              Ctl3D = False
              DataSource = dmCupomFiscal.dsCupom_Troca
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ParentCtl3D = False
              TabOrder = 0
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
              GridStyle.Style = gsAquaBlue
              GridStyle.OddColor = 16774361
              GridStyle.EvenColor = 16768959
              TitleHeight.PixelCount = 24
              FooterColor = clBtnFace
              ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
              RegistryKey = 'Software\Scalabium'
              RegistrySection = 'gridConsulta'
              WidthOfIndicator = 11
              DefaultRowHeight = 16
              ScrollBars = ssHorizontal
              ColCount = 11
              RowCount = 2
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NUM_CUPOM_TROCA'
                  Title.Color = 13828006
                  Width = 73
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERIE_TROCA'
                  Title.Color = 13828006
                  Width = 51
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ITEM_TROCA'
                  Title.Color = 13828006
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_PRODUTO'
                  Title.Color = 13828006
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QTD'
                  Title.Color = 13828006
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLR_UNITARIO'
                  Title.Color = 13828006
                  Width = 87
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLR_TOTAL'
                  Title.Color = 13828006
                  Width = 91
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'clNome_Produto'
                  Title.Color = 13828006
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID'
                  Title.Color = 13828006
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ITEM'
                  Title.Color = 13828006
                  Visible = True
                end>
            end
          end
        end
      end
    end
    object TS_Pagamentos: TRzTabSheet
      Caption = 'Pagamentos'
      object SMDBGrid2: TSMDBGrid
        Left = 618
        Top = 0
        Width = 469
        Height = 450
        Align = alClient
        Ctl3D = False
        DataSource = dmCupomFiscal.dsConsCupom_FormaPagto
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
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
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_TIPOCOBRANCA'
            Title.Alignment = taCenter
            Title.Caption = 'ID Tipo'
            Title.Color = 16777164
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_TIPOCOBRANCA'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Forma Pagamento'
            Title.Color = 16777164
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Title.Color = 16777164
            Width = 95
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TIPO_PGTO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo Pagto'
            Title.Color = 16777164
            Visible = True
          end>
      end
      object SMDBGrid3: TSMDBGrid
        Left = 0
        Top = 0
        Width = 608
        Height = 450
        Align = alLeft
        Ctl3D = False
        DataSource = dmCupomFiscal.dsCupom_Parc
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
        ColCount = 6
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PARCELA'
            Title.Alignment = taCenter
            Title.Caption = 'Parcela'
            Title.Color = 8454143
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTVENCIMENTO'
            Title.Caption = 'Data Vecto.'
            Title.Color = 8454143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_VENCIMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Vencimento'
            Title.Color = 8454143
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_TIPOCOBRANCA'
            Title.Alignment = taCenter
            Title.Caption = 'ID Tipo'
            Title.Color = 8454143
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_COBRANCA'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Tipo Conbran'#231'a'
            Title.Color = 8454143
            Width = 279
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 608
        Top = 0
        Width = 10
        Height = 450
        Align = alLeft
        Color = 16744448
        TabOrder = 2
      end
    end
  end
end

object frmCadFechamento_Det: TfrmCadFechamento_Det
  Left = 167
  Top = 64
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadFechamento_Det'
  ClientHeight = 626
  ClientWidth = 1013
  Color = clBtnFace
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
  object pnlPrincipal: TAdvPanel
    Left = 0
    Top = 0
    Width = 1013
    Height = 626
    Align = alClient
    BevelWidth = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.0.1.0'
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    FullHeight = 0
    object SMDBGrid1: TSMDBGrid
      Left = 10
      Top = 10
      Width = 993
      Height = 396
      Align = alClient
      Ctl3D = False
      DataSource = DMCadFechamento.dsCupomFecDet
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
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
      ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 9
      RowCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Title.Color = 14798525
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_DOC'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Doc'
          Title.Color = 14798525
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FORMA_PAGAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Forma Pagamento'
          Title.Color = 14798525
          Width = 172
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_ENTRADA'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Entrada'
          Title.Color = 14798525
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_SAIDA'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Sa'#237'da'
          Title.Color = 14798525
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTEMISSAO'
          Title.Alignment = taCenter
          Title.Caption = 'Data Emiss'#227'o'
          Title.Color = 14798525
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_DOC'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo Doc'
          Title.Color = 14798525
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HISTORICO'
          Title.Alignment = taCenter
          Title.Caption = 'Hist'#243'rico'
          Title.Color = 14798525
          Width = 350
          Visible = True
        end>
    end
    object NxPanel1: TNxPanel
      Left = 10
      Top = 406
      Width = 993
      Height = 210
      Align = alBottom
      UseDockManager = False
      ParentBackground = False
      TabOrder = 1
      object RzGroupBox1: TRzGroupBox
        Left = 0
        Top = 0
        Width = 993
        Height = 210
        Align = alClient
        Caption = ' Totais por forma de pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object SMDBGrid2: TSMDBGrid
          Left = 1
          Top = 19
          Width = 991
          Height = 190
          Align = alClient
          Ctl3D = False
          DataSource = DMCadFechamento.dsCupomFecTotal
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -16
          TitleFont.Name = 'Verdana'
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
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 22
          ScrollBars = ssHorizontal
          ColCount = 7
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME_FORMA_PAGAMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Caption = 'Forma Pagamento'
              Title.Color = 12255093
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 237
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Tipo Reg'
              Title.Color = 12255093
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_DOC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Tipo Cupom'
              Title.Color = 12255093
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_ENTRADA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Entrada'
              Title.Color = 12255093
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_SAIDA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Sa'#237'da'
              Title.Color = 12255093
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTADOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Qtd. Registro'
              Title.Color = 12255093
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 101
              Visible = True
            end>
        end
      end
    end
  end
end

object frmCadFechamento_Contagem2: TfrmCadFechamento_Contagem2
  Left = 439
  Top = 107
  Width = 564
  Height = 563
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'frmCadFechamento_Contagem2'
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
  object Panel1: TPanel
    Left = 0
    Top = 483
    Width = 548
    Height = 41
    Align = alBottom
    Color = clSilver
    TabOrder = 1
    object btConfirmar: TNxButton
      Left = 95
      Top = 6
      Width = 187
      Height = 30
      Caption = '&Confirmar (F10)'
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
      Left = 282
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
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 40
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 38
      Top = 12
      Width = 120
      Height = 14
      Caption = 'Data Fechamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 292
      Top = 13
      Width = 221
      Height = 13
      Caption = 'Informe  a data e pressione Enter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dateFachamento: TDateEdit
      Left = 165
      Top = 7
      Width = 121
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyDown = dateFachamentoKeyDown
    end
  end
  object gridContagem: TDBGrid
    Left = 0
    Top = 40
    Width = 548
    Height = 443
    Align = alClient
    DataSource = DMCadFechamento.dsmContagem
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Columns = <
      item
        Color = clBtnFace
        Expanded = False
        FieldName = 'NOME_TIPOCOBRANCA'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Forma de Pagamento'
        Title.Color = 16761220
        Width = 337
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Valor Informado'
        Title.Color = 16761220
        Width = 172
        Visible = True
      end>
  end
end

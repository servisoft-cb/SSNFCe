object frmCanalVendas: TfrmCanalVendas
  Left = 378
  Top = 302
  Width = 513
  Height = 336
  BorderIcons = []
  Caption = 'Escolhe o Canal de Vendas'
  Color = 15656155
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 288
    Top = 69
    Width = 195
    Height = 56
    Caption = 'Informe o ID do '#13#10'Canal Vendas:'
    Color = 15195349
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object gridPagamentosDisponiveis: TDBGrid
    Left = 0
    Top = 0
    Width = 278
    Height = 297
    TabStop = False
    Align = alLeft
    Color = clSilver
    DataSource = dmCupomFiscal.dsCanalVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsItalic]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -12
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold, fsItalic]
    OnDblClick = gridPagamentosDisponiveisDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        Title.Alignment = taCenter
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        Title.Alignment = taCenter
        Width = 218
        Visible = True
      end>
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 288
    Top = 136
    Width = 185
    Height = 36
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyDown = CurrencyEdit1KeyDown
  end
end

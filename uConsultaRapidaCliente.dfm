object frmConsultaRapidaCliente: TfrmConsultaRapidaCliente
  Left = 385
  Top = 163
  BorderStyle = bsSingle
  Caption = 'frmConsultaRapidaCliente'
  ClientHeight = 334
  ClientWidth = 690
  Color = 5278518
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object LblTituloTela: TRxLabel
    Left = 0
    Top = 0
    Width = 690
    Height = 45
    Align = alTop
    Alignment = taCenter
    Caption = 'Consulta de Clientes'
    Color = 5278518
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -37
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShadowColor = clBlack
    ShadowSize = 2
    ShadowPos = spRightBottom
    Transparent = True
  end
  object VALOR: TEdit
    Left = 9
    Top = 48
    Width = 672
    Height = 35
    CharCase = ecUpperCase
    Color = clWhite
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnKeyDown = VALORKeyDown
  end
  object DBGridLista: TDBGrid
    Left = 9
    Top = 89
    Width = 671
    Height = 232
    BorderStyle = bsNone
    Color = clWhite
    Ctl3D = False
    DataSource = dsCliente
    FixedColor = 14731440
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnKeyDown = DBGridListaKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Width = 295
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 576
    Top = 168
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 168
    object cdsClienteCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsClienteNome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
    object cdsClienteTelefone: TStringField
      FieldName = 'Telefone'
    end
    object cdsClienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
  end
end

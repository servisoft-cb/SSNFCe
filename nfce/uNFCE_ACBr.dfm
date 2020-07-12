object fNFCE_ACBR: TfNFCE_ACBR
  Left = 221
  Top = 86
  Width = 1057
  Height = 563
  Caption = 'Envia NFCe'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = documento
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1041
    Height = 80
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 72
      Top = 33
      Width = 47
      Height = 13
      Caption = 'Ambiente:'
    end
    object ComboAmbiente: TComboBox
      Left = 123
      Top = 25
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Produ'#231#227'o'
      Items.Strings = (
        'Produ'#231#227'o'
        'Homologa'#231#227'o')
    end
    object pnlErro: TPanel
      Left = 1
      Top = 56
      Width = 1039
      Height = 23
      Align = alBottom
      TabOrder = 1
      object lbErro: TLabel
        Left = 9
        Top = 2
        Width = 543
        Height = 23
        AutoSize = False
        Caption = 'Nota Denegada - Irregularidade Destinat'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
    end
    object chkGravarXml: TCheckBox
      Left = 712
      Top = 40
      Width = 153
      Height = 17
      Caption = 'Gravar XML em c:\A'
      TabOrder = 2
      Visible = False
    end
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 80
    Width = 1041
    Height = 404
    Align = alClient
    TabOrder = 1
    object RzPageControl1: TRzPageControl
      Left = 1
      Top = 1
      Width = 1039
      Height = 402
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      FixedDimension = 19
      object TabSheet1: TRzTabSheet
        Caption = 'Principal'
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 1035
          Height = 72
          Align = alTop
          Caption = 'Envio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label6: TLabel
            Left = 51
            Top = 14
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recibo:'
          end
          object Label7: TLabel
            Left = 9
            Top = 30
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Protocolo:'
          end
          object Label8: TLabel
            Left = 10
            Top = 46
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Chave Acesso:'
          end
          object lbRecibo: TLabel
            Left = 98
            Top = 14
            Width = 352
            Height = 13
            AutoSize = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lbNroProtocolo: TLabel
            Left = 98
            Top = 30
            Width = 352
            Height = 13
            AutoSize = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lbChaveAcesso: TLabel
            Left = 98
            Top = 46
            Width = 352
            Height = 13
            AutoSize = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object btDanfe: TButton
            Left = 623
            Top = 14
            Width = 89
            Height = 50
            Caption = '&DANFE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object btEnviarNovo: TButton
            Left = 532
            Top = 14
            Width = 89
            Height = 50
            Caption = 'Enviar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btEnviarNovoClick
          end
          object btImprimir: TButton
            Left = 714
            Top = 14
            Width = 89
            Height = 50
            Caption = 'Imprimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = btImprimirClick
          end
          object btnInutilizar: TButton
            Left = 806
            Top = 14
            Width = 89
            Height = 50
            Caption = 'Inutilizar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = btnInutilizarClick
          end
          object btnConsultarNFCeWeb: TButton
            Left = 897
            Top = 14
            Width = 89
            Height = 50
            Caption = 'Consultar Web'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = btnConsultarNFCeWebClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 72
          Width = 1035
          Height = 48
          Align = alTop
          Caption = 'Cancelamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label10: TLabel
            Left = 9
            Top = 16
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Protocolo:'
          end
          object lbNroProtocoloCancelamento: TLabel
            Left = 100
            Top = 14
            Width = 413
            Height = 13
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object btCancelar: TBitBtn
            Left = 532
            Top = 9
            Width = 89
            Height = 36
            Caption = 'Cancelar'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btCancelarClick
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 120
          Width = 1035
          Height = 72
          Align = alTop
          Caption = 'Prevenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object btImpresaoPreVenda: TButton
            Left = 42
            Top = 14
            Width = 89
            Height = 50
            Caption = 'Imprimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btImpresaoPreVendaClick
          end
          object mmPreVenda: TMemo
            Left = 136
            Top = 16
            Width = 97
            Height = 49
            TabOrder = 1
          end
        end
      end
    end
  end
  object pnlBotton: TPanel
    Left = 0
    Top = 484
    Width = 1041
    Height = 41
    Align = alBottom
    TabOrder = 2
  end
end

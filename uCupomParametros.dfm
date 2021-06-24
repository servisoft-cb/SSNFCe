object fCupomParametros: TfCupomParametros
  Left = 106
  Top = 6
  Width = 1095
  Height = 724
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'fCupomParametros'
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label88: TLabel
    Left = 7
    Top = 28
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'Superior:'
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1079
    Height = 35
    Align = alTop
    Color = 8404992
    TabOrder = 0
    object btnConfirmar: TBitBtn
      Left = 80
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Confirmar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TBitBtn
      Left = 155
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Ca&ncelar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnAlterar: TBitBtn
      Left = 5
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnAlterarClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 35
    Width = 1079
    Height = 651
    ActivePage = TS_Impressao_SSNFCe
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Configura'#231#227'o'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1071
        Height = 623
        Align = alClient
        Enabled = False
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 4
          Top = 148
          Width = 445
          Height = 257
          Caption = 'Estoque'
          TabOrder = 2
          object Label36: TLabel
            Left = 23
            Top = 56
            Width = 187
            Height = 13
            Alignment = taRightJustify
            Caption = 'Baixar Estoque do Consumo no Cupom:'
          end
          object Label33: TLabel
            Left = 102
            Top = 33
            Width = 108
            Height = 13
            Alignment = taRightJustify
            Caption = 'Vende tipo de produto:'
          end
          object Label25: TLabel
            Left = 29
            Top = 79
            Width = 181
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usar c'#243'pia do pedido no cupom fiscal:'
          end
          object Label13: TLabel
            Left = 117
            Top = 192
            Width = 94
            Height = 13
            Alignment = taRightJustify
            Caption = 'Quantidade padr'#227'o:'
          end
          object Label10: TLabel
            Left = 120
            Top = 169
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID Produto Padr'#227'o:'
          end
          object Label4: TLabel
            Left = 111
            Top = 236
            Width = 100
            Height = 13
            Alignment = taRightJustify
            Caption = 'Multiplicador de Qtd.:'
          end
          object Label51: TLabel
            Left = 111
            Top = 213
            Width = 100
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID Produto Gen'#233'rico:'
          end
          object Label61: TLabel
            Left = 124
            Top = 102
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Local do Estoque:'
          end
          object Label85: TLabel
            Left = 3
            Top = 124
            Width = 207
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gravar entrada Estoque na Troca Produtos:'
          end
          object Label22: TLabel
            Left = 18
            Top = 146
            Width = 192
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grava Movimento faturamento da Troca:'
          end
          object RxDBComboBox20: TRxDBComboBox
            Left = 212
            Top = 48
            Width = 211
            Height = 21
            Style = csDropDownList
            DataField = 'BAIXAR_CONSUMO'
            DataSource = dmCupomFiscal.dsCupomParametros
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'SIM'
              'N'#195'O')
            TabOrder = 1
            Values.Strings = (
              'S'
              'N')
          end
          object RxDBComboBox17: TRxDBComboBox
            Left = 212
            Top = 25
            Width = 211
            Height = 21
            Style = csDropDownList
            DataField = 'VENDA_TIPO_PRODUTO'
            DataSource = dmCupomFiscal.dsCupomParametros
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'PRODUTO'
              'MATERIAL'
              'AMBOS')
            TabOrder = 0
            Values.Strings = (
              'P'
              'M'
              'A')
          end
          object RxDBComboBox13: TRxDBComboBox
            Left = 212
            Top = 71
            Width = 211
            Height = 21
            Style = csDropDownList
            DataField = 'USA_COPIA_PEDIDO_CF'
            DataSource = dmCupomFiscal.dsCupomParametros
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'SIM'
              'N'#195'O')
            TabOrder = 2
            Values.Strings = (
              'S'
              'N')
          end
          object DBEdit3: TDBEdit
            Left = 213
            Top = 184
            Width = 67
            Height = 21
            DataField = 'QTD_PADRAO'
            DataSource = dmCupomFiscal.dsCupomParametros
            TabOrder = 5
          end
          object DBEdit6: TDBEdit
            Left = 213
            Top = 161
            Width = 67
            Height = 21
            DataField = 'PRODUTO_PADRAO'
            DataSource = dmCupomFiscal.dsCupomParametros
            TabOrder = 3
          end
          object DBEdit1: TDBEdit
            Left = 213
            Top = 228
            Width = 67
            Height = 21
            DataField = 'QTD_MULTIPLICADOR'
            DataSource = dmCupomFiscal.dsCupomParametros
            TabOrder = 6
          end
          object DBEdit9: TDBEdit
            Left = 213
            Top = 205
            Width = 67
            Height = 21
            DataField = 'ID_PRODUTO_GENERICO'
            DataSource = dmCupomFiscal.dsCupomParametros
            TabOrder = 4
          end
          object RxDBLookupCombo7: TRxDBLookupCombo
            Left = 212
            Top = 94
            Width = 211
            Height = 21
            DropDownCount = 8
            LookupField = 'ID'
            LookupDisplay = 'NOME'
            LookupSource = dmCupomFiscal.dsLocalEstoque
            TabOrder = 7
            OnEnter = RxDBLookupCombo4Enter
          end
          object RxDBComboBox48: TRxDBComboBox
            Left = 212
            Top = 117
            Width = 82
            Height = 21
            Style = csDropDownList
            DataField = 'GERAR_ESTOQUE_TROCA'
            DataSource = dmCupomFiscal.dsCupomParametros
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'SIM'
              'N'#195'O')
            TabOrder = 8
            Values.Strings = (
              'S'
              'N')
          end
          object RxDBComboBox6: TRxDBComboBox
            Left = 212
            Top = 139
            Width = 82
            Height = 21
            Style = csDropDownList
            DataField = 'GERAR_MOV_TROCA'
            DataSource = dmCupomFiscal.dsCupomParametros
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'SIM'
              'N'#195'O')
            TabOrder = 9
            Values.Strings = (
              'S'
              'N')
          end
          object DBCheckBox3: TDBCheckBox
            Left = 112
            Top = 8
            Width = 97
            Height = 17
            Caption = 'Usa Estoque '
            DataField = 'ESTOQUE_CUPOM'
            DataSource = dmCupomFiscal.dsCupomParametros
            TabOrder = 10
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object GroupBox7: TGroupBox
          Left = 452
          Top = 148
          Width = 457
          Height = 257
          Caption = 'Impress'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label39: TLabel
            Left = 72
            Top = 19
            Width = 92
            Height = 13
            Alignment = taRightJustify
            Caption = 'Quando n'#227'o NFCe:'
          end
          object Label43: TLabel
            Left = 48
            Top = 41
            Width = 116
            Height = 13
            Alignment = taRightJustify
            Caption = 'Altura do Salto de Linha:'
          end
          object Label26: TLabel
            Left = 12
            Top = 63
            Width = 152
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tamanho da Linha (Caracteres):'
          end
          object Label3: TLabel
            Left = 90
            Top = 85
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Vias do Cupom:'
          end
          object Label44: TLabel
            Left = 240
            Top = 40
            Width = 206
            Height = 13
            Caption = 'Para impress'#227'o modo Canvas (padr'#227'o = 25)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label27: TLabel
            Left = 10
            Top = 107
            Width = 154
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imprimir Vendas no Fechamento:'
          end
          object Label49: TLabel
            Left = 33
            Top = 129
            Width = 131
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imprimir Via de Confer'#234'ncia:'
          end
          object Label50: TLabel
            Left = 240
            Top = 129
            Width = 179
            Height = 13
            Caption = 'Imprimie via n'#227'o fiscal depois da fiscal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label66: TLabel
            Left = 56
            Top = 151
            Width = 108
            Height = 13
            Alignment = taRightJustify
            Caption = 'Di'#225'logo da Impressora:'
          end
          object Label67: TLabel
            Left = 240
            Top = 151
            Width = 133
            Height = 13
            Caption = 'Imprimie autom'#225'tico sem OK'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object RxDBComboBox22: TRxDBComboBox
            Left = 166
            Top = 11
            Width = 187
            Height = 21
            Style = csDropDownList
            DataField = 'IMPRIME_FISCAL_NFISCAL'
            DataSource = dmCupomFiscal.dsCupomParametros
            DropDownCount = 2
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'Imprime comprovante n'#227'o fiscal'
              'N'#227'o imprime comprovante')
            TabOrder = 0
            Values.Strings = (
              'S'
              'N')
          end
          object DBEdit5: TDBEdit
            Left = 166
            Top = 33
            Width = 67
            Height = 21
            DataField = 'ALTURA_SALTO_LINHA'
            DataSource = dmCupomFiscal.dsCupomParametros
            TabOrder = 1
          end
          object DBEdit4: TDBEdit
            Left = 166
            Top = 55
            Width = 67
            Height = 21
            DataField = 'TAMANHO_LINHA'
            DataSource = dmCupomFiscal.dsCupomParametros
            TabOrder = 2
          end
          object DBEdit7: TDBEdit
            Left = 166
            Top = 77
            Width = 67
            Height = 21
            DataField = 'VIAS_CUPOM'
            DataSource = dmCupomFiscal.dsCupomParametros
            TabOrder = 3
          end
          object RxDBComboBox2: TRxDBComboBox
            Left = 166
            Top = 99
            Width = 69
            Height = 21
            Style = csDropDownList
            DataField = 'IMP_VENDAS_FECHAMENTO'
            DataSource = dmCupomFiscal.dsCupomParametros
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'SIM'
              'N'#195'O')
            TabOrder = 4
            Values.Strings = (
              'S'
              'N')
          end
          object RxDBComboBox30: TRxDBComboBox
            Left = 166
            Top = 121
            Width = 69
            Height = 21
            Style = csDropDownList
            DataField = 'IMPRIME_NFISCAL_CONFERENCIA'
            DataSource = dmCupomFiscal.dsCupomParametros
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'SIM'
              'N'#195'O')
            TabOrder = 5
            Values.Strings = (
              'S'
              'N')
          end
          object RxDBComboBox39: TRxDBComboBox
            Left = 166
            Top = 143
            Width = 69
            Height = 21
            Style = csDropDownList
            DataField = 'EXIBIR_DIALOGO_IMPRESSORA'
            DataSource = dmCupomFiscal.dsCupomParametros
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'SIM'
              'N'#195'O')
            TabOrder = 6
            Values.Strings = (
              'S'
              'N')
          end
        end
        object GroupBox8: TGroupBox
          Left = 4
          Top = 8
          Width = 905
          Height = 137
          Caption = 'Terminal'
          TabOrder = 0
          object Label20: TLabel
            Left = 144
            Top = 66
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usa NFCe:'
          end
          object Label8: TLabel
            Left = 122
            Top = 44
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Terminal (PDV):'
          end
          object Label30: TLabel
            Left = 9
            Top = 87
            Width = 186
            Height = 13
            Alignment = taRightJustify
            Caption = 'Endere'#231'o Para Salvar o XML da NFCe:'
          end
          object Label21: TLabel
            Left = 10
            Top = 110
            Width = 185
            Height = 13
            Alignment = taRightJustify
            Caption = 'Endere'#231'o Para Salvar o PDF da NFCe:'
          end
          object Label64: TLabel
            Left = 173
            Top = 22
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Filial:'
          end
          object Label2: TLabel
            Left = 256
            Top = 40
            Width = 113
            Height = 13
            Caption = 'F2- Seleciona o terminal'
          end
          object Label77: TLabel
            Left = 456
            Top = 44
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'S'#233'rie (PDV):'
          end
          object RxDBComboBox9: TRxDBComboBox
            Left = 198
            Top = 58
            Width = 187
            Height = 21
            Style = csDropDownList
            DataField = 'USA_NFCE'
            DataSource = dmCupomFiscal.dsParametros
            DropDownCount = 2
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'SIM'
              'N'#195'O')
            TabOrder = 2
            Values.Strings = (
              'S'
              'N')
          end
          object DirectoryEdit2: TDirectoryEdit
            Left = 198
            Top = 80
            Width = 411
            Height = 21
            InitialDir = 'C:\'
            MultipleDirs = True
            NumGlyphs = 1
            TabOrder = 3
            Text = 'C:\'
          end
          object DirectoryEdit3: TDirectoryEdit
            Left = 198
            Top = 102
            Width = 411
            Height = 21
            InitialDir = 'C:\'
            MultipleDirs = True
            NumGlyphs = 1
            TabOrder = 4
            Text = 'C:\'
          end
          object RxDBLookupCombo8: TRxDBLookupCombo
            Left = 198
            Top = 14
            Width = 187
            Height = 21
            DropDownCount = 5
            DisplayEmpty = '[Perguntar em cada venda]'
            EmptyValue = '0'
            LookupField = 'ID'
            LookupDisplay = 'NOME_INTERNO'
            LookupSource = dmCupomFiscal.dsFilial
            TabOrder = 0
          end
          object ceTerminal: TCurrencyEdit
            Left = 198
            Top = 37
            Width = 59
            Height = 21
            AutoSize = False
            Color = clSilver
            Ctl3D = True
            DecimalPlaces = 0
            DisplayFormat = '0'
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
            OnKeyDown = ceTerminalKeyDown
          end
          object edtSerieCupom: TEdit
            Left = 521
            Top = 36
            Width = 88
            Height = 21
            TabOrder = 5
            Text = 'S'#233'rie'
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Personaliza'#231#227'o'
      ImageIndex = 3
      object GroupBox1: TGroupBox
        Left = 16
        Top = 0
        Width = 801
        Height = 257
        Caption = 'Financeiro'
        Enabled = False
        TabOrder = 0
        object Label9: TLabel
          Left = 169
          Top = 42
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Conta de Caixa:'
        end
        object Label31: TLabel
          Left = 120
          Top = 86
          Width = 124
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cond. Pagamento '#192' Vista:'
        end
        object Label37: TLabel
          Left = 163
          Top = 130
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Conta de perdas:'
        end
        object Label6: TLabel
          Left = 152
          Top = 20
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'Exige Caixa Aberto:'
        end
        object Label29: TLabel
          Left = 325
          Top = 174
          Width = 151
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mostrar Cond. Pagto no Cupom:'
        end
        object Label28: TLabel
          Left = 89
          Top = 174
          Width = 155
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mostrar Barra de total no Cupom:'
        end
        object Label12: TLabel
          Left = 100
          Top = 152
          Width = 144
          Height = 13
          Alignment = taRightJustify
          Caption = 'Casas Decimais Valor Unit'#225'rio:'
        end
        object Label1: TLabel
          Left = 379
          Top = 151
          Width = 97
          Height = 13
          Alignment = taRightJustify
          Caption = 'IPI no Cupom Fiscal:'
        end
        object Label41: TLabel
          Left = 117
          Top = 196
          Width = 127
          Height = 13
          Alignment = taRightJustify
          Caption = 'Gera carn'#234' de pagamento:'
        end
        object Label47: TLabel
          Left = 317
          Top = 64
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desconto Item:'
        end
        object Label48: TLabel
          Left = 130
          Top = 64
          Width = 114
          Height = 13
          Alignment = taRightJustify
          Caption = 'Exige Campo Desconto:'
        end
        object lbl1: TLabel
          Left = 116
          Top = 108
          Width = 128
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cond. Pagamento A Prazo:'
        end
        object Label59: TLabel
          Left = 384
          Top = 196
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pr'#233'-visualiza carn'#234':'
        end
        object Label60: TLabel
          Left = 175
          Top = 218
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Arquivo carn'#234':'
        end
        object Label62: TLabel
          Left = 508
          Top = 20
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fechamento:'
        end
        object Label65: TLabel
          Left = 601
          Top = 64
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa Pre'#231'o '#192' Vista:'
        end
        object Label69: TLabel
          Left = 594
          Top = 130
          Width = 96
          Height = 13
          Alignment = taRightJustify
          Caption = 'Juros Parcelamento:'
        end
        object Label81: TLabel
          Left = 595
          Top = 86
          Width = 95
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa Pre'#231'o revenda:'
        end
        object Label82: TLabel
          Left = 579
          Top = 108
          Width = 111
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa Cod. Barra Interno:'
        end
        object Label83: TLabel
          Left = 582
          Top = 152
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Gerar C. Receber:'
        end
        object lblSolicitaCPF: TLabel
          Left = 559
          Top = 174
          Width = 109
          Height = 13
          Alignment = taRightJustify
          Caption = 'Solicita CPF na Venda:'
        end
        object Label84: TLabel
          Left = 470
          Top = 42
          Width = 100
          Height = 13
          Alignment = taRightJustify
          Caption = 'Forma Pagto Padr'#227'o:'
        end
        object Label38: TLabel
          Left = 598
          Top = 196
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr.L'#237'mite CPF:'
        end
        object Label7: TLabel
          Left = 561
          Top = 218
          Width = 131
          Height = 13
          Alignment = taRightJustify
          Caption = 'Imprimir canhoto assinatura:'
        end
        object RxDBLookupCombo3: TRxDBLookupCombo
          Left = 246
          Top = 34
          Width = 187
          Height = 21
          DropDownCount = 8
          DataField = 'ID_CONTA_FECHAMENTO'
          DataSource = dmCupomFiscal.dsParametros
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmCupomFiscal.dsContas
          TabOrder = 2
          OnEnter = RxDBLookupCombo3Enter
        end
        object RxDBLookupCombo5: TRxDBLookupCombo
          Left = 246
          Top = 78
          Width = 299
          Height = 21
          DropDownCount = 8
          DataField = 'ID_CONDPGTO_PADRAO'
          DataSource = dmCupomFiscal.dsCupomParametros
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmCupomFiscal.dsCondPgto
          TabOrder = 7
          OnEnter = RxDBLookupCombo4Enter
        end
        object RxDBLookupCombo6: TRxDBLookupCombo
          Left = 246
          Top = 122
          Width = 299
          Height = 21
          DropDownCount = 8
          DataField = 'ID_CONTAPERDAS'
          DataSource = dmCupomFiscal.dsCupomParametros
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmCupomFiscal.dsContas
          TabOrder = 11
          OnEnter = RxDBLookupCombo4Enter
        end
        object RxDBComboBox4: TRxDBComboBox
          Left = 246
          Top = 12
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'EXIGE_CAIXA_ABERTO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 0
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox15: TRxDBComboBox
          Left = 478
          Top = 166
          Width = 67
          Height = 21
          Style = csDropDownList
          DataField = 'MOSTRAR_CONDPGTO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 17
          Values.Strings = (
            'S'
            'N')
        end
        object RxDBComboBox14: TRxDBComboBox
          Left = 246
          Top = 166
          Width = 67
          Height = 21
          Style = csDropDownList
          DataField = 'MOSTRAR_BARRA_TOTAL'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 16
          Values.Strings = (
            'S'
            'N')
        end
        object DBEdit2: TDBEdit
          Left = 246
          Top = 144
          Width = 67
          Height = 21
          DataField = 'CASAS_DECIMAIS'
          DataSource = dmCupomFiscal.dsCupomParametros
          TabOrder = 13
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 478
          Top = 143
          Width = 67
          Height = 21
          Style = csDropDownList
          DataField = 'USA_IPI'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 14
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox24: TRxDBComboBox
          Left = 246
          Top = 188
          Width = 67
          Height = 21
          Style = csDropDownList
          DataField = 'USA_CARNE'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 19
          Values.Strings = (
            'S'
            'N')
          OnChange = RxDBComboBox24Change
        end
        object RxDBComboBox28: TRxDBComboBox
          Left = 392
          Top = 56
          Width = 153
          Height = 21
          Style = csDropDownList
          DataField = 'USA_DESCONTO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'NOS ITENS'
            'NO TOTAL DA VENDA'
            'AMBOS (ITENS E TOTAL)')
          TabOrder = 5
          Values.Strings = (
            'N'
            'I'
            'T'
            'A')
        end
        object RxDBComboBox29: TRxDBComboBox
          Left = 246
          Top = 56
          Width = 67
          Height = 21
          Style = csDropDownList
          DataField = 'EXIGE_CAMPO_DESCONTO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 4
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBLookupCombo4: TRxDBLookupCombo
          Left = 246
          Top = 100
          Width = 299
          Height = 21
          DropDownCount = 8
          DataField = 'ID_CONDPGTO_PRAZO'
          DataSource = dmCupomFiscal.dsCupomParametros
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmCupomFiscal.dsCondPgto
          TabOrder = 9
          OnEnter = RxDBLookupCombo4Enter
        end
        object RxDBComboBox35: TRxDBComboBox
          Left = 478
          Top = 188
          Width = 67
          Height = 21
          Style = csDropDownList
          DataField = 'USA_PREVIEW_CARNE'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 20
          Values.Strings = (
            'S'
            'N')
        end
        object DBEdit11: TDBEdit
          Left = 246
          Top = 210
          Width = 299
          Height = 21
          DataField = 'CARNE_RELATORIO'
          DataSource = dmCupomFiscal.dsCupomParametros
          TabOrder = 22
        end
        object RxDBComboBox36: TRxDBComboBox
          Left = 574
          Top = 12
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'FECHAMENTO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Completo'
            'Autom'#225'tico'
            'Sem confer'#234'ncia')
          TabOrder = 1
          Values.Strings = (
            'C'
            'A'
            'S')
        end
        object RxDBComboBox38: TRxDBComboBox
          Left = 694
          Top = 56
          Width = 67
          Height = 21
          Style = csDropDownList
          DataField = 'USA_PRECO_AVISTA'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 6
          Values.Strings = (
            'N'
            'S')
        end
        object DBEdit12: TDBEdit
          Left = 694
          Top = 122
          Width = 67
          Height = 21
          DataField = 'JUROS_MES'
          DataSource = dmCupomFiscal.dsCupomParametros
          TabOrder = 12
        end
        object comboRevenda: TRxDBComboBox
          Left = 694
          Top = 78
          Width = 67
          Height = 21
          Style = csDropDownList
          DataField = 'USA_PRECO_REVENDA'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 8
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox46: TRxDBComboBox
          Left = 694
          Top = 100
          Width = 67
          Height = 21
          Style = csDropDownList
          DataField = 'USA_CBARRA_INT'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 10
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox47: TRxDBComboBox
          Left = 670
          Top = 144
          Width = 91
          Height = 21
          Style = csDropDownList
          DataField = 'GERAR_CRECEBER'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Todos'
            'NFCe'
            'N'#227'o'
            '')
          TabOrder = 15
          Values.Strings = (
            'T'
            'C'
            'N'
            '')
        end
        object comboSolicitaCPF: TRxDBComboBox
          Left = 670
          Top = 166
          Width = 91
          Height = 21
          Style = csDropDownList
          DataField = 'SOLICITA_CPF'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'In'#237'cio'
            'Final'
            'N'#227'o Solicita')
          TabOrder = 18
          Values.Strings = (
            'I'
            'F'
            'N')
        end
        object comboFormaPagtoPadrao: TRxDBLookupCombo
          Left = 574
          Top = 34
          Width = 187
          Height = 21
          DropDownCount = 8
          DataField = 'ID_TIPOCOBRANCA_PADRAO'
          DataSource = dmCupomFiscal.dsCupomParametros
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmCupomFiscal.dsTipoCobranca
          TabOrder = 3
          OnEnter = RxDBLookupCombo4Enter
        end
        object DBCheckBox1: TDBCheckBox
          Left = 248
          Top = 232
          Width = 305
          Height = 17
          Caption = 'Mostrar a tela do Caixa depois de confirmar a contagem'
          DataField = 'MOSTRAR_TELA_FECHAMENTO'
          DataSource = dmCupomFiscal.dsCupomParametros
          TabOrder = 24
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBEdit16: TDBEdit
          Left = 670
          Top = 188
          Width = 91
          Height = 21
          DataField = 'VLR_LIMITE_CPF'
          DataSource = dmCupomFiscal.dsCupomParametros
          TabOrder = 21
          OnKeyDown = DBEdit16KeyDown
        end
        object RxDBComboBox12: TRxDBComboBox
          Left = 694
          Top = 210
          Width = 67
          Height = 21
          Style = csDropDownList
          DataField = 'IMPRIMIR_CANHOTO_ASSINATURA'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 23
          Values.Strings = (
            'S'
            'N')
        end
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 259
        Width = 465
        Height = 214
        Caption = 'Usabilidade'
        Enabled = False
        TabOrder = 1
        object Label23: TLabel
          Left = 87
          Top = 88
          Width = 157
          Height = 13
          Alignment = taRightJustify
          Caption = 'Informar na digita'#231#227'o do Produto:'
        end
        object Label58: TLabel
          Left = 130
          Top = 66
          Width = 114
          Height = 13
          Alignment = taRightJustify
          Caption = 'Quantidade Autom'#225'tica:'
        end
        object Label55: TLabel
          Left = 123
          Top = 111
          Width = 121
          Height = 13
          Alignment = taRightJustify
          Caption = 'ID do cliente Consumidor:'
        end
        object Label73: TLabel
          Left = 113
          Top = 134
          Width = 131
          Height = 13
          Alignment = taRightJustify
          Caption = 'Aniversariantes do Per'#237'odo:'
        end
        object Label11: TLabel
          Left = 195
          Top = 43
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa troco:'
        end
        object Label24: TLabel
          Left = 157
          Top = 19
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Autentica Usu'#225'rio:'
        end
        object RxDBComboBox11: TRxDBComboBox
          Left = 246
          Top = 80
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'USA_COD_REF'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'C'#243'digo (ID)'
            'Refer'#234'ncia')
          TabOrder = 1
          Values.Strings = (
            'C'
            'R')
        end
        object RxDBComboBox34: TRxDBComboBox
          Left = 246
          Top = 58
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'QTD_AUTO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM (PASSA DIRETO)'
            'N'#195'O (PARA NO CAMPO)')
          TabOrder = 0
          Values.Strings = (
            'S'
            'N')
        end
        object DBEdit8: TDBEdit
          Left = 246
          Top = 103
          Width = 67
          Height = 21
          DataField = 'ID_CLIENTE_CONSUMIDOR'
          DataSource = dmCupomFiscal.dsParametros
          TabOrder = 2
        end
        object RxDBComboBox43: TRxDBComboBox
          Left = 246
          Top = 126
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'ANIVERSARIO_PERIODO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'DO DIA'
            'DA SEMANA')
          TabOrder = 3
          Values.Strings = (
            'N'
            'D'
            'S')
        end
        object DBCheckBox2: TDBCheckBox
          Left = 144
          Top = 151
          Width = 305
          Height = 17
          Caption = 'Mostrar na Cons. dos Produtos os Materiais'
          DataField = 'MOSTRAR_MATERIAL'
          DataSource = dmCupomFiscal.dsCupomParametros
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object comboUsaTroco: TRxDBComboBox
          Left = 246
          Top = 35
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'USA_TROCO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 5
          Values.Strings = (
            'S'
            'N')
        end
        object RxDBComboBox10: TRxDBComboBox
          Left = 246
          Top = 11
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'AUTENTICA_USUARIO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 6
          Values.Strings = (
            'S'
            'N')
        end
      end
      object GroupBox3: TGroupBox
        Left = 16
        Top = 472
        Width = 802
        Height = 145
        Caption = 'Restaurante'
        Enabled = False
        TabOrder = 3
        object Label14: TLabel
          Left = 80
          Top = 20
          Width = 164
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa Cart'#227'o / Comanda Numerada:'
        end
        object Label34: TLabel
          Left = 118
          Top = 62
          Width = 126
          Height = 13
          Alignment = taRightJustify
          Caption = 'Caixa novo zera comanda:'
        end
        object Label35: TLabel
          Left = 459
          Top = 20
          Width = 137
          Height = 13
          Alignment = taRightJustify
          Caption = 'Imprime no cupom n'#227'o fiscal:'
        end
        object Label32: TLabel
          Left = 30
          Top = 82
          Width = 214
          Height = 13
          Alignment = taRightJustify
          Caption = 'Informar a quantidade de pessoas no Cupom:'
        end
        object Label42: TLabel
          Left = 510
          Top = 40
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Imprimir Comanda:'
        end
        object Label63: TLabel
          Left = 480
          Top = 62
          Width = 116
          Height = 13
          Alignment = taRightJustify
          Caption = 'Permite Rachar a Conta:'
        end
        object Label87: TLabel
          Left = 149
          Top = 104
          Width = 95
          Height = 13
          Alignment = taRightJustify
          Caption = 'Impressora Cozinha:'
        end
        object Label89: TLabel
          Left = 162
          Top = 125
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Impressora Copa:'
        end
        object Label98: TLabel
          Left = 143
          Top = 40
          Width = 101
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa Nome Comanda:'
        end
        object Label5: TLabel
          Left = 507
          Top = 83
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mostrar Adicionais:'
        end
        object RxDBComboBox7: TRxDBComboBox
          Left = 246
          Top = 12
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'USA_CARTAO_COMANDA'
          DataSource = dmCupomFiscal.dsCupomParametros
          DropDownCount = 3
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 0
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox18: TRxDBComboBox
          Left = 246
          Top = 54
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'CAIXA_NUMERA_COMANDA'
          DataSource = dmCupomFiscal.dsCupomParametros
          DropDownCount = 2
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 2
          Values.Strings = (
            'S'
            'N')
        end
        object RxDBComboBox19: TRxDBComboBox
          Left = 598
          Top = 12
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'IMPRIME_NUM_NFISCAL'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#250'mero do Cupom'
            'N'#250'mero do Cart'#227'o')
          TabOrder = 6
          Values.Strings = (
            '1'
            '2')
        end
        object RxDBComboBox16: TRxDBComboBox
          Left = 246
          Top = 74
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'USA_QTD_PESSOA'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 3
          Values.Strings = (
            'S'
            'N')
        end
        object RxDBComboBox25: TRxDBComboBox
          Left = 598
          Top = 32
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'USA_COMANDA'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 7
          Values.Strings = (
            'S'
            'N')
        end
        object RxDBComboBox37: TRxDBComboBox
          Left = 598
          Top = 54
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'RACHAR_CONTA'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 8
          Values.Strings = (
            'S'
            'N')
        end
        object DBEdit14: TDBEdit
          Left = 246
          Top = 96
          Width = 538
          Height = 21
          DataField = 'IMPRESSORA_COZINHA'
          DataSource = dmCupomFiscal.dsCupomParametros
          TabOrder = 4
        end
        object DBEdit15: TDBEdit
          Left = 246
          Top = 117
          Width = 538
          Height = 21
          DataField = 'IMPRESSORA_COPA'
          DataSource = dmCupomFiscal.dsCupomParametros
          TabOrder = 5
        end
        object ComboNomeComanda: TRxDBComboBox
          Left = 246
          Top = 32
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'USA_NOME_COMANDA'
          DataSource = dmCupomFiscal.dsCupomParametros
          DropDownCount = 3
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 1
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox3: TRxDBComboBox
          Left = 598
          Top = 75
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'MOSTRAR_PRODUTO_ADI'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 9
          Values.Strings = (
            'S'
            'N')
        end
      end
      object GroupBox5: TGroupBox
        Left = 486
        Top = 259
        Width = 331
        Height = 214
        Caption = 'Varejo'
        TabOrder = 2
        object Label45: TLabel
          Left = 47
          Top = 18
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa Or'#231'amento:'
        end
        object Label46: TLabel
          Left = 66
          Top = 40
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa Pedido:'
        end
        object Label52: TLabel
          Left = 47
          Top = 62
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'Exige vendedor:'
        end
        object Label53: TLabel
          Left = 38
          Top = 84
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Repete vendedor:'
        end
        object Label56: TLabel
          Left = 20
          Top = 128
          Width = 104
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa tabela de pre'#231'os:'
        end
        object Label18: TLabel
          Left = 60
          Top = 150
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa Balan'#231'a:'
        end
        object Label68: TLabel
          Left = 27
          Top = 172
          Width = 97
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usa Cor / Tamanho:'
        end
        object Label70: TLabel
          Left = 28
          Top = 106
          Width = 96
          Height = 13
          Alignment = taRightJustify
          Caption = 'Autentica vendedor:'
        end
        object Label74: TLabel
          Left = 13
          Top = 194
          Width = 111
          Height = 13
          Alignment = taRightJustify
          Caption = 'Exige canal de vendas:'
        end
        object RxDBComboBox26: TRxDBComboBox
          Left = 128
          Top = 10
          Width = 176
          Height = 21
          Style = csDropDownList
          DataField = 'USA_ORCAMENTO'
          DataSource = dmCupomFiscal.dsCupomParametros
          DropDownCount = 3
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 0
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox27: TRxDBComboBox
          Left = 128
          Top = 32
          Width = 176
          Height = 21
          Style = csDropDownList
          DataField = 'USA_PEDIDO'
          DataSource = dmCupomFiscal.dsCupomParametros
          DropDownCount = 3
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 1
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox31: TRxDBComboBox
          Left = 128
          Top = 54
          Width = 176
          Height = 21
          Style = csDropDownList
          DataField = 'EXIGE_VENDEDOR'
          DataSource = dmCupomFiscal.dsCupomParametros
          DropDownCount = 3
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 2
          Values.Strings = (
            'N'
            'S')
          OnExit = RxDBComboBox31Exit
        end
        object RxDBComboBox32: TRxDBComboBox
          Left = 128
          Top = 76
          Width = 176
          Height = 21
          Style = csDropDownList
          DataField = 'REPETE_VENDEDOR'
          DataSource = dmCupomFiscal.dsCupomParametros
          DropDownCount = 3
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 3
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox33: TRxDBComboBox
          Left = 128
          Top = 120
          Width = 176
          Height = 21
          Style = csDropDownList
          DataField = 'USA_TABELA_PRECO'
          DataSource = dmCupomFiscal.dsCupomParametros
          DropDownCount = 3
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 6
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox8: TRxDBComboBox
          Left = 128
          Top = 142
          Width = 176
          Height = 21
          Style = csDropDownList
          DataField = 'USA_BALANCA'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 7
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox40: TRxDBComboBox
          Left = 128
          Top = 164
          Width = 176
          Height = 21
          Style = csDropDownList
          DataField = 'USA_COR_TAMANHO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 8
          Values.Strings = (
            'N'
            'S')
        end
        object RxDBComboBox41: TRxDBComboBox
          Left = 128
          Top = 98
          Width = 148
          Height = 21
          Style = csDropDownList
          DataField = 'AUTENTICA_VENDEDOR'
          DataSource = dmCupomFiscal.dsCupomParametros
          DropDownCount = 3
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 4
          Values.Strings = (
            'N'
            'S')
        end
        object BitBtn1: TBitBtn
          Left = 282
          Top = 98
          Width = 20
          Height = 20
          Caption = '?'
          TabOrder = 5
          TabStop = False
          OnClick = BitBtn1Click
        end
        object RxDBComboBox44: TRxDBComboBox
          Left = 128
          Top = 186
          Width = 176
          Height = 21
          Style = csDropDownList
          DataField = 'USA_CANAL_VENDA'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'N'#195'O'
            'SIM')
          TabOrder = 9
          Values.Strings = (
            'N'
            'S')
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Balan'#231'a'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1071
        Height = 623
        Align = alClient
        TabOrder = 0
        object Label15: TLabel
          Left = 52
          Top = 32
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Balan'#231'a:'
        end
        object Label16: TLabel
          Left = 56
          Top = 56
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Modelo:'
        end
        object Label17: TLabel
          Left = 67
          Top = 80
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'COM:'
        end
        object Label40: TLabel
          Left = 52
          Top = 104
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Etiqueta:'
        end
        object Label57: TLabel
          Left = 79
          Top = 128
          Width = 135
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tam. do C'#243'digo na Etiqueta:'
        end
        object ComboBox1: TComboBox
          Left = 96
          Top = 24
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'ACBR'
          Items.Strings = (
            'URANO'
            'ACBR')
        end
        object ComboBox2: TComboBox
          Left = 96
          Top = 48
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Text = 'US POP'
          Items.Strings = (
            'US POP'
            'PRIX 8217')
        end
        object ComboBox3: TComboBox
          Left = 96
          Top = 72
          Width = 145
          Height = 21
          DropDownCount = 10
          ItemHeight = 13
          TabOrder = 2
          Text = 'COM1'
          Items.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'COM10')
        end
        object RxDBComboBox23: TRxDBComboBox
          Left = 96
          Top = 96
          Width = 187
          Height = 21
          Style = csDropDownList
          DataField = 'ETIQUETA_INFO'
          DataSource = dmCupomFiscal.dsCupomParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Nenhuma'
            'Informa Peso'
            'Informa Pre'#231'o')
          TabOrder = 3
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object DBEdit10: TDBEdit
          Left = 216
          Top = 120
          Width = 67
          Height = 21
          DataField = 'TAMANHO_COD_ETIQUETA'
          DataSource = dmCupomFiscal.dsCupomParametros
          TabOrder = 4
        end
      end
    end
    object TS_Numeracao: TTabSheet
      Caption = 'Numera'#231#227'o'
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1071
        Height = 622
        Align = alClient
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 1069
          Height = 620
          Align = alClient
          DataSource = dmParametros.dsSequencial
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TABELA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FILIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMREGISTRO'
              Width = 64
              Visible = True
            end>
        end
      end
    end
    object TS_Impressao_SSNFCe: TTabSheet
      Caption = 'Impress'#227'o SSNFCe'
      ImageIndex = 4
      object GroupBox10: TGroupBox
        Left = 16
        Top = 12
        Width = 385
        Height = 101
        Caption = ' Impress'#227'o Cupom '
        TabOrder = 0
        object Label78: TLabel
          Left = 4
          Top = 24
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Porta Impressora:'
        end
        object Label79: TLabel
          Left = 252
          Top = 47
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bound:'
        end
        object Label80: TLabel
          Left = 32
          Top = 47
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Impressora:'
        end
        object Label76: TLabel
          Left = 8
          Top = 70
          Width = 78
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo Impressora:'
        end
        object Label54: TLabel
          Left = 248
          Top = 70
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Gaveta:'
        end
        object edtBound: TEdit
          Left = 290
          Top = 39
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object comboPorta: TRzComboBox
          Left = 90
          Top = 16
          Width = 287
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'USB')
          Values.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'USB')
        end
        object comboImpressora: TRzComboBox
          Left = 90
          Top = 39
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            'BEMATECH'
            'DR700'
            'DR800'
            'ELGIN'
            'EPSON')
          Values.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'USB')
        end
        object RxDBComboBox5: TRxDBComboBox
          Left = 90
          Top = 62
          Width = 143
          Height = 21
          Style = csDropDownList
          DataField = 'IMPRESSORA_FISCAL'
          DataSource = dmCupomFiscal.dsParametros
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'NENHUMA'
            'N'#195'O FISCAL - Modo Texto'
            'N'#195'O FISCAL - Impressora Windows'
            'NFCe - Nota Eletr'#244'nica')
          TabOrder = 3
          Values.Strings = (
            '0'
            '5'
            '6'
            '7')
          OnChange = RxDBComboBox5Change
        end
        object ComboBox4: TComboBox
          Left = 290
          Top = 62
          Width = 87
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 4
          Text = 'N'#195'O'
          Items.Strings = (
            'N'#195'O'
            'SIM')
        end
      end
      object GroupBox11: TGroupBox
        Left = 16
        Top = 116
        Width = 241
        Height = 92
        Caption = 'Margens'
        TabOrder = 1
        object lblSuperior: TLabel
          Left = 9
          Top = 25
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Superior:'
        end
        object lblEsquerda: TLabel
          Left = 3
          Top = 47
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Esquerda:'
        end
        object lblDireita: TLabel
          Left = 134
          Top = 47
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Direira:'
        end
        object lblMInferior: TLabel
          Left = 132
          Top = 25
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Inferior:'
        end
        object Label86: TLabel
          Left = 92
          Top = 69
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Largura Bobina:'
        end
        object edtMSuperior: TEdit
          Left = 52
          Top = 17
          Width = 64
          Height = 21
          Hint = 'Padr'#227'o 0,8'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edtMEsquerda: TEdit
          Left = 52
          Top = 39
          Width = 64
          Height = 21
          Hint = 'Padr'#227'o 0,6'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object edtMDireita: TEdit
          Left = 169
          Top = 39
          Width = 64
          Height = 21
          Hint = 'Padr'#227'o 0,51'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object edtMInferior: TEdit
          Left = 169
          Top = 17
          Width = 64
          Height = 21
          Hint = 'Padr'#227'o 0,8'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object edtLarguraBobina: TEdit
          Left = 169
          Top = 61
          Width = 64
          Height = 21
          Hint = 'Largura padr'#227'o: 290'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
      end
      object GroupBox12: TGroupBox
        Left = 16
        Top = 212
        Width = 241
        Height = 92
        Caption = ' Cozinha '
        TabOrder = 2
        object Label90: TLabel
          Left = 4
          Top = 24
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Porta Impressora:'
        end
        object Label91: TLabel
          Left = 52
          Top = 45
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bound:'
        end
        object Label92: TLabel
          Left = 32
          Top = 67
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Impressora:'
        end
        object edtBound_Cozinha: TEdit
          Left = 90
          Top = 37
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object ComboPorta_Cozinha: TRzComboBox
          Left = 90
          Top = 16
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'USB')
          Values.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'USB')
        end
        object comboImpressora_Cozinha: TRzComboBox
          Left = 90
          Top = 59
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            'BEMATECH'
            'DR700'
            'DR800'
            'ELGIN'
            'EPSON')
          Values.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'USB')
        end
      end
      object GroupBox13: TGroupBox
        Left = 16
        Top = 310
        Width = 241
        Height = 92
        Caption = ' Copa '
        TabOrder = 3
        object Label93: TLabel
          Left = 4
          Top = 24
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Porta Impressora:'
        end
        object Label94: TLabel
          Left = 52
          Top = 45
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bound:'
        end
        object Label95: TLabel
          Left = 32
          Top = 67
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Impressora:'
        end
        object edtBound_Copa: TEdit
          Left = 90
          Top = 37
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object ComboPorta_Copa: TRzComboBox
          Left = 90
          Top = 16
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'USB')
          Values.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'USB')
        end
        object comboImpressora_Copa: TRzComboBox
          Left = 90
          Top = 59
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            'BEMATECH'
            'DR700'
            'DR800'
            'ELGIN'
            'EPSON')
          Values.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'USB')
        end
      end
      object GroupBox14: TGroupBox
        Left = 16
        Top = 406
        Width = 241
        Height = 73
        Caption = ' Tempo Controle Imp Cozinha/Copa '
        TabOrder = 4
        object Label97: TLabel
          Left = 50
          Top = 29
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tempo:'
        end
        object Label96: TLabel
          Left = 16
          Top = 48
          Width = 152
          Height = 13
          Caption = 'Ex: 20000 (igual a 20 segundos)'
        end
        object edtTempo_Cozinha: TEdit
          Left = 90
          Top = 21
          Width = 88
          Height = 21
          TabOrder = 0
        end
      end
    end
  end
end

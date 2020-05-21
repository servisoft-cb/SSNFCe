object frmConsCupom: TfrmConsCupom
  Left = 186
  Top = 144
  Width = 1087
  Height = 524
  Caption = 'Consulta Cupons'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 1071
    Height = 485
    Align = alClient
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 1
      Top = 103
      Width = 1069
      Height = 225
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu2
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = cxGrid1DBTableView1CellDblClick
        DataController.DataSource = dmCupomFiscal.dsCupom_Cons
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        object cxGrid1DBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          Options.Editing = False
        end
        object cxGrid1DBTableView1Column2: TcxGridDBColumn
          DataBinding.FieldName = 'TIPO'
          Width = 43
        end
        object cxGrid1DBTableView1DTEMISSAO: TcxGridDBColumn
          DataBinding.FieldName = 'DTEMISSAO'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Width = 87
        end
        object cxGrid1DBTableView1HREMISSAO: TcxGridDBColumn
          DataBinding.FieldName = 'HREMISSAO'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Width = 108
        end
        object cxGrid1DBTableView1NUMCUPOM: TcxGridDBColumn
          DataBinding.FieldName = 'NUMCUPOM'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Width = 104
        end
        object cxGrid1DBTableView1SERIE: TcxGridDBColumn
          DataBinding.FieldName = 'SERIE'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Width = 54
        end
        object cxGrid1DBTableView1Column4: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CARTAO'
        end
        object cxGrid1DBTableView1VLR_TOTAL: TcxGridDBColumn
          DataBinding.FieldName = 'VLR_TOTAL'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Width = 97
        end
        object cxGrid1DBTableView1CANCELADO: TcxGridDBColumn
          DataBinding.FieldName = 'CANCELADO'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Width = 83
        end
        object cxGrid1DBTableView1CPF: TcxGridDBColumn
          DataBinding.FieldName = 'CPF'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
        end
        object cxGrid1DBTableView1NFECHAVEACESSO: TcxGridDBColumn
          DataBinding.FieldName = 'NFECHAVEACESSO'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Width = 226
        end
        object cxGrid1DBTableView1NFEPROTOCOLO: TcxGridDBColumn
          DataBinding.FieldName = 'NFEPROTOCOLO'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
        end
        object cxGrid1DBTableView1NFERECIBO: TcxGridDBColumn
          DataBinding.FieldName = 'NFERECIBO'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Width = 285
        end
        object cxGrid1DBTableView1CLIENTE_NOME: TcxGridDBColumn
          DataBinding.FieldName = 'CLIENTE_NOME'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
        end
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'VLR_TROCA'
        end
        object cxGrid1DBTableView1Column3: TcxGridDBColumn
          DataBinding.FieldName = 'NFEDENEGADA'
          Width = 100
        end
        object cxGrid1DBTableView1Column5: TcxGridDBColumn
          DataBinding.FieldName = 'VENDEDOR'
        end
        object cxGrid1DBTableView1Column6: TcxGridDBColumn
          Caption = 'Vlr. Desconto'
          DataBinding.FieldName = 'VLR_DESCONTO'
        end
        object cxGrid1DBTableView1Column7: TcxGridDBColumn
          Caption = 'Base Icms Ret Ant'
          DataBinding.FieldName = 'BASE_ICMSSUBST_RET'
        end
        object cxGrid1DBTableView1Column8: TcxGridDBColumn
          Caption = 'Vlr. Icms Ret Ant'
          DataBinding.FieldName = 'VLR_ICMSSUBST_RET'
        end
        object cxGrid1DBTableView1Column9: TcxGridDBColumn
          Caption = 'Vlr. Produtos'
          DataBinding.FieldName = 'VLR_PRODUTOS'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object AdvPanel1: TAdvPanel
      Left = 1
      Top = 1
      Width = 1069
      Height = 102
      Align = alTop
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
      Caption.Visible = True
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
        Left = 10
        Top = 68
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dt.Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 160
        Top = 68
        Width = 26
        Height = 13
        Caption = 'Final:'
      end
      object Label20: TLabel
        Left = 11
        Top = 28
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Terminal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 27
        Top = 90
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'S'#233'rie:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 5
        Top = 48
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vendedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 146
        Top = 88
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPedido: TLabel
        Left = 334
        Top = 45
        Width = 121
        Height = 13
        Caption = 'F9-Ajusta/Finaliza Pedido'
        Transparent = False
        Visible = False
      end
      object dtInicial: TDateEdit
        Left = 57
        Top = 60
        Width = 90
        Height = 21
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 1
      end
      object dtFinal: TDateEdit
        Left = 188
        Top = 60
        Width = 90
        Height = 21
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 2
      end
      object btnConsultar: TNxButton
        Left = 288
        Top = 70
        Width = 145
        Height = 30
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          AE060000424DAE06000000000000360000002800000017000000170000000100
          1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F2F0F5F2F0FCFDFDFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B778D2D52869876
          72B0A3A1FCFDFE000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7780
          0055B812A5FA5E90BDBBA29FFAF5F4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF5C6377004EAD29BEFFA9ECFFA3F7FF3A89BFF6F5F6000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF75737F0051AC17B1FFA4E7FDD5FFFF12A6E45E90B5FFFCFC00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFD6C6C7D0057BB25BAFFA5E7FEC7FFFF099DDF6A8A
          A8FFFFFDFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54657D0057B120B5FFA1E5FECFFFFF
          109CDD4D7EA5FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFCFEFEDADDDDDAD9D9CFCFCFEDEFEFFFFFFFFFFFFFFFFFFF00024A21BCFFA5
          EAFFCAFFFF11A7E86587A9FFFFFCFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFDDE0E0958E8D7A63657D60628467678065658D77799C9393D3D1D1ADAA
          A749343776B3E0B4FFFF19A4DF5A84A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFD2D8D84C3334846269967570A39388A99E9AAB9E99AE9890
          B69DA4A28E8F867070E7D0CC806B6E005499467EA7FFFFFAFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFC2C2C2533638A27B799D80649A9A7C94988895
          97979498949198849E9478C4AFA8C8B5B7AFA1A1B6B3B1FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FBFBFB816D6E8A66679C6F4A987D
          5A978F7499978499998D99998C989783948769987854C9B1A9C1B4B6DED8D8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000E0DCDB74575C
          98634797653998765499876899927799977F99967F99907799826295704B9B64
          3AD4CFD8A39C9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000887F83865B54984D1A945C319969439A77559A7F5F998365998364997F5F
          99735095673F81400DC9A391B2ACB0ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000BDAFB38C57459140079352258D562D875732885D3A8D
          6744946E4B92694587532D91572CBB753CCA906BADAAB0CECDCDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6B7BB8F56428528008B3D08A766
          34CA9765D0A272BC8D5F9E6940A06B3ECB9867EFB984FFCB8ACD8A5FBBB8C0DD
          DBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000B8AEB1906152
          AD5529ECB177FFD29AFED7A5FCDEAEFEE7B6FFEABBFFE8B8FDDCABF7D09CFCCB
          90CF9675AEAAB2CBCBCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00009B96988F6B68EAA769FFD19BF4CD9BF4D8AAF4E0B4F4E4BBF4E5BDF4E4BB
          F4DDB1F6DBABF8C98AC6A399A8A6A9F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000D2D0D07E6B73B47F67FED295F6DBADF4E4BAF5E5C2F5
          E7C8F5E9CAF4E7C8F5E8C3F9E9B9D29E73DDDEE8A6A2A1FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FCFEFE9B8F91B6A0A5CD9972FDE8
          B2F6EDC7F5E9CCF4EDD4F5EED9F5EED6F9EFCDE4C299F3E4DD867F80D7D8D8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFD4D6D6
          574849C3AEB2CDA88FF0D9B4F6ECD0F6F3E3F6F1E5F4E8D3E2C2ABE1D0CF9E95
          96C6C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFD3D5D59F969797888CC0A6A1D1B6ACD5BEB2D7C0B7D5BDB8
          C1B4B8ADA7AAC0BFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFCFDFDD2D0D0A3A0A2CEC5C7E1
          D7D8DCD3D4A09C9EE7E5E5F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 5
        Transparent = True
        OnClick = btnConsultarClick
      end
      object cbNEnviados: TCheckBox
        Left = 328
        Top = 20
        Width = 137
        Height = 17
        Caption = 'Somente N'#227'o Enviados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object btnEnviar: TNxButton
        Left = 437
        Top = 70
        Width = 149
        Height = 30
        Caption = 'Enviar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFAEFF7D67BF2BF33F3C23DF5CF65F7D67BF5CC5EFBEBC0FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEFBF3F7D578F2BC29F7D986FAE7B4F8DC91F0B513EFAF00F3
          C138FDF7E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF0CFF6D475FDF4DBFFFFFFFFFFFFFFFF
          FFFCEFCBF6D372EFAF00F5CC5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF3DAFDF6E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCEECAF7D985F2BC2AF6D16CFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
          FEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF8E8F4C74CF3C341F8DE97F3C139
          F3C33FFAE4A9FFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDF9FEF9ECFFFEFCFFFFFFFFFFFFFFFEFCF8DA8AEFAE01EF
          AE00F2BF36F8DD93F2BE30F0B40FF9E09CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAEEFBEDC7FEFCF4FFFFFFFFFFFFFDF3
          DCF0B314EFB010EFB211EFAD06F2BE37F8DC91F1B81DF2BE31FDF6E3FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9EDFAE6AFFDF5DF
          FFFFFFFFFFFFFAE7B3F6D577FDF1D1FDF5DFF8DC8FF1B924F3C54CF7D67DF0B5
          12F9E09DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDF9FAE4A9FBE9BAFFFFFFFDF5DFF9DE97FFFFFFFDF4DCFCEDC5FFFFFFFDF5DD
          F1BD33F5CC67F4C74EF6D374FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFAE8B5F8DC90FFFFFFF9E09FFFFDF9FDF2D1F0B21CED
          A400F6D06BFAE5AEF3C240EFB215F6D476F4C954FCF0D0FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF6E3F7D884FBEAC0F7D680FFFF
          FFFBEABBF1BB35F1BC3FF3C139F4C547F2BD2CEFB006F3C851F5CE62F4C74BFD
          F4DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFFFFFFFAE7B2
          F1B92CF4CA5BFFFDFCFEFDF8FEFBF0FFFEF6FEFAEEFDF5E1FBE9B8F0B521EFAF
          0EF7D579F2BD2CF4C74EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF7E6F6
          D16EF2BF37F9DF99F1BD33F3BF33FFFFFEFDF6E1F6CD67F3C13BF5CD63FEF8E8
          FEF7E6F1B828EEAA00F5CC5AF5CB58F1BA23FBEABDFBEBC0FEFBF3FFFEFCFBEC
          C2FBEABEF5CA5AF0B40DF0B30AF4C64AF6D477F0B517FBEDC5FFFEF9F5CA59EB
          9D00F1BA2DFEFAECFCEFCAF0B31BEEAB00F0B617F6D16CF7D781F8DC8FFAE9B9
          FBEDCAFDF4DEFBE9B6FBE9B3F2BC3BF8D989FBEAB9F0B312F7D47AF3C44BF3C4
          46FEFBF3FEFBF2FAE3ABFCF1D1FFFFFEF7D67CEDAB00EFB10BF1B81DF9E2A3F9
          E2A4F9E19EFEF7E2FBE8BDFAE6B5FEF9E8FDF4D9F8DE9BF8DC96FDF6DFF1BA29
          EFB01CF8DA8FF0B724F3C54AFCEDC6FDF7E3FDF5DFF8DC93F0B417F2C03CFAE5
          ABFEF9ECFFFFFFFAE5ADFAE5ACFDF7E5F9DE9BF8DE9AFFFEFBFEF9E8FAE7B8FA
          E6B3FEF9E7F5CA63EFAE14F4C54FF6D275EFAD0CEFAE01F1BA27F1BC2BF3C244
          F7D784FDF4DCFFFFFFFFFFFFFFFFFFFCEFCDFBEDC7FCEFCCF8DD92FAE5ACFBE9
          BBFDF0D0FAE3ACFBE9BFFDF6DCFDF5E1FCEDC4FCF0CCF9DF99F6CE69F0B008EE
          AA00F0B51DFAE7B5FFFFFFFFFFFFFFFFFFFFFFFFFEFCF6FEF8E9FDF4DEFBE7AF
          FDF8E8FCF0D3F7D67DFBE7B1F9E5AEFCEDCAFCEECBFDF5DCFAE4AAF8DA87F6D0
          67FCF1D4F9E3A6F3C442EFB106FAE4A8FFFFFFFFFFFFFFFFFFFFFDFAFAE4AAFE
          F8E8FEF9ECF9E19DFFFFFFFBECC3FBEAC2FAE6AEFBEABCFCEFCFFAE8B9FBEBBB
          F8DD95F2BA38F0B41CFCF1D4FFFFFFFDF7E5F8DC91F4C952F6D475FAE5ADFAE7
          B3F4C84FF7D77EFEFCF7FEFCF6F9E1A1FFFFFFF9DF9EFEFCF6FAE5ADFDF8E7FB
          EABEF9E09FFFFEFAFDF3DBFCF1D1FCECC4F9DE97FFFFFFFFFFFFFFFFFFFCF0CF
          F7D987F4C851F2BE30F4CA55FDF4DBFFFFFFFFFFFFFAE6AEF8D987FAE8B6FFFF
          FFFAE6AFF7D985FBECC3FAE6B2F8DE94F9E09BF9E09DF8DE97F8DE95FFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFAFEF9ECFDF7E6FEFCF4FFFFFFFFFFFF}
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 7
        Transparent = True
        OnClick = btnEnviarClick
      end
      object btnReimprimir: TNxButton
        Left = 592
        Top = 70
        Width = 149
        Height = 30
        Caption = 'Imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000000000000000000000000000000000004DAF3A4DAF3A
          4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF
          3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4D
          AF3A49A03849A038FFFFFF49A03849A03849A03849A03849A03849A03849A038
          49A038FFFFFFFFFFFFFFFFFF49A03849A038FFFFFFFFFFFF49A038FFFFFF49A0
          3849A03849A03849A038438E36FFFFFF438E36FFFFFF438E36438E36438E3643
          8E36438E36438E36438E36FFFFFF438E36438E36438E36FFFFFF438E36438E36
          438E36FFFFFF438E36438E36438E36438E363E7A33FFFFFF3E7A33FFFFFF3E7A
          333E7A33FFFFFFFFFFFFFFFFFF3E7A333E7A33FFFFFFFFFFFFFFFFFF3E7A33FF
          FFFF3E7A333E7A333E7A33FFFFFFFFFFFFFFFFFF3E7A333E7A33386831FFFFFF
          386831386831FFFFFF386831386831386831386831386831386831FFFFFF3868
          31386831386831FFFFFF386831386831386831FFFFFF38683138683138683138
          683134592FFFFFFF34592F34592FFFFFFF34592F34592F34592F34592F34592F
          34592FFFFFFFFFFFFFFFFFFF34592F34592FFFFFFFFFFFFF34592FFFFFFFFFFF
          FFFFFFFF34592F34592F314E2E314E2E314E2E314E2E314E2E314E2E314E2E31
          4E2E314E2E314E2E314E2E314E2E314E2E314E2E314E2E314E2E314E2E314E2E
          314E2E314E2E314E2E314E2E314E2E314E2EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFE8E8E89B9B9B8382828D8C8C8E8D8D8E8D8D8E8D
          8D8B8B8B8A8A8A828181979696E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEB9B8B8818181CACACADDDDDD
          D7D7D7D8D7D7D8D7D7D8D7D7D9D9D9CDCCCC848383AEAEAEFCFCFCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B2B29E
          9D9DF1F1F1CBCBCBB4B4B4B7B6B6BCBBBBEDEDEDFFFFFFFDFDFD9D9C9CA5A5A5
          FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6
          F6D1D0D0959595A0A0A0E6E5E5ACABAB909090959494999999CFCFCFF5F5F5F4
          F4F49F9F9F8F8F8FCCCCCCF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFB2B1B17B7A7A727171A7A6A6E9E9E9AAA9A98E8D8D9494949494
          948E8D8DA1A0A0E2E1E1AEAEAE7271717A7979A8A8A8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF807F7F727171727171AAA9A9F8F8F8D1D0D0
          BCBCBCC1C0C0C0C0C0B8B8B8C5C5C5F4F4F4B3B2B27271717271717E7D7DFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8281817271717271718F
          8E8EC8C8C8D2D1D1CFCFCFCFCFCFCFCFCFCFCFCFD2D2D2CBCBCB929191727171
          727171838282FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8483
          837271717271717473737978787C7B7B7D7C7C7D7C7C7D7C7C7D7C7C7D7C7C79
          78787B7A7A807F7F747373848383FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF807F7F7271717271717271717271717271717271717271717271
          71727171727171727171BDBDBDECECEC8D8C8C7B7A7AFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A727171727171727171727171727171
          727171727171727171727171727171727171A8A8A8C9C9C9818181807F7FFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF9291917B7A7A77
          76768988888B8B8B8A89898A89898A89898A89898C8B8B888787767575767575
          8E8D8DC7C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFECECECA7A6A68F8F8FDCDCDCE7E7E7E4E4E4E4E4E4E4E4E4E4E4E4E7E7E7E0
          E0E0908F8F989797E7E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFB7B7B79A9999F8F8F8FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFD9E9E9EABAAAAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBADADAD999898F8F8F8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD9E9E9EA1A0A0F7F7F7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEBAB9B97F
          7E7EBDBDBDCFCFCFCACACACACACACACACACACACACECECEC1C1C1807F7FB2B1B1
          FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFEDEDEDA5A4A4807F7F8584848686868685858685858686868584847F
          7E7E9F9E9EE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        GlyphSpacing = 5
        ParentFont = False
        PopupMenu = PopupMenu1
        ShowArrow = True
        TabOrder = 8
        Transparent = True
      end
      object edtSerie: TEdit
        Left = 57
        Top = 82
        Width = 89
        Height = 21
        TabOrder = 3
      end
      object btnExcluir: TNxButton
        Left = 745
        Top = 70
        Width = 149
        Height = 30
        Caption = 'Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDF4A5A19F5955581F1C260000070000
          0C1B2021595C59A7A8A3FEFEF5FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC1BEB93E3B4C00000B00004100008D
          010AB20C16BB0710B40002A1000073000033000006414247C9C7BEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F4EE827F7B00003300007903
          18BA0717C6040FBB0008B10203AE0202AC0406A50004AD0306A7000096000052
          040325858782F4F6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1EB716F6B0000
          440014B5031CCB0011BB0003B50000BC0000BD0001BB0000BF0101BB0001BA00
          00B80102A702029F000079000023707376F3F4F1FFFFFFFFFFFFFFFFFFFCFBF7
          76757400004A0323D4011BD10007BB0000B90000BC0000BA0100BB0300BE0300
          C00100C10001BA0000BD0201BC0102AC0201A402009500002878797AFCFCFAFF
          FFFFFFFFFFB2ACA900013E0025CA021DD70008BF0000BB0000BF0000BF0000BE
          0100BF0200BF0200C10000C10001BD0000BE0000BD0101C00000B70200A30000
          80000024B3B3AFFFFFFFFFFFFC20213900169F022CE3010CCB0000C10000C500
          00C50000C50000C50000C70000C60000C50000C20102BF0100C40100C70000C7
          0001CA0002AF0202990000631E1F34FFFFFED8DACE0000340834F00420D80000
          C70000CE0000D20000D30000D40000D40000D50000D50000D40000D50000D000
          00D40000D60000D40100D30101C90002A103029C00000FDCDCD685858000028E
          0A36F60312D10000CC0000C90000B50000B10000B10000B10000B10000B10000
          B20000B50000B40000B50000B20000B50000C70000DA0100BA0107A00000488B
          8687403A3A002CDE032FE80006D80000C54947BA9694CF9797D19393CF9494CF
          9494CF9494CF9493CF9195D09594D19792D29696D28F94CF4948B80201CD0201
          C70006A10000873D393B0D0C121444FF0029E80000D53738CFDBDDEBFFFFFFFF
          FFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFEFFFEFFFFFEFFFEFEFFFFFEFFFFFF
          DEDCEA3938D70000CF0005A30509B009061300020E0F4EFF002BEA0000D45B5A
          DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFF
          FFFFFFFFFFFFFFFFFFFFFC5A5EE00000D70007A10711B5000015000209144EFF
          002FEB0005E20806D49496DFFFFFFFF3F1FAF3F2FCF3F2FCF3F2FCF3F2FCF3F2
          FCF2F2FCF2F2FCF2F3FBF3F3FBFFFFFF9D93DA0D06D40000D20007A90B14BE00
          001209070C0C3FFF0537FB071BEE0000E20000DB0000D90706DA0405D80403D8
          0403D80403D80403D80304D80302DE0504D80708D70000D70000DA0000EC0107
          CA000BAF000FB40D0A0D373533001EC90543FF042CF20001E70000EF0000EE00
          00EB0000EA0000EA0000EA0000EA0000EA0000E60000EB0000EA0000E50000E8
          0000F20001EB000DB70015AF0000933C3B3E84838000006B1045FF033AF4061C
          EE0000EC0000F10000F10000F10000F10000F10000F00000F10100F10000F300
          00F00200EF0200F20000F7000BD40014B00417BE000051888588DEDAD300000C
          0B30EB0342FF0434F50413F10000F00000F20000F40000F30000F30000F20000
          F50100F80000F50000F70100F90300F8000ADF0017BA0018BD070FBA000009DC
          DCD4FFFFFE211B270005820A3AFE0341FA0532F70317F20104F30000F60000F8
          0000FB0000F80100F90000F80000F70000FC0003F4000EE0001AC4001DBD0317
          C8000071211D2EFFFFFEFFFFFFB4B3A80000210215B2083FFF0444FB0235F502
          24F10413F50307F80001F80000F80100F90001F70004F6000CED0018D9001FCA
          0023C7041DCE0006A3000024B3B2ABFFFFFFFDFFFFFCFCFA7A767100002D0214
          C10D39FA0743FF003CF50234F1022AEE0324EB031CEF001AEC001EE40222E101
          26D70028D00427D1051CD60007B700002F767670FBFCF9FFFEFFF9FCFFFFFFFF
          F5F4EE73726C00002E0004A80822EE0A39FB013EF7003BF3053BE90135E20037
          DF0231DD002EDB002DDB0225DD0815D40001A200003571716AF3F3ECFFFFFFFE
          FDFDFDFBFFFEFDFCFFFFFFF7F7F284838100002D000072070BCF081DF40428F7
          0429F70529EE0528EE0525EB051DEE0618EA0208C7000073000031848383F7F7
          F1FFFFFFFFFCFFFEFEFBFFFBFAFBFDFEFAFFFDFFFFFFFFFFFDC4C2BA3E3F4D00
          00160000590000B90000FF0D10FF0C0CFF0000FF0000BA00005F000014403E49
          C2C2BBFFFFFEFEFFFFFAFDFDFEFDFDFFFFFCFBFFFBFFFFFEFFFBFFFBFDFCFCFF
          FFFFFFFFFFFFFDF9F9EAA8A59F5C5A5D1C1E250000100000111F1D22585B539F
          A29CF5F6EEFFFFFDFFFFFFFEFFFFFDFEFCFCFBFEFFFEFCFBFFFF}
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 9
        Transparent = True
        OnClick = btnExcluirClick
      end
      object ComboVendedor: TRxDBLookupCombo
        Left = 57
        Top = 40
        Width = 221
        Height = 21
        DropDownCount = 8
        Ctl3D = False
        DisplayEmpty = '[Todos]'
        LookupField = 'CODIGO'
        LookupDisplay = 'NOME'
        LookupSource = dmCupomFiscal.dsVendedor
        ParentCtl3D = False
        TabOrder = 0
      end
      object ComboBox1: TComboBox
        Left = 175
        Top = 80
        Width = 104
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 4
        Text = 'Todos'
        Items.Strings = (
          'Todos'
          'Cupom'
          'NFCe'
          'Pedido'
          'Or'#231'amento'
          'Comanda')
      end
      object ComboTerminal: TRxDBLookupCombo
        Left = 57
        Top = 20
        Width = 221
        Height = 21
        DropDownCount = 8
        Ctl3D = False
        DisplayEmpty = '[Todos]'
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = dmCupomFiscal.dsTerminal
        ParentCtl3D = False
        TabOrder = 10
      end
    end
    object gbxVendedor: TRzGroupBox
      Left = 1
      Top = 328
      Width = 1069
      Height = 156
      Align = alBottom
      BorderColor = clNavy
      BorderInner = fsButtonUp
      BorderOuter = fsBump
      Caption = ' Totais '
      Ctl3D = True
      FlatColor = clNavy
      FlatColorAdjustment = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      VisualStyle = vsGradient
      object Label5: TLabel
        Left = 296
        Top = 80
        Width = 138
        Height = 18
        Caption = 'Total de Vendas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 443
        Top = 80
        Width = 36
        Height = 18
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object SMDBGrid2: TSMDBGrid
        Left = 602
        Top = 21
        Width = 462
        Height = 130
        Align = alRight
        BorderStyle = bsNone
        Color = 12633514
        Ctl3D = False
        DataSource = dmCupomFiscal.dsTotal_FormaPagto
        FixedColor = 3683329
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -13
        TitleFont.Name = 'Verdana'
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
        ExOptions = [eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 20
        ScrollBars = ssHorizontal
        ColCount = 2
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Forma de Pagamento'
            Width = 308
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 134
            Visible = True
          end>
      end
    end
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 616
    Top = 327
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    SkinName = 'Office2007Blue'
    Left = 857
    Top = 312
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 888
    Top = 312
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsItalic]
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 664
    Top = 64
    object ImprimirCupom1: TMenuItem
      Caption = 'Imprimir Cupom'
      OnClick = ImprimirCupom1Click
    end
    object ImprimirCarne1: TMenuItem
      Caption = 'Imprimir Carne'
      OnClick = ImprimirCarne1Click
    end
    object ImprimiraConsulta1: TMenuItem
      Caption = 'Imprimir a Consulta'
      OnClick = ImprimiraConsulta1Click
    end
    object ImprimirCNFPedido1: TMenuItem
      Caption = 'Imprimir CNF / Pedido'
      OnClick = ImprimirCNFPedido1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 672
    Top = 184
    object BuscaNFCeWeb1: TMenuItem
      Caption = 'Busca NFCe Web'
      OnClick = BuscaNFCeWeb1Click
    end
  end
end

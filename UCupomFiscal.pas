unit uCupomFiscal;

interface
                     
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Grids, DBGrids, SMDBGrid,
  StdCtrls, RxLookup, DBFilter, Mask, ToolEdit, CurrEdit, FMTBcd, DB, Provider, DBClient, SqlExpr, DBCtrls,   Buttons, jpeg,
  DBTables, uDmCupomFiscal, uDmEstoque, uDmMovimento, rsDBUtils, uDmParametros, NxCollection, UCupomFiscalImposto, StrUtils,
  ValEdit, UCBase, ACBrBase, ACBrBAL, ACBrDevice, uNFCE_ACBr, uConsCupom, dbXPress, uConsultaRapidaProduto, JvStatusBar,
  ComCtrls, AdvPanel, JvGroupBox, TelaPrecoAlterado, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, uTipoDescontoItem,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ACBrValidador, JvScrollBox, uConsComanda, dxSkinsCore, dxSkinscxPCPainter, cxLookAndFeels,
  dxGDIPlusClasses, GradientLabel, ACBrDeviceSerial, Classe.Enviar.NFCe;

type
  tEnumTipoDesconto = (tpValor, tpPercentual, tpValorPago);

type
  TfCupomFiscal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    SMDBGrid2: TSMDBGrid;
    ACBrBAL1: TACBrBAL;
    AdvPanelStyler1: TAdvPanelStyler;
    pnlProduto: TAdvPanel;
    Label1: TLabel;
    JvStatusBar1: TJvStatusBar;
    Timer1: TTimer;
    Edit1: TEdit;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Edit2: TEdit;
    pnlDescricaoProduto: TAdvPanel;
    JvGroupBox1: TJvGroupBox;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    Label2: TLabel;
    Panel7: TPanel;
    PnlParcial: TPanel;
    btComanda: TNxButton;
    btPedido: TNxButton;
    btOrcamento: TNxButton;
    AdvPanel3: TAdvPanel;
    Image1: TImage;
    Panel5: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ITEM: TcxGridDBColumn;
    cxGrid1DBTableView1QTD: TcxGridDBColumn;
    cxGrid1DBTableView1VLR_UNITARIO: TcxGridDBColumn;
    cxGrid1DBTableView1VLR_DESCONTO: TcxGridDBColumn;
    cxGrid1DBTableView1VLR_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1NOMEPRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1REFERENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1ID_Produto: TcxGridDBColumn;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    pnlCaixaLivre: TPanel;
    ACBrValidador: TACBrValidador;
    pnlBotoes: TPanel;
    btCancelar: TNxButton;
    btFinalizar: TNxButton;
    btTroca: TNxButton;
    pnlCopiar: TPanel;
    btnCopiarComanda: TNxButton;
    btnCopiarPedido: TNxButton;
    btnCopiarSacola: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btFinalizarClick(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Enter(Sender: TObject);
    procedure btnCopiarPedidoClick(Sender: TObject);
    procedure btComandaClick(Sender: TObject);
    procedure btOrcamentoClick(Sender: TObject);
    procedure btPedidoClick(Sender: TObject);
    procedure SMDBGrid2DblClick(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure ACBrBAL1LePeso(Peso: Double; Resposta: string);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnCopiarComandaClick(Sender: TObject);
    procedure btnCopiarSacolaClick(Sender: TObject);
    procedure btTrocaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    fDmParametros: TDmParametros;
    fNFCE_ACBr: TfNFCE_ACBR;
    ffrmConsCupom: TfrmConsCupom;
    ffrmConsultaRapidaCupom: TfrmConsultaRapidaProduto;
    ffrmTelaPrecoAlterado: TFormTelaPrecoAlterado;
    ffrmTelaTipoDescontoItem: TfrmTelaTipoDescontoItem;
    vAliqIcms: Real;
    vTipoDesc: string;
    vSitTrib: Integer;
    vCalcula_IPI, vFinaliza, vDigitaGrade: Boolean;
    vID_Produto: Integer;
    vFilial_Loc: Integer;
    vEstoqueOK, vFinanceiroOK: String;
    vAplicarDescontoItem: Boolean;
    Cont: Integer;
    vTroca: Boolean;
    vExiste_Comanda: Boolean;
    vCanal_Venda : Boolean;
    FImprimirNFCe: Boolean;

    procedure evMensagem(Msg : String);
    procedure Limpa_Campos;
    function posicionaProduto: Boolean;
    procedure prc_Calcular_Tributos_Transparencia;
    function prc_Calcular_Media_Tributos: Currency;
    procedure prc_Calcular_IPI;
    procedure prc_ImprimeComanda(ID_Cupom: Integer);
    procedure prc_EnterCodigo(ConsultaAutomatica: Boolean = False);
    function fnc_VerficaFracionado(vUnidade: string): Boolean;
    procedure FinalizaParcial(vTipo: string);
    function fnc_CorTamanho: Boolean;
    procedure prcPesa;
    procedure prc_Controle_Gravar_Diversos(Financeiro, Estoque: Boolean);
    procedure Gravar_Estoque(vFinanceiro: Boolean);
    procedure prc_PosicionaFormaPgto(vId: Integer);
    procedure Gravar_CReceber;
    function fnc_Altera_Preco: Boolean;
    function fnc_Aplicar_Desconto: Boolean;

    procedure prc_Gravar_Estoque_Troca;
    procedure prc_Limpa_Variaveis_Encerramento;
    procedure prc_Canal_Venda;
    procedure prc_AjustaGrid(Coluna : TcxGridTableView; DbGrid : TcxGrid);
    procedure prc_AjustaPanel;
    procedure SetImprimirNFCe(const Value: Boolean);

  public
    { Public declarations }
    fDmEstoque: TDmEstoque;
    fDmMovimento: TDmMovimento;
    vSerieCupom: string; //Serie Cupom NFCe
    vTeste: Boolean;
    vSacolaSelecionada: Boolean;
    vItem_original: Integer;
    vUnidade, vFormaQtd: string;
    vPerc_Ipi: Real;
    vNome_Complementar: string;
    vID_Pedido: Integer;
    vItem_Pedido: Integer;
    vNumero_OC: string;
    vNumero_OS: string;
    vItem_Cliente: Integer;
    vNum_Pedido: Integer;
    vPedidoSelecionado: Boolean;
    vPreco_Ori: Real;
    vGeraIcms: Boolean;
    vCopiandoComanda: Boolean;
    vSubTotal: Double;
    vValorDesconto: Double;
    vVlrItem: Double;
    vTipoDescItem: String;
    TipoDescFech: String;
    fDmCupomFiscal: TDmCupomFiscal;
    property ImprimirNFCe : Boolean read FImprimirNFCe write SetImprimirNFCe;
    
    procedure Excluir_Estoque(Filial, NumMov: Integer);
    procedure prc_ConfirmaItem;
    procedure prc_InformaCliente;
    procedure prc_ConsPreco;
    procedure prc_Move_Itens;
    procedure prc_Form_Cartao;
    procedure prc_Inserir;
    procedure prc_Verificar_Pedido(ID: Integer);

    function fnc_Estoque_OK(ID_Produto, ID_Cor: Integer; Tamanho: string; Qtd: Real): Boolean;
    function fnc_Validacao_OK: Boolean;
    //procedure prc_Busca_IBPT;
  end;

var
  fCupomFiscal: TfCupomFiscal;

implementation

uses
  UCupomFiscalPgto, UCupomFiscalCanc, USel_Produto, uUtilPadrao, uComandaR,
  uCupomCliente, uCalculo_CupomFiscal, Math, USenha, uUtilCupom, UConsPreco,
  USel_Sacola_CF, USel_Pedido_CF, DmdDatabase, uMenu, UCupomFiscalCli,
  USel_Comanda_CF, uCupomFiscalParcela, uSel_CorTamanho, uBalanca,
  uGrava_Erro, USel_Troca, UCupom_Troca, uCartao, uTelaAtalho, TelaTroco,
  UCanalVendas, uCartaoNome;

{$R *.dfm}

procedure TfCupomFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
var
  fim: Integer; //balança Urano
begin
  Tag := 0;
  fDmCupomFiscal.vID_Canal_Vendas := 0;
  if fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert] then
    fDmCupomFiscal.prc_Excluir_Cupom_Fiscal(fDmCupomFiscal.cdsCupomFiscalID.AsInteger);

  FreeAndNil(fDmEstoque);
  FreeAndNil(fDmMovimento);

  if (fDmCupomFiscal.cdsCupomParametrosUSA_BALANCA.AsString = 'S') then
    if vBalanca = 'URANO' then
      fim := _FechaPortaSerial();
  FreeAndNil(fNFCE_ACBr);
  Action := Cafree;
end;

procedure TfCupomFiscal.FormShow(Sender: TObject);
var
  i: Integer;
  vWidth: Integer;
begin
  fDmCupomFiscal := TDmCupomFiscal.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  fNFCE_ACBr := TfNFCE_ACBR.Create(nil);
  fDmCupomFiscal.vID_Canal_Vendas := 0;

  Cont := 10;

  fDmParametros := TdmParametros.Create(Self);
  vFilial_Loc := vFilial;
  if fDmCupomFiscal.cdsFilialID.AsInteger <> vFilial_Loc then
    fDmCupomFiscal.cdsFilial.Locate('ID', fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger, [loCaseInsensitive]);

  fDmCupomFiscal.prc_Abrir_CSTICMS(fDmCupomFiscal.cdsFilialSIMPLES.AsString);
  if not fnc_Validacao_OK then
  begin
    PostMessage(fCupomFiscal.Handle, WM_CLOSE, 0, 0);
    //Close;
    exit;
  end;
  fDmCupomFiscal.cdsTipoCobranca.Open;
  fDmCupomFiscal.prc_Abrir_CondPgto;

  fDmCupomFiscal.prc_Abrir_cdsVendedor;

  vSerieCupom := fDmCupomFiscal.lerIni('IMPRESSORA', 'Serie');
  vCpfOK := False;
  vDocumentoClienteVenda := '';
  fDmEstoque := TDmEstoque.Create(Self);
  fDmMovimento := TdmMovimento.Create(Self);

//  gbDesconto.Visible := (fDmCupomFiscal.cdsCupomParametrosUSA_DESCONTO.AsString = 'I') or (fDmCupomFiscal.cdsCupomParametrosUSA_DESCONTO.AsString = 'A');
  vFormaQtd := '0.0000';

//  prc_le_Grid(SMDBGrid1, Name, fDmCupomFiscal.qParametros_GeralENDGRIDS.AsString);
  PnlParcial.Visible := (fDmCupomFiscal.cdsCupomParametrosUSA_CARTAO_COMANDA.AsString = 'S') or (fDmCupomFiscal.cdsCupomParametrosUSA_ORCAMENTO.AsString = 'S') or (fDmCupomFiscal.cdsCupomParametrosUSA_PEDIDO.AsString = 'S');

  if fDmCupomFiscal.cdsCupomParametrosPRODUTO_PADRAO.AsInteger > 0 then
  begin
    Edit1.Text := fDmCupomFiscal.cdsCupomParametrosPRODUTO_PADRAO.AsString;
    prc_EnterCodigo;
  end;

  CurrencyEdit1.Value := fDmCupomFiscal.cdsCupomParametrosQTD_PADRAO.AsCurrency;
  Edit1.SetFocus;

  btComanda.Visible := fDmCupomFiscal.cdsCupomParametrosUSA_CARTAO_COMANDA.AsString = 'S';
  btOrcamento.Visible := fDmCupomFiscal.cdsCupomParametrosUSA_ORCAMENTO.AsString = 'S';
  btPedido.Visible := fDmCupomFiscal.cdsCupomParametrosUSA_PEDIDO.AsString = 'S';

  if FileExists(fDmCupomFiscal.cdsFilialENDLOGO.AsString) then
    Image1.Picture.LoadFromFile(fDmCupomFiscal.cdsFilialENDLOGO.AsString);

  if fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString = 'S' then
    btCancelar.Caption := 'E&xcluir Item';

  for i := 0 to cxGrid1DBTableView1.ColumnCount - 2 do
  begin
    if cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = 'REFERENCIA' then
      cxGrid1DBTableView1.Columns[i].Visible := fDmCupomFiscal.cdsCupomParametrosUSA_COD_REF.AsString = 'R';
    if (fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString = 'S') and (cxGrid1DBTableView1.Columns[i].DataBinding.FieldName = 'NOMEPRODUTO') then
      cxGrid1DBTableView1.Columns[i].DataBinding.FieldName := 'NOME_PRODUTO';
  end;
  if fDmCupomFiscal.cdsParametrosGRAVAR_CONSUMO_NOTA.AsString = 'S' then
    fDmCupomFiscal.prc_Abrir_Cupom_ProdPrincipal(fDmCupomFiscal.cdsCupomFiscalID.AsInteger, 0);

  pnlCopiar.Visible := ((fDmCupomFiscal.cdsParametrosGRAVAR_CONSUMO_NOTA.AsString = 'S') or (fDmCupomFiscal.cdsCupomParametrosUSA_COPIA_PEDIDO_CF.AsString = 'S') or (fDmCupomFiscal.cdsCupomParametrosUSA_CARTAO_COMANDA.AsString = 'S'));
  if pnlCopiar.Visible then
  begin
    vWidth := 0;
    btnCopiarSacola.Visible := (fDmCupomFiscal.cdsParametrosGRAVAR_CONSUMO_NOTA.AsString = 'S');
    btnCopiarPedido.Visible := (fDmCupomFiscal.cdsCupomParametrosUSA_COPIA_PEDIDO_CF.AsString = 'S');
    btnCopiarComanda.Visible := (fDmCupomFiscal.cdsCupomParametrosUSA_CARTAO_COMANDA.AsString = 'S');
    if btnCopiarComanda.Visible then
     Inc(vWidth);
    if btnCopiarPedido.Visible then
     Inc(vWidth);
    if btnCopiarSacola.Visible then
     Inc(vWidth);
    if btnCopiarSacola.Visible then
      btnCopiarSacola.Width  := pnlCopiar.Width div vWidth
    else
      btnCopiarSacola.Width  := 0;
    if btnCopiarPedido.Visible then
      btnCopiarPedido.Width  := pnlCopiar.Width div vWidth
    else
      btnCopiarPedido.Width  := 0;
    if btnCopiarComanda.Visible then
      btnCopiarComanda.Width := pnlCopiar.Width div vWidth
    else
      btnCopiarComanda.Width := 0;
  end;

//////////////////////////////////
  if (fDmCupomFiscal.cdsCupomParametrosUSA_BALANCA.AsString = 'S') then
  begin
    if vBalanca = 'URANO' then
    begin
      _AlteraModeloBalanca(3); //US POP
      _AlteraModoOperacao(0); //Computador Requisita
      if _AbrePortaSerial(vPortaBalanca) < 1 then
        ShowMessage('Não foi possivel conectar na porta da balança ' + vPortaBalanca + '!');
    end
    else if vBalanca = 'ACBR' then
    begin
    end;
  end;
//////////////////////////////////
  vPedidoSelecionado := False;
  vUnidade := '';
  vPerc_Ipi := 0;
  vNome_Complementar := '';
  vID_Pedido := 0;
  vItem_Pedido := 0;
  vNumero_OC := '';
  vNumero_OS := '';
  vItem_Cliente := 0;
  vNum_Pedido := 0;

  JvStatusBar1.Panels[0].Text := vUsuario;
  JvStatusBar1.Panels[1].Text := 'Terminal: ' + IntToStr(vTerminal);
  JvStatusBar1.Panels[3].Text := SQLLocate('FILIAL','ID','NOME_INTERNO',fDmCupomFiscal.cdsFilialID.AsString);
  JvStatusBar1.Font.Style := JvStatusBar1.Font.Style + [fsBold];
//  prc_AjustaPanel;
end;

procedure TfCupomFiscal.Edit1Exit(Sender: TObject);
begin
  if vFinaliza then //quando código vazio
    Exit;

  if not posicionaProduto then
    Exit;  //aqui

  if Trim(Edit1.Text) <> '' then
  begin
    //11/01/2017  Cleomar
    if StrToFloat(FormatFloat('0.0000', vPreco_Pos)) > 0 then
      vVlrItem := vPreco_Pos
    else
    if fDmCupomFiscal.cdsCupomParametrosUSA_PRECO_REVENDA.AsString = 'S' then
      vVlrItem := fDmCupomFiscal.cdsProdutoPRECO_REVENDA.AsCurrency
    else
      vVlrItem := fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsCurrency;
    //*************
    if (not vCopiandoComanda) and (Length(Edit1.Text) < 5) and ((fDmCupomFiscal.cdsCupomParametrosUSA_BALANCA.AsString = 'S') and ((fDmCupomFiscal.cdsProdutoUNIDADE.AsString = 'KG') or (fDmCupomFiscal.cdsProdutoUNIDADE.AsString = 'Kg') or (fDmCupomFiscal.cdsProdutoUNIDADE.AsString = 'kg'))) then
    begin
      if acbrBal1.Ativo then
        ACBrBAL1.Desativar;
      prcPesa;
    end;

    if (fDmCupomFiscal.cdsCupomParametrosSOLICITA_CPF.AsString = 'I') and (not vCpfOK) then
      fDmCupomFiscal.prc_Digita_Documento;

    vSubTotal := StrToFloat(FormatFloat('0.00', vVlrItem * CurrencyEdit1.Value));
    prc_Move_Itens;

    if (fDmCupomFiscal.cdsCupomParametrosUSA_CANAL_VENDA.AsString = 'S') and not(vCanal_Venda) then
    begin
      Edit1.SetFocus;
      exit;
    end;

    CurrencyEdit1Exit(Sender);
  end;
end;

procedure TfCupomFiscal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  {if uUtilCupom.fnc_Verifica_NFCe_Nao_Enviada then
  begin
    if MessageDlg('Existe Cupons não enviados para a Sefaz, Favor verificar !' #13 + '   Pressione F11 e enviei os Cupons não enviados!' +#13 + #13+
       '   Deseja Enviar agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then


  end;} 

  CanClose := fnc_Encerrar_Tela(fDmCupomFiscal.cdsCupomFiscal);
end;

procedure TfCupomFiscal.CurrencyEdit1Exit(Sender: TObject);
begin
  if (vVlrItem > 0) and (CurrencyEdit1.Value > 0) then
  begin
    prc_Calcular_IPI;
    vSubTotal := StrToFloat(FormatFloat('0.00', vVlrItem * CurrencyEdit1.Value));
  end;
  if (Edit1.Text = EmptyStr) and (CurrencyEdit1.Value > 0) then
    Edit1.SetFocus;
end;

procedure TfCupomFiscal.RxDBLookupCombo2Exit(Sender: TObject);
begin
//  vAliqIcms := cdsSitTrib_CFPERCENTUAL.AsFloat; //juca 22/04/13
end;

procedure TfCupomFiscal.Limpa_Campos;
begin
  Edit1.Clear;
  CurrencyEdit1.Value := fDmCupomFiscal.cdsCupomParametrosQTD_PADRAO.AsCurrency;
  vVlrItem := 0;
  vSubTotal := 0;
  vPreco_Pos := 0;
  vAliqIcms := 0;
  vValorDesconto := 0;
  vDigitaGrade := False;

  if fDmCupomFiscal.cdsCupomParametrosPRODUTO_PADRAO.AsInteger > 0 then
  begin
    Edit1.Text := fDmCupomFiscal.cdsCupomParametrosPRODUTO_PADRAO.AsString;
    prc_EnterCodigo;
  end;
  vCalcula_IPI         := True;
  vPedidoSelecionado   := False;
  vAplicarDescontoItem := False;
  vUnidade             := '';
  vPerc_Ipi            := 0;
  vNome_Complementar   := '';
  vID_Pedido           := 0;
  vItem_Pedido         := 0;
  vNumero_OC           := '';
  vNumero_OS           := '';
  vItem_Cliente        := 0;
  vNum_Pedido          := 0;
  vCopiandoComanda     := False;
  pnlDescricaoProduto.Text := '';
  ImprimirNFCe         := True;
end;

procedure TfCupomFiscal.SMDBGrid1GetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDmCupomFiscal.cdsCupom_ItensCANCELADO.AsString = 'S' then
    AFont.Color := clRed;
end;

procedure TfCupomFiscal.Excluir_Estoque(Filial, NumMov: Integer);
begin
  fDmCupomFiscal.cdsEstoqueMov.IndexFieldNames := 'Filial;NumMov';
  if fDmCupomFiscal.cdsEstoqueMov.FindKey([Filial, NumMov]) then
    fDmCupomFiscal.cdsEstoqueMov.Delete;
end;

procedure TfCupomFiscal.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ((Shift = [ssCtrl]) and (Key = 84)) or ((Shift = [ssCtrl]) and (Key = 90)) then //CTRL T ou CTRL Z
  begin
    if fDmCupomFiscal.cdsFilialID.AsInteger <> vFilial_Loc then
      fDmCupomFiscal.cdsFilial.Locate('ID', vFilial_Loc, [loCaseInsensitive]);

    fDmCupomFiscal.vID_Troca := 0;
    frmCupom_Troca := TfrmCupom_Troca.Create(Self);
    frmCupom_Troca.fDmCupomFiscal := fDmCupomFiscal;
    frmCupom_Troca.vSerieCupom := vSerieCupom;
    frmCupom_Troca.ShowModal;
    FreeAndNil(frmCupom_Troca);

    //vTroca := not(vTroca);
  end
  else
  if (Key = Vk_Return) then
  begin
    //24/11/2020 
    if ((fDmCupomFiscal.cdsCupom_Itens.Active) and (fDmCupomFiscal.cdsCupom_Itens.RecordCount <= 0)) or (not(fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit,dsInsert]))  then
    begin
      prc_Canal_Venda;
      if (fDmCupomFiscal.cdsCupomParametrosUSA_CANAL_VENDA.AsString = 'S') and not(vCanal_Venda) then
      begin
        Edit1.SetFocus;
        exit;
      end;
    end;

    if vTroca then
    begin
      if (trim(Edit1.Text) <> '') and not(posicionaProduto) then
        Exit;

      fDmCupomFiscal.vID_Troca := 0;
      frmSel_Troca := TfrmSel_Troca.Create(Self);
      frmSel_Troca.fDmCupomFiscal := fDmCupomFiscal;
      frmSel_Troca.CurrencyEdit1.AsInteger := vID_Produto;
      frmSel_Troca.ShowModal;
      FreeAndNil(frmSel_Troca);
      //if fDmCupomFiscal.vID_Troca > 0 then
      //  prc_Gravar_Troca;

    end
    else
    begin
      if Copy(Edit1.Text, Length(Edit1.Text), 1) = '*' then
      begin
        CurrencyEdit1.Value := StrToFloat(Copy(Edit1.Text, 1, Length(Edit1.Text) - 1));
        Edit1.Clear;
        Exit;
      end;
      prc_EnterCodigo;
    end;
  end;
end;

procedure TfCupomFiscal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ffrmConsComanda: TfrmConsComanda;
  ffrmTelaAtalho: TfrmTeclasAtalho;
  RetornoUser: TInfoRetornoUser;
  RetornaCampoUsuario: String;
  vQtdeTotal : Integer;
begin
  if not (Panel4.Enabled) then
    Exit;

  if (Key = Vk_F1) then
  begin
    ffrmTelaAtalho := TfrmTeclasAtalho.Create(Self);
    ffrmTelaAtalho.ShowModal;
    FreeAndNil(ffrmTelaAtalho);
//    if pnlMenu.width = 0 then
//      pnlMenu.width := 250
//    else
//      pnlMenu.width := 0;


  end;

  if (Key = Vk_F2) then
  begin
    Edit1.Clear;

    frmSel_Produto := TfrmSel_Produto.Create(Self);
    frmSel_Produto.ShowModal;

    if vCodProduto_Pos > 0 then
    begin
      if fDmCupomFiscal.cdsCupomParametrosUSA_COD_REF.AsString = 'R' then
        Edit1.Text := vReferencia_Pos
      else
        Edit1.Text := IntToStr(vCodProduto_Pos);
      if not posicionaProduto then
        Exit
      else
        Edit1Exit(Sender);
    end;
  end;

  //lança desconto no item
  if (Key = Vk_F3) then
  begin
    vAplicarDescontoItem := True;
    pnlDescricaoProduto.Text := 'Informe o Produto (C/Desconto)';
    pnlDescricaoProduto.Update;
  end;

  if (Key = Vk_F4) then
    prc_ConsPreco;

  if (Key = Vk_F5) and (fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert]) then
    fDmCupomFiscal.prc_Digita_Documento;

  if (Key = Vk_F6) then
    prc_InformaCliente;

  if (Key = Vk_F7) then
    prc_ConfirmaItem;

  if (Key = Vk_F8) then
  begin
    if btOrcamento.Visible then
      btOrcamentoClick(Sender);
  end;

  if (Key = Vk_F9) then
  begin
    if btPedido.Visible then
      btPedidoClick(Sender);
  end;

  if key = vk_F11 then //F11
  begin
    if not (fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert]) then
    begin
      fDmCupomFiscal.vAceita_Converter := True;
      //fDmCupomFiscal.vID_Cupom_Pos     := 0;
      vID_Cupom_Pos                    := 0;
      ffrmConsCupom := TfrmConsCupom.Create(nil);
      ffrmConsCupom.lblPedido.Visible     := (fDmCupomFiscal.cdsCupomParametrosUSA_PEDIDO.AsString = 'S');
      ffrmConsCupom.fDmCupomFiscal        := fDmCupomFiscal;
      ffrmConsCupom.btnReimprimir.Visible := True;
      ffrmConsCupom.edtSerie.Text         := vSerieCupom;
      try
        ffrmConsCupom.ShowModal;
        if fDmCupomFiscal.vConverter_NFCe then
        begin
          fDmCupomFiscal.prcLocalizar(vID_Cupom_Pos);
          fDmCupomFiscal.Excluir_Duplicata;          
          btFinalizarClick(Sender);
          vID_Cupom_Pos := 0;
        end;
      finally
        FreeAndNil(ffrmConsCupom);
        fDmCupomFiscal.vAceita_Converter := False;
      end;
      if (vID_Cupom_Pos > 0) and not(fDmCupomFiscal.vConverter_NFCe) then
        prc_Verificar_Pedido(vID_Cupom_Pos);
    end;
  end;

  if (Key = Vk_F12) then
  begin
    if btComanda.Visible then
    begin
      btComandaClick(Sender);
//      pnlCaixaLivre.Visible := False;
    end;
  end;

  //Cancela lançamento de itens do cupom
  if key = 27 then // Esc
  begin
    if fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert] then
    begin
      if MessageDlg('Deseja cancelar o cupom?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;
      if fDmCupomFiscal.cdsCupomParametrosAUTENTICA_USUARIO.asString = 'S' then
      begin
        RetornaCampoUsuario := AutenticaUsuario(vUsuario,'',RetornoUser);
        if RetornaCampoUsuario <> 'S' then
          Exit;
      end;

      fDmCupomFiscal.prc_Excluir_Cupom_Fiscal(fDmCupomFiscal.cdsCupomFiscalID.AsInteger);
      fDmCupomFiscal.cdsCupomFiscal.Close;
      fDmCupomFiscal.cdsCupom_Troca.Close;
      pnlDescricaoProduto.Text := '';
      pnlDescricaoProduto.Update;
      pnlCaixaLivre.Visible := True;
      vDocumentoClienteVenda := '';
      vCpfOK := False;
      Limpa_Campos;
      Edit1.Setfocus;
    end;
  end;

  //Consulta de cupons

  //cancelamento do cupom
  if ssCtrl in Shift then
  begin
    case Upcase(Char(Key)) of
      'C' :
      begin
        if not (fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert]) then
        begin
          ffrmConsCupom := TfrmConsCupom.Create(nil);
          ffrmConsCupom.fDmCupomFiscal := fDmCupomFiscal;
          ffrmConsCupom.vCancelar := True;
          try
            ffrmConsCupom.ShowModal;
          finally
            FreeAndNil(ffrmConsCupom);
          end;
          fDmCupomFiscal.cdsCupomFiscal.Close;
        end;
      end;
      'E' :
      begin
        if not (fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert]) then
        begin
          ffrmConsCupom := TfrmConsCupom.Create(nil);
          ffrmConsCupom.fDmCupomFiscal := fDmCupomFiscal;
          ffrmConsCupom.vExcluir := True;
          try
            ffrmConsCupom.ShowModal;
          finally
            FreeAndNil(ffrmConsCupom);
          end;
          fDmCupomFiscal.cdsCupomFiscal.Close;
        end;
      end;
      'S' :
      begin
        if not (fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert]) then
        begin
          if not (DelphiAberto) then
          begin
            vQtdeTotal := VerificaCupomPendente;
            if vQtdeTotal > 0 then
              if vQtdeTotal = 1 then
                ChamaDllMensagem('Existe ' + FormatFloat('00', vQtdeTotal) + ' Cupom pendente nos últimos 30 dias')
              else
                ChamaDllMensagem('Existem ' + FormatFloat('00', vQtdeTotal) + ' Cupons pendentes nos últimos 30 dias');
          end;
          Close;
        end;
      end;
    end;

  end;

  if (Shift = [ssCtrl]) and (Key = 77) then //CTRL  M
  begin
    ffrmConsComanda := TfrmConsComanda.Create(nil);
    ffrmConsComanda.fDmCupomFiscal := fDmCupomFiscal;
    ffrmConsComanda.ShowModal;
    FreeAndNil(ffrmConsComanda);
  end;

  if (Shift = [ssCtrl]) and (Key = 87) then
  begin
  end;


end;

function TfCupomFiscal.posicionaProduto: Boolean;
var
  vCampoPesquisa: string;
  vTamCod: Byte;
  xValor: String;
  vValorConv: Double;
  vCodigoBalanca: String;
  vQtde: Real;
begin
  Result := False;
  vID_Produto := 0;
  vTamCod     := 4;
  fDmCupomFiscal.vIdCombinacao := 0;
  fDmCupomFiscal.vTamanho      := '';
  fDmCupomFiscal.vCombinacao   := '';
  if not fDmCupomFiscal.cdsCupomParametrosTAMANHO_COD_ETIQUETA.IsNull then
    vTamCod := fDmCupomFiscal.cdsCupomParametrosTAMANHO_COD_ETIQUETA.AsInteger;

  if trim(Edit1.Text) = '' then
    exit;

   //Tirei no dia 18/11/2019 - nao sei pra que serve
  if fDmCupomFiscal.cdsCupomParametrosUSA_COD_REF.AsString = 'R' then
    vCampoPesquisa := 'REF'
  else
    vCampoPesquisa := 'ID';

  if ((Length(Edit1.Text) > 7) and (vCampoPesquisa = 'ID')) or (Length(Edit1.Text) = 12) or (Length(Edit1.Text) = 13) or (Length(Edit1.Text) = 14) then
  begin
    if copy(Edit1.Text, 1, 1) = '2' then
    begin
      vCodigoBalanca := SQLLocate('PRODUTO','CODIGO_BALANCA','ID',Copy(Edit1.Text, 2, vTamCod));
      if vCodigoBalanca = EmptyStr then
        vCodigoBalanca := Copy(Edit1.Text, 2, vTamCod);
      fDmCupomFiscal.prc_Abrir_Produto(vCampoPesquisa, vCodigoBalanca); //aqui criar um parametro, pode ser 4
      xValor := copy(Edit1.Text,vTamCod + 2,7);
      if TryStrToFloat(xValor, vValorConv)  then
      begin
        vPreco_Pos := vValorConv / 100;
        vQtde := StrToCurr(FormatFloat('#.##0,00000', (vPreco_Pos / fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsFloat)));
        vPreco_Pos := fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsFloat;
        CurrencyEdit1.Value := vQtde;
      end;
      if fDmCupomFiscal.cdsProduto.IsEmpty then
      begin
        ShowMessage('Código do produto lido: ' + Copy(Edit1.Text, 2, vTamCod));
        Result := False;
      end
      else
      begin
        //11/01/2017   Cleomar
        if StrToFloat(FormatFloat('0.00000', vPreco_Pos)) > 0 then
          vVlrItem := vPreco_Pos
        else
        begin
          //06/11/2019
          if fDmCupomFiscal.cdsCupomParametrosUSA_TABELA_PRECO.AsString = 'S' then
          begin
            fDmCupomFiscal.prc_Lista_Preco(fDmCupomFiscal.cdsProdutoID.AsInteger);
          end
          else
          if (fDmCupomFiscal.cdsCupomParametrosUSA_PRECO_REVENDA.AsString = 'S') then
            vVlrItem := fDmCupomFiscal.cdsProdutoPRECO_REVENDA.AsFloat
          else
          if (fDmCupomFiscal.cdsProdutoPRECO_VENDA.IsNull) or (fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsFloat = 0) then
          begin
            MessageDlg('*** Preço de venda não cadastrado no produto!', mtInformation, [mbOk], 0);
            Edit1.Clear;
            Edit1.SetFocus;
            Exit;
          end
          else
            vVlrItem := fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsFloat;
        end;
        //**************
        //Cleomar 06/11/2019  alterado para a Gercla
        if Trim(fDmCupomFiscal.cdsCupomParametrosUSA_CBARRA_INT.AsString) = 'S' then
        begin
          fDmCupomFiscal.qCBarra_Int.Close;
          fDmCupomFiscal.qCBarra_Int.ParamByName('COD_BARRA').AsString := copy(Edit1.Text,1,12);
          fDmCupomFiscal.qCBarra_Int.Open;
          if fDmCupomFiscal.qCBarra_Int.IsEmpty then
          begin
            MessageDlg('*** Código de barras não cadastrado no produto!', mtInformation, [mbOk], 0);
            Edit1.Clear;
            Edit1.SetFocus;
            Exit;
          end
          else
          begin
            fDmCupomFiscal.vIdCombinacao := fDmCupomFiscal.qCBarra_IntID_COR.AsInteger;
            fDmCupomFiscal.vTamanho      := fDmCupomFiscal.qCBarra_IntTAMANHO.AsString;
            fDmCupomFiscal.vCombinacao   := fDmCupomFiscal.qCBarra_IntNOME_COMBINACAO.AsString;
          end;
          //*********** Até aqui é o da Gercla 06/11/2019
        end
        else
        begin
          case fDmCupomFiscal.cdsCupomParametrosETIQUETA_INFO.AsInteger of
            0:
              ;
            1:
              begin //peso
                CurrencyEdit1.Value := StrToFloat(Copy(Edit1.Text, 7, 6)) / 1000;
                vSubTotal := StrToFloat(FormatFloat('0.00', vVlrItem * CurrencyEdit1.Value));
              end;
            2:
              begin //preço
                CurrencyEdit1.Value := StrToFloat(Copy(Edit1.Text, 7, 6)) / 100 / fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsFloat;
                vSubTotal := StrToFloat(FormatFloat('0.00', vVlrItem * CurrencyEdit1.Value));
              end;
          end;
        end;
        vID_Produto := fDmCupomFiscal.cdsProdutoID.AsInteger;
        Result := True;
        Exit;
      end;
    end
    else
    begin
      if fDmCupomFiscal.cdsCupomParametrosUSA_TABELA_PRECO.AsString = 'S' then
      begin
        fDmCupomFiscal.prc_Lista_Preco(fDmCupomFiscal.cdsProdutoID.AsInteger);
      end;
    end;

    fDmCupomFiscal.prc_Abrir_Produto('CB', Edit1.Text);
    if not fDmCupomFiscal.cdsProduto.IsEmpty then
    begin
      vID_Produto := fDmCupomFiscal.cdsProdutoID.AsInteger;
      Result := True;
    end
    else
    begin
      MessageDlg('*** Código de Barra ' + Edit1.Text + ' não encontrado!', mtInformation, [mbOk], 0);
      Edit1.SelectAll;
      Result := False;
      Exit;
    end;

  end
  else
  begin
    fDmCupomFiscal.prc_Abrir_Produto(vCampoPesquisa, Edit1.Text);
    if fDmCupomFiscal.cdsProduto.RecordCount > 1 then
      prc_EnterCodigo(True);

    if not fDmCupomFiscal.cdsProduto.IsEmpty then
    begin
      vID_Produto := fDmCupomFiscal.cdsProdutoID.AsInteger;
      Result := True;

      //06/11/2019
      if (fDmCupomFiscal.cdsParametrosINFORMAR_COR_MATERIAL.AsString = 'S') or
         (fDmCupomFiscal.cdsParametrosINFORMAR_COR_PROD.AsString = 'C') or
         (fDmCupomFiscal.cdsParametrosINFORMAR_COR_PROD.AsString = 'B') or
         (fDmCupomFiscal.cdsParametrosUSA_GRADE.AsString = 'S') then
      begin
        if not fnc_CorTamanho then
        begin
          MessageDlg('*** Produto possui grade de cor e/ou tamanho, favor informar!' , mtInformation, [mbOk], 0);
          Edit1.Clear;
          Edit1.SetFocus;
          Result := False;
          Exit;
        end;
      end;
      if fDmCupomFiscal.cdsCupomParametrosUSA_TABELA_PRECO.AsString = 'S' then
      begin
        fDmCupomFiscal.prc_Lista_Preco(vID_Produto);
      end
    end
    else
    begin
      MessageDlg('*** Código / Referência ' + Edit1.Text + ' não encontrado!', mtInformation, [mbOk], 0);
      Edit1.Clear;
      Edit1.SetFocus;
      Result := False;
      Exit;
    end;
  end;

  if Result then
  begin
    //11/01/2017 Cleomar
    if StrToFloat(FormatFloat('0.0000', vPreco_Pos)) > 0 then
      vVlrItem := vPreco_Pos
    else
    //06/11/2019
    begin
      if fDmCupomFiscal.cdsCupomParametrosUSA_PRECO_REVENDA.AsString = 'S' then
        vVlrItem := fDmCupomFiscal.cdsProdutoPRECO_REVENDA.AsFloat
      else
        vVlrItem := fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsFloat;
    end;
    vSubTotal := StrToFloat(FormatFloat('0.00', vVlrItem * CurrencyEdit1.Value));
    vID_Produto := fDmCupomFiscal.cdsProdutoID.AsInteger;
  end
  else
  begin
    MessageDlg('*** Registro não encontrado!', mtInformation, [mbOk], 0);
    Edit1.Clear;
    Edit1.SetFocus;
  end;
end;

procedure TfCupomFiscal.RxDBLookupCombo2Enter(Sender: TObject);
begin
  fDmCupomFiscal.cdsSitTribCF.IndexFieldNames := 'CODIGO';
end;

//procedure TfCupomFiscal.prc_Busca_IBPT;
//var
//  vComandoAux: String;
//begin
  {if fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger <> fDmCupomFiscal.cdsProdutoID.AsInteger then
    fDmCupomFiscal.cdsProduto.Locate('ID',fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);

  fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat   := StrToFloat(FormatFloat('0.00',0));
  fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat  := StrToFloat(FormatFloat('0.00',0));
  fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',0));
  fDmCupomFiscal.cdsCupom_ItensFONTE_TRIBUTO.Clear;
  fDmCupomFiscal.cdsCupom_ItensVERSAO_TRIBUTO.Clear;

  vComandoAux := '';
  fDmCupomFiscal.qIBPT.Close;
  fDmCupomFiscal.qIBPT.SQL.Text := fDmCupomFiscal.ctqIBPT;
  if (fDmCupomFiscal.cdsParametrosTIPO_LEI_TRANSPARENCIA.AsString = 'P') then
    vComandoAux := 'WHERE I.CODIGO = ' + QuotedStr('COMERCIO')
  else
    vComandoAux := 'WHERE  N.ID = ' + IntToStr(fDmCupomFiscal.cdsCupom_ItensID_NCM.AsInteger)
                 + ' AND I.EX = ' + QuotedStr(fDmCupomFiscal.cdsProdutoNCM_EX.AsString);
  if trim(vComandoAux) = '' then
    exit;
  fDmCupomFiscal.qIBPT.SQL.Text := fDmCupomFiscal.qIBPT.SQL.Text + ' ' + vComandoAux;
  fDmCupomFiscal.qIBPT.Open;
  if not fDmCupomFiscal.qIBPT.IsEmpty then
  begin
    if (fDmCupomFiscal.cdsCupom_ItensORIGEM_PROD.AsString = '0') or (fDmCupomFiscal.cdsCupom_ItensORIGEM_PROD.AsString = '3')
      or (fDmCupomFiscal.cdsCupom_ItensORIGEM_PROD.AsString = '4') or (fDmCupomFiscal.cdsCupom_ItensORIGEM_PROD.AsString = '5') then
      fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.qIBPTPERC_NACIONAL.AsFloat))
    else
      fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.qIBPTPERC_IMPORTACAO.AsFloat));
    fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat  := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.qIBPTPERC_ESTADUAL.AsFloat));
    fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.qIBPTPERC_MUNICIPAL.AsFloat));
    fDmCupomFiscal.cdsCupom_ItensFONTE_TRIBUTO.AsString         := fDmCupomFiscal.qIBPTFONTE.AsString;
    fDmCupomFiscal.cdsCupom_ItensVERSAO_TRIBUTO.AsString        := fDmCupomFiscal.qIBPTVERSAO.AsString;
  end;

  if fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger <> fDmCupomFiscal.cdsProdutoID.AsInteger then
    fDmCupomFiscal.cdsProduto.Locate('ID',fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);
  fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO.AsFloat := StrToFloat(FormatFloat('0.00',0));}

{
  fDmCupomFiscal.qIBPT.Close;
  fDmCupomFiscal.qIBPT.ParamByName('ID').AsInteger := fDmCupomFiscal.cdsCupom_ItensID_NCM.AsInteger;
  fDmCupomFiscal.qIBPT.ParamByName('EX').AsString  := fDmCupomFiscal.cdsProdutoNCM_EX.AsString;
  fDmCupomFiscal.qIBPT.Open;
  
  if not fDmCupomFiscal.qIBPT.IsEmpty then
  begin
    if (fDmCupomFiscal.cdsCupom_ItensORIGEM_PROD.AsString = '0') or (fDmCupomFiscal.cdsCupom_ItensORIGEM_PROD.AsString = '3') or
       (fDmCupomFiscal.cdsCupom_ItensORIGEM_PROD.AsString = '4') or (fDmCupomFiscal.cdsCupom_ItensORIGEM_PROD.AsString = '5') then
      fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO.AsFloat := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.qIBPTPERC_NACIONAL.AsFloat))
    else
      fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO.AsFloat := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.qIBPTPERC_IMPORTACAO.AsFloat));
  end;
}
//end;

procedure TfCupomFiscal.prc_Calcular_Tributos_Transparencia;
var
  vAux: Real;
begin
  fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO.AsFloat := 0;
  fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat := 0;
  fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat := 0;
  fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat := 0;

  if (StrToFloat(FormatFloat('0.00', fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat)) > 0) then
  begin
    if fDmCupomFiscal.cdsParametrosARREDONDAR_5.AsString = 'B' then
      vAux := StrToCurr(FormatCurr('0.00', (fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat * fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat) / 100))
    else
      vAux := StrToFloat(FormatFloat('0.00', (fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat * fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat) / 100));
    fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00', vAux));
  end;

  if (StrToFloat(FormatFloat('0.00', fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat)) > 0) then
  begin
    if fDmCupomFiscal.cdsParametrosARREDONDAR_5.AsString = 'B' then
      vAux := StrToCurr(FormatCurr('0.00', (fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat * fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat) / 100))
    else
      vAux := StrToFloat(FormatFloat('0.00', (fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat * fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat) / 100));
    fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat := StrToFloat(FormatFloat('0.00', vAux));
  end;

  if (StrToFloat(FormatFloat('0.00', fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat)) > 0) then
  begin
    if fDmCupomFiscal.cdsParametrosARREDONDAR_5.AsString = 'B' then
      vAux := StrToCurr(FormatCurr('0.00', (fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat * fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat) / 100))
    else
      vAux := StrToFloat(FormatFloat('0.00', (fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat * fDmCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat) / 100));
    fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00', vAux));
  end;
  fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO.AsFloat := fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat + fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat + fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat;
end;

function TfCupomFiscal.prc_Calcular_Media_Tributos: Currency;
var
  vSoma: Currency;
begin
  vSoma := 0;
  fDmCupomFiscal.cdsCupom_Itens.First;
  while not fDmCupomFiscal.cdsCupom_Itens.Eof do
  begin
    if fDmCupomFiscal.cdsCupom_ItensCANCELADO.AsString <> 'S' then
      vSoma := vSoma + fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO.AsCurrency;
    fDmCupomFiscal.cdsCupom_Itens.Next;
  end;

  Result := vSoma / fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsCurrency * 100;
end;

procedure TfCupomFiscal.btCancelarClick(Sender: TObject);
var
  RetornoUser: TInfoRetornoUser;
  RetornaCampoUsuario: String;
begin
  if not (fDmCupomFiscal.cdsCupomFiscal.State in [dsInsert, dsEdit]) then
    Exit;

  if fDmCupomFiscal.cdsCupomParametrosAUTENTICA_USUARIO.asString = 'S' then
  begin
    RetornaCampoUsuario := AutenticaUsuario(vUsuario,'',RetornoUser);
    if RetornaCampoUsuario <> 'S' then
      Exit;
  end;

  fCupomFiscalCanc := TfCupomFiscalCanc.Create(Self);
  fCupomFiscalCanc.fDmCupomFiscal := fDmCupomFiscal;
  fCupomFiscalCanc.fDmParametros := fDmParametros;
  fCupomFiscalCanc.vTeste := vTeste;
  if fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString = 'S' then
    fCupomFiscalCanc.CurrencyEdit1.AsInteger := fDmCupomFiscal.cdsCupom_ItensITEM.AsInteger;
  fCupomFiscalCanc.ShowModal;
  Edit1.SetFocus;
  //07/04/2020
  if fDmCupomFiscal.cdsCupom_Itens.IsEmpty then
    prc_Calcular_Geral(fDmCupomFiscal);
end;

procedure TfCupomFiscal.btFinalizarClick(Sender: TObject);
var
  vTextoFechamento: string;
  i: Byte;
  vVias: Byte;
  ffrmTelaTroco: TFormTelaTroco;
  ffCupomFiscalPgto: TfCupomFiscalPgto;
  vArq: String;
  vAux: Integer;
  vNomeAux: String;
  aEnvioNFCe : TEnvioNFCe;
begin
  vFilial := vFilial_Loc;
  if fDmCupomFiscal.cdsCupomFiscal.IsEmpty then
    Exit;
  if fDmCupomFiscal.cdsCupom_Itens.IsEmpty then
    Exit;
  if not (fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert]) then
    fDmCupomFiscal.cdsCupomFiscal.Edit;
  fDmCupomFiscal.cdsCupomFiscalCONVERTIDO.AsString  := 'N';

  if fDmCupomFiscal.vConverter_NFCe then
  begin
    fDmCupomFiscal.vEncerrado := True;
    fDmCupomFiscal.prcLocalizar(vID_Cupom_Pos);
    if (fDmCupomFiscal.cdsCupomFiscal.IsEmpty) or (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'NFC') then
      exit;
    fDmCupomFiscal.cdsFilial.Locate('ID', fDmCupomFiscal.cdsCupomFiscalFILIAL.AsInteger, [loCaseInsensitive]);
    vAux := dmDatabase.ProximaSequencia('NUM_NFC', fDmCupomFiscal.cdsCupomFiscalFILIAL.AsInteger, IntToStr(fDmCupomFiscal.cdsCupomFiscalSERIE.AsInteger));
    fDmCupomFiscal.cdsCupomFiscal.Edit;
    fDmCupomFiscal.cdsCupomFiscalNUMCUPOM.AsInteger := vAux;
    fDmCupomFiscal.cdsCupomFiscalTIPO.AsString      := 'NFC';
    //23/11/2020
    fDmCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime := Date;
    fDmCupomFiscal.cdsCupomFiscalCONVERTIDO.AsString  := 'S';
    //************
    FImprimirNFCe := False;
    //fDmCupomFiscal.cdsCupomFiscal.Post;
  end
  else
  begin
    fDmCupomFiscal.vEncerrado := False;
    ffCupomFiscalPgto := TfCupomFiscalPgto.Create(Self);
    ffCupomFiscalPgto.fDmCupomFiscal := fDmCupomFiscal;
    ffCupomFiscalPgto.fDmParametros := fDmParametros;
    ffCupomFiscalPgto.ShowModal;
    FreeAndNil(ffCupomFiscalPgto);

    if (fDmCupomFiscal.cdsCupomParametrosUSA_TROCO.AsString = 'S') and (fDmCupomFiscal.cdsCupomFiscalVLR_TROCO.AsFloat > 0) then
    begin
      ffrmTelaTroco := TFormTelaTroco.Create(self);
      try
        ffrmTelaTroco.labeltroco.Caption := FormatFloat('R$ ##0.00', fDmCupomFiscal.cdsCupomFiscalVLR_TROCO.AsFloat);
        ffrmTelaTroco.ShowModal;
      finally
        FreeAndNil(ffrmTelaTroco);
      end;
    end;
  end;
  vTextoFechamento := '';
  if vDocumentoClienteVenda <> EmptyStr then
    vTextoFechamento := 'Consumidor CPF: ' + vDocumentoClienteVenda + #13;

  if not fDmCupomFiscal.vEncerrado then
    exit;

//  if (fDmCupomFiscal.cdsCupomParametrosBAIXAR_CONSUMO.AsString = 'S') then
//    fDmCupomFiscal.prc_Excluir_CupomFiscal_MP;


  case fDmCupomFiscal.cdsParametrosIMPRESSORA_FISCAL.AsInteger of
    5:
      begin
        if fDmCupomFiscal.vEncerrado then
        begin
          if (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'CNF') and (fDmCupomFiscal.cdsCupomParametrosIMPRIME_FISCAL_NFISCAL.AsString = 'S') then
            fDmCupomFiscal.ChamaNaoFiscal(fDmCupomFiscal.cdsCupomFiscalID.AsInteger, 'modWrite');
        end
        else
          Exit; //para cupom não fiscal, permite continuar vendendo
      end;
    6:
      begin
        if fDmCupomFiscal.vEncerrado then
        begin
          if (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'CNF') and (fDmCupomFiscal.cdsCupomParametrosIMPRIME_FISCAL_NFISCAL.AsString = 'S') then
          begin
            vVias := fDmCupomFiscal.cdsCupomParametrosVIAS_CUPOM.AsInteger;
            if vVias <= 0 then
              vVias := 1;
              //arrumar aqui devido o tipo de cobrança    Cleomar    05/03/2020
            fDmCupomFiscal.cdsTipoCobranca.Close;
            fDmCupomFiscal.cdsTipoCobranca.Open;
            fDmCupomFiscal.cdsTipoCobranca.Locate('ID', fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger, [loCaseInsensitive]);
            if fDmCupomFiscal.cdsTipoCobrancaIMPRIME_CARNE.AsString = 'S' then
              vVias := vVias - 1;
            if (fDmCupomFiscal.cdsCupomParametrosEXIBIR_DIALOGO_IMPRESSORA.AsString = 'S') and (MessageDLg('Deseja imprimir o cupom/pedido?', mtConfirmation, [mbyes, mbNo], 0) <> mrYes) then
              vVias := 0;
            if vVias > 0 then
            begin
              try
                fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
                fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
                fNFCE_ACBr.NroVias := vVias;
                fNFCE_ACBr.btImpresaoPreVendaClick(Sender);
              except
                on e: Exception do
                begin
                  MessageDlg('*** Erro ao imprimir: ' + #13+ e.Message, mtInformation, [mbOk], 0);
                  //prc_Limpa_Variaveis_Encerramento;
                end
              end;
            end
          end;
        end
        else
          Exit; //para cupom não fiscal, permite continuar vendendo
      end;
  end;

  if fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert] then
  begin
    //fDmCupomFiscal.vID_Cupom_Pos := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
    vID_Cupom_Pos := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
    fDmCupomFiscal.cdsCupomFiscal.Post;
    fDmCupomFiscal.cdsCupomFiscal.ApplyUpdates(0);
  end;

  try
    //aqui
    if (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'NFC') then
    begin
      aEnvioNFCe := TEnvioNFCe.Create(vFilial);
      try
        aEnvioNFCe.evMsg := evMensagem;
        aEnvioNFCe.IDCupom := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
        aEnvioNFCe.Gerar_NFCe;
        aEnvioNFCe.AssinarNFCe;
        aEnvioNFCe.ValidarNFCe;
        aEnvioNFCe.Imprimir := FImprimirNFCe;
        if not aEnvioNFCe.Enviar then
        begin
          
        end;
      finally
        aEnvioNFCe.Free;
      end;
//      Exit;



      fDmCupomFiscal.mPedidoAux.EmptyDataSet;
//      fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
//      fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
//      fNFCE_ACBr.ComboAmbiente.ItemIndex := StrToIntDef(fdmCupomFiscal.cdsFilialNFCEPRODUCAO.AsString, 1) - 1;
//      fNFCE_ACBr.btEnviarNovoClick(Sender);
    end;

  finally
    //23/10/2019  Estoque e Movimento
    if (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'NFC') or (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'CNF') then
    //06/11/2019 aqui
    begin
      //03/09/2020
      if StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_RECIBO_TROCA.AsFloat)) > 0 then
      begin
        vNomeAux := fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString;
        vNomeAux := InputBox('', 'Informe o Nome do Cliente para Imp. no Recibo?', vNomeAux);
        fDmCupomFiscal.prc_Gravar_Recibo_Troca(fDmCupomFiscal.cdsCupomFiscalID.AsInteger,vNomeAux);
        if vVias > 0 then
        begin
          try
            fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
            fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
            fNFCE_ACBr.NroVias := vVias;
            fNFCE_ACBr.btImpresaoTrocaClick(Sender);
          except
            on e: Exception do
            begin
              MessageDlg('*** Erro ao imprimir: ' + #13+ e.Message, mtInformation, [mbOk], 0);
            end
          end;
        end;
      end;

      //Calcula o rateio nos itens quando houver troca
      if fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat > 0 then
        fDmCupomFiscal.prc_Gravar_Rateio_Troca(fDmCupomFiscal.cdsCupomFiscalID.AsInteger);
      if fDmCupomFiscal.cdsCupomFiscalVLR_RECIBO_USADO.AsFloat > 0 then
        fDmCupomFiscal.prc_Gravar_Rateio_Recibo(fDmCupomFiscal.cdsCupomFiscalID.AsInteger); //15/09/2020
      if fDmCupomFiscal.cdsCupomFiscalVLR_VALE_USADO.AsFloat > 0 then
        fDmCupomFiscal.prc_Gravar_Rateio_Vale(fDmCupomFiscal.cdsCupomFiscalID.AsInteger); //20/11/2020
      if fDmCupomFiscal.cdsCupomFiscalVLR_CASHBACK_USADO.AsFloat > 0 then
        fDmCupomFiscal.prc_Gravar_Rateio_Cash(fDmCupomFiscal.cdsCupomFiscalID.AsInteger); //30/11/2020

      //***********
      //Calcula o rateio nos itens quando houver recibo de troca
      if fDmCupomFiscal.cdsCupomFiscalVLR_RECIBO_TROCA.AsFloat > 0 then
        fDmCupomFiscal.prc_Gravar_Rateio_Recibo_Troca(fDmCupomFiscal.cdsCupomFiscalID.AsInteger);

      fDmCupomFiscal.prc_Gravar_Estoque_Movimento(fDmCupomFiscal.cdsCupomFiscalID.AsInteger,'TRO');

      fDmCupomFiscal.prc_Gravar_Estoque_Movimento(fDmCupomFiscal.cdsCupomFiscalID.AsInteger,'CFI');

      //19/11/2020
      prc_Gravar_Vale_Presente(fDmCupomFiscal,fDmCupomFiscal.cdsCupomFiscalID.AsInteger);
      if fDmCupomFiscal.vVale_Presente then
      begin
        fNFCE_ACBR.vID_Cupom_Novo := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
        fNFCE_ACBR.btImpressaoValeClick(Sender);
      end;
      //******************

      //30/11/2020
      if (fDmCupomFiscal.qParametros_FinUSA_CASHBACK.AsString = 'S') and (fDmCupomFiscal.qParametros_FinPERC_CASHBACK.AsFloat > 0) then
      begin
        fDmCupomFiscal.sdsPRC_GRAVAR_CASHBACK.Close;
        fDmCupomFiscal.sdsPRC_GRAVAR_CASHBACK.ParamByName('P_ID').AsInteger := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
        fDmCupomFiscal.sdsPRC_GRAVAR_CASHBACK.ExecSQL;
      end;
      //********************

      prc_Controle_Gravar_Diversos(True,True);

      if not (fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit]) then
        fDmCupomFiscal.cdsCupomFiscal.Edit;
      fDmCupomFiscal.cdsCupomFiscalTRANSMITIR.AsString := 'S';
      fDmCupomFiscal.cdsCupomFiscal.Post;
      fDmCupomFiscal.cdsCupomFiscal.ApplyUpdates(0);
      //troca
//      prc_Gravar_Estoque_Troca;
    end;

    //02/03/2020  Foi incluido essa linha para alterar a baixa da comanda, onde vai fazer na procedure.
    if not fDmCupomFiscal.vConverter_NFCe then
      fDmCupomFiscal.prc_Atualiza_Comanda(fDmCupomFiscal.cdsCupomFiscalID.AsInteger);
    // dá baixa na comanda     //02/03/2020 foi alterada para a linha acima
    {fDmCupomFiscal.mCupom.Active := True;
    if not fDmCupomFiscal.mCupom.IsEmpty then
    begin
      fDmCupomFiscal.mCupom.First;
      while not fDmCupomFiscal.mCupom.Eof do
      begin
        fDmCupomFiscal.prc_Atualiza_Comanda(fDmCupomFiscal.mCupomID_CUPOM.AsInteger);
        fDmCupomFiscal.mCupom.Next
      end;
    end;
    fDmCupomFiscal.mCupom.Active := False;}

    {else
    if (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'ORC') then
      prc_Controle_Gravar_Diversos(False, False)
    else
      prc_Controle_Gravar_Diversos(False, True);}
    //******************

    if (fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger > 0) and  (fDmCupomFiscal.cdsTipoCobranca.Locate('ID', fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger, [loCaseInsensitive])) then
    begin
      if (fDmCupomFiscal.cdsTipoCobrancaIMPRIME_CARNE.AsString = 'S') and (MessageDlg('Deseja imprimir carnê de pagamento?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
      begin
        if fDmCupomFiscal.cdsCupomParametrosCARNE_RELATORIO.AsString <> '' then
          vArq := fDmCupomFiscal.cdsCupomParametrosCARNE_RELATORIO.AsString
        else
          vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\CarnePgto1.fr3';

        if FileExists(vArq) then
        begin
          fDmCupomFiscal.frxReport1.Report.LoadFromFile(vArq);
          if fDmCupomFiscal.cdsCupomParametrosUSA_PREVIEW_CARNE.AsString = 'S' then
            fDmCupomFiscal.frxReport1.ShowReport
          else
            fDmCupomFiscal.frxReport1.Print;
        end
        else
          ShowMessage('Relatório não localizado! ' + vArq);
      end;
    end;

    if fDmCupomFiscal.cdsCupomFiscal.Active then
      fDmCupomFiscal.cdsCupomFiscal.Close;
    prc_Limpa_Variaveis_Encerramento;
  end;
end;

procedure TfCupomFiscal.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_F3 then
  begin
    prcPesa;
    if CurrencyEdit1.TabOrder = 0 then
      Edit1.SetFocus;
  end;
  if (Key = Vk_Return) then
    if CurrencyEdit1.TabOrder = 0 then
      Edit1.SetFocus
    else
    begin
      if vVlrItem = 0 then
      begin
        if not fnc_Altera_Preco then
        begin
          Edit1.SetFocus;
          Exit;
        end;
      end;
      if vAplicarDescontoItem then
      begin
        if not fnc_Aplicar_Desconto then
        begin
          Edit1.SetFocus;
          Exit;
        end;
      end;
      prc_ConfirmaItem;
    end;
end;

procedure TfCupomFiscal.prc_Move_Itens;
begin
  //if (fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString <> 'S') then
  //  exit;
  if Edit1.Text = '' then
    exit;
  pnlCaixaLivre.Visible := False;
  if not (fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert]) then
    prc_Inserir;

  //24/11/2020
  if (fDmCupomFiscal.cdsCupomParametrosUSA_CANAL_VENDA.AsString = 'S') and not(vCanal_Venda) then
  begin
    Edit1.SetFocus;
    exit;
  end;
  //*********************
  
  if fDmCupomFiscal.cdsProdutoID.AsInteger <> vID_Produto then
    fDmCupomFiscal.cdsProduto.Locate('ID', vID_Produto, [loCaseInsensitive]);

  fDmCupomFiscal.vID_NCM := fDmCupomFiscal.cdsProdutoID_NCM.AsInteger;
  if fDmCupomFiscal.vID_NCM > 0 then
    fDmCupomFiscal.cdsTab_NCM.Locate('ID', fDmCupomFiscal.vID_NCM, [loCaseInsensitive]);

  if fDmCupomFiscal.cdsProdutoID_CFOP_NFCE.AsInteger > 0 then
    fDmCupomFiscal.vID_CFOP := fDmCupomFiscal.cdsProdutoID_CFOP_NFCE.AsInteger
  else if (fDmCupomFiscal.cdsTab_NCMID_CFOP.AsInteger > 0) and (fDmCupomFiscal.cdsTab_NCMID.AsInteger = fDmCupomFiscal.cdsCupom_ItensID_NCM.AsInteger) then
    fDmCupomFiscal.vID_CFOP := fDmCupomFiscal.cdsTab_NCMID_CFOP.AsInteger
  else if fDmCupomFiscal.cdsFilialID_CFOP_NFCE_PADRAO.AsInteger > 0 then
    fDmCupomFiscal.vID_CFOP := fDmCupomFiscal.cdsFilialID_CFOP_NFCE_PADRAO.AsInteger;
  if fDmCupomFiscal.vID_CFOP > 0 then
  begin
    fDmCupomFiscal.cdsCFOP.Locate('ID', fDmCupomFiscal.vID_CFOP, [loCaseInsensitive]);
    vGeraIcms := fDmCupomFiscal.cdsCFOPGERAR_ICMS.AsString = 'S';
  end;
  fDmCupomFiscal.vID_Variacao := 0;
  if fDmCupomFiscal.vID_CFOP > 0 then
    fDmCupomFiscal.vID_Variacao := fDmCupomFiscal.fnc_Buscar_Regra_CFOP(fDmCupomFiscal.vID_CFOP);
  if fDmCupomFiscal.vID_Variacao = 0 then
    ShowMessage('Variação da CFOP não localizada para a operação!' + #13 + 'Cupom fiscal não será validado!')
  else
    fDmCupomFiscal.prc_Mover_CST;

end;

function TfCupomFiscal.fnc_Estoque_OK(ID_Produto, ID_Cor: Integer; Tamanho: string; Qtd: Real): Boolean;
var
  ffrmSenha: TfrmSenha;
  vQtdAux: Real;
  vID_LocalEst : Integer;
begin
  Result := True;
  if fDmCupomFiscal.cdsParametrosCONTROLAR_ESTOQUE_SAIDA.AsString <> 'S' then
    exit;
  vID_LocalEst := 1;
  if fDmCupomFiscal.cdsCupomFiscalID_LOCALESTOQUE.AsInteger > 0 then
    vID_LocalEst := fDmCupomFiscal.cdsCupomFiscalID_LOCALESTOQUE.AsInteger;

  vQtdAux := fnc_Busca_Estoque2(fDmCupomFiscal.cdsCupomFiscalFILIAL.AsInteger, ID_Produto, ID_Cor, Tamanho, vID_LocalEst);
  if StrToFloat(FormatFloat('0.0000', vQtdAux)) < StrToFloat(FormatFloat('0.0000', Qtd)) then
  begin
    if trim(fDmCupomFiscal.cdsParametrosSENHA_LIBERA_ESTOQUE.AsString) = '' then
      Result := (MessageDlg('Produto com quantidade menor no estoque, confirma inclusão do produto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    else
    begin
      ffrmSenha := TfrmSenha.Create(self);
      ffrmSenha.Label2.Caption := 'Produto com estoque negativo ';
      ffrmSenha.Label3.Caption := 'Informe a senha para liberar ';
      if Tamanho <> '' then
        ffrmSenha.Label4.Caption := 'Tamanho = ' + Tamanho
      else
        ffrmSenha.Label4.Caption := '';
      ffrmSenha.Label4.Caption := ffrmSenha.Label4.Caption + '   Qtd Est. ' + FormatFloat('0.####', vQtdAux);
      if StrToFloat(FormatFloat('0.0000', vQtdAux)) <= 0 then
        ffrmSenha.Label4.Font.Color := clRed
      else
        ffrmSenha.Label4.Font.Color := clBlue;
      ffrmSenha.vControlaSenha := True;
      ffrmSenha.vSenha_Param := fDmCupomFiscal.cdsParametrosSENHA_LIBERA_ESTOQUE.AsString;
      ffrmSenha.ShowModal;
      FreeAndNil(ffrmSenha);
      if vSenha <> fDmCupomFiscal.cdsParametrosSENHA_LIBERA_ESTOQUE.AsString then
        Result := False;
    end;
  end;
end;

procedure TfCupomFiscal.prc_Calcular_IPI;
begin
  if not vCalcula_IPI then
    Exit;

  if (fDmCupomFiscal.cdsProdutoPERC_IPI.AsCurrency > 0) then
  begin
    if (fDmCupomFiscal.vID_CFOP > 0) and (fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString = 'S') then
    begin
      if (fDmCupomFiscal.cdsCFOP.Locate('ID', fDmCupomFiscal.vID_CFOP, [loCaseInsensitive])) then
        if fDmCupomFiscal.cdsCFOPGERAR_IPI.AsString <> 'S' then
          exit;
    end;
    vCalcula_IPI := False;
  end;
end;

procedure TfCupomFiscal.Edit1Enter(Sender: TObject);
begin
  vCalcula_IPI := True;
  Edit1.SelectAll;
end;

procedure TfCupomFiscal.btnCopiarPedidoClick(Sender: TObject);
var
  ffrmSel_Pedido_CF: TfrmSel_Pedido_CF;
begin
  vUnidade := '';
  vPerc_Ipi := 0;
  vNome_Complementar := '';

  ffrmSel_Pedido_CF := TfrmSel_Pedido_CF.Create(self);

  ffrmSel_Pedido_CF.fDMCupomFiscal := fDMCupomFiscal;
  ffrmSel_Pedido_CF.ffCupomFiscal2 := fCupomFiscal;
  ffrmSel_Pedido_CF.ShowModal;
  FreeAndNil(ffrmSel_Pedido_CF);
end;

procedure TfCupomFiscal.btComandaClick(Sender: TObject);
var
  vID: Integer;
begin
  if not(fDmCupomFiscal.cdsCupomFiscal.Active) or ((fDmCupomFiscal.cdsCupom_Itens.IsEmpty) and (StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat)) <= 0)) then
  begin
    prc_Form_Cartao;
    Edit1.SetFocus;
    exit;
  end;

  if (fDmCupomFiscal.cdsCupom_Itens.IsEmpty) then
  begin
    ShowMessage('Para gravação da comanda é preciso ter produtos incluídos!');
    Exit;
  end;
  if StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat)) > 0 then
  begin
    ShowMessage('Para gravação da comanda não pode ter valor de troca!');
    Exit;
  end;
  if fDmCupomFiscal.cdsCupomFiscalNUM_CARTAO.AsInteger <= 0 then
  begin
    fDmCupomFiscal.vNumCartao := 0;
    fCartao := TfCartao.Create(Self);
    try
      fCartao.fDmCupomFiscal := fDmCupomFiscal;
      fCartao.ShowModal;
      if fCartao.ModalResult = mrOk then
      begin
        JvStatusBar1.Panels[4].Text := IntToStr(vID);
        vID := fDmCupomFiscal.fnc_Existe_Cartao_Pendente(fDmCupomFiscal.vNumCartao);
        if (fDmCupomFiscal.cdsCupomParametrosUSA_NOME_COMANDA.AsString = 'S') and (fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString = EmptyStr)  then
        begin
          fCartaoNome := TfCartaoNome.Create(Self);
          try
            if fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString <> EmptyStr then
              JvStatusBar1.Panels[4].Text := JvStatusBar1.Panels[4].Text + '-' + fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString
            else
            begin
              fCartaoNome.edtNome.Text := fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString;
              fCartaoNome.ShowModal;
              JvStatusBar1.Panels[4].Text := JvStatusBar1.Panels[4].Text + '-' + fCartaoNome.edtNome.Text;
              fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString := fCartaoNome.edtNome.Text;
            end;
          finally
            fCartaoNome.Free;
          end;
        end;
      end
      else
        Exit;
    finally
      fCartao.Free;
    end;

    if vID > 0 then
    begin
      ShowMessage('Nº Cartão já esta em uso!');
      Exit;
    end;
  end;

  fDmCupomFiscal.cdsCupomFiscalTIPO.AsString := 'COM';

  FinalizaParcial('COM');
end;

procedure TfCupomFiscal.btOrcamentoClick(Sender: TObject);
begin
  if fDmCupomFiscal.cdsCupom_Itens.IsEmpty then
  begin
    ShowMessage('Para gravação do orçamento é preciso ter produtos incluídos!');
    Exit;
  end;

  fDmCupomFiscal.cdsCupomFiscalTIPO.AsString := 'ORC';

  fDmCupomFiscal.vClienteConfirmado := False;
  fCupomCliente := TfCupomCliente.Create(Self);
  fCupomCliente.fDmCupomFiscal := fDmCupomFiscal;
  fCupomCliente.ShowModal;

  if fDmCupomFiscal.vClienteConfirmado then
  begin
    fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger := fDmCupomFiscal.vClienteID;

    FinalizaParcial('ORC');
    fDmCupomFiscal.vClienteID := fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger;
  end;
end;

procedure TfCupomFiscal.btPedidoClick(Sender: TObject);
begin
  if fDmCupomFiscal.cdsCupom_Itens.IsEmpty then
  begin
    ShowMessage('Para gravação do pedido é preciso ter produtos incluídos!');
    Exit;
  end;

  fDmCupomFiscal.cdsCupomFiscalTIPO.AsString := 'PED';

  fDmCupomFiscal.vClienteConfirmado := False;
  fCupomCliente := TfCupomCliente.Create(Self);
  fCupomCliente.fDmCupomFiscal := fDmCupomFiscal;
  fCupomCliente.ShowModal;

  if (fDmCupomFiscal.vClienteConfirmado) then
  begin
    fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger := fDmCupomFiscal.vClienteID;

    FinalizaParcial('PED');
    fDmCupomFiscal.vClienteID := fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger;
  end;
    if fDmCupomFiscal.cdsCupomFiscal.Active then
      fDmCupomFiscal.cdsCupomFiscal.Close;
  vDocumentoClienteVenda := '';
  vCpfOK := False;
  pnlDescricaoProduto.Text := '';
  pnlDescricaoProduto.Update;
  pnlCaixaLivre.Visible := True;
  fDmCupomFiscal.vID_Canal_Vendas := 0;
  Edit1.SelectAll;
  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TfCupomFiscal.FinalizaParcial(vTipo: string);
begin
  if (fDmCupomFiscal.cdsCupomFiscalNUMCUPOM.AsInteger <= 0) then
  begin
    fDmCupomFiscal.qProximoCupom.Close;
    fDmCupomFiscal.qProximoCupom.ParamByName('FILIAL').AsInteger := fDmCupomFiscal.cdsCupomFiscalFILIAL.AsInteger;
    fDmCupomFiscal.qProximoCupom.ParamByName('TIPO').AsString := vTipo;
    fDmCupomFiscal.qProximoCupom.Open;
    fDmCupomFiscal.cdsCupomFiscalNUMCUPOM.AsInteger := fDmCupomFiscal.qProximoCupomNUMCUPOM.AsInteger + 1;
    fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger := fDmCupomFiscal.vClienteID;
  end;

  if fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert] then
  begin
    //fDmCupomFiscal.vID_Cupom_Pos := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
    vID_Cupom_Pos := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
    fDmCupomFiscal.cdsCupomFiscal.Post;
    fDmCupomFiscal.cdsCupomFiscal.ApplyUpdates(0);
    fDmCupomFiscal.vEncerrado := True;
  end;

  if (vTipo = 'COM') then
  begin
    if (fDmCupomFiscal.cdsCupomParametrosUSA_COMANDA.AsString = 'S') then
      //prc_ImprimeComanda(fDmCupomFiscal.vID_Cupom_Pos);
      prc_ImprimeComanda(vID_Cupom_Pos);
  end
  else if MessageDLg('Deseja imprimir?', mtConfirmation, [mbyes, mbNo], 0) = mrYes then
    case fDmCupomFiscal.cdsParametrosIMPRESSORA_FISCAL.AsInteger of
      5:
        fDmCupomFiscal.ChamaNaoFiscal(fDmCupomFiscal.cdsCupomFiscalID.AsInteger, 'modWrite');
      6:
      begin
        fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
        fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
        fNFCE_ACBr.NroVias := StrToIntDef(SQLLocate('CUPOMFISCAL_PARAMETROS','ID','VIAS_CUPOM','1'),1);
        fNFCE_ACBr.btImpresaoPreVenda.Click;
      end;
    end;

  //20/02/2020
  fDmCupomFiscal.cdsCupomFiscal.Close;
  prc_Limpa_Variaveis_Encerramento;
  pnlCaixaLivre.Visible := True;
  pnlCaixaLivre.Update;
  fDmCupomFiscal.vID_Canal_Vendas := 0;
  JvStatusBar1.Panels[4].Text := '';  
  //******************

//  if fDmCupomFiscal.cdsCupomFiscal.State in [dsBrowse] then
//  begin
//    Tag := 99;
//    fDmCupomFiscal.vSair_Tela := False;
//    Close;
//  end;
end;

procedure TfCupomFiscal.prc_ImprimeComanda(ID_Cupom: Integer);
begin
  fDmCupomFiscal.cdsComandaRel.Close;
  fDmCupomFiscal.sdsComandaRel.CommandText := fDmCupomFiscal.ctComandaRel;
  fDmCupomFiscal.sdsComandaRel.ParamByName('ID').AsInteger := ID_Cupom;
  fDmCupomFiscal.cdsComandaRel.Open;

  fDmCupomFiscal.cdsComandaItem_Rel.Close;
  //fDmCupomFiscal.sdsComandaItem_Rel.ParamByName('ID').AsInteger := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
  fDmCupomFiscal.cdsComandaItem_Rel.Open;

  fComandaR := TfComandaR.Create(Self);
  fComandaR.fDmCupomFiscal := fDmCupomFiscal;
  fComandaR.RLReport1.PrintDialog := False;
  fComandaR.RLReport1.Print;
end;

procedure TfCupomFiscal.prc_EnterCodigo(ConsultaAutomatica: Boolean = False);
var
  vPrimeiroAux: String;
begin
  if (Trim(Edit1.Text) <> '') then
  begin
    if not Panel2.Enabled then
      Exit;

    vPrimeiroAux := copy(Edit1.Text,1,1);
    if (not fnc_Verifica_Numero(Edit1.Text) or (ConsultaAutomatica)) and (vPrimeiroAux <> '/') then
    begin
      ffrmConsultaRapidaCupom := TfrmConsultaRapidaProduto.Create(nil);
      try
        vPrimeiroAux := copy(Edit1.Text,1,1);
        if fDmCupomFiscal.cdsCupomParametrosUSA_COD_REF.AsString = 'R' then
        begin
          if not fnc_Verifica_Numero(vPrimeiroAux) then
            ffrmConsultaRapidaCupom.edtDescricao.Text := UpperCase(Edit1.Text)
          else
            ffrmConsultaRapidaCupom.edtReferencia.Text := UpperCase(Edit1.Text)
        end
        else
          ffrmConsultaRapidaCupom.edtDescricao.Text := UpperCase(Edit1.Text);
        ffrmConsultaRapidaCupom.fdmCupomFiscal := fDmCupomFiscal;
        ffrmConsultaRapidaCupom.ShowModal;
        if ffrmConsultaRapidaCupom.ModalResult = mrOK then
        begin
          if fDmCupomFiscal.cdsCupomParametrosUSA_COD_REF.AsString = 'R' then
            Edit1.Text := ffrmConsultaRapidaCupom.referenciaRetorno
          else
            Edit1.Text := IntToStr(ffrmConsultaRapidaCupom.codigoProdutoRetorno);
          //06/03/2020 incluido pra posicionar o produto depois da consulta
          Edit1Exit(nil);
          //******************
        end
        else
        begin
          Edit1.SelectAll;
          Edit1.SetFocus;
          Exit;
        end;
      finally
        FreeAndNil(ffrmConsultaRapidaCupom);
      end;

    end;

    if Edit1.TabOrder = 0 then
      CurrencyEdit1.SetFocus;
  end;
end;

procedure TfCupomFiscal.SMDBGrid2DblClick(Sender: TObject);
begin
  fCupomFiscalParcela := TfCupomFiscalParcela.Create(Self);
  fCupomFiscalParcela.fdmCupomFiscal := fDmCupomFiscal;
  fCupomFiscalParcela.Tag := 1;
  fDmCupomFiscal.cdsCupom_Parc.Edit;
  fCupomFiscalParcela.ShowModal;

  fDmCupomFiscal.cdsTipoCobranca.IndexFieldNames := 'ID';
  fDmCupomFiscal.cdsTipoCobranca.FindKey([fDmCupomFiscal.cdsCupom_ParcID_TIPOCOBRANCA.AsInteger]);
  if fDmCupomFiscal.cdsTipoCobrancaCREDITO_LOJA.AsString = 'S' then
  begin
    fDmCupomFiscal.cdsDuplicata.IndexFieldNames := 'ID_CUPOM;PARCELA';
    fDmCupomFiscal.cdsDuplicata.Active := False;
    fDmCupomFiscal.sdsDuplicata.CommandText := fDmCupomFiscal.ctDuplicata + ' WHERE ID_CUPOM = ' + fDmCupomFiscal.cdsCupomFiscalID.AsString + ' AND PARCELA = ' + fDmCupomFiscal.cdsCupom_ParcPARCELA.AsString;
    fDmCupomFiscal.cdsDuplicata.Active := True;
    if fDmCupomFiscal.cdsDuplicata.IsEmpty then
      fDmCupomFiscal.Gravar_Duplicata(0,'R', 'N', fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger, fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsFloat, fDmCupomFiscal.cdsCupom_ParcDTVENCIMENTO.AsDateTime, '')
    else
    begin
      fDmCupomFiscal.cdsDuplicata.Edit;
      fDmCupomFiscal.cdsDuplicataDTVENCIMENTO.AsDateTime := fDmCupomFiscal.cdsCupom_ParcDTVENCIMENTO.AsDateTime;
      fDmCupomFiscal.cdsDuplicataVLR_RESTANTE.AsFloat := StrToFloat(FormatFloat('0.00', fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsFloat));
      fDmCupomFiscal.cdsDuplicataID_TIPOCOBRANCA.AsInteger := fDmCupomFiscal.cdsCupom_ParcID_TIPOCOBRANCA.AsInteger;
      fDmCupomFiscal.cdsDuplicata.Post;
      fDmCupomFiscal.cdsDuplicata.ApplyUpdates(0);
      fDmCupomFiscal.cdsDuplicata.Active := False;
      fDmCupomFiscal.sdsDuplicata.CommandText := fDmCupomFiscal.ctDuplicata;
    end;
  end;
  if fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit] then
  begin
    fDmCupomFiscal.cdsCupomFiscal.Post;
    fDmCupomFiscal.cdsCupomFiscal.ApplyUpdates(0);
  end;
end;

procedure TfCupomFiscal.CurrencyEdit1Enter(Sender: TObject);
begin
  if (fDmCupomFiscal.cdsCupomParametrosQTD_AUTO.AsString = 'S') and
     (Edit1.Text <> '') and ((fDmCupomFiscal.cdsCupomParametrosUSA_BALANCA.AsString = 'N') or (fDmCupomFiscal.cdsProdutoUNIDADE.AsString <> 'KG')) then
  begin
    prc_ConfirmaItem;
  end;
  if (fDmCupomFiscal.cdsCupomParametrosUSA_BALANCA.AsString = 'S') and (vBalanca = 'ACBR') and (fDmCupomFiscal.cdsProdutoUNIDADE.AsString = 'KG') then
  begin
  end;
end;

function TfCupomFiscal.fnc_VerficaFracionado(vUnidade: string): Boolean;
begin
  Result := True;
  fDmCupomFiscal.qUnidade.ParamByName('U1').AsString := vUnidade;
  fDmCupomFiscal.qUnidade.Open;
  if fDmCupomFiscal.qUnidadeFRACIONAVEL.AsString = 'N' then
    if frac(CurrencyEdit1.Value) <> 0.00 then
      Result := False;
  fDmCupomFiscal.qUnidade.Close;
end;

function TfCupomFiscal.fnc_CorTamanho: Boolean;
var
  sds: TSQLDataSet;
  vExiste: Boolean;
begin
  // 16/04/2021 - adicionei essa regra porque estava passando duas vezes aqui
  if vDigitaGrade then
  begin
    Result := True;
    exit;
  end;

  //06/11/2019
  Result := False;
  vExiste := False;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT SUM(AUX.CONTADOR) CONTADOR '
                       + 'FROM ( '
                       + 'SELECT COUNT(1) CONTADOR FROM PRODUTO_COMB WHERE ID = :ID '
                       + 'UNION ALL '
                       + 'SELECT COUNT(1) CONTADOR FROM PRODUTO_TAM WHERE ID = :ID) AUX ';
    sds.ParamByName('ID').AsInteger := fDmCupomFiscal.cdsProdutoID.AsInteger;
    sds.Open;
    if sds.FieldByName('CONTADOR').AsInteger > 0 then
      vExiste := True;
  finally
    FreeAndNil(sds);
  end;

  if vExiste then
  begin
    fSel_CorTamanho := TfSel_CorTamanho.Create(Self);
    fSel_CorTamanho.fDmCupomFiscal := fDmCupomFiscal;
    fSel_CorTamanho.vProd := fDmCupomFiscal.cdsProdutoID.AsInteger;
    fSel_CorTamanho.ShowModal;
    if fSel_CorTamanho.ModalResult = mrOK then
    begin
      Result := True;
      vDigitaGrade := True;
    end;
    FreeAndNil(fSel_CorTamanho);
  end
  else
    Result := True;
end;

procedure TfCupomFiscal.DBEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    if fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit] then
    begin
      fDmCupomFiscal.cdsCupomFiscal.Post;
      fDmCupomFiscal.cdsCupomFiscal.ApplyUpdates(0);
    end;
  end;
end;

procedure TfCupomFiscal.SMDBGrid1DblClick(Sender: TObject);
begin
  fCupomFiscalImposto := TfCupomFiscalImposto.Create(Self);
  fCupomFiscalImposto.fDmCupomFiscal := fDmCupomFiscal;
  fDmCupomFiscal.vID_CFOP := fDmCupomFiscal.cdsCupom_ItensID_CFOP.AsInteger;

  fDmCupomFiscal.vID_Pis := fDmCupomFiscal.cdsCupom_ItensID_PIS.AsInteger;
  fDmCupomFiscal.vID_Cofins := fDmCupomFiscal.cdsCupom_ItensID_COFINS.AsInteger;
  fDmCupomFiscal.vID_CSTICMS := fDmCupomFiscal.cdsCupom_ItensID_CSTICMS.AsInteger;
  fDmCupomFiscal.vID_CSTIPI := fDmCupomFiscal.cdsCupom_ItensID_CSTIPI.AsInteger;
  fDmCupomFiscal.vVlr_ICMS := fDmCupomFiscal.cdsCupom_ItensVLR_ICMS.AsFloat;
  fDmCupomFiscal.vBase_ICMS := fDmCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat;
  fDmCupomFiscal.vVlr_ICMS_Ret := fDmCupomFiscal.cdsCupom_ItensVLR_ICMSSUBST_RET.AsFloat;
  fDmCupomFiscal.vBase_ICMS_Ret := fDmCupomFiscal.cdsCupom_ItensBASE_ICMSSUBST_RET.AsFloat;
  fDmCupomFiscal.vVlr_ICMS_Efet := fDmCupomFiscal.cdsCupom_ItensVLR_ICMS_EFE.AsFloat;
  fDmCupomFiscal.vPerc_ICMS_Efet := fDmCupomFiscal.cdsCupom_ItensPERC_ICMS_EFET.AsFloat;
  fDmCupomFiscal.vBase_ICMS_Efet := fDmCupomFiscal.cdsCupom_ItensVLR_BASE_EFET.AsFloat;

  {if fDmCupomFiscal.vTipo_Pis = 'P' then
    ComboBox1.ItemIndex := 0
  else
  if fDmCupomFiscal.vTipo_Pis = 'V' then
    ComboBox1.ItemIndex := 1;
  if fDmCupomFiscal.vTipo_Cofins = 'P' then
    ComboBox2.ItemIndex := 0
  else
  if fDmCupomFiscal.vTipo_Cofins = 'V' then
    ComboBox2.ItemIndex := 1;}
  fCupomFiscalImposto.ShowModal;
  FreeAndNil(fCupomFiscalImposto);
end;

procedure TfCupomFiscal.prcPesa;
var
  strPeso: string;
  TimeOut: Integer;
begin
  if vBalanca = 'URANO' then
  begin
    StrPeso := _LePeso;
    if StrPeso = 'Porta serial fechada!'#$D#$A then
    begin
      ShowMessage('Porta serial fechada!');
      Exit;
    end;
    Edit2.Text := _LePeso;
    CurrencyEdit1.Value := StrToFloat(Copy(Edit2.Text, 20, 6));
  end
  else if vBalanca = 'ACBR' then
  begin
       // se houver conecção aberta, Fecha a conecção
    if acbrBal1.Ativo then
      ACBrBAL1.Desativar;

       // configura porta de comunicação
    ACBrBAL1.Modelo := TACBrBALModelo(2);
    ACBrBAL1.Device.HandShake := TACBrHandShake(0);
    ACBrBAL1.Device.Parity := TACBrSerialParity(0);
    ACBrBAL1.Device.Stop := TACBrSerialStop(0);
    ACBrBAL1.Device.Data := StrToInt('8');
    ACBrBAL1.Device.Baud := StrToInt('2400');
    ACBrBAL1.Device.Baud := StrToInt('2400');
    ACBrBAL1.Device.Porta := 'COM2';

       // Conecta com a balança
    ACBrBAL1.Ativar;
    TimeOut := 2000;
    ACBrBAL1.LePeso(TimeOut);
  end;
end;

procedure TfCupomFiscal.ACBrBAL1LePeso(Peso: Double; Resposta: string);
var
  Valid: Integer;
begin
  CurrencyEdit1.Value := Peso;

  if Peso > 0 then

  else
  begin
    valid := Trunc(ACBrBAL1.UltimoPesoLido);
    case valid of
      0:
        ShowMessage('TimeOut !' + sLineBreak + 'Coloque o produto sobre a Balança!');
      -1:
        ShowMessage('Peso Instável ! ' + sLineBreak + 'Tente Nova Leitura');
      -2:
        ShowMessage('Peso Negativo !');
      -10:
        ShowMessage('Sobrepeso !');
    end;
  end;
end;

function TfCupomFiscal.fnc_Validacao_OK: Boolean;
var
  vMSG: string;
begin
  vMSG := '';
  Result := True;
  if fDmCupomFiscal.cdsCupomParametrosEXIGE_CAIXA_ABERTO.AsString = 'S' then
  begin
    fDmParametros.qCaixaAberto.Close;
    fDmParametros.qCaixaAberto.ParamByName('T1').AsInteger := vTerminal;
    fDmParametros.qCaixaAberto.ParamByName('D1').AsDate := Date;
    fDmParametros.qCaixaAberto.Open;
    if fDmParametros.qCaixaAberto.IsEmpty then
      vMSG := vMSG + #13 + 'Não existe caixa aberto para efetuar venda!'
    else if (fDmParametros.qCaixaAbertoDATA.AsDateTime < Date) then
    begin
      if (fDmParametros.qCaixaAbertoDATA2.AsDateTime > fDmParametros.qCaixaAbertoDATA.AsDateTime) then
        vMSG := vMSG + #13 + '*** Caixa aberto com data: ' + fDmParametros.qCaixaAbertoDATA.AsString + ', mas já existe caixa com data superior pendente de conferência ou já encerrado!' + #13 + ' FAVOR VERIFICAR!';
      if fDmCupomFiscal.vID_Fechamento <> fDmParametros.qCaixaAbertoID.AsInteger then
      begin
        if (MessageDlg('Caixa aberto com data de ' + fDmParametros.qCaixaAbertoDATA.AsString + ', usar este mesmo caixa?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
          Result := False;
      end;
    end;
    if Result then
      fDmCupomFiscal.vID_Fechamento := fDmParametros.qCaixaAbertoID.AsInteger;
  end;
  fDmCupomFiscal.vClienteID := fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger;
  fDmCupomFiscal.prc_Localizar_Pessoa(fDmCupomFiscal.vClienteID,'');
  if fDmCupomFiscal.cdsPessoa.IsEmpty then
    vMSG := vMSG + #13 + 'Não existe Cliente Consumidor código ' + fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsString + '!';
  if (fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString = 'S') and (trim(fDmCupomFiscal.cdsFilialSERIE_NFCE.AsString) = '') then
    vMSG := vMSG + #13 + 'Série da NFCe não informada na Filial!';
  if vFilial = 0 then
    vMSG := vMSG + #13 + 'Filial não informada no Parâmetro do Cupom!';    Close;

  if Trim(vMSG) <> '' then
  begin
    MessageDlg(vMSG, mtInformation, [mbOk], 0);
    Result := False;
  end;
  fDmParametros.qCaixaAberto.Close;
end;

procedure TfCupomFiscal.prc_Inserir;
begin
  fDmCupomFiscal.mPedidoAux.EmptyDataSet;
  vExiste_Comanda := False;

  fDmCupomFiscal.cdsFilial.IndexFieldNames := 'ID';
  fDmCupomFiscal.cdsFilial.FindKey([vFilial_Loc]);

  fDmCupomFiscal.vClienteID := fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger;

  //24/11/2020
  {vCanal_Venda := True;
  if fDmCupomFiscal.cdsCupomParametrosUSA_CANAL_VENDA.AsString = 'S' then
  begin
    fDmCupomFiscal.cdsCanalVendas.Close;
    fDmCupomFiscal.cdsCanalVendas.Open;
    if fDmCupomFiscal.cdsCanalVendas.RecordCount <= 0 then
    begin
      MessageDlg('*** Não existe Canal de Vendas cadastrado!', mtError, [mbOk], 0);
      vCanal_Venda := False;
      exit;
    end;
    frmCanalVendas := TfrmCanalVendas.Create(Self);
    frmCanalVendas.fDmCupomFiscal := fDmCupomFiscal;
    frmCanalVendas.ShowModal;
    FreeAndNil(frmCanalVendas);
    if fDmCupomFiscal.vID_Canal_Vendas <= 0 then
    begin
      MessageDlg('*** Não foi informado o Canal de Vendas!', mtError, [mbOk], 0);
      vCanal_Venda := False;
      exit;
    end;
  end;}
  //******************

  if (fDmCupomFiscal.cdsCupomParametrosUSA_CARTAO_COMANDA.AsString = 'S') and not(vCopiandoComanda) then
    prc_Form_Cartao
  else
    fDmCupomFiscal.prcInserir(0, fDmCupomFiscal.vClienteID,vSerieCupom);

  //24/11/2020
  if fDmCupomFiscal.cdsCupomParametrosUSA_CANAL_VENDA.AsString = 'S' then
    fDmCupomFiscal.cdsCupomFiscalID_CANAL_VENDA.AsInteger := fDmCupomFiscal.vID_Canal_Vendas;
  //********************

end;

procedure TfCupomFiscal.prc_Controle_Gravar_Diversos(Financeiro, Estoque: Boolean);
var
  ID: TTransactionDesc;
  Flag: Boolean;
  vMSGAux: string;
begin
  vMSGAux := '';
  vFinanceiroOK := 'N';
  vEstoqueOK := 'N';
  if Financeiro then
  begin
    ID.TransactionID := 70;
    ID.IsolationLevel := xilREADCOMMITTED;
    dmDatabase.scoDados.StartTransaction(ID);
    try

      fDmCupomFiscal.cdsCupom_Parc.First;
      while not fDmCupomFiscal.cdsCupom_Parc.Eof do
      begin
        fDmCupomFiscal.cdsTipoCobranca.Locate('ID',fDmCupomFiscal.cdsCupom_ParcID_TIPOCOBRANCA.AsInteger,[loCaseInsensitive]);
        if ((fDmCupomFiscal.cdsTipoCobrancaCREDITO_LOJA.AsString = 'S') or
           (fDmCupomFiscal.cdsCupomParametrosGERAR_CRECEBER.AsString = 'T')) or
           ((fDmCupomFiscal.cdsTipoCobrancaFORMA_PGTO.AsString = 'P') and
           ((fDmCupomFiscal.cdsCupomParametrosGERAR_CRECEBER.AsString = 'C') and (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'NFC'))) then
        begin
          Gravar_CReceber;

          if (fDmCupomFiscal.cdsCupomFiscalID_VENDEDOR.AsInteger > 0) and (StrToFloat(FormatFloat('0.00', fDmCupomFiscal.cdsCupomFiscalPERC_VENDEDOR.AsFloat)) > 0) then
          begin
            fDmCupomFiscal.cdsVendedor.Locate('CODIGO', fDmCupomFiscal.cdsCupomFiscalID_VENDEDOR.AsInteger, [loCaseInsensitive]);
            if fDmCupomFiscal.cdsVendedorTIPO_COMISSAO.AsString = 'N' then
              fDmCupomFiscal.prc_Gravar_Comissao('AVI');  //aqui, comissão a prazo
          end;
        end;
        fDmCupomFiscal.cdsCupom_Parc.Next;
      end;

      fDmCupomFiscal.cdsCupom_Parc.ApplyUpdates(0);


      fDmCupomFiscal.cdsCupomFiscal_FormaPgto.First;
      while not fDmCupomFiscal.cdsCupomFiscal_FormaPgto.Eof do
      begin
        fDmCupomFiscal.cdsTipoCobranca.Locate('ID',fDmCupomFiscal.cdsCupomFiscal_FormaPgtoID_TIPOCOBRANCA.AsInteger,[loCaseInsensitive]);
        if ((fDmCupomFiscal.cdsTipoCobrancaCREDITO_LOJA.AsString = 'S') or
           (fDmCupomFiscal.cdsCupomParametrosGERAR_CRECEBER.AsString = 'T')) or
           ((fDmCupomFiscal.cdsTipoCobrancaFORMA_PGTO.AsString = 'P') and
           ((fDmCupomFiscal.cdsCupomParametrosGERAR_CRECEBER.AsString = 'C') and (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'NFC'))) then
          begin

          end
        else
        begin
          fDmCupomFiscal.prc_Gravar_Financeiro_Cupom(0, fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency);
          fDmCupomFiscal.prc_Gravar_Comissao('AVI');  //aqui, comissão a vista
        end;
        fDmCupomFiscal.cdsCupomFiscal_FormaPgto.Next;
      end;

      dmDatabase.scoDados.Commit(ID);


      vFinanceiroOK := 'S';
    except
      on e: Exception do
      begin
        vFinanceiroOK := 'N';
        //vMSGAux := 'Erro ao gravar Comissão/Contas Receber: ' + #13 + e.Message;
        //uGrava_Erro.prc_Gravar('Financeiro,Estoque,Comissão', 'fCupomFiscal', vMSGAux, DateToStr(Date), TimeToStr(Now));
        dmDatabase.scoDados.Rollback(ID);
      end;
    end;
  end;

  if trim(vMSGAux) <> '' then
    MessageDlg(vMSGAux, mtInformation, [mbOk], 0);

end;

procedure TfCupomFiscal.Gravar_Estoque(vFinanceiro: Boolean);
var
  vID_Estoque,
  vID_Mov: Integer;
  vDescAux: Real;
//  fDMCadCupomFiscal_MP: TDMCadCupomFiscal_MP;
begin
{  if fDmCupomFiscal.cdsCupomParametrosBAIXAR_CONSUMO.AsString = 'S' then
  begin
    fDMCadCupomFiscal_MP := TDMCadCupomFiscal_MP.Create(Self);
    fDMCadCupomFiscal_MP.mMaterial.EmptyDataSet;
  end;}

  fDmCupomFiscal.cdsCupom_Itens.DisableControls;
  fDmCupomFiscal.cdsCupom_Itens.First;
  while not fDmCupomFiscal.cdsCupom_Itens.Eof do
  begin
    vID_Mov  := 0;
    vDescAux := StrToFloat(FormatFloat('0.0000',fDmCupomFiscal.cdsCupom_ItensVLR_DESCONTO.AsFloat));

    if fDmCupomFiscal.cdsCupom_ItensCANCELADO.AsString = 'S' then
    begin
      fDmCupomFiscal.cdsCupom_Itens.Next;
      Continue;
    end;

    fDmCupomFiscal.prc_Abrir_Produto('ID',fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsString);

    vID_Estoque := fDMEstoque.fnc_Gravar_Estoque(fDmCupomFiscal.cdsCupom_ItensID_MOVESTOQUE.AsInteger,
                                                 fDmCupomFiscal.cdsCupomFiscalFILIAL.AsInteger,
                                                 vLocalEstoque,
                                                 fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger,
                                                 fDmCupomFiscal.cdsCupomFiscalNUMCUPOM.AsInteger,
                                                 fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger,
                                                 fDmCupomFiscal.cdsCupom_ItensID_CFOP.AsInteger,
                                                 fDmCupomFiscal.cdsCupomFiscalID.AsInteger,0,
                                                 'S','CFI',
                                                 fDmCupomFiscal.cdsCupom_ItensUNIDADE.AsString,
                                                 fDmCupomFiscal.cdsCupom_ItensUNIDADE.AsString,
                                                 fDmCupomFiscal.cdsCupomFiscalSERIE.AsString,
                                                 fDmCupomFiscal.cdsCupom_ItensTAMANHO.AsString,
                                                 fDmCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime,
                                                 fDmCupomFiscal.cdsCupom_ItensVLR_UNITARIO.AsFloat,
                                                 fDmCupomFiscal.cdsCupom_ItensQTD.AsFloat,
                                                 fDmCupomFiscal.cdsCupom_ItensPERC_ICMS.AsFloat,
                                                 0,
                                                 vDescAux,
                                                 0,
                                                 0,
                                                 fDmCupomFiscal.cdsCupom_ItensQTD.AsFloat,
                                                 fDmCupomFiscal.cdsCupom_ItensVLR_UNITARIO.AsFloat,
                                                 vDescAux,0,'',
                                                 fDmCupomFiscal.cdsCupom_ItensID_COR_COMBINACO.AsInteger,'','N',0,0,0,0,0,0,0);

    if (not fDmCupomFiscal.cdsProduto.IsEmpty) and
       (fDmCupomFiscal.cdsProdutoTIPO_REG.AsString <> 'N') and (vFinanceiro) then
    begin
      vID_Mov := fDMMovimento.fnc_Gravar_Movimento(0,
                                                   fDMCupomFiscal.cdsCupomFiscalFILIAL.AsInteger,
                                                   fDMCupomFiscal.cdsCupom_ItensITEM.AsInteger,
                                                   fDMCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger,
                                                   0,
                                                   fDMCupomFiscal.cdsCupom_ItensID.AsInteger,
                                                   fDMCupomFiscal.cdsCupom_ItensID_CFOP.AsInteger,
                                                   fDMCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger,
                                                   0,
                                                   fDMCupomFiscal.cdsCupomFiscalNUMCUPOM.AsInteger,0,
                                                   'CFI',
                                                   fDmCupomFiscal.cdsCupomFiscalSERIE.AsString,//Série
                                                   'S','CFI',
                                                   fDMCupomFiscal.cdsCupom_ItensVLR_UNITARIO.AsFloat,
                                                   fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat,
                                                   0,
                                                   0,
                                                   fDMCupomFiscal.cdsCupom_ItensVLR_ICMS.AsFloat,
                                                   0,
                                                   0,0,0,
                                                   0,0,
                                                   0,
                                                   0,
                                                   fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat,0,
                                                   0,
                                                   0,
                                                   0,
                                                   0,
                                                   0,0,0,0,fDMCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat,
                                                   0,
                                                   0,
                                                   fDMCupomFiscal.cdsCupom_ItensQTD.AsFloat,
                                                   0,
                                                   fDMCupomFiscal.cdsCupom_ItensPERC_ICMS.AsFloat,
                                                   0,
                                                   0,
                                                   0,0,0,0,
                                                   fDMCupomFiscal.cdsCupom_ItensCANCELADO.AsString,
                                                   fDmCupomFiscal.cdsCupomFiscalNFEDENEGADA.AsString,
                                                   fDMCupomFiscal.cdsCupom_ItensUNIDADE.AsString,
                                                   '',
                                                   fDMCupomFiscal.cdsCupom_ItensNOMEPRODUTO.AsString,
                                                   fDmCupomFiscal.cdsProdutoREFERENCIA.AsString,
                                                   fDMCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime,   
                                                   fDMCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime,
                                                   fDMCupomFiscal.cdsCupom_ItensTAMANHO.AsString,
                                                   '',
                                                   fDMCupomFiscal.cdsCupomFiscalID_CONDPGTO.AsInteger,0,
                                                   fDmCupomFiscal.cdsCupomFiscalID_VENDEDOR.AsInteger,
                                                   fDmCupomFiscal.cdsCupom_ItensID_COR_COMBINACO.AsInteger,
                                                   fDmCupomFiscal.cdsCupomFiscalPERC_VENDEDOR.AsFloat,0,0,vTerminal,0,'N',
                                                   0,0,0,0,0,0,0,0,0,0,0,0);
    end;
    if (fDmCupomFiscal.cdsCupom_ItensID_MOVESTOQUE.AsInteger <> vID_Estoque) or (fDmCupomFiscal.cdsCupom_ItensID_MOVIMENTO.AsInteger <> vID_Mov) then
    begin
      fDmCupomFiscal.cdsCupom_Itens.Edit;
      fDmCupomFiscal.cdsCupom_ItensID_MOVESTOQUE.AsInteger := vID_Estoque;
      fDmCupomFiscal.cdsCupom_ItensID_MOVIMENTO.AsInteger  := vID_Mov;
      fDmCupomFiscal.cdsCupom_Itens.Post;
    end;
    fDmCupomFiscal.cdsCupom_Itens.Next;
  end;
  fDmCupomFiscal.cdsCupom_Itens.EnableControls;
  {if fDmCupomFiscal.cdsCupomParametrosBAIXAR_CONSUMO.AsString = 'S' then
  begin
    fDMCadCupomFiscal_MP.prc_Le_mMaterial;
    FreeAndNil(fDMCadCupomFiscal_MP);
  end;}
end;

procedure TfCupomFiscal.Gravar_CReceber;
begin
  {if fDmCupomFiscal.cdsCupomFiscalTIPO_PGTO.AsString = 'V' then
  begin
    fDmCupomFiscal.cdsCupomFiscal.Edit;
    fDmCupomFiscal.cdsCupomFiscalID_DUPLICATA.AsInteger := fDmCupomFiscal.Gravar_Duplicata('R','N',1,
                                                                                          fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat,
                                                                                          fDmCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime,'');
    fDmCupomFiscal.cdsCupomFiscal.Post;
  end
  else}
  begin
    fDmCupomFiscal.cdsCupom_Parc.Edit;
    fDmCupomFiscal.cdsCupom_ParcID_DUPLICATA.AsInteger := fDmCupomFiscal.Gravar_Duplicata(0,'R','N',fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger,
                                                                                          fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsFloat,
                                                                                          fDmCupomFiscal.cdsCupom_ParcDTVENCIMENTO.AsDateTime,'');
    fDmCupomFiscal.cdsCupom_Parc.Post;
  end;
end;

procedure TfCupomFiscal.prc_PosicionaFormaPgto(vId: Integer);
begin
  if not fDmCupomFiscal.cdsTipoCobranca.Active then
    fDmCupomFiscal.cdsTipoCobranca.Open;
  fDmCupomFiscal.cdsTipoCobranca.IndexFieldNames := 'ID';
  fDmCupomFiscal.cdsTipoCobranca.FindKey([vID]);
end;

procedure TfCupomFiscal.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
   if Msg.CharCode = VK_F10 then
   begin
     Handled := True;
     btFinalizar.Click;
   end;
end;

procedure TfCupomFiscal.prc_ConfirmaItem;
var
  vItemAux: Integer;
  vUni: string;
begin
  if (Edit1.Text = '') or (Edit1.Text = '0') then
  begin
    ShowMessage('Produto não informado!');
    Edit1.SetFocus;
    Exit;
  end;
  fDmCupomFiscal.cdsProduto.Locate('ID', vID_Produto, [loCaseInsensitive]);
  if CurrencyEdit1.Value <= 0 then
  begin
    ShowMessage('Quantidade não informada!');
    CurrencyEdit1.SetFocus;
    Exit;
  end;
  if vVlrItem <= 0 then
  begin
    if not fnc_Altera_Preco then
    begin
      Edit1.SetFocus;
      Exit;
    end;
  end;

  if vAplicarDescontoItem then
  begin
    if not fnc_Aplicar_Desconto then
    begin
      Edit1.SetFocus;
      Exit;
    end;
  end;

  if trim(vUnidade) <> '' then
  begin
    if not fnc_VerficaFracionado(vUnidade) then
    begin
      ShowMessage('Produto não pode ser vendido fracionado!');
      Exit;
    end;
  end
  else if not fnc_VerficaFracionado(fDmCupomFiscal.cdsProdutoUnidade.AsString) then
  begin
    ShowMessage('Produto não pode ser vendido fracionado!');
    Exit;
  end;

  //Controle do estoque  11/05/2015       //02/03/2020 foi colocado o vCopiandoComanda
  if (fDmCupomFiscal.cdsParametrosCONTROLAR_ESTOQUE_SAIDA.AsString = 'S') and not(vCopiandoComanda) then
  begin
    if not fnc_Estoque_OK(fDmCupomFiscal.cdsProdutoID.AsInteger, 0, '', CurrencyEdit1.Value) then
      Exit;
  end;

  fDmCupomFiscal.cdsCupom_Itens.Last;
  vItemAux := fDmCupomFiscal.cdsCupom_ItensItem.AsInteger;
  try
    fDmCupomFiscal.cdsCupom_Itens.Insert;
    fDmCupomFiscal.cdsCupom_ItensID.AsInteger := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
    fDmCupomFiscal.cdsCupom_ItensITEM.AsInteger := vItemAux + 1;
    fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger := vID_Produto;
    fDmCupomFiscal.cdsCupom_ItensQTD.AsFloat := StrToFloat(FormatFloat(vFormaQtd, CurrencyEdit1.Value));
    //06/11/2019
    //fDmCupomFiscal.cdsCupom_ItensTAMANHO.AsString := '';
    if fDmCupomFiscal.vIdCombinacao > 0 then
      fDmCupomFiscal.cdsCupom_ItensID_COR_COMBINACO.AsInteger := fDmCupomFiscal.vIdCombinacao;
    fDmCupomFiscal.cdsCupom_ItensTAMANHO.AsString           := fDmCupomFiscal.vTamanho;
    //**********************
    fDmCupomFiscal.cdsCupom_ItensVLR_UNITARIO.AsFloat       := vVlrItem;
    fDmCupomFiscal.cdsCupom_ItensVLR_UNIT_ORIGINAL.AsFloat  := vVlrItem;
    fDmCupomFiscal.vSomaOriginal := fDmCupomFiscal.vSomaOriginal + vSubTotal;

    if vValorDesconto > 0 then
    begin
      fDmCupomFiscal.cdsCupom_ItensVLR_DESCONTO.AsFloat := vValorDesconto;
      vTipoDesc := '$';
      fDmCupomFiscal.cdsCupomFiscalTIPO_DESCONTO.AsString := 'I';
    end
    else
      fDmCupomFiscal.cdsCupom_ItensVLR_DESCONTO.AsFloat := 0;

    fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat := vSubTotal;

    //NFCe
    if fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString <> 'S' then
    begin
      fDmCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat := 0;
      fDmCupomFiscal.cdsCupom_ItensVLR_ICMS.AsFloat := 0;
      if StrToFloat(FormatFloat('0.00', fDmCupomFiscal.cdsCupom_ItensPERC_ICMS.AsFloat)) > 0 then
      begin
        fDmCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat := vSubTotal;
        if StrToFloat(FormatFloat('0.0000', fDmCupomFiscal.cdsCupom_ItensPERC_TRIBICMS.AsFloat)) > 0 then
          fDmCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat := StrToFloat(FormatFloat('0.00', (fDmCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat * fDmCupomFiscal.cdsCupom_ItensPERC_TRIBICMS.AsFloat / 100)));
        fDmCupomFiscal.cdsCupom_ItensVLR_ICMS.AsFloat := StrToFloat(FormatFloat('0.00', fDmCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat * fDmCupomFiscal.cdsCupom_ItensPERC_ICMS.AsFloat / 100));
      end;
      fDmCupomFiscal.cdsCupom_ItensID_CFOP.AsInteger := 0;
    end;
    fDmCupomFiscal.cdsCupom_ItensREFERENCIA.AsString := fDmCupomFiscal.cdsProdutoREFERENCIA.AsString;
    fDmCupomFiscal.cdsCupom_ItensORIGEM_PROD.AsString := fDmCupomFiscal.cdsProdutoORIGEM_PROD.AsString;
    fDmCupomFiscal.cdsCupom_ItensID_NCM.AsString := fDmCupomFiscal.cdsProdutoID_NCM.AsString;

    fDmCupomFiscal.cdsCupom_ItensID_MOVESTOQUE.AsInteger := 0;
    if (vPedidoSelecionado) and (trim(vUnidade) <> '') then
      fDmCupomFiscal.cdsCupom_ItensUNIDADE.AsString := vUnidade
    else
      fDmCupomFiscal.cdsCupom_ItensUNIDADE.AsString := fDmCupomFiscal.cdsProdutoUnidade.AsString;
    fDmCupomFiscal.cdsCupom_ItensNOMEPRODUTO.AsString := fDmCupomFiscal.cdsProdutoNome.AsString;
    fDmCupomFiscal.cdsCupom_ItensCANCELADO.AsString := 'N';

    //06/11/2019
    fDmCupomFiscal.cdsCupom_ItensNOME_PRODUTO.AsString := fDmCupomFiscal.cdsProdutoNome.AsString;
    if fDmCupomFiscal.vIdCombinacao > 0 then
      fDmCupomFiscal.cdsCupom_ItensNOME_PRODUTO.AsString := fDmCupomFiscal.cdsCupom_ItensNOME_PRODUTO.AsString + ' ' + fDmCupomFiscal.vCombinacao;
    if Trim(fDmCupomFiscal.vTamanho) <> '' then
      fDmCupomFiscal.cdsCupom_ItensNOME_PRODUTO.AsString := fDmCupomFiscal.cdsCupom_ItensNOME_PRODUTO.AsString + ' ' + fDmCupomFiscal.vTamanho;
    //*****************

    if (vPedidoSelecionado) and (trim(vNome_Complementar) <> '') then
      fDmCupomFiscal.cdsCupom_ItensNOME_PRODUTO.AsString := fDmCupomFiscal.cdsCupom_ItensNOME_PRODUTO.AsString + ' ' + vNome_Complementar;

    fDmCupomFiscal.prc_Busca_IBPT;

    if fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString = 'S' then
    begin
      if fDmCupomFiscal.vID_CFOP > 0 then
      begin
        fDmCupomFiscal.cdsCupom_ItensID_CFOP.AsInteger := fDmCupomFiscal.vID_CFOP;
        if fDmCupomFiscal.vID_Variacao > 0 then
          fDmCupomFiscal.cdsCupom_ItensID_VARIACAO.AsInteger := fDmCupomFiscal.vID_Variacao;
      end;

      if fDmCupomFiscal.vID_Pis > 0 then
        fDmCupomFiscal.cdsCupom_ItensID_PIS.AsInteger := fDmCupomFiscal.vID_Pis;
      if fDmCupomFiscal.vID_Cofins > 0 then
        fDmCupomFiscal.cdsCupom_ItensID_COFINS.AsInteger := fDmCupomFiscal.vID_Cofins;
      if fDmCupomFiscal.vID_CSTICMS > 0 then
        fDmCupomFiscal.cdsCupom_ItensID_CSTICMS.AsInteger := fDmCupomFiscal.vID_CSTICMS;
      fDmCupomFiscal.cdsCupom_ItensTIPO_PIS.AsString := fDmCupomFiscal.vTipo_Pis;
      fDmCupomFiscal.cdsCupom_ItensTIPO_COFINS.AsString := fDmCupomFiscal.vTipo_Cofins;
      fDmCupomFiscal.cdsCupom_ItensPERC_PIS.AsFloat := fDmCupomFiscal.vPerc_Pis;
      fDmCupomFiscal.cdsCupom_ItensPERC_COFINS.AsFloat := fDmCupomFiscal.vPerc_Cofins;
      fDmCupomFiscal.cdsCupom_ItensPERC_TRIBICMS.AsFloat := fDmCupomFiscal.vPerc_TribICMS;
      fDmCupomFiscal.cdsCupom_ItensPERC_ICMS.AsFloat := fDmCupomFiscal.vPerc_ICMS;
      if (vPedidoSelecionado) then
        fDmCupomFiscal.cdsCupom_ItensPERC_IPI.AsFloat := vPerc_Ipi
      else
        fDmCupomFiscal.cdsCupom_ItensPERC_IPI.AsFloat := fDmCupomFiscal.vPerc_IPI;

      fDmCupomFiscal.prc_Busca_CodBenef;
        prc_Calculo_GeralItem(fDmCupomFiscal, fDmCupomFiscal.cdsCupom_ItensQTD.AsFloat, fDmCupomFiscal.cdsCupom_ItensVLR_UNIT_ORIGINAL.AsFloat, fDmCupomFiscal.cdsCupom_ItensVLR_DESCONTO.AsFloat, fDmCupomFiscal.cdsCupom_ItensPERC_DESCONTO.AsFloat, fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat, fDmCupomFiscal.cdsCupom_ItensVLR_ACRESCIMO.AsFloat, 'S', 0);
    end;

    if (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'CFI') then
      prc_Calcular_Tributos_Transparencia;

    if fDmCupomFiscal.cdsParametrosGRAVAR_CONSUMO_NOTA.AsString = 'S' then
      fDmCupomFiscal.cdsCupom_ItensITEM_ORIGINAL.AsInteger := vItem_original
    else
      fDmCupomFiscal.cdsCupom_ItensITEM_ORIGINAL.AsInteger := 0;

    if vPedidoSelecionado then
    begin
      fDmCupomFiscal.cdsCupom_ItensID_PEDIDO.AsInteger := vID_Pedido;
      fDmCupomFiscal.cdsCupom_ItensITEM_PEDIDO.AsInteger := vItem_Pedido;
      fDmCupomFiscal.cdsCupom_ItensNUMERO_OC.AsString := vNumero_OC;
      fDmCupomFiscal.cdsCupom_ItensNUMERO_OS.AsString := vNumero_OS;
      fDmCupomFiscal.cdsCupom_ItensITEM_CLIENTE.AsInteger := vItem_Cliente;
      fDmCupomFiscal.cdsCupom_ItensNUM_PEDIDO.AsInteger := vNum_Pedido;
    end;

    if vCopiandoComanda then
    begin
      fDmCupomFiscal.cdsCupom_ItensID_COMANDA.AsInteger   := fDmCupomFiscal.mCupomItensID_CUPOM.AsInteger;
      fDmCupomFiscal.cdsCupom_ItensITEM_COMANDA.AsInteger := fDmCupomFiscal.mCupomItensItem.AsInteger;
    end;

    pnlDescricaoProduto.Text := fDmCupomFiscal.cdsCupom_ItensNOME_PRODUTO.AsString;
    pnlDescricaoProduto.Update;

    fDmCupomFiscal.cdsCupom_Itens.Post;

    //Total
    if fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString <> 'S' then
    begin
      fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat := fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat + fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat;
      fDmCupomFiscal.cdsCupomFiscalVLR_ICMS.AsFloat := fDmCupomFiscal.cdsCupomFiscalVLR_ICMS.AsFloat + fDmCupomFiscal.cdsCupom_ItensVLR_ICMS.AsFloat;
      fDmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsFloat := fDmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsFloat + fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat;
      fDmCupomFiscal.cdsCupomFiscalBASE_ICMS.AsFloat := fDmCupomFiscal.cdsCupomFiscalBASE_ICMS.AsFloat + fDmCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat;

      fDmCupomFiscal.cdsCupomFiscalVLR_TRIBUTO.AsFloat := fDmCupomFiscal.cdsCupomFiscalVLR_TRIBUTO.AsFloat + fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO.AsFloat;

      fDmCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_FEDERAL.AsFloat := fDmCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_FEDERAL.AsFloat + fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat;
      fDmCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_ESTADUAL.AsFloat := fDmCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_ESTADUAL.AsFloat + fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat;
      fDmCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_MUNICIPAL.AsFloat := fDmCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_MUNICIPAL.AsFloat + fDmCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat;
    end;
    //*****
    fDmCupomFiscal.cdsCupomFiscal.Post;
    fDmCupomFiscal.cdsCupomFiscal.Edit;
    fDmCupomFiscal.cdsCupom_Itens.Last;


  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível incluir o item, ' + E.Message + '! Clique para continuar!');
      fDmCupomFiscal.cdsCupom_Itens.CancelUpdates;
    end;
  end;

  Limpa_Campos;
  case fDmCupomFiscal.cdsCupomParametrosPRIMEIRO_CAMPO.AsInteger of
    1:
      begin
        CurrencyEdit1.SetFocus;
        CurrencyEdit1.SelectAll;
      end;
    2:
      Edit1.SetFocus;
  end;

end;

procedure TfCupomFiscal.prc_InformaCliente;
begin
  if not fDmCupomFiscal.cdsCupomFiscal.Active then
    exit;

  fCupomFiscalCli := TfCupomFiscalCli.Create(Self);
  try
    fCupomFiscalCli.fDmCupomFiscal := fDmCupomFiscal;
    fCupomFiscalCli.ShowModal;
  finally
    fCupomFiscalCli.Free;
  end;

  fDmCupomFiscal.SQLQuery1.SQL.Text := 'SELECT CF.ID, CF.DTEMISSAO, CF.ID_TIPOCOBRANCA, CF.TIPO ' + 'FROM CUPOMFISCAL CF ' + 'WHERE CF.ID_TIPOCOBRANCA IS NULL AND ' + ' CF.TIPO IN (''PED'',''ORC'') AND ' + ' CF.ID_CLIENTE = ' + IntToStr(fDmCupomFiscal.vClienteID) + ' ORDER BY CF.DTEMISSAO';
  if not fDmCupomFiscal.SQLQuery1.IsEmpty then
  begin
    ShowMessage('Existe orçamento ou pedido aberto para este cliente em ' + fDmCupomFiscal.SQLQuery1.fieldByName('DTEMISSAO').AsString);
  end;
  fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger := fDmCupomFiscal.vClienteID;
end;

procedure TfCupomFiscal.prc_ConsPreco;
begin
  frmConsPreco := TfrmConsPreco.Create(Self);
  frmConsPreco.ShowModal;
  FreeAndNil(frmConsPreco);
end;

procedure TfCupomFiscal.Timer1Timer(Sender: TObject);
begin
  JvStatusBar1.Panels[2].Text := 'Data: ' + DateToStr(Date) + ' - ' +  TimeToStr(Time);
end;

function TfCupomFiscal.fnc_Altera_Preco: Boolean;
begin
  Result := False;
  ffrmTelaPrecoAlterado := TFormTelaPrecoAlterado.Create(nil);
  ffrmTelaPrecoAlterado.Valor_Original := vVlrItem;
  ffrmTelaPrecoAlterado.Controla_Dig_Preco := fDmCupomFiscal.qParametros_FinCONTROLE_DIG_PRECO.AsString;
  ffrmTelaPrecoAlterado.Altera_Preco_Pedido := fDmCupomFiscal.qParametros_UsuarioALT_PRECO_PED.AsString;
  ffrmTelaPrecoAlterado.ShowModal;
  if ffrmTelaPrecoAlterado.ModalResult = MrCancel then
  begin
    Edit1.SetFocus;
    Exit;
  end
  else
  if ffrmTelaPrecoAlterado.ModalResult = MrOK then
  begin
    vVlrItem := ffrmTelaPrecoAlterado.EditValorTotal.Value;
    vSubTotal := StrToFloat(FormatFloat('0.00', vVlrItem * CurrencyEdit1.Value));
  end;
  Result := True;
end;

procedure TfCupomFiscal.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  fCupomFiscalImposto := TfCupomFiscalImposto.Create(Self);
  fCupomFiscalImposto.fDmCupomFiscal := fDmCupomFiscal;
  fDmCupomFiscal.vID_CFOP := fDmCupomFiscal.cdsCupom_ItensID_CFOP.AsInteger;

  fDmCupomFiscal.vID_Pis := fDmCupomFiscal.cdsCupom_ItensID_PIS.AsInteger;
  fDmCupomFiscal.vID_Cofins := fDmCupomFiscal.cdsCupom_ItensID_COFINS.AsInteger;
  fDmCupomFiscal.vID_CSTICMS := fDmCupomFiscal.cdsCupom_ItensID_CSTICMS.AsInteger;
  fDmCupomFiscal.vID_CSTIPI := fDmCupomFiscal.cdsCupom_ItensID_CSTIPI.AsInteger;
  fDmCupomFiscal.vVlr_ICMS := fDmCupomFiscal.cdsCupom_ItensVLR_ICMS.AsFloat;
  fDmCupomFiscal.vBase_ICMS := fDmCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat;
  fDmCupomFiscal.vVlr_ICMS_Ret := fDmCupomFiscal.cdsCupom_ItensVLR_ICMSSUBST_RET.AsFloat;
  fDmCupomFiscal.vBase_ICMS_Ret := fDmCupomFiscal.cdsCupom_ItensBASE_ICMSSUBST_RET.AsFloat;
  fDmCupomFiscal.vVlr_ICMS_Efet := fDmCupomFiscal.cdsCupom_ItensVLR_ICMS_EFE.AsFloat;
  fDmCupomFiscal.vPerc_ICMS_Efet := fDmCupomFiscal.cdsCupom_ItensPERC_ICMS_EFET.AsFloat;
  fDmCupomFiscal.vBase_ICMS_Efet := fDmCupomFiscal.cdsCupom_ItensVLR_BASE_EFET.AsFloat;
  fCupomFiscalImposto.ShowModal;
  FreeAndNil(fCupomFiscalImposto);
end;

function TfCupomFiscal.fnc_Aplicar_Desconto: Boolean;
var
  vDescItemValor: Double;
  vDescItemPerc: Double;
begin
  Result := False;
  ffrmTelaTipoDescontoItem := TfrmTelaTipoDescontoItem.Create(nil);
  ffrmTelaTipoDescontoItem.vValorOriginal := vVlrItem;
  ffrmTelaTipoDescontoItem.ShowModal;
  if ffrmTelaTipoDescontoItem.ModalResult = mrCancel then
    Exit;
  with ffrmTelaTipoDescontoItem do
  begin
    if EditDesconto.Value > 0 then
    begin
      case tEnumTipoDesconto(rdgDescontoUnitario.ItemIndex) of
        tpPercentual :
        begin
          vDescItemPerc := EditDesconto.Value;
          vDescItemValor := 0;
        end;
        tpValor :
        begin
          vDescItemPerc := 0;
          vDescItemValor := EditDesconto.Value;
        end;
        tpValorPago :
        begin
          vDescItemPerc := 0;
          vDescItemValor := vVlrItem - EditDesconto.Value;
        end;
      end;
    end;
  end;

  if vDescItemPerc > 0 then
    vDescItemValor := vVlrItem * (vDescItemPerc / 100);

  if CurrencyEdit1.Value > 1 then
  begin

  end;

  if (vDescItemValor > 0) and (vDescItemValor > vVlrItem) and (CurrencyEdit1.Value = 1) then
  begin
    MessageDlg('O valor do desconto informado é maior que o valor do item!',mtInformation,[mbOK],0);
    Result := False;
    Exit;
  end;
  vSubTotal := (CurrencyEdit1.Value * vVlrItem - vDescItemValor);
  vValorDesconto := vDescItemValor;
  Result := True;
end;

procedure TfCupomFiscal.prc_Gravar_Estoque_Troca;
var
  vID_Estoque: Integer;
begin
  if fDmCupomFiscal.cdsCupomParametrosGERAR_ESTOQUE_TROCA.AsString <> 'S' then
    exit;

  fDmCupomFiscal.cdsCupom_Troca.Close;
  fDmCupomFiscal.sdsCupom_Troca.ParamByName('ID_CUPOM').AsInteger := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
  fDmCupomFiscal.cdsCupom_Troca.Open;
  fDmCupomFiscal.cdsCupom_Troca.First;
  while not fDmCupomFiscal.cdsCupom_Troca.Eof do
  begin
    fDmCupomFiscal.qProd.Close;
    fDmCupomFiscal.qProd.ParamByName('ID').AsInteger := fDmCupomFiscal.cdsCupom_TrocaID_PRODUTO.AsInteger;
    fDmCupomFiscal.qProd.Open;

    vID_Estoque := fDMEstoque.fnc_Gravar_Estoque(fDmCupomFiscal.cdsCupom_TrocaID_MOVESTOQUE.AsInteger,
                                                 fDmCupomFiscal.cdsCupomFiscalFILIAL.AsInteger,
                                                 vLocalEstoque,
                                                 fDmCupomFiscal.cdsCupom_TrocaID_PRODUTO.AsInteger,
                                                 fDmCupomFiscal.cdsCupomFiscalNUMCUPOM.AsInteger,
                                                 fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger,
                                                 0,
                                                 fDmCupomFiscal.cdsCupom_TrocaID.AsInteger,0,
                                                 'E','CFITR',
                                                 fDmCupomFiscal.qProdUNIDADE.AsString,
                                                 fDmCupomFiscal.qProdUNIDADE.AsString,
                                                 fDmCupomFiscal.cdsCupomFiscalSERIE.AsString,
                                                 '',
                                                 fDmCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime,
                                                 fDmCupomFiscal.cdsCupom_TrocaVLR_UNITARIO.AsFloat,
                                                 fDmCupomFiscal.cdsCupom_TrocaQTD.AsFloat,
                                                 0,
                                                 0,
                                                 0,
                                                 0,
                                                 0,
                                                 fDmCupomFiscal.cdsCupom_TrocaQTD.AsFloat,
                                                 fDmCupomFiscal.cdsCupom_TrocaVLR_UNITARIO.AsFloat,
                                                 0,0,'',
                                                 0,'','S',0,0,0,0,0,0,0);
    fDmCupomFiscal.cdsCupom_Troca.Edit;
    fDmCupomFiscal.cdsCupom_TrocaID_MOVESTOQUE.AsInteger := vID_Estoque;
    fDmCupomFiscal.cdsCupom_Troca.Post;

    fDmCupomFiscal.cdsCupom_Troca.Next;
  end;
  fDmCupomFiscal.cdsCupom_Troca.ApplyUpdates(0);
  fDmCupomFiscal.cdsCupom_Troca.Close;

end;

procedure TfCupomFiscal.prc_Limpa_Variaveis_Encerramento;
begin
  vDocumentoClienteVenda := '';
  vCpfOK := False;
  pnlDescricaoProduto.Text := '';
  pnlDescricaoProduto.Update;
  pnlCaixaLivre.Visible := True;
  Edit1.SelectAll;
  Edit1.Clear;
  Edit1.SetFocus;
  fDmCupomFiscal.vConverter_NFCe   := False;
  fDmCupomFiscal.vAceita_Converter := False;
  fDmCupomFiscal.vID_Canal_Vendas  := 0;
  fDmCupomFiscal.vID_TabPreco_CV   := 0;
  JvStatusBar1.Panels[4].Text := '';
end;

procedure TfCupomFiscal.prc_Form_Cartao;
var
  vID: Integer;
begin
  vExiste_Comanda := False;
  if fDmCupomFiscal.cdsCupomParametrosUSA_CARTAO_COMANDA.AsString = 'S' then
  begin
    fDmCupomFiscal.vNumCartao := 0;
    fCartao := TfCartao.Create(Self);
    try
      fCartao.fDmCupomFiscal := fDmCupomFiscal;
      fCartao.ShowModal;
      if fCartao.ModalResult = mrCancel then
        exit;
      vID := fDmCupomFiscal.fnc_Existe_Cartao_Pendente(fDmCupomFiscal.vNumCartao);
      JvStatusBar1.Panels[4].Text := IntToStr(fDmCupomFiscal.vNumCartao);
      if vID <= 0 then
      begin
        fDmCupomFiscal.prcInserir(0,fDmCupomFiscal.vClienteID,vSerieCupom);
        fDmCupomFiscal.cdsCupomFiscalNUM_CARTAO.AsInteger := fDmCupomFiscal.vNumCartao;
        pnlCaixaLivre.Visible := False;
        if fDmCupomFiscal.cdsCupomParametrosUSA_NOME_COMANDA.AsString = 'S' then
        begin
          fCartaoNome := TfCartaoNome.Create(Self);
          try
            if fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString <> EmptyStr then
              JvStatusBar1.Panels[4].Text := JvStatusBar1.Panels[4].Text + '-' + fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString
            else
            begin
              fCartaoNome.edtNome.Text := fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString;
              fCartaoNome.ShowModal;
              JvStatusBar1.Panels[4].Text := JvStatusBar1.Panels[4].Text + '-' + fCartaoNome.edtNome.Text;
              fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString := fCartaoNome.edtNome.Text;
            end;
          finally
            fCartaoNome.Free;
          end;
        end;
      end
      else
      begin
        fDmCupomFiscal.prcLocalizar(VID);
        fDmCupomFiscal.cdsCupomFiscal.Edit;
        pnlCaixaLivre.Visible := False;
        vExiste_Comanda       := True;
        if fDmCupomFiscal.cdsCupomParametrosUSA_NOME_COMANDA.AsString = 'S' then
        begin
          fCartaoNome := TfCartaoNome.Create(Self);
          try
            if fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString <> EmptyStr then
              JvStatusBar1.Panels[4].Text := JvStatusBar1.Panels[4].Text + '-' + fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString
            else
            begin
              fCartaoNome.edtNome.Text := fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString;
              fCartaoNome.ShowModal;
              JvStatusBar1.Panels[4].Text := JvStatusBar1.Panels[4].Text + '-' + fCartaoNome.edtNome.Text;
              fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString := fCartaoNome.edtNome.Text;
            end;
          finally
            fCartaoNome.Free;
          end;
        end;

      end;


    finally
      fCartao.Free;
    end;
  end
end;

procedure TfCupomFiscal.btnCopiarComandaClick(Sender: TObject);
begin
  frmSel_Comanda_CF := TfrmSel_Comanda_CF.Create(Self);
  //frmSel_Comanda_CF.WindowState := wsMaximized;
  frmSel_Comanda_CF.fDmCupomFiscal := fDmCupomFiscal;
  frmSel_Comanda_CF.ShowModal;
  vCopiandoComanda := False;
end;

procedure TfCupomFiscal.btnCopiarSacolaClick(Sender: TObject);
var
  ffrmSel_Sacola_CF: TfrmSel_Sacola_CF;
begin
  ffrmSel_Sacola_CF := TfrmSel_Sacola_CF.Create(self);

  ffrmSel_Sacola_CF.fDMCupomFiscal := fDMCupomFiscal;
  ffrmSel_Sacola_CF.ffCupomFiscal2 := fCupomFiscal;
  ffrmSel_Sacola_CF.ShowModal;
  FreeAndNil(ffrmSel_Sacola_CF);
end;

procedure TfCupomFiscal.prc_Verificar_Pedido(ID: Integer);
begin
  fDmCupomFiscal.prcLocalizar(ID);
  if (fDmCupomFiscal.cdsCupomFiscal.IsEmpty) or (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString <> 'PED' ) then
  begin
    MessageDlg('*** Pedido não encontrado!', mtInformation, [mbOk], 0);
    exit;
  end;
  fDmCupomFiscal.cdsCupomFiscal.Edit;
  fDmCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime := Date;
  Edit1.SetFocus;
  pnlCaixaLivre.Visible := False;
end;

procedure TfCupomFiscal.btTrocaClick(Sender: TObject);
begin
  if fDmCupomFiscal.cdsFilialID.AsInteger <> vFilial_Loc then
    fDmCupomFiscal.cdsFilial.Locate('ID', vFilial_Loc, [loCaseInsensitive]);
  fDmCupomFiscal.vID_Troca := 0;
  frmCupom_Troca := TfrmCupom_Troca.Create(Self);
  frmCupom_Troca.fDmCupomFiscal := fDmCupomFiscal;
  frmCupom_Troca.vSerieCupom := vSerieCupom;
  frmCupom_Troca.ShowModal;
  FreeAndNil(frmCupom_Troca);
end;

procedure TfCupomFiscal.prc_Canal_Venda;
begin
  //24/11/2020
  vCanal_Venda := True;
  if fDmCupomFiscal.cdsCupomParametrosUSA_CANAL_VENDA.AsString = 'S' then
  begin
    fDmCupomFiscal.cdsCanalVendas.Close;
    fDmCupomFiscal.cdsCanalVendas.Open;
    if fDmCupomFiscal.cdsCanalVendas.RecordCount <= 0 then
    begin
      MessageDlg('*** Não existe Canal de Vendas cadastrado!', mtError, [mbOk], 0);
      vCanal_Venda := False;
      exit;
    end;
    frmCanalVendas := TfrmCanalVendas.Create(Self);
    frmCanalVendas.fDmCupomFiscal := fDmCupomFiscal;
    frmCanalVendas.CurrencyEdit1.AsInteger := fDmCupomFiscal.vID_Canal_Vendas;
    frmCanalVendas.ShowModal;
    FreeAndNil(frmCanalVendas);
    if fDmCupomFiscal.vID_Canal_Vendas <= 0 then
    begin
      MessageDlg('*** Não foi informado o Canal de Vendas!', mtError, [mbOk], 0);
      vCanal_Venda := False;
    end;
  end;
end;

procedure TfCupomFiscal.prc_AjustaGrid(Coluna : TcxGridTableView; DbGrid : TcxGrid);
const
  Col_Item = 4.82;
  Col_Codigo = 8.10;
  Col_Referencia = 11.28;
  Col_Produto = 42.28;
  Col_Qtde = 10.06;
  Col_VlrUnitario = 10.41;
  Col_VlrDesconto = 10.23;
  Col_VlrTotal = 10.32;
begin
  Coluna.Columns[0].Width := Round((DbGrid.Width * Col_Item) / 100);
  Coluna.Columns[1].Width := Round((DbGrid.Width * Col_Codigo) / 100);
  Coluna.Columns[2].Width := Round((DbGrid.Width * Col_Referencia) / 100);
  Coluna.Columns[3].Width := Round((DbGrid.Width * Col_Produto) / 100);
  Coluna.Columns[4].Width := Round((DbGrid.Width * Col_Qtde) / 100);
  Coluna.Columns[5].Width := Round((DbGrid.Width * Col_VlrUnitario) / 100);
  Coluna.Columns[6].Width := Round((DbGrid.Width * Col_VlrDesconto) / 100);
  Coluna.Columns[7].Width := Round((DbGrid.Width * Col_VlrTotal) / 100);
end;

procedure TfCupomFiscal.FormResize(Sender: TObject);
begin
  prc_AjustaGrid(cxGrid1DBTableView1, cxGrid1);
//  prc_AjustaPanel;
end;

procedure TfCupomFiscal.evMensagem(Msg: String);
begin
  pnlDescricaoProduto.Text := Msg;
  pnlDescricaoProduto.Update;
end;

procedure TfCupomFiscal.prc_AjustaPanel;
const
  aPnlValores = 29.36;
  aPnlGrid = 70.64;
  aPnlProduto = 27.67;
  aPnl2 = 27.81;
  aPnlImage = 27.81;
  aPnlCopia = 27.81;
  aPnl7 = 27.81;
  aPnlBotoes = 27.81;
begin
//  Panel2.Width := Round((Self.Width * aPnlValores) / 100);
//  Panel1.Width := Round((Self.Width * aPnlGrid) / 100);
//  pnlProduto.Width := Round((Self.Width * aPnlProduto) / 100);
//  Panel4.Width := Round((Self.Width * aPnl2) / 100);
//  AdvPanel3.Width := Round((Self.Width * aPnlImage) / 100);
//  pnlCopiar.Width := Round((Self.Width * aPnlCopia) / 100);
//  pnlBotoes.Width := Round((Self.Width * aPnlBotoes) / 100);
end;

procedure TfCupomFiscal.SetImprimirNFCe(const Value: Boolean);
begin
  FImprimirNFCe := Value;
end;

end.


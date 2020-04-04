unit UCadProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDMCadProduto, DB, UCBase,
  UCadUnidade, UCadNCM, StdCtrls, DBCtrls, RxDBComb, RxLookup, RXDBCtrl, ToolEdit, CurrEdit, ExtCtrls, RzTabs, dbXPress, ExtDlgs,
  UCadProduto_Consumo, RzPanel, NxCollection, DBVGrids, DBGrids, UDMCopiarProduto, SqlExpr, DBAdvGrid, USenha,
  AdvDBLookupComboBox, ComCtrls, RzChkLst, RzLstBox, Menus, Mask, Variants, UConsEstoque_Mov, NxEdit, ComObj,
  cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxSkinsCore, dxSkinscxPCPainter;

type
  TfrmCadProduto = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Panel1: TPanel;
    StaticText1: TStaticText;
    pnlCons_Produto: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtReferencia: TEdit;
    ceID: TCurrencyEdit;
    RzPageControl2: TRzPageControl;
    TabSheet1: TRzTabSheet;
    pnlCadastro: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    TS_Engenharia: TRzTabSheet;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label27: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label29: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    Label30: TLabel;
    rxdbGrupo: TRxDBLookupCombo;
    Label32: TLabel;
    rxdbMarca: TRxDBLookupCombo;
    Label33: TLabel;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Label34: TLabel;
    rxdbFornecedor: TRxDBLookupCombo;
    SpeedButton6: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label37: TLabel;
    edtCodBarra: TEdit;
    Label44: TLabel;
    btnInserir: TNxButton;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    btnConsultar: TNxButton;
    btnAlterar: TNxButton;
    btnCancelar: TNxButton;
    btnConfirmar: TNxButton;
    Label68: TLabel;
    ComboBox2: TComboBox;
    Label72: TLabel;
    Label73: TLabel;
    btnCopiarProduto: TNxButton;
    ckInativo: TCheckBox;
    btnImprimir: TNxButton;
    PopupMenu1: TPopupMenu;
    Normal1: TMenuItem;
    Conferncia1: TMenuItem;
    ProgressBar1: TProgressBar;
    StaticText2: TStaticText;
    Label28: TLabel;
    RxDBComboBox4: TRxDBComboBox;
    RzCheckList1: TRzCheckList;
    Label100: TLabel;
    DBEdit51: TDBEdit;
    SpeedButton3: TSpeedButton;
    ListBox1: TListBox;
    ProdutoAgrupadoRefPadro1: TMenuItem;
    TS_Foto: TRzTabSheet;
    DBEdit55: TDBEdit;
    BitBtn20: TBitBtn;
    Label106: TLabel;
    Image1: TImage;
    Label107: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    btnAlterar_Nome: TNxButton;
    Image2: TImage;
    Label113: TLabel;
    Edit9: TEdit;
    RxDBComboBox7: TRxDBComboBox;
    Label25: TLabel;
    pnl_Eng_Consumo: TPanel;
    pnlConsumo: TPanel;
    btnInserir_Consumo: TNxButton;
    btnAlterar_Consumo: TNxButton;
    btnExcluir_Consumo: TNxButton;
    btnRecalcular_Mat: TNxButton;
    ceVlr_Total_Mat: TCurrencyEdit;
    SMDBGrid3: TSMDBGrid;
    FichaTcnica1: TMenuItem;
    DBMemo2: TDBMemo;
    BitBtn6: TBitBtn;
    TS_Balanca: TRzTabSheet;
    pnlBalanca: TPanel;
    Label132: TLabel;
    Label133: TLabel;
    DBEdit66: TDBEdit;
    Label143: TLabel;
    RxDBComboBox8: TRxDBComboBox;
    RxDBComboBox9: TRxDBComboBox;
    GroupBox4: TGroupBox;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    GroupBox5: TGroupBox;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    GroupBox6: TGroupBox;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit84: TDBEdit;
    DBEdit85: TDBEdit;
    GroupBox7: TGroupBox;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    DBEdit86: TDBEdit;
    DBEdit87: TDBEdit;
    DBEdit88: TDBEdit;
    DBEdit89: TDBEdit;
    DBEdit90: TDBEdit;
    Label159: TLabel;
    DBEdit91: TDBEdit;
    ProdutoConsumoEstruturado1: TMenuItem;
    ProdutosSelecionados1: TMenuItem;
    Panel13: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label36: TLabel;
    DBEdit15: TDBEdit;
    Label181: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    btnAjustarPeso: TBitBtn;
    Exportaparabalana1: TMenuItem;
    ExportarProduto1: TMenuItem;
    AtualizarPreo1: TMenuItem;
    Shape1: TShape;
    Label248: TLabel;
    Label249: TLabel;
    ComboBox3: TComboBox;
    ListacomCdigodeBarras1: TMenuItem;
    btnAltRefEstruturada: TSpeedButton;
    lblEstrutura: TLabel;
    Excel1: TMenuItem;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    TS_Tributaveis: TRzTabSheet;
    pnlFiscal: TPanel;
    Label20: TLabel;
    Label23: TLabel;
    Label35: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label101: TLabel;
    SpeedButton11: TSpeedButton;
    Label112: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label161: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    Label243: TLabel;
    Label253: TLabel;
    Label257: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit10: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    RxDBLookupCombo13: TRxDBLookupCombo;
    RxDBLookupCombo17: TRxDBLookupCombo;
    DBEdit60: TDBEdit;
    RxDBLookupCombo20: TRxDBLookupCombo;
    DBCheckBox15: TDBCheckBox;
    DBEdit100: TDBEdit;
    DBEdit101: TDBEdit;
    btnAjudaCod_Barra: TNxButton;
    RxDBLookupCombo22: TRxDBLookupCombo;
    RxDBLookupCombo25: TRxDBLookupCombo;
    DBEdit162: TDBEdit;
    dbckbCalcular_ST: TDBCheckBox;
    NxButton2: TNxButton;
    DBEdit163: TDBEdit;
    TabSheet2: TRzTabSheet;
    pnlCadastro_Forn: TPanel;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    SMDBGrid2: TSMDBGrid;
    TS_OBS: TRzTabSheet;
    DBMemo1: TDBMemo;
    Panel3: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label21: TLabel;
    Label13: TLabel;
    RxDBComboBox5: TRxDBComboBox;
    RxDBComboBox1: TRxDBComboBox;
    Label92: TLabel;
    DBEdit44: TDBEdit;
    Label240: TLabel;
    DBEdit156: TDBEdit;
    Label242: TLabel;
    Label26: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label131: TLabel;
    DBDateEdit4: TDBDateEdit;
    gbxVendedor: TRzGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    lblPrecoCusto: TLabel;
    DBEdit3: TDBEdit;
    lblCustoTotal: TLabel;
    DBEdit57: TDBEdit;
    lblMargem: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label160: TLabel;
    DBEdit92: TDBEdit;
    Label11: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label121: TLabel;
    edtCod_EnqIPI: TEdit;
    Label122: TLabel;
    UCControls1: TUCControls;
    pnlAdicional: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1clNome_Produto: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel6: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReferenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ceIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnExcluir_ConsumoClick(Sender: TObject);
    procedure btnInserir_ConsumoClick(Sender: TObject);
    procedure btnAlterar_ConsumoClick(Sender: TObject);
    procedure RxDBComboBox7Change(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure RzPageControl1Change(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo7Enter(Sender: TObject);
    procedure RxDBLookupCombo8Enter(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure edtCodBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzPageControl2Change(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnRecalcular_MatClick(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure btnCopiarProdutoClick(Sender: TObject);
    procedure SMDBGrid3DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo5CloseUp(Sender: TObject);
    procedure RxDBLookupCombo5DropDown(Sender: TObject);
    procedure rxdbGrupoDropDown(Sender: TObject);
    procedure Normal1Click(Sender: TObject);
    procedure Conferncia1Click(Sender: TObject);
    procedure RxDBLookupCombo5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxdbGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure rxdbGrupoExit(Sender: TObject);
    procedure RxDBComboBox7Exit(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1Exit(Sender: TObject);
    procedure DBEdit51Exit(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ProdutoAgrupadoRefPadro1Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure btnAlterar_NomeClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit7Enter(Sender: TObject);
    procedure RxDBComboBox7Enter(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure SMDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure edtCod_EnqIPIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FichaTcnica1Click(Sender: TObject);
    procedure DBEdit60KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit60Exit(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit57Exit(Sender: TObject);
    procedure DBCheckBox13Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure ProdutoConsumoEstruturado1Click(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure ProdutosSelecionados1Click(Sender: TObject);
    procedure SMDBGrid1ChangeSelection(Sender: TObject);
    procedure DBEdit100Exit(Sender: TObject);
    procedure btnAjudaCod_BarraClick(Sender: TObject);
    procedure btnAjustarPesoClick(Sender: TObject);
    procedure AtualizarPreo1Click(Sender: TObject);
    procedure ExportarProduto1Click(Sender: TObject);
    procedure ListacomCdigodeBarras1Click(Sender: TObject);
    procedure btnAltRefEstruturadaClick(Sender: TObject);
    procedure RxDBLookupCombo5Change(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure DBEdit163Exit(Sender: TObject);
    procedure DBEdit163KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Excel1Click(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fDMCadProduto: TDMCadProduto;
    fDMCopiarProduto: TDMCopiarProduto;
    ffrmCadProduto_Consumo: TfrmCadProduto_Consumo;
    ffrmConsEstoque_Mov: TfrmConsEstoque_Mov;

    vReferencia_Ant: String;
    vTipo_Reg_Ant: String;
    vID_Grupo_Ant: Integer;
    vOrigem_Ant: String;
    vPreco_Venda_Ant: Real;
    vUser_Exclui: Boolean;
    vID_Principal: Integer;

    vPreco_Custo, vPreco_Custo_Total, vPerc_MargemLucro: Real;

    //*** 16/06/2016  usado para gravar a tabela Produto_Cad_Ant
    vNome_Cad_Ant, vReferencia_Cad_Ant: String;
    vAltera_Nome: Boolean;
    //*****************

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;

    procedure prc_Posiciona_Produto;
    procedure prc_Controle_Balanca;
    procedure prc_Limpar_Edit_Consulta;
    procedure prc_Habilita;

    procedure prc_Verificar_mGrupo(ID_Grupo: Integer);
    procedure prc_Gravar_mGrupo(ID, ID_Principal: Integer; Codigo, Nome: String);
    procedure prc_Gravar_mGrupo_Produto;

    procedure prc_Imprimir_Estruturado(Agrupado: Boolean = False);
    procedure prc_Mostrar_Foto;

    function fnc_Verificar_Tipo: Boolean;
    procedure prc_Abrir_EnqIPI(ID: Integer);

    procedure prc_Gravar_Produto_Cad_Ant;
    procedure prc_Ajustar_Produto_Ped;
    procedure prc_Imp_Produto(Selecionados: Boolean);

    procedure prc_Aplicar_Margem;
    procedure prc_Atualiza_Percentual;
    procedure prc_Gerar_Ref_Estruturada;
    procedure prc_Grava_Peso;
    function fnc_Duplicidade_Mat(ID_Prod: Integer): String;

    function fnc_Monta_Nome_Estrutura(ID: Integer): String;

    procedure prcExportaCadastroMGV5;
    procedure prcAtualizaPrecoMGV5;

    procedure prcScroll(DataSet: TDataSet);

    procedure prc_CriaExcel(vDados: TDataSource);

    procedure prc_Abrir_Produto_Adicional(ID :Integer);

  public
    { Public declarations }
    vID_Produto_Local: Integer;
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

uses rsDBUtils, uUtilPadrao, URelProduto, URelProduto_Grupo, USel_Grupo, DmdDatabase,
  USel_EnqIPI, USel_CodCest, VarUtils, USel_Produto,
  UAltProd, uConsProduto_Compras, USel_CBenef, UCadProduto_ST, uMenu1;

{$R *.dfm}

procedure TfrmCadProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vID_Produto_Local := 0;
  SMDBGrid1.ClearFilter;
  try
    fDMCadProduto.qParametros_Geral.Close;
    fDMCadProduto.qParametros_Geral.Open;
    prc_Grava_Grid(SMDBGrid1, Name, fDMCadProduto.qParametros_GeralENDGRIDS.AsString);
  finally
    Action := Cafree;
  end;
end;

procedure TfrmCadProduto.btnExcluirClick(Sender: TObject);
var
  vExcluir: Boolean;
  vCont: Integer;
begin
  if not(fDMCadProduto.cdsProduto_Consulta.Active) or (fDMCadProduto.cdsProduto_Consulta.IsEmpty) or
        (fDMCadProduto.cdsProduto_ConsultaID.AsInteger <= 0) then
    exit;

  if (trim(fDMCadProduto.qParametros_ProdEXCLUI_PROD_SEL.AsString) <> 'S') and (SMDBGrid1.SelectedRows.Count > 1) then
  begin
    MessageDlg('*** Existe mais de um produto selecionado para a exclusão, favor verificar!', mtError, [mbOk], 0);
    exit;
  end;
  vExcluir := False;

  if (SMDBGrid1.SelectedRows.Count > 1) then
    MessageDlg('*** Existe mais de um produto selecionado para a exclusão!', mtWarning, [mbOk], 0)
  else
  if (SMDBGrid1.SelectedRows.Count <= 0) then
  begin
    MessageDlg('*** Não existe produto selecionado para a exclusão!', mtInformation, [mbOk], 0);
    exit;
  end;

  if (fDMCadProduto.qParametros_ProdEXCLUI_PROD_SEL.AsString = 'S') then
  begin
    if (SMDBGrid1.SelectedRows.Count > 1) then
      if MessageDlg('Deseja excluir os produtos selecionados?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        vExcluir := True;
    if not(vExcluir) and (SMDBGrid1.SelectedRows.Count = 1) then
      if MessageDlg('Deseja excluir o produtos selecionado?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        vExcluir := True;
  end
  else
  if (fDMCadProduto.qParametros_ProdEXCLUI_PROD_SEL.AsString <> 'S') and (SMDBGrid1.SelectedRows.Count = 1) then
  begin
    if MessageDlg('Deseja excluir o produtos selecionado?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      vExcluir := True;
  end;
  if not vExcluir then
    exit;

  vCont := SMDBGrid1.SelectedRows.Count;
  fDMCadProduto.cdsProduto_Consulta.First;
  while not fDMCadProduto.cdsProduto_Consulta.Eof do
  begin
    if SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      vCont := vCont - 1;
      prc_Posiciona_Produto;
      if not fDMCadProduto.cdsProduto.IsEmpty then
        prc_Excluir_Registro;
    end;
    if vCont <= 0 then
      fDMCadProduto.cdsProduto_Consulta.Last;
    fDMCadProduto.cdsProduto_Consulta.Next;
  end;
  btnExcluir.Enabled := False;
  btnConsultarClick(Sender);
end;

procedure TfrmCadProduto.prc_Excluir_Registro;
var
  vCodAux: Integer;
begin
  vCodAux := fDMCadProduto.cdsProdutoID.AsInteger;
  try
    fDMCadProduto.prc_Excluir;
  except
    on e: Exception do
    begin
      prc_Consultar;
      if vCodAux > 0 then
         fDMCadProduto.cdsProduto.Locate('ID',vCodAux,([Locaseinsensitive]));
      raise;
    end
  end;
end;

procedure TfrmCadProduto.prc_Gravar_Registro;
var
  vIDAux: Integer;
  sds: TSQLDataSet;
  sds2: TSQLDataSet;
  ID: TTransactionDesc;
  vGerar_Ref: Boolean;
  vAux: Integer;
  vID_SemiAux: Integer;
  vMaterial: String;
  Flag: Boolean;
begin
  if fDMCadProduto.qParametros_LoteLOTE_CALCADO_NOVO.AsString = 'S' then
    if (trim(fDMCadProduto.cdsProdutoNOME_MODELO.AsString) <> '') and (fDMCadProduto.cdsProdutoTIPO_REG.AsString <> 'P') then
      fDMCadProduto.cdsProdutoNOME_MODELO.Clear;

  vIDAux := fDMCadProduto.cdsProdutoID.AsInteger;
  if trim(fDMCadProduto.cdsProdutoREFERENCIA.AsString) = '' then
    fDMCadProduto.cdsProdutoREFERENCIA.AsString := fDMCadProduto.cdsProdutoID.AsString;

  if fDMCadProduto.fnc_Possui_Erro then
  begin
    MessageDlg(fDMCadProduto.vMsgErro, mtError, [mbOk], 0);
    exit;
  end;
  
  sds  := TSQLDataSet.Create(nil);
  if fDMCadProduto.cdsProdutoREFERENCIA_SEQ.AsInteger > 0 then
    sds2 := TSQLDataSet.Create(nil);

  ID.TransactionID  := 3;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    try
      sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      sds.CommandText   := ' UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('PRODUTO');
      Flag := False;
      while not Flag do
      begin
        try
          sds.Close;
          sds.ExecSQL;
          Flag := True;
        except
          on E: Exception do
          begin
            Flag := False;
          end;
        end;
      end;
    except
      raise
    end;

    vGerar_Ref := False;
    if trim(fDMCadProduto.cdsProdutoREFERENCIA.AsString) = '' then
      vGerar_Ref := True
    else
    if fDMCadProduto.cdsProdutoREFERENCIA_SEQ.AsInteger > 0 then
    begin
      sds2.SQLConnection := dmDatabase.scoDados;
      sds2.Close;
      sds2.NoMetadata    := True;
      sds2.GetMetadata   := False;
      sds2.CommandText   := 'SELECT ID FROM PRODUTO '
                          + ' WHERE TIPO_REG = ' + QuotedStr(fDMCadProduto.cdsProdutoTIPO_REG.AsString)
                          + '   AND REFERENCIA_SEQ = ' + IntToStr(fDMCadProduto.cdsProdutoREFERENCIA_SEQ.AsInteger);
      sds2.Open;
      if (sds2.FieldByName('ID').AsInteger > 0) and (sds2.FieldByName('ID').AsInteger <> fDMCadProduto.cdsProdutoID.AsInteger) then
        vGerar_Ref := True;
    end;

    if vGerar_Ref then
    begin
      vAux := fDMCadProduto.fnc_Referencia_Proxima_Seq(fDMCadProduto.cdsProdutoTIPO_REG.AsString);
      fDMCadProduto.cdsProdutoREFERENCIA_SEQ.AsInteger := vAux;
      fDMCadProduto.cdsProdutoREFERENCIA.AsString      := fDMCadProduto.cdsProdutoTIPO_REG.AsString +
                                                          FormatFloat('000000',fDMCadProduto.cdsProdutoREFERENCIA_SEQ.AsInteger);
    end;

    fDMCadProduto.prc_Gravar;

    if (fDMCadProduto.cdsProdutoUSA_NA_BALANCA.AsString = 'S') and (fDMCadProduto.cdsProduto_Balanca.State in [dsEdit,dsInsert]) then
    begin
      fDMCadProduto.cdsProduto_Balanca.Post;
      fDMCadProduto.cdsProduto_Balanca.ApplyUpdates(0);
    end;

    if (not(fDMCadProduto.cdsProduto.State in [dsEdit,dsInsert])) and (fDMCadProduto.cdsProduto_Adicional.Active) then
    begin
      if fDMCadProduto.cdsProduto_Adicional.State in [dsEdit,dsInsert] then
        fDMCadProduto.cdsProduto_Adicional.Post;
      fDMCadProduto.cdsProduto_Adicional.ApplyUpdates(0);
    end;

    //16/06/2016
    if (vAltera_Nome) and ((trim(vNome_Cad_Ant) <> '') or (trim(vReferencia_Cad_Ant) <> '')) then
    begin
      if (vNome_Cad_Ant <> fDMCadProduto.cdsProdutoNOME.AsString) or (vReferencia_Cad_Ant <> fDMCadProduto.cdsProdutoREFERENCIA.AsString) then
      begin
        fDMCadProduto.prc_Abrir_Produto_Cad_Ant(fDMCadProduto.cdsProdutoID.AsInteger);
        prc_Gravar_Produto_Cad_Ant;
        prc_Ajustar_Produto_Ped;
      end;
    end;
    //****************

    vCodProduto_Pos := 0;
    vReferencia_Pos := '';

    dmDatabase.scoDados.Commit(ID);

    if fDMCadProduto.cdsProduto_Forn.RecordCount < 1 then
    begin
      vCodProduto_Pos := fDMCadProduto.cdsProdutoID.AsInteger;
      vReferencia_Pos := fDMCadProduto.cdsProdutoReferencia.AsString;
    end;
    prc_Habilita;
    if (vIDAux > 0) then
    begin
      if fDMCadProduto.cdsProduto_Consulta.IsEmpty then
        ceID.AsInteger := vIDAux;
      prc_Consultar;
      fDMCadProduto.cdsProduto_Consulta.Locate('ID',vIDAux,([Locaseinsensitive]));
      ceID.Clear;
    end;
    RzPageControl2.ActivePage := TabSheet1;
    RzPageControl1.ActivePage := TS_Consulta;

  except
    on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar a Produto: ' + #13 + e.Message);
      end;
  end;
end;

procedure TfrmCadProduto.prc_Inserir_Registro;
begin
  fDMCadProduto.prc_Inserir;

  if fDMCadProduto.cdsProduto.State in [dsBrowse] then
    exit;

  vNome_Cad_Ant       := '';
  vReferencia_Cad_Ant := '';
  vAltera_Nome        := False;

  RzPageControl1.ActivePage := TS_Cadastro;
  DBEdit2.ReadOnly := False;
  DBEdit7.ReadOnly := False;
  btnAlterar_Nome.Enabled := False;

  prc_Habilita;
  RxDBComboBox7.Enabled := True;

  RxDBComboBox7.SetFocus;

  vPreco_Custo       := 0;
  vPreco_Custo_Total := 0;
  vPerc_MargemLucro  := 0;
  RxDBComboBox7Change(nil);

  prc_Abrir_Produto_Adicional(0);
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
var
  i: Integer;
  vTipo_Consulta_Produto_Padrao: String;
begin
  fDMCadProduto := TDMCadProduto.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadProduto);

  fDMCadProduto.qParametros_Ped.Open;
  //prc_le_Grid(SMDBGrid1, Name, fDMCadProduto.qParametros_GeralENDGRIDS.AsString);

  DBEdit3.Visible  := (lblPrecoCusto.Enabled);
  DBEdit57.Visible := (lblPrecoCusto.Enabled);
  DBEdit11.Visible := (lblPrecoCusto.Enabled);
  lblCustoTotal.Enabled := (lblPrecoCusto.Enabled);
  lblMargem.Enabled := (lblPrecoCusto.Enabled);

  TS_Balanca.TabVisible   := False;

  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (fDMCadProduto.qParametrosUSA_COD_BARRAS.AsString <> 'S') and (SMDBGrid1.Columns[i].FieldName = 'COD_BARRA') then
      SMDBGrid1.Columns[i].Visible := False
    else
    if (SMDBGrid1.Columns[i].FieldName = 'PRECO_CUSTO') then
      SMDBGrid1.Columns[i].Visible := lblPrecoCusto.Enabled
    else
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_FORNECEDOR') then
      SMDBGrid1.Columns[i].Visible := (fDMCadProduto.qParametrosUSA_PRODUTO_FORNECEDOR.AsString <> 'N')
    else
    if (SMDBGrid1.Columns[i].FieldName = 'PRECO_CUSTO_TOTAL') then
      SMDBGrid1.Columns[i].Visible := lblPrecoCusto.Enabled
    else
    if (SMDBGrid1.Columns[i].FieldName = 'SPED_TIPO_ITEM') then
      SMDBGrid1.Columns[i].Visible := (fDMCadProduto.qParametrosUSA_SPED.AsString = 'S')
    else
    if (SMDBGrid1.Columns[i].FieldName = 'OBS') then
      SMDBGrid1.Columns[i].Visible := (fDMCadProduto.qParametros_ProdMOSTRAR_OBS_CONSULTA.AsString = 'S');
  end;
  DBMemo2.Visible     := (fDMCadProduto.qParametros_ProdMOSTRAR_OBS_CONSULTA.AsString = 'S');
  Label37.Visible     := ((fDMCadProduto.qParametrosUSA_COD_BARRAS.AsString = 'S') and (fDMCadProduto.qParametrosUSA_COD_BARRAS_PROPRIO.AsString <> 'S'));
  edtCodBarra.Visible := ((fDMCadProduto.qParametrosUSA_COD_BARRAS.AsString = 'S') and (fDMCadProduto.qParametrosUSA_COD_BARRAS_PROPRIO.AsString <> 'S'));

  Label36.Visible  := ((fDMCadProduto.qParametrosUSA_COD_BARRAS.AsString = 'S') and (fDMCadProduto.qParametrosUSA_COD_BARRAS_PROPRIO.AsString <> 'S'));
  DBEdit15.Visible := ((fDMCadProduto.qParametrosUSA_COD_BARRAS.AsString = 'S') and (fDMCadProduto.qParametrosUSA_COD_BARRAS_PROPRIO.AsString <> 'S'));
  Panel16.Visible  := ((fDMCadProduto.qParametrosUSA_COD_BARRAS.AsString = 'S') and (fDMCadProduto.qParametrosUSA_COD_BARRAS_PROPRIO.AsString <> 'S'));

  Label28.Visible       := (fDMCadProduto.qParametrosUSA_SPED.AsString = 'S');
  RxDBComboBox4.Visible := (fDMCadProduto.qParametrosUSA_SPED.AsString = 'S');
  Label249.Visible      := (fDMCadProduto.qParametrosUSA_SPED.AsString = 'S');
  ComboBox3.Visible     := (fDMCadProduto.qParametrosUSA_SPED.AsString = 'S');

  vTipo_Consulta_Produto_Padrao := trim(fDMCadProduto.qParametros_UsuarioTIPO_CONSULTA_PRODUTO_PADRAO.AsString);
  if vTipo_Consulta_Produto_Padrao = '' then
    vTipo_Consulta_Produto_Padrao := trim(fDMCadProduto.qParametrosTIPO_CONSULTA_PRODUTO_PADRAO.AsString);

  if (trim(vTipo_Consulta_Produto_Padrao) = '') then
    ComboBox2.ItemIndex := 6
  else
  if vTipo_Consulta_Produto_Padrao = 'P' then
    ComboBox2.ItemIndex := 0
  else
  if vTipo_Consulta_Produto_Padrao = 'M' then
    ComboBox2.ItemIndex := 1
  else
  if vTipo_Consulta_Produto_Padrao = 'N' then
    ComboBox2.ItemIndex := 2
  else
  if vTipo_Consulta_Produto_Padrao = 'C' then
    ComboBox2.ItemIndex := 3
  else
  if vTipo_Consulta_Produto_Padrao = 'I' then
    ComboBox2.ItemIndex := 4
  else
  if vTipo_Consulta_Produto_Padrao = 'S' then
    ComboBox2.ItemIndex := 5;

  Label29.Visible           := (fDMCadProduto.qParametrosMOSTRAR_MARCAR_PROD.AsString = 'S');
  RxDBLookupCombo7.Visible  := (fDMCadProduto.qParametrosMOSTRAR_MARCAR_PROD.AsString = 'S');
  SpeedButton4.Visible      := (fDMCadProduto.qParametrosMOSTRAR_MARCAR_PROD.AsString = 'S');

  for i := 1 to SMDBGrid3.ColCount - 2 do
  begin
    if (fDMCadProduto.qParametrosUSA_POSICAO_CONSUMO.AsString <> 'S') and (SMDBGrid3.Columns[i].FieldName = 'NOME_POSICAO') then
      SMDBGrid3.Columns[i].Visible := False;
    if (fDMCadProduto.qParametrosUSA_SETOR_CONSUMO.AsString <> 'S') and (SMDBGrid3.Columns[i].FieldName = 'NOME_SETOR') then
      SMDBGrid3.Columns[i].Visible := False;
    if (SMDBGrid3.Columns[i].FieldName = 'PRECO_CUSTO') then
      SMDBGrid3.Columns[i].Visible := (fDMCadProduto.qParametrosGRAVAR_CONSUMO_NOTA.AsString <> 'S');
  end;
  
  if vID_Produto_Local > 0 then
  begin
    ceID.AsInteger := vID_Produto_Local;
    prc_Consultar;
  end;
  Label159.Visible          := (fDMCadProduto.qParametros_ProdGRAVA_CONSUMO_PRVENDA.AsString = 'S');
  DBEdit91.Visible          := (fDMCadProduto.qParametros_ProdGRAVA_CONSUMO_PRVENDA.AsString = 'S');
  Label160.Visible          := (fDMCadProduto.qParametros_ProdUSA_DESC_MAXIMO.AsString = 'S');
  DBEdit92.Visible          := (fDMCadProduto.qParametros_ProdUSA_DESC_MAXIMO.AsString = 'S');

  StaticText1.Caption := 'Duplo clique para alterar  |  F3 Consultar Cadastro Anterior  |  F6 Histórico  |  F8 Compras';

  vUser_Exclui       := btnExcluir.Enabled;
  btnExcluir.Enabled := False;

  Shape1.Visible    := ((fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.AsString <> 'N') and not(fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.IsNull));
  Label248.Visible  := ((fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.AsString <> 'N') and not(fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.IsNull));
  if ((fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.AsString <> 'N') and not(fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.IsNull)) then
  begin
    if fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.AsString = 'P' then
      Label248.Caption := 'Produto'
    else
    if fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.AsString = 'M' then
      Label248.Caption := 'Material'
    else
    if fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.AsString = 'C' then
      Label248.Caption := 'Material de Consumo';
    Label248.Caption := Label248.Caption + ' Sem Preço Custo ';
  end;

  if fDMCadProduto.qFilial_STRetCONTADOR.AsInteger > 0 then
    StaticText1.Caption := StaticText1.Caption + '  | F7 ST Entrada ';

  btnAltRefEstruturada.Visible := (fDMCadProduto.qParametros_ProdALT_REF_ESTRUTURADA.AsString = 'S');

  dbckbCalcular_ST.Visible := (fDMCadProduto.qParametros_ProdCONTROLAR_PROD_ST.AsString = 'S');

  prc_le_Grid(SMDBGrid1, Name, fDMCadProduto.qParametros_GeralENDGRIDS.AsString);
end;

procedure TfrmCadProduto.prc_Consultar;
var
  i: integer;
begin
  SMDBGrid1.DisableScroll;

  {if fDMCadProduto.qParametros_LoteLOTE_CALCADO_NOVO.AsString = 'S' then
  begin
    for i := 1 to SMDBGrid1.ColCount - 2 do
    begin
      if (SMDBGrid1.Columns[i].FieldName = 'NOME_FORNECEDOR') then
        SMDBGrid1.Columns[i].Visible := (ComboBox2.ItemIndex = 1);
    end;
  end;}

  fDMCadProduto.cdsProduto_Consulta.Close;
  fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.ctConsulta;
  if ceID.AsInteger > 0 then
    fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText
                                    + ' WHERE PRO.ID =  ' + ceID.Text
  else
  if edtCodBarra.Text <> '' then
    fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText
                                    + ' WHERE PRO.COD_BARRA = ' + QuotedStr(edtCodBarra.Text)
  else
  begin
    fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText
                                    + ' WHERE 0 = 0 ';
    if Trim(edtNome.Text) <> '' then
      fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText
                                      + ' AND PRO.NOME LIKE ' + QuotedStr('%'+edtNome.Text+'%');
    if Trim(edtReferencia.Text) <> '' then
      fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText
                                      + ' AND PRO.REFERENCIA LIKE ' + QuotedStr('%'+edtReferencia.Text+'%');
    if rxdbGrupo.Text <> '' then
      fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText
                                      + ' AND PRO.ID_GRUPO = ' + IntToStr(rxdbGrupo.KeyValue);
    if rxdbMarca.Text <> '' then
      fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText
                                      + ' AND PRO.ID_MARCA = ' + IntToStr(rxdbMarca.KeyValue);
    if rxdbFornecedor.Text <> '' then
      fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText
                                      + ' AND PRO.ID_FORNECEDOR = ' + IntToStr(rxdbFornecedor.KeyValue);
    case ComboBox2.ItemIndex of
      0: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND TIPO_REG = ' + QuotedStr('P');
      1: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND TIPO_REG = ' + QuotedStr('M');
      2: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND TIPO_REG = ' + QuotedStr('N');
      3: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND TIPO_REG = ' + QuotedStr('C');
      5: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND TIPO_REG = ' + QuotedStr('S');
    end;

    case ComboBox3.ItemIndex of
      0: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('00');
      1: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('01');
      2: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('02');
      3: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('03');
      4: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('04');
      5: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('05');
      6: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('06');
      7: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('07');
      8: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('08');
      9: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('09');
     10: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('10');
     11: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND SPED_TIPO_ITEM = ' + QuotedStr('99');
     13: fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND COALESCE(SPED_TIPO_ITEM,' + QuotedStr('') + ') = ' + QuotedStr('');
    end;

    if Trim(Edit9.Text) <> '' then
      fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText
                                      + ' AND PRO.LOCALIZACAO LIKE ' + QuotedStr('%'+Edit9.Text+'%');

    if not ckInativo.Checked then
      fDMCadProduto.sdsProduto_Consulta.CommandText := fDMCadProduto.sdsProduto_Consulta.CommandText + ' AND PRO.INATIVO = ' + QuotedStr('N');
  end;
  fDMCadProduto.cdsProduto_Consulta.Open;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmCadProduto.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmCadProduto.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadProduto.cdsProduto.State in [dsBrowse]) or not(fDMCadProduto.cdsProduto.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadProduto.cdsProduto.CancelUpdates;
  if (fDMCadProduto.qParametrosEMPRESA_VEICULO.AsString = 'S') and (fDMCadProduto.cdsProduto_Veiculo.State in [dsEdit,dsInsert]) then
    fDMCadProduto.cdsProduto_Veiculo.CancelUpdates;
  if (fDMCadProduto.cdsProdutoUSA_NA_BALANCA.AsString = 'S') and (fDMCadProduto.cdsProduto_Balanca.State in [dsEdit,dsInsert]) then
    fDMCadProduto.cdsProduto_Balanca.CancelUpdates;
  prc_Habilita;
  RzPageControl1.ActivePage := TS_Consulta;
  RzPageControl2.ActivePage := TabSheet1;
end;

procedure TfrmCadProduto.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  if (fDMCadProduto.cdsProduto.IsEmpty) or not(fDMCadProduto.cdsProduto.Active) or (fDMCadProduto.cdsProdutoID.AsInteger < 1) then
    exit;

  fDMCadProduto.cdsProduto.Edit;

  vPreco_Custo       := StrToFloat(FormatFloat('0.00000',fDMCadProduto.cdsProdutoPRECO_CUSTO.AsFloat));
  vPreco_Custo_Total := StrToFloat(FormatFloat('0.00000',fDMCadProduto.cdsProdutoPRECO_CUSTO_TOTAL.AsFloat));
  vPerc_MargemLucro  := StrToFloat(FormatFloat('0.00',fDMCadProduto.cdsProdutoPERC_MARGEMLUCRO.AsFloat));

  vNome_Cad_Ant       := fDMCadProduto.cdsProdutoNOME.AsString;
  vReferencia_Cad_Ant := fDMCadProduto.cdsProdutoREFERENCIA.AsString;
  vAltera_Nome        := False;

  DBEdit2.ReadOnly        := True;
  DBEdit7.ReadOnly        := True;
  btnAlterar_Nome.Enabled := True;

  RxDBComboBox7.Enabled := True;

  prc_Habilita;

  RzPageControl2Change(Sender);
end;

procedure TfrmCadProduto.btnConfirmarClick(Sender: TObject);
var
  vIDAux: Integer;
begin
  vIDAux := fDMCadProduto.cdsProdutoID.AsInteger;
  prc_Gravar_Registro;
end;

procedure TfrmCadProduto.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadProduto);
end;

procedure TfrmCadProduto.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadProduto.DBEdit11Exit(Sender: TObject);
begin
  prc_Aplicar_Margem;
end;

procedure TfrmCadProduto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fDMCadProduto.cdsProduto);
end;

procedure TfrmCadProduto.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadProduto.edtReferenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadProduto.ceIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadProduto.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadProduto.cdsProduto_Forn.Delete;
end;

procedure TfrmCadProduto.btnExcluir_ConsumoClick(Sender: TObject);
var
  vItemAux: Integer;
  vFlag: Boolean;
begin
  if fDMCadProduto.cdsProduto_Consumo.IsEmpty then
    exit;

  if uAltProd.fnc_Custo(fDMCadProduto.cdsProdutoID.AsInteger,fDMCadProduto) then
    exit;

  if (fDMCadProduto.qParametros_LoteLOTE_CALCADO_NOVO.AsString = 'S') then
  begin
    if (fDMCadProduto.cdsProduto_Comb.RecordCount > 0) then
    begin
      vFlag := False;
      fDMCadProduto.cdsProduto_Comb.First;
      while not fDMCadProduto.cdsProduto_Comb.Eof do
      begin
        if fDMCadProduto.cdsProduto_Comb_Mat.Locate('ITEM_MAT',fDMCadProduto.cdsProduto_ConsumoITEM.AsInteger,([Locaseinsensitive])) then
        begin
          vFlag := True;
          fDMCadProduto.cdsProduto_Comb.Last;
        end;
        fDMCadProduto.cdsProduto_Comb.Next;
      end;
      if vFlag then
      begin
        MessageDlg('*** Esse Material esta na Combinação ' + fDMCadProduto.cdsProduto_CombNOME.AsString, mtError, [mbOk], 0);
        exit;
      end;
    end;
  end;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadProduto.cdsProduto_Consumo_Tam.First;
  while not fDMCadProduto.cdsProduto_Consumo_Tam.Eof do
    fDMCadProduto.cdsProduto_Consumo_Tam.Delete;

  fDMCadProduto.cdsProduto_Consumo_Proc.First;
  while not fDMCadProduto.cdsProduto_Consumo_Proc.Eof do
    fDMCadProduto.cdsProduto_Consumo_Proc.Delete;

  fDMCadProduto.cdsProduto_Consumo.Delete;

  vItemAux := fDMCadProduto.cdsProduto_ConsumoITEM.AsInteger;

  SMDBGrid3.DisableScroll;
  ceVlr_Total_Mat.Value := fDMCadProduto.fnc_Calcular_Mat;
  SMDBGrid3.EnableScroll;

  fDMCadProduto.cdsProduto_Consumo.Locate('ITEM',vItemAux,([Locaseinsensitive]));
end;

procedure TfrmCadProduto.btnInserir_ConsumoClick(Sender: TObject);
begin
  if (fDMCadProduto.cdsProdutoID.AsInteger < 1) or not(fDMCadProduto.cdsProduto.Active) then
    exit;

  if uAltProd.fnc_Custo(fDMCadProduto.cdsProdutoID.AsInteger,fDMCadProduto) then
    exit;

  fDMCadProduto.cdsProduto_Consumo.IndexFieldNames := 'ID;ITEM';

  fDMCadProduto.prc_Inserir_ProdConsumo;

  ffrmCadProduto_Consumo := TfrmCadProduto_Consumo.Create(self);
  ffrmCadProduto_Consumo.fDMCadProduto := fDMCadProduto;
  ffrmCadProduto_Consumo.ShowModal;

  FreeAndNil(ffrmCadProduto_Consumo);

  ceVlr_Total_Mat.Value := fDMCadProduto.fnc_Calcular_Mat;
  fDMCadProduto.cdsProduto_Consumo.IndexFieldNames := 'ID;ID_SETOR;NOME_POSICAO';
end;

procedure TfrmCadProduto.btnAlterar_ConsumoClick(Sender: TObject);
var
  vItemAux: Integer;
begin
  if (fDMCadProduto.cdsProduto_ConsumoITEM.AsInteger < 1) or not(fDMCadProduto.cdsProduto_Consumo.Active) or
     (fDMCadProduto.cdsProduto_Consumo.IsEmpty) then
    exit;
  if uAltProd.fnc_Custo(fDMCadProduto.cdsProdutoID.AsInteger,fDMCadProduto) then
    exit;

  vItemAux := fDMCadProduto.cdsProduto_ConsumoITEM.AsInteger;

  fDMCadProduto.cdsProduto_Consumo.Edit;

  ffrmCadProduto_Consumo := TfrmCadProduto_Consumo.Create(self);
  ffrmCadProduto_Consumo.fDMCadProduto := fDMCadProduto;
  ffrmCadProduto_Consumo.ShowModal;

  FreeAndNil(ffrmCadProduto_Consumo);
  ceVlr_Total_Mat.Value := fDMCadProduto.fnc_Calcular_Mat;

  fDMCadProduto.cdsProduto_Consumo.Locate('ITEM',vItemAux,([Locaseinsensitive]));
end;

procedure TfrmCadProduto.RxDBComboBox7Change(Sender: TObject);
begin
  if fDMCadProduto.qParametrosUSA_CONSUMO.AsString = 'S' then
    TS_Engenharia.TabVisible := ((RxDBComboBox7.ItemIndex = 0) or (RxDBComboBox7.ItemIndex = 5));

  if (fDMCadProduto.qParametrosUSA_PRODUTO_LOCALIZACAO.AsString = 'N') or (RxDBComboBox7.ItemIndex = 2) or (RxDBComboBox7.ItemIndex = 4) then
  begin
    Label16.Visible  := False;
    DBEdit14.Visible := False;
  end
  else
  begin
    Label16.Visible  := (((fDMCadProduto.qParametrosUSA_PRODUTO_LOCALIZACAO.AsString = 'P') and ((RxDBComboBox7.ItemIndex = 0) or (RxDBComboBox7.ItemIndex = 5)))
                       or ((fDMCadProduto.qParametrosUSA_PRODUTO_LOCALIZACAO.AsString = 'M') and ((RxDBComboBox7.ItemIndex = 1) or (RxDBComboBox7.ItemIndex = 5)))
                       or ((fDMCadProduto.qParametrosUSA_PRODUTO_LOCALIZACAO.AsString = 'M') and (RxDBComboBox7.ItemIndex = 3))
                       or (fDMCadProduto.qParametrosUSA_PRODUTO_LOCALIZACAO.AsString = 'A'));
    DBEdit14.Visible := (((fDMCadProduto.qParametrosUSA_PRODUTO_LOCALIZACAO.AsString = 'P') and ((RxDBComboBox7.ItemIndex = 0) or (RxDBComboBox7.ItemIndex = 5)))
                       or ((fDMCadProduto.qParametrosUSA_PRODUTO_LOCALIZACAO.AsString = 'M') and ((RxDBComboBox7.ItemIndex = 1) or (RxDBComboBox7.ItemIndex = 5)))
                       or ((fDMCadProduto.qParametrosUSA_PRODUTO_LOCALIZACAO.AsString = 'M') and (RxDBComboBox7.ItemIndex = 3))
                       or (fDMCadProduto.qParametrosUSA_PRODUTO_LOCALIZACAO.AsString = 'A'));
  end;
  if (fDMCadProduto.qParametrosUSA_PRODUTO_FORNECEDOR.AsString = 'N') or (RxDBComboBox7.ItemIndex = 2) or (RxDBComboBox7.ItemIndex = 4) then
  begin
    Label33.Visible          := False;
    RxDBLookupCombo8.Visible := False;
  end
  else
  begin
    Label33.Visible  := (((fDMCadProduto.qParametrosUSA_PRODUTO_FORNECEDOR.AsString = 'P') and ((RxDBComboBox7.ItemIndex = 0) or (RxDBComboBox7.ItemIndex = 5)))
                       or ((fDMCadProduto.qParametrosUSA_PRODUTO_FORNECEDOR.AsString = 'M') and ((RxDBComboBox7.ItemIndex = 1) or (RxDBComboBox7.ItemIndex = 5)))
                       or ((fDMCadProduto.qParametrosUSA_PRODUTO_FORNECEDOR.AsString = 'M') and (RxDBComboBox7.ItemIndex = 3))
                       or (fDMCadProduto.qParametrosUSA_PRODUTO_FORNECEDOR.AsString = 'A'));
    RxDBLookupCombo8.Visible := (((fDMCadProduto.qParametrosUSA_PRODUTO_FORNECEDOR.AsString = 'P') and ((RxDBComboBox7.ItemIndex = 0) or (RxDBComboBox7.ItemIndex = 5)))
                             or ((fDMCadProduto.qParametrosUSA_PRODUTO_FORNECEDOR.AsString = 'M') and ((RxDBComboBox7.ItemIndex = 1) or (RxDBComboBox7.ItemIndex = 5)))
                             or ((fDMCadProduto.qParametrosUSA_PRODUTO_FORNECEDOR.AsString = 'M') and (RxDBComboBox7.ItemIndex = 3))
                             or (fDMCadProduto.qParametrosUSA_PRODUTO_FORNECEDOR.AsString = 'A'))
  end;
end;

procedure TfrmCadProduto.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadProduto.cdsProduto_Consulta.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I].Title = Column.Title) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmCadProduto.RzPageControl1Change(Sender: TObject);
var
  i: Byte;
begin
  if RzPageControl1.ActivePage = TS_Cadastro then
  begin
    if not(fDMCadProduto.cdsProduto_Consulta.Active) or (fDMCadProduto.cdsProduto_Consulta.IsEmpty) or
          (fDMCadProduto.cdsProduto_ConsultaID.AsInteger <= 0) then
    begin
      exit;
    end;

    if not (fDMCadProduto.cdsProduto.State in [dsedit,dsinsert]) then
    begin
      prc_Posiciona_Produto;
      if (fDMCadProduto.cdsProduto.Active) and not(fDMCadProduto.cdsProduto.IsEmpty) then
        Label73.Caption := FormatFloat('###,###,##0.####',fDMCadProduto.cdsProduto_consultaQTD_ESTOQUE.AsFloat);
    end
    else
      Label73.Caption := FormatFloat('###,###,##0.####',0);

    RzPageControl2.ActivePage := TabSheet1;
    DBEdit1Change(Sender);
    edtCod_EnqIPI.Clear;
    prc_Abrir_EnqIPI(fDMCadProduto.cdsProdutoID_ENQIPI.AsInteger);
    edtCod_EnqIPI.Text := fDMCadProduto.qEnqIPICODIGO.AsString;

    if fDMCadProduto.cdsProdutoID_GRUPO.AsInteger > 0 then
    begin
      fDMCadProduto.cdsGrupo.Locate('ID',fDMCadProduto.cdsProdutoID_GRUPO.AsInteger,([Locaseinsensitive]));
      lblEstrutura.Caption := fDMCadProduto.cdsGrupoNOME_SUPERIOR.AsString;
    end
    else
      lblEstrutura.Caption := '';
  end
  else
    fDMCadProduto.cdsProduto_Serie.Close;
  if not(fDMCadProduto.cdsProduto.State in [dsEdit, dsInsert]) then
  begin
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      if not(fDMCadProduto.cdsProduto_consulta.Active) or (fDMCadProduto.cdsProduto_consulta.IsEmpty) or
            (fDMCadProduto.cdsProduto_ConsultaID.AsInteger <= 0) then
        exit;
      TS_Balanca.TabVisible      := (fDMCadProduto.cdsProdutoUSA_NA_BALANCA.AsString = 'S');
      if btnRecalcular_Mat.Enabled then
        ceVlr_Total_Mat.Value := fDMCadProduto.fnc_Calcular_Mat;
      prc_Mostrar_Foto;

    end;
    //12/08/2019
    RxDBLookupCombo3Exit(Sender);
  end;
  if RzPageControl1.ActivePage = TS_Cadastro then
    TS_Engenharia.TabVisible := ((fDMCadProduto.qParametrosUSA_CONSUMO.AsString = 'S') and ((fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'P') or (fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'S')));

  RxDBComboBox7Change(Sender);
end;

procedure TfrmCadProduto.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadProduto.cdsProduto_ConsultaINATIVO.AsString = 'S' then
    AFont.Color := clRed
  else
  if ((fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.AsString <> 'N') and not(fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.IsNull))
    and (fDMCadProduto.cdsProduto_ConsultaCONT_POSSUIPRECO.AsInteger > 0) then
  begin
    if (fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.AsString = 'A') or (fDMCadProduto.qParametros_ProdINDICAR_PCUSTO.AsString = fDMCadProduto.cdsProduto_ConsultaTIPO_REG.AsString) then
    begin
      Background  := clYellow;
      AFont.Color := clBlack;
    end;
  end;
end;

procedure TfrmCadProduto.RxDBLookupCombo5Enter(Sender: TObject);
begin
  fDMCadProduto.cdsGrupo.IndexFieldNames := 'CODIGO';
  StaticText2.Visible := True;
  vID_Grupo_Ant       := fDMCadProduto.cdsProdutoID_GRUPO.AsInteger;
end;

procedure TfrmCadProduto.RxDBLookupCombo7Enter(Sender: TObject);
begin
  fDMCadProduto.cdsMarca.IndexFieldNames := 'NOME';
end;

procedure TfrmCadProduto.prc_Posiciona_Produto;
begin
  fDMCadProduto.prc_Localizar(fDMCadProduto.cdsProduto_ConsultaID.AsInteger);
  fDMCadProduto.cdsProduto_Forn.Close;
  fDMCadProduto.cdsProduto_Forn.Open;
  fDMCadProduto.cdsProduto_Consumo.Close;
  fDMCadProduto.cdsProduto_Consumo.Open;
  fDMCadProduto.cdsProduto_Consumo_Proc.Close;
  fDMCadProduto.cdsProduto_Consumo_Proc.Open;
  fDMCadProduto.cdsProduto_Consumo_Proc.First;
  prc_Abrir_Produto_Adicional(fDMCadProduto.cdsProduto_ConsultaID.AsInteger);
end;

procedure TfrmCadProduto.RxDBLookupCombo8Enter(Sender: TObject);
begin
  fDMCadProduto.cdsFornecedor.IndexFieldNames := 'NOME';
end;

procedure TfrmCadProduto.SpeedButton6Click(Sender: TObject);
begin
  fDMCadProduto.cdsGrupo.Close;
  fDMCadProduto.cdsGrupo.Open;
  fDMCadProduto.qParametros_Prod.Close;
  fDMCadProduto.qParametros_Prod.Open;
end;

procedure TfrmCadProduto.SpeedButton4Click(Sender: TObject);
begin
  fDMCadProduto.cdsMarca.Close;
  fDMCadProduto.cdsMarca.Open;
end;

procedure TfrmCadProduto.SpeedButton5Click(Sender: TObject);
begin
  fDMCadProduto.cdsUnidade.Close;
  fDMCadProduto.cdsUnidade.Open;
end;

procedure TfrmCadProduto.SpeedButton7Click(Sender: TObject);
begin
  fDMCadProduto.cdsNCM.Close;
  fDMCadProduto.cdsNCM.Open;
end;

procedure TfrmCadProduto.edtCodBarraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadProduto.RzPageControl2Change(Sender: TObject);
begin
  if (RzPageControl2.ActivePage = TS_Engenharia) and (fDMCadProduto.cdsProdutoID.AsInteger > 0) and (fDMCadProduto.qParametros_LoteTIPO_PROCESSO.AsString = 'L') then
    fDMCadProduto.cdsProduto_Consumo.IndexFieldNames := 'ID;ID_SETOR;NOME_POSICAO'
  else
  if (RzPageControl2.ActivePage = TS_Balanca) and (fDMCadProduto.cdsProdutoID.AsInteger > 0) then
    prc_Controle_Balanca;
end;

procedure TfrmCadProduto.btnPesquisarClick(Sender: TObject);
begin
  pnlCons_Produto.Visible := not(pnlCons_Produto.Visible);

  if pnlCons_Produto.Visible then
    edtNome.SetFocus
  else
    prc_Limpar_Edit_Consulta;
end;

procedure TfrmCadProduto.prc_Limpar_Edit_Consulta;
begin
  edtCodBarra.Clear;
  edtNome.Clear;
  edtReferencia.Clear;
  rxdbMarca.ClearValue;
  ceID.Clear;
  rxdbGrupo.ClearValue;
  rxdbFornecedor.ClearValue;
end;

procedure TfrmCadProduto.btnRecalcular_MatClick(Sender: TObject);
begin
  ceVlr_Total_Mat.Value := fDMCadProduto.fnc_Calcular_Mat;
end;

procedure TfrmCadProduto.DBCheckBox2Click(Sender: TObject);
begin
  Label72.Visible := ((DBCheckBox2.Checked));
  Label73.Visible := ((DBCheckBox2.Checked));
end;

procedure TfrmCadProduto.btnCopiarProdutoClick(Sender: TObject);
var
  x, x2: Integer;
  Form: TForm;
begin
  if not(fDMCadProduto.cdsProduto_Consulta.Active) or (fDMCadProduto.cdsProduto_Consulta.IsEmpty) then
    exit;

  if MessageDlg('Deseja copiar o produto selecionado?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);
   
  fDMCopiarProduto := TDMCopiarProduto.Create(Self);
  fDMCopiarProduto.prc_Localizar(fDMCadProduto.cdsProduto_ConsultaID.AsInteger);
  if fDMCopiarProduto.cdsProduto.IsEmpty then
  begin
    MessageDlg('Produto não encontrado!', mtError, [mbOk], 0);
    FreeAndNil(fDMCopiarProduto);
    FreeAndNil(Form);
    exit;
  end;

  try
    fDMCadProduto.prc_Inserir;
    if not(fDMCadProduto.cdsProduto.State in [dsEdit,dsInsert]) then
    begin
      FreeAndNil(Form);
      exit;
    end;

    for x := 0 to (fDMCopiarProduto.cdsProduto.FieldCount - 1) do
    begin
      if (fDMCopiarProduto.cdsProduto.Fields[x].FieldName <> 'ID') and (fDMCopiarProduto.cdsProduto.Fields[x].FieldName <> 'COD_BARRA') then
         fDMCadProduto.cdsProduto.FieldByName(fDMCopiarProduto.cdsProduto.Fields[x].FieldName).AsVariant := fDMCopiarProduto.cdsProduto.Fields[x].Value;
    end;

    fDMCopiarProduto.cdsProduto_Consumo.First;
    while not fDMCopiarProduto.cdsProduto_Consumo.Eof do
    begin
      fDMCadProduto.prc_Inserir_ProdConsumo;
      for x := 0 to (fDMCopiarProduto.cdsProduto_Consumo.FieldCount - 1) do
      begin
        if (fDMCopiarProduto.cdsProduto_Consumo.Fields[x].FieldName <> 'ID') then
          fDMCadProduto.cdsProduto_Consumo.FieldByName(fDMCopiarProduto.cdsProduto_Consumo.Fields[x].FieldName).AsVariant := fDMCopiarProduto.cdsProduto_Consumo.Fields[x].Value;
      end;
      fDMCadProduto.cdsProduto_Consumo.Post;

      fDMCopiarProduto.cdsProduto_Consumo_Tam.First;
      while not fDMCopiarProduto.cdsProduto_Consumo_Tam.Eof do
      begin
        fDMCadProduto.cdsProduto_Consumo_Tam.Insert;
        for x2 := 0 to (fDMCopiarProduto.cdsProduto_Consumo_Tam.FieldCount - 1) do
        begin
          if (fDMCopiarProduto.cdsProduto_Consumo_Tam.Fields[x2].FieldName <> 'ID') then
            fDMCadProduto.cdsProduto_Consumo_Tam.FieldByName(fDMCopiarProduto.cdsProduto_Consumo_Tam.Fields[x2].FieldName).AsVariant := fDMCopiarProduto.cdsProduto_Consumo_Tam.Fields[x2].Value;
        end;
        fDMCadProduto.cdsProduto_Consumo_Tam.Post;
        fDMCopiarProduto.cdsProduto_Consumo_Tam.Next;
      end;

      fDMCopiarProduto.cdsProduto_Consumo_Proc.First;
      while not fDMCopiarProduto.cdsProduto_Consumo_Proc.Eof do
      begin
        fDMCadProduto.cdsProduto_Consumo_Proc.Insert;
        for x2 := 0 to (fDMCopiarProduto.cdsProduto_Consumo_Proc.FieldCount - 1) do
        begin
          if (fDMCopiarProduto.cdsProduto_Consumo_Proc.Fields[x2].FieldName <> 'ID') then
            fDMCadProduto.cdsProduto_Consumo_Proc.FieldByName(fDMCopiarProduto.cdsProduto_Consumo_Proc.Fields[x2].FieldName).AsVariant := fDMCopiarProduto.cdsProduto_Consumo_Proc.Fields[x2].Value;
        end;
        fDMCadProduto.cdsProduto_Consumo_Proc.Post;
        fDMCopiarProduto.cdsProduto_Consumo_Proc.Next;
      end;

      fDMCopiarProduto.cdsProduto_Consumo.Next;
    end;

    fDMCopiarProduto.cdsProduto_Tam.First;
    while not fDMCopiarProduto.cdsProduto_Tam.Eof do
    begin
      fDMCadProduto.cdsProduto_Tam.Insert;
      for x := 0 to (fDMCopiarProduto.cdsProduto_Tam.FieldCount - 1) do
      begin
        if (fDMCopiarProduto.cdsProduto_Tam.Fields[x].FieldName <> 'ID') then
          fDMCadProduto.cdsProduto_Tam.FieldByName(fDMCopiarProduto.cdsProduto_Tam.Fields[x].FieldName).AsVariant := fDMCopiarProduto.cdsProduto_Tam.Fields[x].Value;
      end;
      fDMCadProduto.cdsProduto_Tam.Post;
      fDMCopiarProduto.cdsProduto_Tam.Next;
    end;

    //23/09/2019
    if fDMCadProduto.qParametros_ProdCOPIAR_COMB.AsString = 'S' then
    begin
      fDMCopiarProduto.cdsProduto_Comb.Close;
      fDMCopiarProduto.sdsProduto_Comb.ParamByName('ID').AsInteger := fDMCopiarProduto.cdsProdutoID.AsInteger;
      fDMCopiarProduto.cdsProduto_Comb.Open;
      fDMCopiarProduto.cdsProduto_Comb.First;
      while not fDMCopiarProduto.cdsProduto_Comb.Eof do
      begin
        fDMCadProduto.cdsProduto_Comb.Insert;
        fDMCadProduto.cdsProduto_CombID.AsInteger := fDMCadProduto.cdsProdutoID.AsInteger;
        for x := 0 to (fDMCopiarProduto.cdsProduto_Comb.FieldCount - 1) do
        begin
          if (fDMCopiarProduto.cdsProduto_Comb.Fields[x].FieldName <> 'ID') then
            fDMCadProduto.cdsProduto_Comb.FieldByName(fDMCopiarProduto.cdsProduto_Comb.Fields[x].FieldName).AsVariant := fDMCopiarProduto.cdsProduto_Comb.Fields[x].Value;
        end;
        fDMCadProduto.cdsProduto_Comb.Post;

        fDMCopiarProduto.cdsProduto_Comb_Mat.Close;
        fDMCopiarProduto.sdsProduto_Comb_Mat.ParamByName('ID').AsInteger   := fDMCopiarProduto.cdsProduto_CombID.AsInteger;
        fDMCopiarProduto.sdsProduto_Comb_Mat.ParamByName('ITEM').AsInteger := fDMCopiarProduto.cdsProduto_CombITEM.AsInteger;
        fDMCopiarProduto.cdsProduto_Comb_Mat.Open;
        fDMCopiarProduto.cdsProduto_Comb_Mat.First;
        while not fDMCopiarProduto.cdsProduto_Comb_Mat.Eof do
        begin
          fDMCadProduto.cdsProduto_Comb_Mat.Insert;
          fDMCadProduto.cdsProduto_Comb_MatID.AsInteger := fDMCadProduto.cdsProdutoID.AsInteger;
          for x := 0 to (fDMCopiarProduto.cdsProduto_Comb.FieldCount - 1) do
          begin
            if (fDMCopiarProduto.cdsProduto_Comb_Mat.Fields[x].FieldName <> 'ID') then
              fDMCadProduto.cdsProduto_Comb_Mat.FieldByName(fDMCopiarProduto.cdsProduto_Comb_Mat.Fields[x].FieldName).AsVariant := fDMCopiarProduto.cdsProduto_Comb_Mat.Fields[x].Value;
          end;
          fDMCadProduto.cdsProduto_Comb_Mat.Post;

          fDMCopiarProduto.cdsProduto_Comb_Mat.Next;
        end;

        fDMCopiarProduto.cdsProduto_Comb.Next;
      end;
    end;
    //******************

  except
    on e: Exception do
    begin
      Raise Exception.Create('Ocorreu o seguinte erro ao copiar: ' + #13 + e.Message);
    end;
  end;
  FreeAndNil(fDMCopiarProduto);

  FreeAndNil(Form);

  RzPageControl1.ActivePage := TS_Cadastro;
  btnAlterarClick(Sender);
  btnAlterar_NomeClick(Sender);
end;

procedure TfrmCadProduto.SMDBGrid3DblClick(Sender: TObject);
begin
  ffrmCadProduto_Consumo := TfrmCadProduto_Consumo.Create(self);
  ffrmCadProduto_Consumo.fDMCadProduto := fDMCadProduto;
  ffrmCadProduto_Consumo.Panel2.Enabled    := False;
  ffrmCadProduto_Consumo.BitBtn1.Enabled   := False;
  ffrmCadProduto_Consumo.ShowModal;
  FreeAndNil(ffrmCadProduto_Consumo);
end;

procedure TfrmCadProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 82) and (RzPageControl1.ActivePage = TS_Consulta) then
  begin
    BitBtn6.Visible            := not(BitBtn6.Visible);
    btnAjustarPeso.Visible     := not(btnAjustarPeso.Visible);
  end;
end;

procedure TfrmCadProduto.prc_Habilita;
var
  i: Integer;
  vTexto: String;
begin
  TS_Consulta.TabEnabled      := not(TS_Consulta.TabEnabled);
  btnAlterar.Enabled          := not(btnAlterar.Enabled);
  btnConfirmar.Enabled        := not(btnConfirmar.Enabled);
  pnlCadastro.Enabled         := not(pnlCadastro.Enabled);
  pnlBalanca.Enabled          := not(pnlBalanca.Enabled);
  pnlCadastro_Forn.Enabled    := not(pnlCadastro_Forn.Enabled);
  btnInserir_Consumo.Enabled  := not(btnInserir_Consumo.Enabled);
  btnAlterar_Consumo.Enabled  := not(btnAlterar_Consumo.Enabled);
  btnExcluir_Consumo.Enabled  := not(btnExcluir_Consumo.Enabled);
  pnlFiscal.Enabled           := not(pnlFiscal.Enabled);
  pnlAdicional.Enabled        := not(pnlAdicional.Enabled);
  DBMemo1.ReadOnly            := not(DBMemo1.ReadOnly);
  TS_Foto.Enabled             := not(TS_Foto.Enabled);
  for i := 1 to SMDBGrid2.ColCount - 2 do
  begin
    vTexto := SMDBGrid2.Columns[i].FieldName;
    if (vTexto = 'COD_MATERIAL_FORN') or (vTexto = 'TAMANHO_CLIENTE') or (vTexto = 'NOME_MATERIAL_FORN') then
      SMDBGrid2.Columns[i].ReadOnly := not(SMDBGrid2.Columns[i].ReadOnly);
  end;
end;

procedure TfrmCadProduto.RxDBLookupCombo5CloseUp(Sender: TObject);
begin
  RxDBLookupCombo5.LookupDisplay := 'NOME';
end;

procedure TfrmCadProduto.RxDBLookupCombo5DropDown(Sender: TObject);
begin
  RxDBLookupCombo5.LookupDisplay := 'NOME_AUX;CODIGO';
end;

procedure TfrmCadProduto.rxdbGrupoDropDown(Sender: TObject);
begin
  rxdbGrupo.LookupDisplay := 'NOME_AUX;CODIGO';
end;

procedure TfrmCadProduto.Normal1Click(Sender: TObject);
begin
  prc_Imp_Produto(False);
end;

procedure TfrmCadProduto.Conferncia1Click(Sender: TObject);
begin
  vTipo_Config_Email := 3;
  prc_Imprimir_Estruturado(False);
end;

procedure TfrmCadProduto.prc_Verificar_mGrupo(ID_Grupo: Integer);
var
  sds: TSQLDataSet;
begin
  if ID_Grupo <= 0 then
  begin
    prc_Gravar_mGrupo(0,vID_Principal,'','');
    exit;
  end;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT G.ID, G.NOME, G.TIPO, G.CODIGO, G.NIVEL, G.SUPERIOR, CASE G.NIVEL '
                       + 'WHEN 5 THEN ' + QuotedStr('          ') + ' ||  G.NOME '
                       + 'WHEN 4 THEN ' + QuotedStr('        ') + ' ||  G.NOME '
                       + 'WHEN 3 THEN ' + QuotedStr('      ') + ' ||  G.NOME '
                       + 'WHEN 2 THEN ' + QuotedStr('    ') + '||  G.NOME '
                       + 'WHEN 1 THEN G.NOME '
                       + 'ELSE G.NOME '
                       //+ 'END AS NOME_AUX , S2.NOME || ' + QuotedStr(' - ') + ' || G.NOME  AS NOME_PRINCIPAL '
                       + 'END AS NOME_AUX , S2.NOME '
                       + 'FROM GRUPO G '
                       + 'LEFT JOIN GRUPO S2 ON G.SUPERIOR = S2.ID '
                       + 'WHERE G.ID = ' + IntToStr(ID_Grupo);
    sds.Open;
    if (sds.FieldByName('Superior').IsNull) or (sds.FieldByName('Superior').AsInteger <= 0) then
      ID_Grupo := 0
    else
      ID_Grupo := sds.FieldByName('Superior').AsInteger;
    //prc_Gravar_mGrupo(sds.FieldByName('ID').AsInteger,ID_Grupo,sds.FieldByName('Codigo').AsString,sds.FieldByName('Nome_Aux').AsString);
    if sds.FieldByName('TIPO').AsString = 'A' then
      prc_Gravar_mGrupo(sds.FieldByName('ID').AsInteger,ID_Grupo,sds.FieldByName('Codigo').AsString,sds.FieldByName('NOME').AsString);
  finally
    FreeAndNil(sds);
  end;
  if ID_Grupo > 0 then
    prc_Verificar_mGrupo(ID_Grupo);
end;

procedure TfrmCadProduto.prc_Gravar_mGrupo(ID, ID_Principal: Integer; Codigo, Nome: String);
var
  sds: TSQLDataSet;
begin
  if not fDMCadProduto.mGrupo.FindKey([ID]) then
  begin
    fDMCadProduto.mGrupo.Insert;
    fDMCadProduto.mGrupoID_Grupo.AsInteger     := ID;
    fDMCadProduto.mGrupoCodigo.AsString        := Codigo;
    fDMCadProduto.mGrupoNome.AsString          := Nome;
    fDMCadProduto.mGrupoID_Principal.AsInteger := ID_Principal;

    fDMCadProduto.mGrupoNome_Completo.AsString := fnc_Monta_Nome_Estrutura(ID);

    fDMCadProduto.mGrupo.Post;

  end;
  if ID_Principal > 0 then
    vID_Principal := ID_Principal;
end;

procedure TfrmCadProduto.prc_Gravar_mGrupo_Produto;
begin
  fDMCadProduto.mGrupo_Produto.Insert;
  fDMCadProduto.mGrupo_ProdutoID_Produto.AsInteger   := fDMCadProduto.cdsProduto_ConsultaID.AsInteger;
  fDMCadProduto.mGrupo_ProdutoID_Grupo.AsInteger     := fDMCadProduto.cdsProduto_ConsultaID_GRUPO.AsInteger;
  fDMCadProduto.mGrupo_ProdutoCod_Grupo.AsString     := fDMCadProduto.cdsProduto_ConsultaCOD_GRUPO.AsString;
  fDMCadProduto.mGrupo_ProdutoReferencia.AsString    := fDMCadProduto.cdsProduto_ConsultaREFERENCIA.AsString;
  fDMCadProduto.mGrupo_ProdutoNome_Produto.AsString  := fDMCadProduto.cdsProduto_ConsultaNOME.AsString;
  fDMCadProduto.mGrupo_ProdutoNCM.AsString           := fDMCadProduto.cdsProduto_ConsultaNCM.AsString;
  fDMCadProduto.mGrupo_ProdutoUnidade.AsString       := fDMCadProduto.cdsProduto_ConsultaUNIDADE.AsString;
  fDMCadProduto.mGrupo_ProdutoPreco_Custo.AsFloat    := StrToFloat(FormatFloat('0.000##',fDMCadProduto.cdsProduto_ConsultaPRECO_CUSTO.AsFloat));
  fDMCadProduto.mGrupo_ProdutoPreco_Venda.AsFloat    := StrToFloat(FormatFloat('0.000##',fDMCadProduto.cdsProduto_ConsultaPRECO_VENDA.AsFloat));
  fDMCadProduto.mGrupo_ProdutoSaldo_Estoque.AsFloat  := StrToFloat(FormatFloat('0.000',fDMCadProduto.cdsProduto_ConsultaQTD_ESTOQUE.AsFloat));
  fDMCadProduto.mGrupo_ProdutoID_Principal.AsInteger := vID_Principal;
  fDMCadProduto.mGrupo_Produto.Post;
end;

procedure TfrmCadProduto.RxDBLookupCombo5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vID_Grupo_Pos := fDMCadProduto.cdsProdutoID_GRUPO.AsInteger;
    frmSel_Grupo  := TfrmSel_Grupo.Create(Self);
    frmSel_Grupo.ShowModal;
    fDMCadProduto.cdsProdutoID_GRUPO.AsInteger := vID_Grupo_Pos;
  end;
end;

procedure TfrmCadProduto.rxdbGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if rxdbGrupo.Text <> '' then
      vID_Grupo_Pos := rxdbGrupo.KeyValue;
    frmSel_Grupo := TfrmSel_Grupo.Create(Self);
    frmSel_Grupo.ShowModal;
    if vID_Grupo_Pos > 0 then
      rxdbGrupo.KeyValue := vID_Grupo_Pos;
  end;
end;

procedure TfrmCadProduto.RxDBLookupCombo5Exit(Sender: TObject);
begin
  StaticText2.Visible := False;
  if (vID_Grupo_Ant <> fDMCadProduto.cdsProdutoID_GRUPO.AsInteger) and (fDMCadProduto.cdsProdutoID_GRUPO.AsInteger > 0) then
    prc_Gerar_Ref_Estruturada;
  if RxDBLookupCombo5.Text <> '' then
  begin
    fDMCadProduto.cdsGrupo.Locate('ID',RxDBLookupCombo5.KeyValue,([Locaseinsensitive]));
    lblEstrutura.Caption := fDMCadProduto.cdsGrupoNOME_SUPERIOR.AsString;
  end
  else
    lblEstrutura.Caption := '';
end;

procedure TfrmCadProduto.rxdbGrupoExit(Sender: TObject);
begin
  StaticText2.Visible := False;
end;

procedure TfrmCadProduto.RxDBComboBox7Exit(Sender: TObject);
begin
  if (vTipo_Reg_Ant <> fDMCadProduto.cdsProdutoTIPO_REG.AsString) and (fDMCadProduto.cdsProduto.State in [dsInsert]) and
     (copy(fDMCadProduto.cdsProdutoREFERENCIA.AsString,2,1) = '.') then
    fDMCadProduto.cdsProdutoREFERENCIA.AsString := '';
  if (vTipo_Reg_Ant <> fDMCadProduto.cdsProdutoTIPO_REG.AsString) or (fDMCadProduto.cdsProdutoSPED_TIPO_ITEM.IsNull) then
  begin
    if fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'P' then
      fDMCadProduto.cdsProdutoSPED_TIPO_ITEM.AsString := '04'
    else
    if fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'S' then
      fDMCadProduto.cdsProdutoSPED_TIPO_ITEM.AsString := '06'
    else
    if fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'M' then
      fDMCadProduto.cdsProdutoSPED_TIPO_ITEM.AsString := '01'
    else
    if fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'C' then
      fDMCadProduto.cdsProdutoSPED_TIPO_ITEM.AsString := '07'
    else
    if fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'I' then
      fDMCadProduto.cdsProdutoSPED_TIPO_ITEM.AsString := '08';
  end;
  if (vTipo_Reg_Ant <> fDMCadProduto.cdsProdutoTIPO_REG.AsString) and (fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'M') then
  begin
    if (fDMCadProduto.qParametrosINFORMAR_COR_PROD.AsString = 'C') or (fDMCadProduto.qParametrosINFORMAR_COR_MATERIAL.AsString = 'S') then
      fDMCadProduto.prc_Abrir_Produto_Cor(fDMCadProduto.cdsProdutoID.AsInteger);
  end;
end;

procedure TfrmCadProduto.RxDBLookupCombo1Change(Sender: TObject);
begin
  Label98.Visible  := (fDMCadProduto.cdsProdutoORIGEM_PROD.AsString <> '0');
  DBEdit49.Visible := (fDMCadProduto.cdsProdutoORIGEM_PROD.AsString <> '0');
  Label99.Visible  := (fDMCadProduto.cdsProdutoORIGEM_PROD.AsString <> '0');
  DBEdit50.Visible := (fDMCadProduto.cdsProdutoORIGEM_PROD.AsString <> '0');
end;

procedure TfrmCadProduto.SpeedButton3Click(Sender: TObject);
var
  sds: TSQLDataSet;
begin
  if ListBox1.Visible then
  begin
    ListBox1.Visible := False;
    exit;
  end;
  if RxDBLookupCombo3.Text <> '' then
    fDMCadProduto.cdsNCM.Locate('ID',RxDBLookupCombo3.KeyValue,([Locaseinsensitive]))
  else
    exit;
  ListBox1.Height := 65;
  ListBox1.Items.Clear;
  ListBox1.Items.Add('EX  -  Descrição');
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'SELECT * FROM TAB_IBPT ' +
                       'WHERE CODIGO = ' + QuotedStr(fDMCadProduto.cdsNCMNCM.AsString) +
                       ' AND EX <> ' + QuotedStr('');
  sds.Open;
  sds.First;
  while not sds.Eof do
  begin
    ListBox1.Items.Add(sds.FieldByName('EX').AsString + ' - ' + sds.FieldByName('NOME').AsString);
    sds.Next;
  end;
  FreeAndNil(sds);

  ListBox1.Visible := True;
  ListBox1.SetFocus;
end;

procedure TfrmCadProduto.ListBox1DblClick(Sender: TObject);
var
  vTexto: String;
begin
  if ListBox1.ItemIndex = 0 then
    exit;
  vTexto := ListBox1.Items[ListBox1.ItemIndex];
  fDMCadProduto.cdsProdutoNCM_EX.AsString := copy(vTexto,1,2);
  DBEdit51.SetFocus;
  ListBox1.Visible := False;
end;

procedure TfrmCadProduto.ListBox1Exit(Sender: TObject);
begin
  ListBox1.Visible := False;
end;

procedure TfrmCadProduto.DBEdit51Exit(Sender: TObject);
var
  sds: TSQLDataSet;
begin
  if trim(DBEdit51.Text) = '' then
    exit;
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'SELECT * FROM TAB_IBPT '
                     + 'WHERE CODIGO = ' + QuotedStr(fDMCadProduto.cdsNCMNCM.AsString)
                     + ' AND EX = ' + QuotedStr(DBEdit51.Text);
  sds.Open;
  if sds.IsEmpty then
  begin
    MessageDlg('*** Excessão não encontrada na NCM, favor verificar!', mtError, [mbOk], 0);
    DBEdit51.SetFocus;
  end;
  FreeAndNil(sds);
end;

procedure TfrmCadProduto.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    ListBox1DblClick(Sender);
end;

procedure TfrmCadProduto.SpeedButton11Click(Sender: TObject);
begin
  fDMCadProduto.cdsSitTribCf.Close;
  fDMCadProduto.cdsSitTribCf.Open;
end;

procedure TfrmCadProduto.prc_Imprimir_Estruturado(Agrupado: Boolean);
var
  vCodGrupo_Ant: String;
  vRefAnt: String;
begin
  if fDMCadProduto.cdsProduto_Consulta.IsEmpty then
  begin
    MessageDlg('*** Não existe produto para imprimir!', mtInformation, [mbOk], 0);
    exit;
  end;
  Screen.Cursor := crHourGlass;
  SMDBGrid1.DisableScroll;
  try
    vCodGrupo_Ant := '-1';
    fDMCadProduto.mGrupo.EmptyDataSet;
    fDMCadProduto.mGrupo_Produto.EmptyDataSet;
    fDMCadProduto.mGrupo.IndexFieldNames         := 'Codigo';
    fDMCadProduto.mGrupo_Produto.IndexFieldNames := 'Cod_Grupo;Nome_Produto;Referencia';
    if Agrupado then
      fDMCadProduto.cdsProduto_Consulta.IndexFieldNames := 'COD_GRUPO;REFERENCIA'
    else
      fDMCadProduto.cdsProduto_Consulta.IndexFieldNames := 'COD_GRUPO;NOME;REFERENCIA';
    ProgressBar1.Max      := fDMCadProduto.cdsProduto_Consulta.RecordCount;
    ProgressBar1.Position := 0;
    ProgressBar1.Visible  := True;
    vRefAnt := '-1';
    vID_Principal := 0;
    fDMCadProduto.mGrupo.IndexFieldNames         := 'ID_Grupo';
    fDMCadProduto.cdsProduto_Consulta.First;
    while not fDMCadProduto.cdsProduto_Consulta.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if vCodGrupo_Ant <> fDMCadProduto.cdsProduto_ConsultaCOD_GRUPO.AsString then
        prc_Verificar_mGrupo(fDMCadProduto.cdsProduto_ConsultaID_GRUPO.AsInteger);
      if not(Agrupado) or ((Agrupado) and (vRefAnt <> fDMCadProduto.cdsProduto_ConsultaREFERENCIA_PADRAO.AsString)) then
        prc_Gravar_mGrupo_Produto;
      vCodGrupo_Ant := fDMCadProduto.cdsProduto_ConsultaCOD_GRUPO.AsString;
      vRefAnt       := fDMCadProduto.cdsProduto_ConsultaREFERENCIA_PADRAO.AsString;
      fDMCadProduto.cdsProduto_Consulta.Next;
    end;
  finally
    ProgressBar1.Visible := False;
    Screen.Cursor        := crDefault;
    SMDBGrid1.EnableScroll;
  end;
  fDMCadProduto.mGrupo.IndexFieldNames         := 'Codigo';
  fRelProduto_Grupo               := TfRelProduto_Grupo.Create(Self);
  fRelProduto_Grupo.vImpConsumo   := RzCheckList1.ItemChecked[1];
  fRelProduto_Grupo.vImpPrecoCusto := RzCheckList1.ItemChecked[2];
  fRelProduto_Grupo.vImpPreco     := RzCheckList1.ItemChecked[3];
  fRelProduto_Grupo.fDMCadProduto := fDMCadProduto;
  fRelProduto_Grupo.RLReport1.PreviewModal;
  fRelProduto_Grupo.RLReport1.Free;
  FreeAndNil(fRelProduto_Grupo);
end;

procedure TfrmCadProduto.ProdutoAgrupadoRefPadro1Click(Sender: TObject);
begin
  vTipo_Config_Email := 3;
  prc_Imprimir_Estruturado(True);
end;

procedure TfrmCadProduto.DBEdit7Exit(Sender: TObject);
var
  vAux: Integer;
begin
  if (fDMCadProduto.qParametros_LoteLOTE_CALCADO_NOVO.AsString = 'S') and (trim(fDMCadProduto.cdsProdutoREFERENCIA.AsString) = '') then
    fDMCadProduto.cdsProdutoREFERENCIA.AsString := fDMCadProduto.cdsProdutoTIPO_REG.AsString + '.' +FormatFloat('000000',fDMCadProduto.cdsProdutoID.AsInteger)
  else
  if (trim(fDMCadProduto.qParametros_LoteLOTE_CALCADO_NOVO.AsString) <> 'S') then
  begin
    if (trim(DBEdit7.Text) = '') and (fDMCadProduto.cdsProdutoTIPO_REG.AsString <> '') then
    begin
      vAux := fDMCadProduto.fnc_Referencia_Proxima_Seq(fDMCadProduto.cdsProdutoTIPO_REG.AsString);
      fDMCadProduto.cdsProdutoREFERENCIA_SEQ.AsInteger := vAux;
      fDMCadProduto.cdsProdutoREFERENCIA.AsString      := fDMCadProduto.cdsProdutoTIPO_REG.AsString + '.' +FormatFloat('000000',fDMCadProduto.cdsProdutoREFERENCIA_SEQ.AsInteger);
    end;
    if ((trim(DBEdit7.Text) <> '') and ((trim(fDMCadProduto.cdsProdutoREFERENCIA_PADRAO.AsString) = '')) or (fDMCadProduto.cdsProduto.State in [dsInsert])
       or (DBEdit7.Text <> vReferencia_Ant)) then
      fDMCadProduto.cdsProdutoREFERENCIA_PADRAO.AsString := DBEdit7.Text;
    if (trim(DBEdit7.Text) <> '') and (Copy(DBEdit7.Text,1,2) <> fDMCadProduto.cdsProdutoTIPO_REG.AsString + '.') then
      fDMCadProduto.cdsProdutoREFERENCIA_SEQ.AsInteger := 0;
  end;
end;

procedure TfrmCadProduto.RxDBLookupCombo2Enter(Sender: TObject);
begin
  RxDBLookupCombo2.ReadOnly := not(fDMCadProduto.cdsProduto_Uni.IsEmpty);
end;

procedure TfrmCadProduto.BitBtn20Click(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
  fDMCadProduto.cdsProdutoFOTO.AsString := OpenPictureDialog1.FileName;
  try
    Image1.Picture.LoadFromFile(fDMCadProduto.cdsProdutoFOTO.AsString)
  except
    Image1.Picture := nil;
  end;
  Image2.Picture := Image1.Picture;
end;

procedure TfrmCadProduto.btnAlterar_NomeClick(Sender: TObject);
var
  sds: TSQLDataSet;
  vFlag: Boolean;
  ffrmSenha: TfrmSenha;
  vMsgSenha: String;
begin
  vAltera_Nome := False;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText := 'SELECT COUNT(M.ID_PRODUTO) CONTADOR, '
                     + ' (SELECT COUNT(E.ID_PRODUTO) FROM ESTOQUE_MOV E  '
                     + '  WHERE E.ID_PRODUTO = ' + IntToStr(fDMCadProduto.cdsProdutoID.AsInteger)
                     + '    AND (e.tipo_mov = ' + QuotedStr('NTS')
                     + '     OR E.tipo_mov = ' + QuotedStr('NTE')
                     + '     OR E.tipo_mov = ' + QuotedStr('CFI')
                     + '     OR E.tipo_mov = ' + QuotedStr('NFC')
                     + ' )) CONTADOR2 '
                     + ', (SELECT COUNT(PI.ID_PRODUTO) FROM PEDIDO_ITEM PI '
                     + ' WHERE PI.ID_PRODUTO = ' + IntToStr(fDMCadProduto.cdsProdutoID.AsInteger)
                     + '   AND PI.qtd_restante > 0 ) CONTADOR3 '
                     + ' FROM MOVIMENTO M '
                     + ' WHERE M.ID_PRODUTO = ' + IntToStr(fDMCadProduto.cdsProdutoID.AsInteger);
    sds.Open;
    vMsgSenha := '';
    if (sds.FieldByName('CONTADOR').AsInteger > 0) then
      vMsgSenha := '*** Esse produto possui pedido em aberto, '
    else
    if (sds.FieldByName('CONTADOR2').AsInteger > 0) or (sds.FieldByName('CONTADOR3').AsInteger > 0)then
      vMsgSenha := '*** Esse produto já teve movimentação, ';

    //24/06/2016
    //if (sds.FieldByName('CONTADOR3').AsInteger > 0) then
    //begin
    //  MessageDlg('*** Esse produto possui pedido em aberto, não pode ser alterado nome/referência!', mtInformation, [mbOk], 0);
    //  DBEdit2.ReadOnly := True;
    //  DBEdit7.ReadOnly := True;
    //end
    //else
    //if (sds.FieldByName('CONTADOR').AsInteger > 0) or (sds.FieldByName('CONTADOR2').AsInteger > 0) then
    if (sds.FieldByName('CONTADOR').AsInteger > 0) or (sds.FieldByName('CONTADOR2').AsInteger > 0) or (sds.FieldByName('CONTADOR3').AsInteger > 0)  then
    begin
      vFlag := False;
      if (trim(fDMCadProduto.qParametros_ProdSENHA_ALT_PROD_MOV.AsString) = '') or (fDMCadProduto.qParametros_ProdSENHA_ALT_PROD_MOV.IsNull) then
      begin
        //MessageDlg('*** Esse produto já teve movimentação, para alterar nome/referência precisa informar a senha!' + #13 +
        MessageDlg(vMsgSenha + 'para alterar nome/referência precisa informar a senha!' + #13 +
                   '*** Senha não cadastrada para alterar o Nome/Referência!', mtInformation, [mbOk], 0);
        vFlag := True;
      end
      else
      begin
        ffrmSenha := TfrmSenha.Create(self);
        if (sds.FieldByName('CONTADOR3').AsInteger > 0) then
          ffrmSenha.Label2.Caption := 'Produto com pedido em aberto!'
        else
          ffrmSenha.Label2.Caption := 'Produto com movimentação!';
        ffrmSenha.Label3.Caption := 'Informe a senha para alterar';
        ffrmSenha.Label4.Caption := ' Nome/Referência: ';
        ffrmSenha.vControlaSenha := True;
        ffrmSenha.vSenha_Param := fDMCadProduto.qParametros_ProdSENHA_ALT_PROD_MOV.AsString;
        ffrmSenha.ShowModal;
        FreeAndNil(ffrmSenha);
        if vSenha <>  fDMCadProduto.qParametros_ProdSENHA_ALT_PROD_MOV.AsString then
          vFlag := True;
      end;
      DBEdit2.ReadOnly := vFlag;
      DBEdit7.ReadOnly := vFlag;
      if not vFlag then
      begin
        vAltera_Nome := True;
        DBEdit2.SetFocus;
      end;
    end
    else
    begin
      DBEdit2.ReadOnly := False;
      DBEdit7.ReadOnly := False;
      DBEdit2.SetFocus;
    end;
    sds.Close;

  except
    on e: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
  end;
  FreeAndNil(sds);
end;

procedure TfrmCadProduto.DBEdit1Change(Sender: TObject);
var
  vAux: Real;
begin
  vAux := 0;
  if trim(DBEdit1.Text) <> '' then
    vAux := StrToFloat(DBEdit1.Text);
  //25/11/2015
  //Label11.Visible          := (vAux > 0);
  //RxDBLookupCombo4.Visible := (vAux > 0);
end;

procedure TfrmCadProduto.DBEdit7Enter(Sender: TObject);
begin
  vReferencia_Ant  := fDMCadProduto.cdsProdutoREFERENCIA.AsString;
  if fDMCadProduto.qParametrosMOSTRAR_LINHA_PROD.AsString = 'S' then
    DBEdit7.SelStart := Length(DBEdit7.Text) + 1;
end;

procedure TfrmCadProduto.prc_Mostrar_Foto;
begin
  Image1.Picture := nil;
  if trim(fDMCadProduto.cdsProdutoFOTO.AsString) <> '' then
  begin
    try
      Image1.Picture.LoadFromFile(fDMCadProduto.cdsProdutoFOTO.AsString);
    except
      Image1.Picture := nil;
    end;
  end;
  Image2.Picture := Image1.Picture; 
end;

procedure TfrmCadProduto.RxDBComboBox7Enter(Sender: TObject);
begin
  vTipo_Reg_Ant := fDMCadProduto.cdsProdutoTIPO_REG.AsString;
  if not fnc_Verificar_Tipo then
    DBEdit7.SetFocus;
end;

procedure TfrmCadProduto.DBEdit15Exit(Sender: TObject);
var
  sds: TSQLDataSet;
  vExiste: Boolean;
  vMsgAux: String;
begin
  if trim(DBEdit15.Text) = '' then
    exit;
  vExiste := False;
  vMsgAux := '';

  sds  := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT P.ID, P.NOME, P.COD_BARRA FROM PRODUTO P  WHERE P.COD_BARRA = :COD_BARRA ';
    sds.ParamByName('COD_BARRA').AsString := DBEdit15.Text;
    sds.Open;
    if not(sds.IsEmpty) and (sds.FieldByName('ID').AsInteger <> fDMCadProduto.cdsProdutoID.AsInteger) then
    begin
      vExiste := True;
      vMsgAux := 'ID: ' + sds.FieldByName('ID').AsString + '  ' + sds.FieldByName('NOME').AsString;
    end;
    sds.Close;
  finally
    FreeAndNil(sds);
  end;
  if vExiste then
  begin
    MessageDlg('*** Código de barras já está cadastrado no produto: ' + #13
               + vMsgAux, mtInformation, [mbOk], 0);
    DBEdit15.SetFocus;
  end;
end;

function TfrmCadProduto.fnc_Verificar_Tipo: Boolean;
begin
  Result := True;
  if fDMCadProduto.qParametros_ProdCONT_TIPO_PROD.AsString = 'S' then
  begin
    if (fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'M') then
    begin
      if (fDMCadProduto.cdsProduto_Cor.Active) and not(fDMCadProduto.cdsProduto_Cor.IsEmpty) then
        Result := False;
    end
    else
    if (fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'P') or (fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'S') then
    begin
      if (fDMCadProduto.cdsProduto_Comb.Active) and not(fDMCadProduto.cdsProduto_Comb.IsEmpty) then
        Result := False
      else
      if (fDMCadProduto.cdsProduto_Atelier.Active) and not(fDMCadProduto.cdsProduto_Atelier.IsEmpty) then
        Result := False
      else
      if (fDMCadProduto.cdsProduto_Consumo.Active) and not(fDMCadProduto.cdsProduto_Consumo.IsEmpty) then
        Result := False
      else
      if (fDMCadProduto.cdsProduto_Emb.Active) and not(fDMCadProduto.cdsProduto_Emb.IsEmpty) then
        Result := False
      else
      if fDMCadProduto.cdsProdutoID_LINHA.AsInteger > 0 then
        Result := False;
    end;
  end;
end;

procedure TfrmCadProduto.SMDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadProduto.cdsProduto_ConsumoclTIPO_REG.AsString = 'S' then
    AFont.Color := clBlue
  else
  if fDMCadProduto.cdsProduto_ConsumoESPECIFICO.AsString = 'S' then
    AFont.Color := clGreen;
end;

procedure TfrmCadProduto.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if (fDMCadProduto.cdsProdutoORIGEM_PROD.AsString <> vOrigem_Ant) or (fDMCadProduto.cdsProduto.State in [dsInsert]) then
  begin
    if (fDMCadProduto.cdsProdutoORIGEM_PROD.AsString = '1') or (fDMCadProduto.cdsProdutoORIGEM_PROD.AsString = '2') or
       (fDMCadProduto.cdsProdutoORIGEM_PROD.AsString = '3') or (fDMCadProduto.cdsProdutoORIGEM_PROD.AsString = '8') then
      fDMCadProduto.cdsProdutoUSA_PERC_IMP_INTERESTADUAL.AsString := 'S'
    else
      fDMCadProduto.cdsProdutoUSA_PERC_IMP_INTERESTADUAL.AsString := 'N';
  end;
end;

procedure TfrmCadProduto.RxDBLookupCombo1Enter(Sender: TObject);
begin
  vOrigem_Ant := fDMCadProduto.cdsProdutoORIGEM_PROD.AsString;
end;

procedure TfrmCadProduto.edtCod_EnqIPIKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 27) then
  begin
   fDMCadProduto.cdsProdutoID_ENQIPI.Clear;
   edtCod_EnqIPI.Clear;
  end
  else
  if (Key = Vk_F2) then
  begin
    viD_EnqIPI_Pos := fDMCadProduto.cdsProdutoID_ENQIPI.AsInteger;
    frmSel_EnqIPI := TfrmSel_EnqIPI.Create(Self);
    frmSel_EnqIPI.ShowModal;
    if viD_EnqIPI_Pos > 0 then
      fDMCadProduto.cdsProdutoID_ENQIPI.AsInteger := viD_EnqIPI_Pos
    else
      fDMCadProduto.cdsProdutoID_ENQIPI.Clear;
    edtCod_EnqIPI.Clear;
    prc_Abrir_EnqIPI(fDMCadProduto.cdsProdutoID_ENQIPI.AsInteger);
    edtCod_EnqIPI.Text := fDMCadProduto.qEnqIPICODIGO.AsString;
  end;
end;

procedure TfrmCadProduto.prc_Abrir_EnqIPI(ID: Integer);
begin
  fDMCadProduto.qEnqIPI.Close;
  fDMCadProduto.qEnqIPI.ParamByName('ID').AsInteger := ID;
  fDMCadProduto.qEnqIPI.Open;
end;

procedure TfrmCadProduto.FichaTcnica1Click(Sender: TObject);
var
  vArq: String;
begin
  if not(fDMCadProduto.cdsProduto_Consulta.Active) or (fDMCadProduto.cdsProduto_Consulta.IsEmpty) then
  begin
    MessageDlg('*** Não há produto selecionado para a impressão!', mtInformation, [mbOk], 0);
    exit;
  end;
  fDMCadProduto.prc_Localizar(fDMCadProduto.cdsProduto_ConsultaID.AsInteger);

  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Produto_Consumo.fr3';
  if FileExists(vArq) then
    fDMCadProduto.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDMCadProduto.frxReport1.ShowReport;
end;

procedure TfrmCadProduto.DBEdit60KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ffrmSel_CodCest: TfrmSel_CodCest;
begin
  if (Key = Vk_F2) then
  begin
    vCodCest_Pos := fDMCadProduto.cdsProdutoCOD_CEST.AsString;
    ffrmSel_CodCest := TfrmSel_CodCest.Create(Self);
    ffrmSel_CodCest.ShowModal;
    if vCodCest_Pos <> '' then
      fDMCadProduto.cdsProdutoCOD_CEST.AsString := vCodCest_Pos
    else
      fDMCadProduto.cdsProdutoCOD_CEST.Clear;
  end;
end;

procedure TfrmCadProduto.DBEdit60Exit(Sender: TObject);
begin
  if trim(fDMCadProduto.cdsProdutoCOD_CEST.AsString) <> '' then
  begin
    fDMCadProduto.qCest.Close;
    fDMCadProduto.qCest.ParamByName('COD_CEST').AsString := fDMCadProduto.cdsProdutoCOD_CEST.AsString;
    fDMCadProduto.qCest.Open;
    if fDMCadProduto.qCest.IsEmpty then
    begin
      MessageDlg('*** Código do CEST não encontrado na tabela! ', mtError, [mbOk], 0);
      DBEdit60.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmCadProduto.prc_Gravar_Produto_Cad_Ant;
var
  vItemAux: Integer;
begin
  fDMCadProduto.cdsProduto_Cad_Ant.Last;
  vItemAux := fDMCadProduto.cdsProduto_Cad_AntITEM.AsInteger;

  fDMCadProduto.cdsProduto_Cad_Ant.Insert;
  fDMCadProduto.cdsProduto_Cad_AntID.AsInteger        := fDMCadProduto.cdsProdutoID.AsInteger;
  fDMCadProduto.cdsProduto_Cad_AntITEM.AsInteger      := vItemAux + 1;
  fDMCadProduto.cdsProduto_Cad_AntDATA.AsDateTime     := Date;
  fDMCadProduto.cdsProduto_Cad_AntHora.AsDateTime     := Now;
  fDMCadProduto.cdsProduto_Cad_AntNOME.AsString       := vNome_Cad_Ant;
  fDMCadProduto.cdsProduto_Cad_AntREFERENCIA.AsString := vReferencia_Cad_Ant;
  fDMCadProduto.cdsProduto_Cad_AntUSUARIO.AsString    := vUsuario;
  fDMCadProduto.cdsProduto_Cad_Ant.Post;
  fDMCadProduto.cdsProduto_Cad_Ant.ApplyUpdates(0);
end;

procedure TfrmCadProduto.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  
  ffrmCadProduto_ST: TfrmCadProduto_ST;
  vId: Integer;
  vTipoReg, vIndexName: String;
begin
  if (Key = Vk_F7) and (fDMCadProduto.cdsProduto_Consulta.Active) and (fDMCadProduto.cdsProduto_ConsultaID.AsInteger > 0) then
  begin
    ffrmCadProduto_ST := TfrmCadProduto_ST.Create(Self);
    ffrmCadProduto_ST.vID_Produto_Local := fDMCadProduto.cdsProduto_ConsultaID.AsInteger;
    ffrmCadProduto_ST.ShowModal;
    FreeAndNil(ffrmCadProduto_ST);
  end
  else
  if (Key = Vk_F6) and not(fDMCadProduto.cdsProduto_Consulta.IsEmpty) then
  begin
    case ComboBox2.ItemIndex of
      0: vTipoReg := 'P';
      1: vTipoReg := 'M';
      3: vTipoReg := 'C';
      5: vTipoReg := 'S';
    end;
    vIndexName := fDMCadProduto.cdsProduto_Consulta.IndexFieldNames;
    vId := fDMCadProduto.cdsProduto_ConsultaID.AsInteger;
    ceID.AsInteger := vId;
    ffrmConsEstoque_Mov := TfrmConsEstoque_Mov.Create(self);
    vControleExterno    := True;
    ffrmConsEstoque_Mov.ceIDProduto.AsInteger := ceID.AsInteger;
    ffrmConsEstoque_Mov.edtRef.Text := edtReferencia.Text;
    ffrmConsEstoque_Mov.WindowState := wsMaximized;
    ffrmConsEstoque_Mov.ShowModal;
    FreeAndNil(frmConsEstoque_Mov);
    ceID.Clear;
  end;
  if (Key = Vk_F8) and not(fDMCadProduto.cdsProduto_Consulta.IsEmpty) then
  begin
    frmConsProduto_Compras := TfrmConsProduto_Compras.Create(Self);
    frmConsProduto_Compras.vIdProd := fDMCadProduto.cdsProduto_ConsultaID.AsInteger;
    frmConsProduto_Compras.ShowModal;
    FreeAndNil(frmConsProduto_Compras);
  end;
end;

procedure TfrmCadProduto.prc_Ajustar_Produto_Ped;
var
  sds: TSQLDataSet;
  vTamAux: String;
begin
  sds := TSQLDataSet.Create(nil);
  try
    vTamAux := '';
    if fDMCadProduto.qParametros_NFeGRAVAR_TAB_TAMANHO.AsString <> 'S' then
    begin
      if fDMCadProduto.cdsProdutoUSA_GRADE.AsString = 'S' then
        vTamAux := ' TAM. ';
    end;
      
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'UPDATE PEDIDO_ITEM I SET I.referencia = ' + QuotedStr(fDMCadProduto.cdsProdutoREFERENCIA.AsString) +
                         ' , I.nomeproduto = ' + QuotedStr(fDMCadProduto.cdsProdutoNOME.AsString + vTamAux) + ' || coalesce(I.Tamanho,'''') ' +
                         'WHERE I.id_produto = ' + fDMCadProduto.cdsProdutoID.AsString +
                         ' AND I.qtd_restante > 0 ' +
                         ' AND I.TIPO_REG = ' + QuotedStr('P');
    sds.ExecSQL();
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadProduto.BitBtn6Click(Sender: TObject);
begin
  if not fDMCadProduto.cdsProduto_Consulta.Active then
    exit;
  if MessageDlg('Deseja inativar os produtos selecionados?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  fDMCadProduto.cdsProduto_Consulta.First;
  while not fDMCadProduto.cdsProduto_Consulta.Eof do
  begin
    if SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      fDMCadProduto.prc_Localizar(fDMCadProduto.cdsProduto_ConsultaID.AsInteger);
      if not fDMCadProduto.cdsProduto.IsEmpty then
      begin
        if fDMCadProduto.cdsProdutoINATIVO.AsString <> 'S' then
        begin
          fDMCadProduto.cdsProduto.Edit;
          fDMCadProduto.cdsProdutoINATIVO.AsString := 'S';
          fDMCadProduto.cdsProduto.Post;
          fDMCadProduto.cdsProduto.ApplyUpdates(0);
        end;
      end;
    end;
    fDMCadProduto.cdsProduto_Consulta.Next;
  end;
end;

procedure TfrmCadProduto.prc_Aplicar_Margem;
var
  vAux: Real;
begin
  if (StrToFloat(FormatFloat('0.00',fDMCadProduto.cdsProdutoPERC_MARGEMLUCRO.AsFloat)) <= 0) then
    exit;

  if (StrToFloat(FormatFloat('0.00000',fDMCadProduto.cdsProdutoPRECO_CUSTO.AsFloat)) = StrToFloat(FormatFloat('0.00000',vPreco_Custo))) and
     (StrToFloat(FormatFloat('0.00000',fDMCadProduto.cdsProdutoPRECO_CUSTO_TOTAL.AsFloat)) = StrToFloat(FormatFloat('0.00000',vPreco_Custo_Total))) and
     (StrToFloat(FormatFloat('0.00',fDMCadProduto.cdsProdutoPERC_MARGEMLUCRO.AsFloat)) = StrToFloat(FormatFloat('0.00',vPerc_MargemLucro))) then
    exit;

  vPreco_Custo       := StrToFloat(FormatFloat('0.00000',fDMCadProduto.cdsProdutoPRECO_CUSTO.AsFloat));
  vPreco_Custo_Total := StrToFloat(FormatFloat('0.00000',fDMCadProduto.cdsProdutoPRECO_CUSTO_TOTAL.AsFloat));
  vPerc_MargemLucro  := StrToFloat(FormatFloat('0.00',fDMCadProduto.cdsProdutoPERC_MARGEMLUCRO.AsFloat));

  vPreco_Venda_Ant := StrToFloat(FormatFloat('0.0000',fDMCadProduto.cdsProdutoPRECO_VENDA.AsFloat));

  if (fDMCadProduto.qParametros_ProdOPCAO_APLICAR_MARGEM.AsString <> 'X') then
  begin
    if (fDMCadProduto.qParametros_ProdOPCAO_APLICAR_MARGEM.AsString = 'C') then
    begin
      if StrToFloat(formatFloat('0.0000',fDMCadProduto.cdsProdutoPRECO_CUSTO_TOTAL.AsFloat)) <= 0 then
        exit;
      fDMCadProduto.cdsProdutoPRECO_VENDA.AsFloat := StrToFloat(FormatFloat('0.00000',(fDMCadProduto.cdsProdutoPRECO_CUSTO_TOTAL.AsFloat *
                                                                fDMCadProduto.cdsProdutoPERC_MARGEMLUCRO.AsFloat / 100) +
                                                                fDMCadProduto.cdsProdutoPRECO_CUSTO_TOTAL.AsFloat));
    end
    else
    begin
      if StrToFloat(formatFloat('0.0000',fDMCadProduto.cdsProdutoPRECO_CUSTO.AsFloat)) <= 0 then
        exit;
      fDMCadProduto.cdsProdutoPRECO_VENDA.AsFloat := StrToFloat(FormatFloat('0.00000',(fDMCadProduto.cdsProdutoPRECO_CUSTO.AsFloat *
                                                                fDMCadProduto.cdsProdutoPERC_MARGEMLUCRO.AsFloat / 100) +
                                                                fDMCadProduto.cdsProdutoPRECO_CUSTO.AsFloat));
    end;
  end;
end;

procedure TfrmCadProduto.DBEdit3Exit(Sender: TObject);
begin
  prc_Aplicar_Margem;
end;

procedure TfrmCadProduto.DBEdit57Exit(Sender: TObject);
begin
  prc_Aplicar_Margem;
end;

procedure TfrmCadProduto.DBCheckBox13Click(Sender: TObject);
begin
  TS_Balanca.TabVisible := DBCheckBox13.Checked;
end;

procedure TfrmCadProduto.prc_Controle_Balanca;
begin
  if not(fDMCadProduto.cdsProduto_Balanca.Active) or not(fDMCadProduto.cdsProduto_Balanca.State in [dsEdit, dsInsert]) then
  begin
    fDMCadProduto.prc_Abrir_Balanca(fDMCadProduto.cdsProdutoID.AsInteger);
    if (fDMCadProduto.cdsProduto.State in [dsEdit, dsInsert]) then
    begin
      if fDMCadProduto.cdsProduto_Balanca.IsEmpty then
      begin
        fDMCadProduto.cdsProduto_Balanca.Insert;
        fDMCadProduto.cdsProduto_BalancaID.AsInteger := fDMCadProduto.cdsProdutoID.AsInteger;
      end
      else
        fDMCadProduto.cdsProduto_Balanca.Edit;
    end;
  end;
end;

procedure TfrmCadProduto.DBEdit2Exit(Sender: TObject);
begin
  if copy(fdmCadProduto.cdsProdutoNOME.AsString,1,1) = ' ' then
    fdmCadProduto.cdsProdutoNOME.AsString := TrimLeft(fdmCadProduto.cdsProdutoNOME.AsString);
end;

procedure TfrmCadProduto.DBEdit10Exit(Sender: TObject);
begin
  Label161.Visible          := (StrToFloat(FormatFloat('0.0000',fDMCadProduto.cdsProdutoPERC_REDUCAOICMS.AsFloat)) > 0);
  RxDBLookupCombo20.Visible := (StrToFloat(FormatFloat('0.0000',fDMCadProduto.cdsProdutoPERC_REDUCAOICMS.AsFloat)) > 0);
  if StrToFloat(FormatFloat('0.0000',fDMCadProduto.cdsProdutoPERC_REDUCAOICMS.AsFloat)) <= 0 then
    fDMCadProduto.cdsProdutoID_CSTICMS_BRED.Clear;
end;

procedure TfrmCadProduto.ProdutoConsumoEstruturado1Click(Sender: TObject);
var
  vArq: String;
begin
  if not(fDMCadProduto.cdsProduto_Consulta.Active) or (fDMCadProduto.cdsProduto_Consulta.IsEmpty) then
  begin
    MessageDlg('*** Não há produto selecionado para a impressão!', mtInformation, [mbOk], 0);
    exit;
  end;
  fDMCadProduto.prc_Localizar(fDMCadProduto.cdsProduto_ConsultaID.AsInteger);

  fDMCadProduto.cdsConsumo_Det.Close;
  fDMCadProduto.sdsConsumo_Det.ParamByName('ID').AsInteger := fDMCadProduto.cdsProdutoID.AsInteger;
  fDMCadProduto.cdsConsumo_Det.Open;

  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Produto_Consumo2.fr3';
  if FileExists(vArq) then
    fDMCadProduto.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDMCadProduto.frxReport1.ShowReport;
end;

procedure TfrmCadProduto.DBEdit5Enter(Sender: TObject);
begin
  vPreco_Venda_Ant := StrToFloat(FormatFloat('0.0000',fDMCadProduto.cdsProdutoPRECO_VENDA.AsFloat));
end;

procedure TfrmCadProduto.prc_Imp_Produto(Selecionados: Boolean);
var
  vIndice: String;
begin
  Screen.Cursor := crHourGlass;
  btnImprimir.Enabled := False;
  vTipo_Config_Email := 3;

  vIndice := fDMCadProduto.cdsProduto_Consulta.IndexFieldNames;

  SMDBGrid1.DisableScroll;
  try
    if Selecionados then
    begin
      fDMCadProduto.cdsProduto_Consulta.First;
      while not fDMCadProduto.cdsProduto_Consulta.Eof do
      begin
        if SMDBGrid1.SelectedRows.CurrentRowSelected then
        begin
          fDMCadProduto.cdsProduto_Consulta.Edit;
          fDMCadProduto.cdsProduto_ConsultaTESTE.AsString := 'S';
          fDMCadProduto.cdsProduto_Consulta.Post;
        end;
        fDMCadProduto.cdsProduto_Consulta.Next;
      end;

    end;

    fDMCadProduto.cdsProduto_Consulta.IndexFieldNames := 'NOMEGRUPO';
    if trim(vIndice) <> '' then
      fDMCadProduto.cdsProduto_Consulta.IndexFieldNames := fDMCadProduto.cdsProduto_Consulta.IndexFieldNames + ';' + vIndice;
    if Selecionados then
    begin
      fDMCadProduto.cdsProduto_Consulta.Filtered := False;
      fDMCadProduto.cdsProduto_Consulta.Filter   := 'TESTE = ' + QuotedStr('S');
      fDMCadProduto.cdsProduto_Consulta.Filtered := True;
    end;
    fRelProduto               := TfRelProduto .Create(Self);
    fRelProduto.vSelecionados := Selecionados;
    fRelProduto.vImpConsumo   := RzCheckList1.ItemChecked[1];
    fRelProduto.vImpPrecoCusto := RzCheckList1.ItemChecked[2];
    fRelProduto.vImpPreco     := RzCheckList1.ItemChecked[3];
    fRelProduto.vImpEmbalagem := (fDMCadProduto.qParametros_ProdUSA_QTD_EMBALAGEM.AsString = 'S');
    fRelProduto.fDMCadProduto := fDMCadProduto;
    fRelProduto.RLReport1.PreviewModal;
    fRelProduto.RLReport1.Free;
    FreeAndNil(fRelProduto);
  finally
    fDMCadProduto.cdsProduto_Consulta.Filtered := False;
    SMDBGrid1.UnSelectAllClick(nil);
    btnImprimir.Enabled := True;
    Screen.Cursor := crDefault;
    SMDBGrid1.EnableScroll;
    if Selecionados then
      btnConsultarClick(nil);
    if trim(vIndice) <> '' then
      fDMCadProduto.cdsProduto_Consulta.IndexFieldNames := vIndice;
  end;
end;

procedure TfrmCadProduto.ProdutosSelecionados1Click(Sender: TObject);
begin
  prc_Imp_Produto(True);
end;

procedure TfrmCadProduto.prc_Atualiza_Percentual;
var
  vPercentual, vValorCusto, vValorVenda: Real;
begin
   if (fDMCadProduto.qParametros_ProdOPCAO_APLICAR_MARGEM.AsString = 'C') then
     vValorCusto := fDMCadProduto.cdsProdutoPRECO_CUSTO_TOTAL.AsFloat
   else
     vValorCusto := fDMCadProduto.cdsProdutoPRECO_CUSTO.AsFloat;
   vValorVenda := fDMCadProduto.cdsProdutoPRECO_VENDA.AsFloat;
   if (vValorCusto <= 0) or (vValorVenda <= 0) then
    exit;
   vPercentual := (vValorVenda - vValorCusto) / vValorCusto * 100;
   fDMCadProduto.cdsProdutoPERC_MARGEMLUCRO.AsFloat := StrToFloat(FormatFloat('0.00',vPercentual));
end;

procedure TfrmCadProduto.prc_Gerar_Ref_Estruturada;
var
  vRefAux: String;
  sds: TSQLDataSet;
  i: Integer;
begin
  if fDMCadProduto.qParametros_ProdGERAR_REF_GRUPO.AsString <> 'S' then
    exit;
  if fDMCadProduto.qParametros_ProdQTD_DIGITOS_REF.AsInteger <= 0 then
  begin
    MessageDlg('*** Quantidade de digitos da referência não informado nos Parâmetros na aba Produtos!', mtError, [mbOk], 0);
    exit;
  end;
  if fDMCadProduto.cdsGrupoID.AsInteger <> fDMCadProduto.cdsProdutoID_GRUPO.AsInteger then
    fDMCadProduto.cdsGrupo.Locate('ID',fDMCadProduto.cdsProdutoID_GRUPO.AsInteger,([Locaseinsensitive]));
  if not(fDMCadProduto.cdsGrupoUNIDADE.IsNull) and (trim(fDMCadProduto.cdsProdutoUNIDADE.AsString) = '')  then
    fDMCadProduto.cdsProdutoUNIDADE.AsString := fDMCadProduto.cdsGrupoUNIDADE.AsString;
  if (fDMCadProduto.cdsGrupoID_NCM.AsInteger > 0) then
    fDMCadProduto.cdsProdutoID_NCM.AsInteger := fDMCadProduto.cdsGrupoID_NCM.AsInteger;
  vRefAux := fDMCadProduto.cdsGrupoCODIGO.AsString + '.';
  i := Length(fDMCadProduto.cdsGrupoCODIGO.AsString) + 2;
  sds  := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT max( SUBSTRING(REFERENCIA FROM ' + IntToStr(i) + ' FOR ' + IntToStr(fDMCadProduto.qParametros_ProdQTD_DIGITOS_REF.AsInteger) + ')) SEQ '
                       + ' FROM PRODUTO WHERE ID_GRUPO = :ID_GRUPO';
    sds.ParamByName('ID_GRUPO').AsInteger := fDMCadProduto.cdsProdutoID_GRUPO.AsInteger;
    sds.Open;
    if sds.FieldByName('SEQ').IsNull then
      i := 1
    else
      i := sds.FieldByName('SEQ').AsInteger + 1;
    vRefAux := vRefAux + Monta_Numero(IntToStr(i),fDMCadProduto.qParametros_ProdQTD_DIGITOS_REF.AsInteger);
  finally
    FreeAndNil(sds);
  end;
  fDMCadProduto.cdsProdutoREFERENCIA.AsString := vRefAux;
end;

procedure TfrmCadProduto.SMDBGrid1ChangeSelection(Sender: TObject);
begin
  if vUser_Exclui then
    begin
    if fDMCadProduto.qParametros_ProdEXCLUI_PROD_SEL.AsString = 'S' then
      btnExcluir.Enabled := (SMDBGrid1.SelectedRows.Count > 0)
    else
      btnExcluir.Enabled := (SMDBGrid1.SelectedRows.Count = 1);
  end;      
end;

function TfrmCadProduto.fnc_Duplicidade_Mat(ID_Prod: Integer): String;
var
  sds: TSQLDataSet;
begin
  Result := '';

  sds  := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT AUX.* '
                       + ' FROM ( SELECT COUNT(1) CONTADOR , P.id_material, P.id_posicao, MAT.NOME NOME_MATERIAL, '
                       + '        PS.NOME NOME_POSICAO '
                       + '         FROM PRODUTO_CONSUMO P '
                       + '         INNER JOIN PRODUTO MAT '
                       + '         ON P.id_material = MAT.ID '
                       + '         INNER JOIN POSICAO PS '
                       + '         ON P.id_posicao = PS.ID '
                       + '         WHERE P.ID = :ID '
                       + '         GROUP BY P.id_material, P.id_posicao, MAT.NOME, PS.NOME ) AUX '
                       + ' WHERE CONTADOR > 1 ';
    sds.ParamByName('ID').AsInteger := ID_Prod;
    sds.Open;
    if not sds.IsEmpty then
      Result := 'Material: ' + sds.FieldByName('NOME_MATERIAL').AsString + ' - Posição: ' + sds.FieldByName('NOME_POSICAO').AsString;
    sds.Close;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadProduto.DBEdit100Exit(Sender: TObject);
var
  sds: TSQLDataSet;
  vExiste: Boolean;
  vMsgAux: String;
begin
  if trim(DBEdit15.Text) = '' then
    exit;
  vExiste := False;
  vMsgAux := '';

  sds  := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT P.ID, P.NOME, P.COD_BARRA FROM PRODUTO P  WHERE P.COD_BARRA2 = :COD_BARRA2 ';
    sds.ParamByName('COD_BARRA2').AsString := DBEdit100.Text;
    sds.Open;
    if not(sds.IsEmpty) and (sds.FieldByName('ID').AsInteger <> fDMCadProduto.cdsProdutoID.AsInteger) then
    begin
      vExiste := True;
      vMsgAux := 'ID: ' + sds.FieldByName('ID').AsString + '  ' + sds.FieldByName('NOME').AsString;
    end;
    sds.Close;
  finally
    FreeAndNil(sds);
  end;
  if vExiste then
  begin
    MessageDlg('*** Código de barras já está cadastrado no produto: ' + #13
               + vMsgAux, mtInformation, [mbOk], 0);
    DBEdit100.SetFocus;
  end;

end;

procedure TfrmCadProduto.btnAjudaCod_BarraClick(Sender: TObject);
var
  vMSGAux: String;
begin
  vMSGAux := 'Esse Código de Barras é o do Produto individual' + #13
           + ' Ao informar ele já coloca a quantidade que este produto vai no Pacote/Caixa ' + #13
           + ' e também coloca a unidade do produto ' + #13 + #13
           + ' Esse Código de Barras, só informar quando o cadastro for da Embalagem ';
  MessageDlg(vMSGAux, mtInformation, [mbOk], 0);
end;

procedure TfrmCadProduto.prc_Grava_Peso;
var
  vPesoAux: Real;
  sds: TSQLDataSet;
begin
  vPesoAux := 0;
  if fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'P' then
  begin
    sds  := TSQLDataSet.Create(nil);
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
  end;
  fDMCadProduto.cdsProduto_Consumo.First;
  while not fDMCadProduto.cdsProduto_Consumo.Eof do
  begin
    fDMCadProduto.qMaterial.Close;
    fDMCadProduto.qMaterial.ParamByName('ID').AsInteger := fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger;
    fDMCadProduto.qMaterial.Open;
    if fDMCadProduto.qMaterialTIPO_REG.AsString = 'M' then
      vPesoAux := StrToFloat(FormatFloat('0.0000',vPesoAux + fDMCadProduto.cdsProduto_ConsumoQTD_CONSUMO.AsFloat))
    else
    begin
      sds.Close;
      sds.CommandText := 'select sum(p.qtd_consumo) qtd_consumo from produto_consumo p WHERE P.ID = :ID ';
      sds.ParamByName('ID').AsInteger := fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger;
      sds.Open;
      vPesoAux := vPesoAux + (StrToFloat(FormatFloat('0.0000',sds.FieldByName('qtd_consumo').AsFloat * fDMCadProduto.cdsProduto_ConsumoQTD_CONSUMO.AsFloat)));
    end;
    fDMCadProduto.cdsProduto_Consumo.Next;
  end;
  if fDMCadProduto.cdsProdutoTIPO_REG.AsString = 'P' then
    FreeAndNil(sds);
  if StrToFloat(FormatFloat('0.0000',vPesoAux)) > 0 then
  begin
    if not(fDMCadProduto.cdsProduto.State in [dsEdit,dsInsert]) then
      fDMCadProduto.cdsProduto.Edit;
    fDMCadProduto.cdsProdutoPESOBRUTO.AsFloat   := StrToFloat(FormatFloat('0.0000',vPesoAux));
    fDMCadProduto.cdsProdutoPESOLIQUIDO.AsFloat := StrToFloat(FormatFloat('0.0000',vPesoAux));
  end;
end;

procedure TfrmCadProduto.btnAjustarPesoClick(Sender: TObject);
begin
  if trim(fDMCadProduto.qParametros_ProdATUALIZA_PESO_ENG.AsString) <> 'S' then
    exit;
  SMDBGrid1.DisableScroll;
  fDMCadProduto.cdsProduto_Consulta.First;
  while not fDMCadProduto.cdsProduto_Consulta.Eof do
  begin
    if (fDMCadProduto.cdsProduto_ConsultaTIPO_REG.AsString = 'P') or (fDMCadProduto.cdsProduto_ConsultaTIPO_REG.AsString = 'S') then
    begin
      fDMCadProduto.prc_Localizar(fDMCadProduto.cdsProduto_ConsultaID.AsInteger);
      if not fDMCadProduto.cdsProduto.IsEmpty then
      begin
        fDMCadProduto.cdsProduto.Edit;
        prc_Grava_Peso;
        fDMCadProduto.cdsProduto.Post;
        fDMCadProduto.cdsProduto.ApplyUpdates(0);
      end;
    end;
    fDMCadProduto.cdsProduto_Consulta.Next;
  end;
  SMDBGrid1.EnableScroll;
  MessageDlg('*** Ajustado o Peso dos produtos da tela!', mtConfirmation, [mbOk], 0);
end;

procedure TfrmCadProduto.prcAtualizaPrecoMGV5;
var
  vCont: Integer;
  f: TextFile;
  i: Word;
  vArq, vTxt, vTxt1: string;
begin
  vCont := SMDBGrid1.SelectedRows.Count;
  if vCont = 0 then
  begin
    ShowMessage('Não existe produto selecionado!');
    Exit;
  end;

  vArq := ExtractFilePath(Application.ExeName) + 'TXITENS.TXT';
  AssignFile(f,vArq);
  ReWrite(f);

  fDMCadProduto.cdsProduto_Consulta.First;
  while not fDMCadProduto.cdsProduto_Consulta.Eof do
  begin
    if SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      vCont := vCont - 1;
      prc_Posiciona_Produto;
      if not fDMCadProduto.cdsProduto.IsEmpty then
      begin
        vTxt := '0101';
        if fDMCadProduto.cdsProdutoUNIDADE.AsString = 'KG' then
          vTxt := vTxt + '0'
        else
          vTxt := vTxt + '1';
        vTxt := vTxt + Monta_Numero(fDMCadProduto.cdsProdutoID.AsString,6);
        vTxt := vTxt + Monta_Numero(FormatFloat('0.00',fDMCadProduto.cdsProdutoPRECO_VENDA.AsFloat),6);
        vTxt := vTxt + Monta_Texto(fDMCadProduto.cdsProdutoVALIDADE.AsString,3);
        vTxt1 := Formatar_Campo(fDMCadProduto.cdsProdutoNOME.AsString,25);
        vTxt := vTxt + vTxt1;
        vTxt1 := Formatar_Campo('',25);
        vTxt := vTxt + vTxt1;
        vTxt1 := Formatar_Campo('',25);
        vTxt := vTxt + vTxt1;
        vTxt1 := Formatar_Campo('',50);
        vTxt := vTxt + vTxt1;
        vTxt1 := Formatar_Campo('',50);
        vTxt := vTxt + vTxt1;
        vTxt1 := Formatar_Campo('',50);
        vTxt := vTxt + vTxt1;
        vTxt1 := Formatar_Campo('',50);
        vTxt := vTxt + vTxt1;
        vTxt1 := Formatar_Campo('',50);
        vTxt := vTxt + vTxt1;
        Writeln(f,vTxt);
      end;
    end;
    if vCont <= 0 then
      fDMCadProduto.cdsProduto_Consulta.Last;
    fDMCadProduto.cdsProduto_Consulta.Next;
  end;
  CloseFile(f);
  ShowMessage('Arquivo ' + ExtractFilePath(Application.ExeName) + 'TXITENS.TXT gerado!');
end;

procedure TfrmCadProduto.prcExportaCadastroMGV5;
var
  vCont: Integer;
  f: TextFile;
  i: Word;
  vArq, vTxt, vTxt1: string;
begin
  vCont := SMDBGrid1.SelectedRows.Count;
  if vCont = 0 then
  begin
    ShowMessage('Não existe produto selecionado!');
    Exit;
  end;

  vArq := ExtractFilePath(Application.ExeName) + 'CADASTRO.TXT';
  AssignFile(f,vArq);
  ReWrite(f);

  fDMCadProduto.cdsProduto_Consulta.First;
  while not fDMCadProduto.cdsProduto_Consulta.Eof do
  begin
    if SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      vCont := vCont - 1;
      prc_Posiciona_Produto;
      if not fDMCadProduto.cdsProduto.IsEmpty then
      begin
        vTxt := '01';
        if fDMCadProduto.cdsProdutoUNIDADE.AsString = 'KG' then
          vTxt := vTxt + '0'
        else
          vTxt := vTxt + '1';
        vTxt := vTxt + Monta_Numero(fDMCadProduto.cdsProdutoID.AsString,6);
        vTxt := vTxt + Monta_Numero(fDMCadProduto.cdsProdutoPRECO_VENDA.AsString,6);
        vTxt := vTxt + '005';
        vTxt1 := Formatar_Campo(fDMCadProduto.cdsProdutoNOME.AsString,25);
        vTxt := vTxt + vTxt1;
        vTxt1 := Formatar_Campo('',25);
        vTxt := vTxt + vTxt1;
        vTxt := vTxt + '000000' + '000' + '000000';
        Writeln(f,vTxt);
      end;
    end;
    if vCont <= 0 then
      fDMCadProduto.cdsProduto_Consulta.Last;
    fDMCadProduto.cdsProduto_Consulta.Next;
  end;
  CloseFile(f);
  ShowMessage('Arquivo ' + ExtractFilePath(Application.ExeName) + 'CADASTRO.TXT gerado!');
end;


procedure TfrmCadProduto.AtualizarPreo1Click(Sender: TObject);
begin
  prcAtualizaPrecoMGV5;
end;

procedure TfrmCadProduto.ExportarProduto1Click(Sender: TObject);
begin
  prcExportaCadastroMGV5;
end;

procedure TfrmCadProduto.ListacomCdigodeBarras1Click(Sender: TObject);
var
  vArq: String;
begin
  if not(fDMCadProduto.cdsProduto_Consulta.Active) or (fDMCadProduto.cdsProduto_Consulta.IsEmpty) then
  begin
    MessageDlg('*** Não há produto selecionado para a impressão!', mtInformation, [mbOk], 0);
    exit;
  end;

  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Produtos_CBarra.fr3';
  if FileExists(vArq) then
    fDMCadProduto.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDMCadProduto.frxReport1.ShowReport;
end;

procedure TfrmCadProduto.btnAltRefEstruturadaClick(Sender: TObject);
begin
  if fDMCadProduto.cdsProdutoID_GRUPO.AsInteger <= 0 then
  begin
    MessageDlg('*** Estrutura não informada!', mtInformation, [mbOk], 0);
    exit;
  end;
  if fDMCadProduto.qParametros_ProdGERAR_REF_GRUPO.AsString <> 'S' then
  begin
    MessageDlg('*** Referência não esta marcada como estruturada!', mtInformation, [mbOk], 0);
    exit;
  end;
  prc_Gerar_Ref_Estruturada;
end;

procedure TfrmCadProduto.RxDBLookupCombo5Change(Sender: TObject);
begin
  if RxDBLookupCombo5.Text <> '' then
    lblEstrutura.Caption := fDMCadProduto.cdsGrupoNOME_SUPERIOR.AsString
  else
    lblEstrutura.Caption := '';
end;

procedure TfrmCadProduto.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if (RxDBLookupCombo3.Text <> '') then
  begin
    if (RxDBLookupCombo3.KeyValue <> fDMCadProduto.cdsNCMID.AsInteger) then
      fDMCadProduto.cdsNCM.Locate('ID',RxDBLookupCombo3.KeyValue,([Locaseinsensitive]));
    dbckbCalcular_ST.Visible := ((fDMCadProduto.cdsNCMGERAR_ST.AsString = 'S') and (fDMCadProduto.qParametros_ProdCONTROLAR_PROD_ST.AsString = 'S'));
  end
  else
    dbckbCalcular_ST.Visible := False;
end;

procedure TfrmCadProduto.NxButton2Click(Sender: TObject);
var
  vMSGAux: String;
begin
  vMSGAux := 'Esse CFOP vai ser usado na NFCe, ' + #13
           + 'e na NFe quando a venda for interna!';
  MessageDlg(vMSGAux, mtInformation, [mbOk], 0);
end;

function TfrmCadProduto.fnc_Monta_Nome_Estrutura(ID: Integer): String;
var
  sds: TSQLDataSet;
begin
  Result := '';
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'with recursive '
                       + ' GRUPO_REC AS ( '
                       + '  SELECT G.codigo, cast(nome as varchar(255)) nome, G.SUPERIOR, g.id, G.NOME NOME_FILHO '
                       + '    FROM GRUPO G'
                       + '  WHERE G.id = :CODIGO'
                       + '  UNION ALL'
                       + '  SELECT FILHO.CODIGO, filho.nome || ' + QuotedStr(' ** ') + ' || pai.nome, filho.superior, filho.id, FILHO.NOME NOME_FILHO'
                       + '    FROM GRUPO FILHO'
                       + '    JOIN GRUPO_REC PAI'
                       + '      ON PAI.superior = FILHO.id'
                       + '  )'
                       + ' SELECT FIRST 1 GG.* FROM GRUPO_REC GG'
                       + ' ORDER BY 1';
    sds.ParamByName('CODIGO').AsInteger := ID;
    sds.Open;
    Result := sds.FieldByName('nome').AsString;
  finally
    FreeAndNil(sds);
  end;

end;

procedure TfrmCadProduto.prcScroll(DataSet: TDataSet);
begin
  if not(fDMCadProduto.cdsProduto_Consulta.Active) or (fDMCadProduto.cdsProduto_Consulta.IsEmpty) or
        (fDMCadProduto.cdsProduto_ConsultaID.AsInteger <= 0) then
  begin
    exit;
  end;

  if not (fDMCadProduto.cdsProduto.State in [dsedit,dsinsert]) then
    prc_Posiciona_Produto;
end;

procedure TfrmCadProduto.DBEdit163Exit(Sender: TObject);
begin
  if not fnc_Existe_CBenef(DBEdit163.Text) then
  begin
    MessageDlg('*** Código Benefício Fiscal não encontrado!', mtInformation, [mbOk], 0);
    DBEdit163.SetFocus;
  end;
end;

procedure TfrmCadProduto.DBEdit163KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vCod_CBenef   := DBEdit163.Text;
    frmSel_CBenef := TfrmSel_CBenef.Create(Self);
    if (RxDBLookupCombo20.Text <> '') and (Length(RxDBLookupCombo20.Text) = 2) then
      frmSel_CBenef.vCod_CST := RxDBLookupCombo20.Text
    else
    if (RxDBLookupCombo25.Text <> '') and (Length(RxDBLookupCombo25.Text) = 2) then
      frmSel_CBenef.vCod_CST := RxDBLookupCombo25.Text;
    frmSel_CBenef.ShowModal;
    if trim(vCod_CBenef) <> '' then
      DBEdit163.Text := vCod_CBenef;
    FreeAndNil(frmSel_CBenef);
  end;
end;

procedure TfrmCadProduto.Excel1Click(Sender: TObject);
begin
  prc_CriaExcel(SMDBGrid1.DataSource);
end;

procedure TfrmCadProduto.prc_CriaExcel(vDados: TDataSource);
var
  planilha: variant;
  vTexto: string;
begin
  Screen.Cursor := crHourGlass;
  vDados.DataSet.First;

  planilha := CreateOleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do tela para o Excel';
  planilha.visible := true;

  prc_Preencher_Excel2(planilha, vDados, SMDBGrid1);

  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  vTexto := vTexto + Name + '_' + RzPageControl1.ActivePage.Caption;

  Planilha.ActiveWorkBook.SaveAs(vTexto);
  Screen.Cursor := crDefault;
end;

procedure TfrmCadProduto.prc_Abrir_Produto_Adicional(ID: Integer);
begin
  fDMCadProduto.cdsProduto_Adicional.Close;
  fDMCadProduto.sdsProduto_Adicional.ParamByName('ID').AsInteger := ID;
  fDMCadProduto.cdsProduto_Adicional.Open;
  fDMCadProduto.cdsProduto_Adicional.First;
  fDMCadProduto.cdsProduto_Adicional.Last;
end;

procedure TfrmCadProduto.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_F2) and (fDMCadProduto.cdsProduto_Adicional.State in [dsEdit,dsInsert]) then
  begin
    vCodProduto_Pos := 0;
    frmSel_Produto := TfrmSel_Produto.Create(Self);
    frmSel_Produto.vTipo_Prod := 'A';
    frmSel_Produto.ShowModal;
    if vCodProduto_Pos > 0 then
      fDMCadProduto.cdsProduto_AdicionalID_PRODUTO.AsInteger := vCodProduto_Pos;
    FreeAndNil(frmSel_Produto);
  end;

end;

end.


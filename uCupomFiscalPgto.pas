unit uCupomFiscalPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, RxLookup, StdCtrls, Buttons, Mask,
  DB, DBTables, RxDBComb, DBCtrls, ExtCtrls, UDMCupomFiscal, rsDBUtils,
    uDmMovimento, uDmParametros, ACBrBase, DBGrids,
  Grids, SMDBGrid, RzTabs, NxCollection, dbXPress, SqlExpr, ToolEdit, CurrEdit,
    StrUtils, Math, uCupomFiscalPgtoDet, uTipoDescontoItem,
  JvLabel, JvGroupBox, AdvPanel, DBClient, AdvEdit, uTipoFormaPagto,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins,
  dxSkinOffice2007Blue, dxSkinSeven, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup, dxSkinBlack, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

const
  InformandoVendedor = 'InformandoVendedor';
  InformandoFormaPagamento = 'InformandoFormaPagamento';
  InformandoValorRecebido = 'InformandoValorRecebido';
  FinalizandoVenda = 'FinalizandoVenda';

type
  TEnumTipoPrazo = (tpVista, tpPrazo);

type
  TfCupomFiscalPgto = class(TForm)
    pnlPrincipal: TAdvPanel;
    Label1: TLabel;
    grCliente: TJvGroupBox;
    pnlBotton: TAdvPanel;
    btConfirmar: TNxButton;
    btCancelar: TNxButton;
    btGaveta: TNxButton;
    AdvPanelStyler1: TAdvPanelStyler;
    pnlPagamentos: TAdvPanel;
    edtPagamento: TAdvEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    gridPagamentosDisponiveis: TDBGrid;
    Label11: TLabel;
    dsPagamentosSelecionados: TDataSource;
    mPagamentosSelecionados: TClientDataSet;
    mPagamentosSelecionadosNome: TStringField;
    mPagamentosSelecionadosValor: TFloatField;
    mPagamentosSelecionadosId: TIntegerField;
    ceJuros: TCurrencyEdit;
    Label17: TLabel;
    Edit1: TEdit;
    DBText1: TDBText;
    edtCodigoCliente: TDBEdit;
    btnCliente: TSpeedButton;
    edtNomeCliente: TEdit;
    gridPagamento: TSMDBGrid;
    mPagamentosSelecionadosTipo: TStringField;
    edtValorPagamento: TAdvEdit;
    grVendedor: TJvGroupBox;
    btnVendedor: TSpeedButton;
    edtCodigoVendedor: TDBEdit;
    edtNomeVendedor: TEdit;
    AdvPanel1: TAdvPanel;
    pnlTotal: TAdvPanel;
    Label15: TLabel;
    edtTotal: TDBEdit;
    pnlDesconto: TAdvPanel;
    Label8: TLabel;
    edtDesconto: TDBEdit;
    pnlTroca: TAdvPanel;
    lblVlr_Troca: TLabel;
    edtVlr_Troca: TDBEdit;
    pnlRecebido: TAdvPanel;
    lblRecebido: TLabel;
    edtVlrRecebido: TDBEdit;
    pnlTroco: TAdvPanel;
    Label5: TLabel;
    edtTroco: TDBEdit;
    rdgEnviaNFce: TcxRadioGroup;
    mTotalPagamentos: TClientDataSet;
    mTotalPagamentosValor: TFloatField;
    mTotalPagamentosTipo: TStringField;
    mTotalPagamentosId: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure comboCondicaoPgtoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btGavetaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure cbNFCeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ceJurosExit(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure edtPagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorPagamento1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridPagamentosDisponiveisDblClick(Sender: TObject);
    procedure gridPagamentosDisponiveisKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtValorPagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnClienteClick(Sender: TObject);
    procedure btnVendedorClick(Sender: TObject);
    procedure edtCodigoClienteExit(Sender: TObject);
  private
    { Private declarations }
    vPercJuros, vVlrDesconto_Ant : Real;
    vCpfOk: Boolean;
    vQtdParcelas: Word;
    ffrmTelaTipoDescontoItem: TfrmTelaTipoDescontoItem;
    vVlr_Desconto_Itens : Real;
    vCancelar : Boolean;

    procedure Gerar_Parcelas(vVlrParcelado, vTxJuros: Real; vQtdParc: Word);
    procedure Gravar_CupomFiscalParc(Data: TDateTime; Valor: Real);
    function Calcula_Troco: Boolean;
    function fncVerificaParc(vTotal: Currency): Boolean;
    procedure prc_EditaTodas(vRestante: Currency; vQtdParc: Word);
    procedure prc_EditaPrimeira(vRestante: Currency; vQtdParc: Word);
    procedure prc_ControleParcelas(vVlrParcelado, vVlrTxJuros: Real; vQtdParc:
      Word);
    function fnc_CalulaJuros(vVlrEntrada, vVlrFinanciado, vPercJuros: Real;
      vParcelas: Word): Real;
    procedure prc_CalculaJuros(vTaxa, vTotal, vItem: Real);
    procedure prcCorrigirParc(vTotal: Currency);
    function fnc_Aplicar_Desconto: Boolean;
    procedure prc_InformaCliente;
    procedure prc_InformaVendedor;
    procedure DrawControl(Control: TWinControl);

    procedure prc_Grava_Pagto_Selecionado(ID: Integer; Valor: Real);
    function fnc_valor_recebido: Real;
    procedure prc_Limpa_Campo_Cliente;
    procedure prc_Recalcular_Pagamentos;

    function fnc_Verifica_Cobranca : String;
    procedure prc_Remonta_Desconto;
        
  public
    { Public declarations }
    vSenhaVendedor: string;
    fDmCupomFiscal: TDmCupomFiscal;
    ffrmCupomFiscalPgtoDet : TfrmCupomFiscalPgtoDet;
    ffrmTelaTipoFormaPagto : TfrmTelaTipoFormaPagto;
    fDmMovimento: TDmMovimento;
    fDmParametros: TDmParametros;
    vTeste: Boolean;
    EstadoFechVenda: string;
    procedure prc_Calcular_CondPagto(Sender: TObject);
  end;

var
  fCupomFiscalPgto: TfCupomFiscalPgto;

implementation

//---------------TROCAR IMPRESSORA
uses
  UCupomFiscalCli, ACBrECF, DmdDatabase, uUtilPadrao, uCupomFiscalParcela, uUtilCliente, USel_Pessoa,
  uCalculo_CupomFiscal, UConsPessoa_Fin, uCupomCliente, uCupomDadosCli, UCupomFiscal, USenha, uGrava_Erro;

{$R *.dfm}

procedure TfCupomFiscalPgto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCupomFiscalPgto.Gerar_Parcelas(vVlrParcelado, vTxJuros: Real;
  vQtdParc: Word);
var
  vVlrParcelas: Real;
  vVlrRestante: Real;
  vDataAux: TDateTime;
  i: Word;
begin
  fDmCupomFiscal.vSomaParcelas := 0;
  if fDmCupomFiscal.cdsCupomFiscalTIPO_PGTO.AsString = 'V' then
  begin
    Gravar_CupomFiscalParc(fDmCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime, fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat);
    vVlrParcelas := StrToFloat(FormatFloat('0.00', vVlrParcelado));
    vVlrRestante := StrToFloat(FormatFloat('0.00', vVlrParcelado));
  end
  else
  begin
    if vTxJuros > 0 then
    begin
      if fDmCupomFiscal.cdsCupomFiscalVLR_OUTROS.AsCurrency > 0 then
      begin
        vVlrParcelas := StrToFloat(FormatFloat('0.00', vVlrParcelado / vQtdParc));
        vVlrRestante := StrToFloat(FormatFloat('0.00', vVlrParcelas * vQtdParc));
      end
      else
      begin
        vVlrParcelas := StrToFloat(FormatFloat('0.00', vVlrParcelado * ((vTxJuros / 100) / (1 - (Power(1 + (vTxJuros / 100), vQtdParc * -1))))));
        vVlrRestante := StrToFloat(FormatFloat('0.00', vVlrParcelas * vQtdParc));
      end;
    end
    else
    begin
      if vQtdParc > 1 then
      begin
        vVlrParcelas := StrToFloat(FormatFloat('0.00', vVlrParcelado / vQtdParc));
        vVlrRestante := StrToFloat(FormatFloat('0.00', vVlrParcelado));
      end
      else
      begin
        vVlrParcelas := StrToFloat(FormatFloat('0.00', vVlrParcelado));
        vVlrRestante := StrToFloat(FormatFloat('0.00', vVlrParcelado));
      end;
    end;
  end;
  fDmCupomFiscal.vSomaParcelas := StrToFloat(FormatFloat('0.00', vVlrRestante));

  if (fDmCupomFiscal.cdsCondPgto.Locate('ID', mPagamentosSelecionadosId.AsInteger,[loCaseInsensitive])) then
  begin
    if fDmCupomFiscal.cdsCondPgtoTIPO_CONDICAO.AsString = 'V' then
    begin

      vDataAux := fDmCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime;
      fDmCupomFiscal.cdsCondPgto_Dia.First;
      while not fDmCupomFiscal.cdsCondPgto_Dia.Eof do
      begin
        if (fDmCupomFiscal.cdsCondPgto_Dia.RecordCount = fDmCupomFiscal.cdsCondPgto_Dia.RecNo) and
          (StrToFloat(FormatFloat('0.00', vVlrParcelas)) <> StrToFloat(FormatFloat('0.00', vVlrRestante))) then
          vVlrParcelas := StrToFloat(FormatFloat('0.00', vVlrRestante));

        vDataAux := vDataAux + fDmCupomFiscal.cdsCondPgto_DiaQtdDias.AsInteger;
        Gravar_CupomFiscalParc(vDataAux, vVlrParcelas);
        vVlrRestante := StrToFloat(FormatFloat('0.00', vVlrRestante - vVlrParcelas));

        if StrToFloat(FormatFloat('0.00', vVlrRestante)) <= 0 then
          fDmCupomFiscal.cdsCondPgto_Dia.Last;
        fDmCupomFiscal.cdsCondPgto_Dia.Next;
      end
    end
    else
    begin
      vDataAux := fDmCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime;
      if fDmCupomFiscal.vDataEntrada > 1 then
        vDataAux := fDmCupomFiscal.vDataEntrada;
      for i := 1 to fDmCupomFiscal.cdsCondPgtoQTD_PARCELA.AsInteger do
      begin
        if StrToFloat(FormatFloat('0.00', vVlrParcelas)) > StrToFloat(FormatFloat('0.00', vVlrRestante)) then
          vVlrParcelas := StrToFloat(FormatFloat('0.00', vVlrRestante));
        if (i = fDmCupomFiscal.cdsCondPgtoQTD_PARCELA.AsInteger) and
          (StrToFloat(FormatFloat('0.00', vVlrParcelas)) < StrToFloat(FormatFloat('0.00', vVlrRestante))) then
          vVlrParcelas := StrToFloat(FormatFloat('0.00', vVlrParcelas + (vVlrRestante - vVlrParcelas)));
        vDataAux := IncMonth(vDataAux, 1);
        Gravar_CupomFiscalParc(vDataAux, vVlrParcelas);
        vVlrRestante := StrToFloat(FormatFloat('0.00', vVlrRestante - vVlrParcelas));
      end
    end;
  end;
end;

procedure TfCupomFiscalPgto.Gravar_CupomFiscalParc(Data: TDateTime; Valor: Real);
var
  vParcelaAux: Integer;
begin
  fDmCupomFiscal.cdsCupom_Parc.Last;
  if (Data = Date) and (fDmCupomFiscal.cdsCondPgtoENTRADA.AsString = 'S') then
    vParcelaAux := -1
  else
    vParcelaAux := fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger;

  fDmCupomFiscal.cdsCupom_Parc.Insert;
  fDmCupomFiscal.cdsCupom_ParcID.AsInteger := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
  fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger := vParcelaAux + 1;
  fDmCupomFiscal.cdsCupom_ParcDTVENCIMENTO.AsDateTime := Data;
  fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsFloat := StrToFloat(FormatFloat('0.00', Valor));
  if fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger = 0 then
  begin
    fDmCupomFiscal.qTipoDinheiro.Open;
    fDmCupomFiscal.cdsCupom_ParcID_TIPOCOBRANCA.AsInteger := fDmCupomFiscal.qTipoDinheiro.FieldByName('ID').AsInteger;
    fDmCupomFiscal.cdsCupom_ParcTIPO_COBRANCA.AsString := fDmCupomFiscal.qTipoDinheiro.FieldByName('NOME').AsString;
    fDmCupomFiscal.qTipoDinheiro.Close;
  end
  else
  begin
    fDmCupomFiscal.cdsCupom_ParcID_TIPOCOBRANCA.AsInteger := fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger;
    fDmCupomFiscal.cdsCupom_ParcTIPO_COBRANCA.AsString := fDmCupomFiscal.cdsTipoCobrancaNOME.AsString;
  end;
  fDmCupomFiscal.cdsCupom_ParcEDITADA.AsString := 'N';
  fDmCupomFiscal.cdsCupom_Parc.Post;
end;

function TfCupomFiscalPgto.Calcula_Troco: Boolean;
var
  vVlrRecebido: Real;
  vVlrTroco : Real;
begin
  vVlrRecebido := fnc_valor_recebido;
  vVlrTroco := (vVlrRecebido + edtValorPagamento.FloatValue) - fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat;
  fDmCupomFiscal.cdsCupomFiscalVLR_TROCO.AsFloat := vVlrTroco;
end;

procedure TfCupomFiscalPgto.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  EstadoFechVenda := InformandoFormaPagamento;
  mPagamentosSelecionados.Close;
  mPagamentosSelecionados.CreateDataSet;
  mPagamentosSelecionados.EmptyDataSet;

  //18/02/2020
  pnlTroca.Visible   := (StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat)) > 0);

  if not fdmCupomFiscal.cdsTipoCobranca.Active then
    fDmCupomFiscal.cdsTipoCobranca.Open;

  if fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString <> 'S' then
  begin
    if fDmCupomFiscal.cdsParametrosIMPRESSORA_FISCAL.AsString = '4' then
      fDmParametros.ACBrECF1.CarregaFormasPagamento;
  end;

//  vCpfOk := True;

  if fDmCupomFiscal.vClienteID > 0 then
  begin
    if fDmCupomFiscal.cdsPessoaCODIGO.AsInteger = fDmCupomFiscal.vClienteID then
    begin
      if (fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger <> fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger) and
        ((fDmCupomFiscal.cdsPessoaCNPJ_CPF.AsString <> '000.000.000-00') and
          (fDmCupomFiscal.cdsPessoaCNPJ_CPF.AsString <> '')) then
      begin
        fDmCupomFiscal.cdsCupomFiscalCPF.AsString := fDmCupomFiscal.cdsPessoaCNPJ_CPF.AsString;
        vDocumentoClienteVenda := fDmCupomFiscal.cdsPessoaCNPJ_CPF.AsString;
      end;
    end;
  end;

  fdmCupomFiscal.prc_Localizar_Pessoa(fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger, '');
  if not fDmCupomFiscal.cdsPessoa.IsEmpty then
    edtNomeCliente.Text := fDmCupomFiscal.cdsPessoaNOME.AsString;

  fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger := fDmCupomFiscal.cdsCupomParametrosID_TIPOCOBRANCA_PADRAO.AsInteger;
  if fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger > 0 then
  begin
    edtPagamento.Text := IntToStr(fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger);
    edtValorPagamento.FloatValue := fDmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsFloat - fDmCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsFloat;
    edtPagamentoKeyDown(Sender, Enter, [ssAlt]);
    EstadoFechVenda := InformandoValorRecebido;
  end
  else
  begin
    edtPagamento.SetFocus;
    EstadoFechVenda := InformandoFormaPagamento;
    edtValorPagamento.FloatValue := fDmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsFloat - fDmCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsFloat;
  end;

  //04/02/2017
  if fDmCupomFiscal.cdsCupomFiscalID_CONDPGTO.AsInteger <= 0 then
    fDmCupomFiscal.cdsCupomFiscalID_CONDPGTO.AsInteger :=
      fDmCupomFiscal.cdsCupomParametrosID_CONDPGTO_PADRAO.AsInteger;

  grVendedor.Visible := fDmCupomFiscal.cdsParametrosUSA_VENDEDOR.AsString = 'S';

  if EstadoFechVenda = InformandoValorRecebido then
    edtValorPagamento.SetFocus;

  //Arredonda os cantos das edit´s
  DrawControl(edtTotal);
  DrawControl(edtDesconto);
  DrawControl(edtPagamento);
  DrawControl(edtTroco);
  DrawControl(edtVlrRecebido);
  DrawControl(edtValorPagamento);
  DrawControl(edtVlr_Troca);
  //Desabilita a barra de rolagem da grid
  ShowScrollBar(gridPagamentosDisponiveis.Handle, SB_VERT, False);

  //18/02/2020
  if StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat)) > 0 then
  begin
    if (fDmCupomFiscal.cdsTipoCobranca.Locate('TROCA','S' ,[loCaseInsensitive])) then
    begin
      EstadoFechVenda        := InformandoValorRecebido;
      edtPagamento.Text      := fDmCupomFiscal.cdsTipoCobrancaID.AsString;
      edtValorPagamento.Text := FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat);
      edtValorPagamentoKeyDown(Sender, Enter, [ssAlt]);

      if (edtValorPagamento.Text <> EmptyStr) and (fDmCupomFiscal.cdsCupomParametrosID_TIPOCOBRANCA_PADRAO.AsInteger > 0) then
      begin
        edtPagamento.Text := IntToStr(fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger);
        edtPagamentoKeyDown(Sender, Enter, [ssAlt]);
        EstadoFechVenda := InformandoValorRecebido;
      end;
    end;
  end;
  vVlr_Desconto_Itens := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsFloat));
end;

procedure TfCupomFiscalPgto.comboCondicaoPgtoChange(Sender: TObject);
begin
  fDmCupomFiscal.cdsCupomFiscalTIPO_PGTO.AsString := fdmCupomFiscal.cdsCondPgtoTIPO.AsString;
  vQtdParcelas := fDmCupomFiscal.cdsCondPgtoQTD_PARCELA.AsInteger;
end;

procedure TfCupomFiscalPgto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 vPagamento : Integer;
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
  begin
    Edit1.Visible := not (Edit1.Visible);
  end;

  if (Key = Vk_F2) then
  begin
    prc_InformaCliente;
  end
  else if (Key = Vk_F3) then
  begin
    if fnc_Aplicar_Desconto then
    begin
      edtValorPagamento.FloatValue := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat - fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat));
      edtValorPagamento.SelectAll;
      if edtValorPagamento.FloatValue <= 0 then
      begin
        edtPagamento.Clear;
        EstadoFechVenda := FinalizandoVenda;
      end;
      if (edtValorPagamento.FloatValue > 0) and (edtPagamento.FloatValue <= 0) then
        edtPagamento.SetFocus
      else
        edtValorPagamento.SetFocus;
    end;
  end
  else if (Key = Vk_F4) then
    SpeedButton2Click(Sender)
  else if (Key = Vk_F6) then
    SpeedButton1Click(Sender)
  else if (Key = Vk_F7) and (grVendedor.Visible) then
    prc_InformaVendedor
  else if (Key = Vk_F8) then
    btGavetaClick(Sender)
  else if (Key = Vk_F9) and (rdgEnviaNFce.Visible) then
  begin
    if rdgEnviaNFce.ItemIndex = 0 then rdgEnviaNFce.ItemIndex := 1
    else if rdgEnviaNFce.ItemIndex = 1 then rdgEnviaNFce.ItemIndex := 0;
  end
  else if (Key = VK_TAB) then
  begin
    if edtValorPagamento.Focused then
      edtPagamento.SetFocus
    else
    if edtPagamento.Focused then
      edtValorPagamento.SetFocus;
  end
  else
  if (Key = VK_Escape) then
  begin
    prc_Remonta_Desconto;
    Close;
  end;

  if ssCtrl in Shift then
  begin
    case Upcase(Char(Key)) of
      'D' :
      begin
        if not (mPagamentosSelecionados.IsEmpty) then
          vPagamento :=  StrToIntDef(InputBox('Exclusão de Pagamento!', 'Informe o número do pagamento para exclusão?', IntToStr(vPagamento)),0);
        if mPagamentosSelecionados.Locate('Id',vPagamento,[loCaseInsensitive]) then
        begin
          prc_Recalcular_Pagamentos;
          mPagamentosSelecionados.Delete;
        end
        else
          edtPagamento.SetFocus;
      end;
    end;
  end;
end;

procedure TfCupomFiscalPgto.btConfirmarClick(Sender: TObject);
const
  vCliente : array[1..2] of String =('','99999');
var
  vGravar_Aux: Boolean;
  vGeraNFCe, vGravar_OK: Boolean;
  vAux: Integer;
  vIdCupom: Integer;
  vMSGAux: string;
  vExigeCliente : Boolean;
  vTipoFormaPagto : String;
begin
  if EstadoFechVenda <> FinalizandoVenda then
  begin
    edtValorPagamento.SetFocus;
    Exit;
  end;
  vGeraNFCe := False;
  if (fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString = 'S') then// and
//    (fDmCupomFiscal.cdsTipoCobranca.Locate('ID', fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger, [loCaseInsensitive])) then
    vGeraNFCe := (rdgEnviaNFce.ItemIndex = 0);
  if (vGeraNFCe) and (trim(fDmCupomFiscal.cdsFilialINSCR_EST.AsString) = '') then
  begin
    MessageDlg('*** Inscrição Estadual da Filial esta informada incorretamente!', mtInformation, [mbOk], 0);
    exit;
  end;
  mTotalPagamentos.Close;
  mTotalPagamentos.CreateDataSet;
  mTotalPagamentos.EmptyDataSet;

  fDmCupomFiscal.vCondicaoPgto := 0;

  vExigeCliente := False;
  //20/02/2020
  fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger := 0;
  mPagamentosSelecionados.First;
  while not mPagamentosSelecionados.Eof do
  begin

    if mPagamentosSelecionadosTipo.AsString = 'A' then
    begin
      try
        repeat
          ffrmTelaTipoFormaPagto := TfrmTelaTipoFormaPagto.Create(nil);
          begin
            ffrmTelaTipoFormaPagto.ShowModal;
            case TEnumTipoPrazo(ffrmTelaTipoFormaPagto.rdgTipoFormaPagto.ItemIndex) of
              tpVista : vTipoFormaPagto := 'V';
              tpPrazo : vTipoFormaPagto := 'P';
            end;
          end;
        until vTipoFormaPagto <> EmptyStr;
      finally
        FreeAndNil(ffrmTelaTipoFormaPagto);
      end;
    end
    else
      vTipoFormaPagto := mPagamentosSelecionadosTipo.AsString;

    if mTotalPagamentos.Locate('TIPO',vTipoFormaPagto,[loCaseInsensitive]) then
      mTotalPagamentos.Edit
    else
      mTotalPagamentos.Insert;
    mTotalPagamentosTipo.AsString := vTipoFormaPagto;
    mTotalPagamentosId.AsInteger := mPagamentosSelecionadosId.AsInteger;
    mTotalPagamentosValor.AsFloat := mTotalPagamentosValor.AsFloat + mPagamentosSelecionadosValor.AsFloat;
    mTotalPagamentos.Post;

    fDmCupomFiscal.prc_Inserir_FormaPagto;
    fDmCupomFiscal.cdsCupomFiscal_FormaPgtoID_TIPOCOBRANCA.AsInteger := mPagamentosSelecionadosId.AsInteger;
    fDmCupomFiscal.cdsCupomFiscal_FormaPgtoVALOR.AsFloat := mPagamentosSelecionadosValor.AsFloat;
    if fDmCupomFiscal.cdsCupomFiscal_FormaPgtoTIPO_PGTO.AsString = EmptyStr  then
      fDmCupomFiscal.cdsCupomFiscal_FormaPgtoTIPO_PGTO.AsString := vTipoFormaPagto;
    fDmCupomFiscal.cdsCupomFiscal_FormaPgto.Post;
    mPagamentosSelecionados.Next;
  end;

  //******************
  mTotalPagamentos.First;
  while not mTotalPagamentos.Eof do
  begin
    //19/04/2020
    fDmCupomFiscal.vCondicaoPgto := 0;

    //*****************
    vTipoFormaPagto := mTotalPagamentosTipo.AsString;

    if (SQLLocate('TIPOCOBRANCA','ID','CREDITO_LOJA',mTotalPagamentosId.AsString) = 'S') or (vTipoFormaPagto = 'P') then
    begin
      ffrmCupomFiscalPgtoDet := TfrmCupomFiscalPgtoDet.Create(nil);
      ffrmCupomFiscalPgtoDet.fdmCupomFiscal := fDmCupomFiscal;
      ffrmCupomFiscalPgtoDet.vVlr_Recebido := mTotalPagamentosValor.AsFloat;
      fDmCupomFiscal.vID_TipoCobranca := mTotalPagamentosId.AsInteger;
      //20/02/2020
      fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger := mTotalPagamentosId.AsInteger;
      //*****************
      ffrmCupomFiscalPgtoDet.ShowModal;
      if ffrmCupomFiscalPgtoDet.ModalResult = mrCancel then
      begin
        edtValorPagamento.SetFocus;
        FreeAndNil(ffrmCupomFiscalPgtoDet);
        Exit;
      end;
      FreeAndNil(ffrmCupomFiscalPgtoDet);
      if SQLLocate('TIPOCOBRANCA','ID','EXIGE_CLIENTE',mTotalPagamentosId.AsString) = 'S' then
        vExigeCliente := True;
    end
    else
    begin
      fDmCupomFiscal.vID_TipoCobranca := mTotalPagamentosId.AsInteger;
      fDmCupomFiscal.Gerar_Parcelas(mTotalPagamentosValor.AsFloat,0,1);
    end;
//    fDmCupomFiscal.prc_Inserir_FormaPagto;
//    fDmCupomFiscal.cdsCupomFiscal_FormaPgtoID_TIPOCOBRANCA.AsInteger := mTotalPagamentosId.AsInteger;
//    fDmCupomFiscal.cdsCupomFiscal_FormaPgtoVALOR.AsFloat := mTotalPagamentosValor.AsFloat;
//    if fDmCupomFiscal.cdsCupomFiscal_FormaPgtoTIPO_PGTO.AsString = EmptyStr  then
//      fDmCupomFiscal.cdsCupomFiscal_FormaPgtoTIPO_PGTO.AsString := vTipoFormaPagto;
//    fDmCupomFiscal.cdsCupomFiscal_FormaPgto.Post;

    prc_Calcular_Geral(fDmCupomFiscal,vVlr_Desconto_Itens);
    mTotalPagamentos.Next;
  end;

  if (vExigeCliente) and ansiMatchStr(fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsString,vCliente) then
  begin
    repeat
      prc_InformaCliente;
    until fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger > 0;
  end;

  vCodPessoa_Pos := 0;
  if (fDmCupomFiscal.cdsCupomParametrosEXIGE_VENDEDOR.AsString = 'S') and
    (fDmCupomFiscal.cdsCupomFiscalID_VENDEDOR.AsInteger = 0) then
  begin
    repeat
      begin
        prc_InformaVendedor;
        if vCancelar then
          Exit;
      end;
    until fDmCupomFiscal.cdsCupomFiscalID_VENDEDOR.AsInteger > 0;
  end
  else if fDmCupomFiscal.vID_Fechamento > 0 then
    fDmCupomFiscal.cdsCupomFiscalID_FECHAMENTO.AsInteger := fDmCupomFiscal.vID_Fechamento;

  if (fDmCupomFiscal.cdsCupomParametrosSOLICITA_CPF.AsString = 'F') and (not vCpfOK) then
    fDmCupomFiscal.prc_Digita_Documento;

  if fDmCupomFiscal.cdsPessoaCODIGO.AsInteger <> fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger then
  begin
    fdmCupomFiscal.prc_Localizar_Pessoa(fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger, '');
    if not fDmCupomFiscal.cdsPessoa.IsEmpty then
      raise Exception.Create('Cliente: ' +
        fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsString + ', não encontrado!');
  end;

  vExcluir_Cupom := False;

  //Alertar valores em atraso  12/05/2015
  if (fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger <> fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger) and
    (fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger > 0) then
  begin
    vGravar_Aux :=
      fnc_Controle_Financeiro(fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat,
      fDmCupomFiscal.cdsPessoaVLR_LIMITE_CREDITO.AsFloat,
      fDmCupomFiscal.cdsParametrosUSA_LIMITE_CREDITO.AsString,
      fDmCupomFiscal.cdsParametrosSENHA_CREDITO.AsString,
      fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger);
    if not vGravar_Aux then
    begin
      vExcluir_Cupom := True;
      exit;
    end;
  end;
  //////////////////

  fDmCupomFiscal.vNome_Consumidor := '';

  try
    if (fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString = 'S') and ((fDmCupomFiscal.cdsCupomFiscalNUMCUPOM.AsInteger <= 0) or
        (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'COM') or (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'ORC') or
        (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString = 'PED')) then
    begin
      fDmCupomFiscal.qProximoCupom.Close;
      fDmCupomFiscal.qProximoCupom.ParamByName('FILIAL').AsInteger := fDmCupomFiscal.cdsCupomFiscalFILIAL.AsInteger;

      if vGeraNFCe then
      begin
        vAux := dmDatabase.ProximaSequencia('NUM_NFC', vFilial, IntToStr(fDmCupomFiscal.cdsCupomFiscalSERIE.AsInteger));
        fDmCupomFiscal.cdsCupomFiscalNUMCUPOM.AsInteger := vAux;
        fDmCupomFiscal.cdsCupomFiscalSERIE.AsString := fDmCupomFiscal.cdsCupomFiscalSERIE.AsString;
        fDmCupomFiscal.cdsCupomFiscalTIPO.AsString := 'NFC';
      end
      else
      begin
        vAux := dmDatabase.ProximaSequencia('NUM_CNF', vFilial, IntToStr(fDmCupomFiscal.cdsCupomFiscalSERIE.AsInteger));
        fDmCupomFiscal.cdsCupomFiscalNUMCUPOM.AsInteger := vAux;
        fDmCupomFiscal.cdsCupomFiscalSERIE.AsString := fDmCupomFiscal.cdsCupomFiscalSERIE.AsString;
        fDmCupomFiscal.cdsCupomFiscalTIPO.AsString := 'CNF';
      end;
    end;
    vIdCupom := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;

    fDmCupomFiscal.cdsCupomFiscalCOPIADO.AsString := 'S';

    if fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit, dsInsert] then
      fDmCupomFiscal.cdsCupomFiscal.Post;

    if fDmCupomFiscal.cdsCupomFiscal.ApplyUpdates(0) <= 0 then
    begin
      vGravar_OK := True;
      fDmCupomFiscal.vEncerrado := True;
      //18/02/2020
      if fDmCupomFiscal.cdsCupom_Troca.Active then
      begin
        if fDmCupomFiscal.cdsCupom_Troca.State in [dsEdit,dsInsert] then
          fDmCupomFiscal.cdsCupom_Troca.Post;
        fDmCupomFiscal.cdsCupom_Troca.ApplyUpdates(0);
      end;
      //******************
    end;

    if fDmCupomFiscal.cdsParametrosGRAVAR_CONSUMO_NOTA.AsString = 'S' then
      fDmCupomFiscal.cdsCupomFiscal_ProdPrincipal.ApplyUpdates(0);
  except
    on e: Exception do
    begin
      raise Exception.Create('Erro ao gravar cupom: ' + #13 + e.Message +
        //#13 + #13 'Feche o programa e abra novamente!');
        #13 + #13 + 'Favor confirmar novamente e verificar se o cupom foi enviado corretamente!');
    end;
  end;
  if not vGravar_OK then
  begin
    fDmCupomFiscal.cdsCupomFiscal.Edit;
    exit;
  end;

  vIdCupom := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
  fdmCupomFiscal.cdsCupomFiscal.Close;
  fDmCupomFiscal.cdsCupom_Troca.Close;

  fDmCupomFiscal.prcLocalizar(vIdCupom);

  //Atualiza os pedidos   02/05/2018
  if fDmCupomFiscal.cdsCupomParametrosUSA_COPIA_PEDIDO_CF.AsString = 'S' then
  begin
    fDmCupomFiscal.cdsCupom_Itens.First;
    while not fDmCupomFiscal.cdsCupom_Itens.Eof do
    begin
      if fDmCupomFiscal.cdsCupom_ItensID_PEDIDO.AsInteger > 0 then
      begin
        if not fDmCupomFiscal.mPedidoAux.Locate('ID_Pedido', fDmCupomFiscal.cdsCupom_ItensID_PEDIDO.AsInteger, [loCaseInsensitive]) then
        begin
          fDmCupomFiscal.mPedidoAux.Insert;
          fDmCupomFiscal.mPedidoAuxID_Pedido.AsInteger := fDmCupomFiscal.cdsCupom_ItensID_PEDIDO.AsInteger;
          fDmCupomFiscal.mPedidoAux.Post;
        end;
      end;
      fDmCupomFiscal.cdsCupom_Itens.Next;
    end;
    fDmCupomFiscal.mPedidoAux.First;
    while not fDmCupomFiscal.mPedidoAux.Eof do
    begin
      fDmCupomFiscal.sdsPrc_Atualiza_Status_Ped.Close;
      fDmCupomFiscal.sdsPrc_Atualiza_Status_Ped.ParamByName('P_ID').AsInteger := fDmCupomFiscal.mPedidoAuxID_Pedido.AsInteger;
      fDmCupomFiscal.sdsPrc_Atualiza_Status_Ped.ExecSQL;
      fDmCupomFiscal.mPedidoAux.Delete;
    end;
  end;

  Close;
end;

procedure TfCupomFiscalPgto.btCancelarClick(Sender: TObject);
begin
  fdmCupomFiscal.cdsCupom_Parc.EmptyDataSet;
  Close;
end;

procedure TfCupomFiscalPgto.btnGerarParcelasClick(Sender: TObject);
begin
  if StrToFloat(FormatFloat('0.00',
    fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat)) <= 0 then
  begin
    fDmCupomFiscal.cdsCupom_Parc.First;
    while not fDmCupomFiscal.cdsCupom_Parc.Eof do
      fDmCupomFiscal.cdsCupom_Parc.Delete;
  end;
end;

procedure TfCupomFiscalPgto.SMDBGrid1DblClick(Sender: TObject);
var
  vRestante, vVlrOriginal: Real;
  vQtdParc: Word;
begin
  fCupomFiscalParcela := TfCupomFiscalParcela.Create(Self);
  fCupomFiscalParcela.fdmCupomFiscal := fDmCupomFiscal;
  vVlrOriginal := fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency;
  fDmCupomFiscal.cdsCupom_Parc.Edit;
  fCupomFiscalParcela.ShowModal;

  if vVlrOriginal <> fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency then
  begin
    fDmCupomFiscal.cdsCupom_Parc.Edit;
    fDmCupomFiscal.cdsCupom_ParcEDITADA.AsString := 'S';
    fDmCupomFiscal.cdsCupom_Parc.Post;
    fDmCupomFiscal.vPgtoEditado := True;
  end;
  vRestante := fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsCurrency;
  vQtdParc := fDmCupomFiscal.cdsCupom_Parc.RecordCount;

  if fDmCupomFiscal.cdsCupomParametrosRACHAR_CONTA.AsString = 'S' then
    prc_EditaTodas(vRestante, vQtdParc)
  else
    prc_EditaPrimeira(vRestante, vQtdParc);
end;

procedure TfCupomFiscalPgto.btGavetaClick(Sender: TObject);
begin
  prc_AbreGaveta(1);
end;

procedure TfCupomFiscalPgto.SpeedButton1Click(Sender: TObject);
begin
  frmConsPessoa_Fin := TfrmConsPessoa_Fin.Create(self);
  frmConsPessoa_Fin.vID_Pessoa_Cons := fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger;
  frmConsPessoa_Fin.Label2.Caption := fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString;
  frmConsPessoa_Fin.ShowModal;
end;

procedure TfCupomFiscalPgto.SpeedButton2Click(Sender: TObject);
var
  ffrmCupomDadosCli: TfrmCupomDadosCli;
begin
  if (fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger > 0) and
    (fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger <>  fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger) then
    MessageDlg('*** Consumidor já identificado no cadastro!', mtInformation, [mbOk], 0)
  else
  begin
    ffrmCupomDadosCli := TfrmCupomDadosCli.Create(Self);
    ffrmCupomDadosCli.fDmCupomFiscal := fDmCupomFiscal;
    ffrmCupomDadosCli.ShowModal;
    FreeAndNil(ffrmCupomDadosCli);
  end;
end;

procedure TfCupomFiscalPgto.DBEdit9Exit(Sender: TObject);
begin
  fdmCupomFiscal.cdsCupomFiscalCLIENTE_OBS.AsString := Trim(fdmCupomFiscal.cdsCupomFiscalCLIENTE_OBS.AsString);
end;

function TfCupomFiscalPgto.fncVerificaParc(vTotal: Currency): Boolean;
var
  vTot: Currency;
begin
  vTot := 0;
  fDmCupomFiscal.cdsCupom_Parc.First;
  while not fDmCupomFiscal.cdsCupom_Parc.Eof do
  begin
    vTot := vTot + fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency;
    fDmCupomFiscal.cdsCupom_Parc.Next;
  end;
  Result := True;
  if FormatFloat('0.00', vTot) <> FormatFloat('0.00', vTotal) then
    Result := False;
end;

procedure TfCupomFiscalPgto.cbNFCeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(Sender as TWinControl, True, True);
end;

procedure TfCupomFiscalPgto.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(Sender as TWinControl, True, True);
end;

procedure TfCupomFiscalPgto.prc_EditaTodas(vRestante: Currency; vQtdParc: Word);
var
  vParcMexida: Word;
  vDiferenca, vSoma: Real;
begin
  vParcMexida := 0;

  fDmCupomFiscal.cdsCupom_Parc.First;
  while not fDmCupomFiscal.cdsCupom_Parc.Eof do
  begin
    if (fDmCupomFiscal.cdsCupom_ParcEDITADA.AsString = 'S') then
    begin
      vRestante := vRestante -
        fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency;
      Inc(vParcMexida);
    end
    else
    begin
      fDmCupomFiscal.cdsCupom_Parc.Edit;
      fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency := StrToFloat(FormatFloat('0.00', vRestante / (vQtdParc - vParcMexida)));
      fDmCupomFiscal.cdsCupom_Parc.Post;
    end;
    fDmCupomFiscal.cdsCupom_Parc.Next;
  end;

  vSoma := 0;
  vDiferenca := 0;
  fDmCupomFiscal.cdsCupom_Parc.First;
  while not fDmCupomFiscal.cdsCupom_Parc.Eof do
  begin
    vSoma := vSoma + fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency;
    fDmCupomFiscal.cdsCupom_Parc.Next;
  end;

  vDiferenca := StrToFloat(FormatFloat('0.00',
    fdmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsCurrency - vSoma));
  if vDiferenca <> 0 then
  begin
    fDmCupomFiscal.cdsCupom_Parc.Edit;
    fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency := fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency + vDiferenca;
    fDmCupomFiscal.cdsCupom_Parc.Post;
  end;
end;

procedure TfCupomFiscalPgto.prc_EditaPrimeira(vRestante: Currency; vQtdParc:
  Word);
var
  vParcMexida: Word;
  vSoma, vDiferenca: Real;
begin
  vParcMexida := 0;

  fDmCupomFiscal.cdsCupom_Parc.First;
  while not fDmCupomFiscal.cdsCupom_Parc.Eof do
  begin
    if (fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger = 0) then
    begin
      vRestante := vRestante - fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency;
      Inc(vParcMexida);
    end
    else if (fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger = 1) and
      (fDmCupomFiscal.cdsCupom_ParcEDITADA.AsString = 'S') then
    begin
      vRestante := vRestante - fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency;
      Inc(vParcMexida);
    end
    else
    begin
      fDmCupomFiscal.cdsCupom_Parc.Edit;
      fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency := StrToFloat(FormatFloat('0.00', vRestante / (vQtdParc - vParcMexida)));
      fDmCupomFiscal.cdsCupom_Parc.Post;
    end;
    fDmCupomFiscal.cdsCupom_Parc.Next;
  end;

  vSoma := 0;
  vDiferenca := 0;
  fDmCupomFiscal.cdsCupom_Parc.First;
  while not fDmCupomFiscal.cdsCupom_Parc.Eof do
  begin
    vSoma := vSoma + fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency;
    fDmCupomFiscal.cdsCupom_Parc.Next;
  end;

  vDiferenca := StrToFloat(FormatFloat('0.00', fdmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsCurrency - vSoma));
  if vDiferenca <> 0 then
  begin
    fDmCupomFiscal.cdsCupom_Parc.Edit;
    fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency := fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency + vDiferenca;
    fDmCupomFiscal.cdsCupom_Parc.Post;
  end;
end;

procedure TfCupomFiscalPgto.prc_ControleParcelas(vVlrParcelado, vVlrTxJuros:
  Real; vQtdParc: Word);
begin
  fDmCupomFiscal.cdsCupom_Parc.First;
  while not fDmCupomFiscal.cdsCupom_Parc.Eof do
  begin
    if fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger = 0 then
      fDmCupomFiscal.cdsCupom_Parc.Next
    else
      fDmCupomFiscal.cdsCupom_Parc.Delete;
  end;
  Gerar_Parcelas(vVlrParcelado, vVlrTxJuros, vQtdParc);
  fDmCupomFiscal.vPgtoEditado := False;
end;

function TfCupomFiscalPgto.fnc_CalulaJuros(vVlrEntrada, vVlrFinanciado,
  vPercJuros: Real; vParcelas: Word): Real;
begin
  Result := StrToFloat(FormatFloat('0.00', vVlrFinanciado / ((1 - power((1 + vPercJuros / 100), (-1 * vParcelas))) / (vPercJuros / 100)) * vParcelas));
  Result := Result + vVlrEntrada;
end;

procedure TfCupomFiscalPgto.prcCorrigirParc(vTotal: Currency);
var
  vTot: Currency;
begin
  vTot := 0;
  fDmCupomFiscal.cdsCupom_Parc.First;
  while not fDmCupomFiscal.cdsCupom_Parc.Eof do
  begin
    vTot := vTot + fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency;
    fDmCupomFiscal.cdsCupom_Parc.Next;
  end;
  if StrToFloat(FormatFloat('0.00', vTot)) > StrToFloat(FormatFloat('0.00', vTotal)) then
  begin
    vTot := vTot - vTotal;
    fDmCupomFiscal.cdsCupom_Parc.Edit;
    fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency := fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency - vTot;
    fDmCupomFiscal.cdsCupom_Parc.Post;
  end
  else if StrToFloat(FormatFloat('0.00', vTot)) < StrToFloat(FormatFloat('0.00', vTotal)) then
  begin
    vTot := vTotal - vTot;
    fDmCupomFiscal.cdsCupom_Parc.Edit;
    fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency := fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency + vTot;
    fDmCupomFiscal.cdsCupom_Parc.Post;
  end;
end;

procedure TfCupomFiscalPgto.prc_CalculaJuros(vTaxa, vTotal, vItem: Real);
begin
  fDmCupomFiscal.cdsCupom_ItensVLR_JUROS.AsCurrency := fDmCupomFiscal.cdsCupom_ItensVLR_JUROS.AsCurrency * (vTaxa / 100);
end;

procedure TfCupomFiscalPgto.ceJurosExit(Sender: TObject);
begin
  fDmCupomFiscal.prc_Calcular_Valor_Juros(ceJuros.Value);
end;

procedure TfCupomFiscalPgto.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  if Msg.CharCode = VK_F10 then
  begin
    Handled := True;
    btConfirmar.Click;
  end;

  if Msg.CharCode = VK_F5 then
  begin
    Handled := True;
    fDmCupomFiscal.prc_Digita_Documento;
  end;
end;

procedure TfCupomFiscalPgto.prc_Calcular_CondPagto(Sender: TObject);
var
  vVlrParcelado, vVlrTotal, vVlrProdutos: Real;
begin
  while not fDmCupomFiscal.cdsCupom_Parc.IsEmpty do
    fDmCupomFiscal.cdsCupom_Parc.Delete;

  if ceJuros.Value > 0 then
    ceJurosExit(Sender);

  fDmCupomFiscal.vVlrEntrada := 0;
  fDmCupomFiscal.vDataEntrada :=
    fDmCupomFiscal.cdsCupomFiscalDTEMISSAO.AsDateTime;
  if (fDmCupomFiscal.cdsCondPgtoTIPO.AsString = 'P') and
    (fDmCupomFiscal.cdsCondPgtoTIPO_CONDICAO.AsString = 'V') then
    vQtdParcelas := fDmCupomFiscal.cdsCondPgto_Dia.RecordCount
  else
    vQtdParcelas := fDmCupomFiscal.cdsCondPgtoQTD_PARCELA.AsInteger;
  if fDmCupomFiscal.cdsCondPgtoENTRADA.AsString = 'S' then
  begin
    fDmCupomFiscal.cdsCupom_Parc.Insert;
    fDmCupomFiscal.cdsCupom_ParcID.AsInteger := fDmCupomFiscal.cdsCupomFiscalID.AsInteger;
    fDmCupomFiscal.cdsCupom_ParcDTVENCIMENTO.AsDateTime := Date;
    fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger := 0;

    fDmCupomFiscal.qTipoDinheiro.Open;
    fDmCupomFiscal.cdsCupom_ParcID_TIPOCOBRANCA.AsInteger := fDmCupomFiscal.qTipoDinheiro.FieldByName('ID').AsInteger;
    fDmCupomFiscal.qTipoDinheiro.Close;

    fCupomFiscalParcela := TfCupomFiscalParcela.Create(Self);
    fCupomFiscalParcela.fDmCupomFiscal := fDmCupomFiscal;
    fCupomFiscalParcela.ShowModal;
  end;

  //////////////////////////////////////////////
  fDMCupomFiscal.cdsCupomFiscalVLR_COFINS.AsFloat := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_ICMS.AsFloat := 0;
  fDMCupomFiscal.cdsCupomFiscalBASE_ICMS.AsFloat := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_IPI.AsFloat := 0;

  fDmCupomFiscal.cdsCupomFiscalBASE_ICMSSUBST_RET.AsFloat := 0;
  fDmCupomFiscal.cdsCupomFiscalVLR_ICMSSUBST_RET.AsFloat := 0;
  fDmCupomFiscal.cdsCupomFiscalVLR_BASE_EFET.AsFloat := 0;
  fDmCupomFiscal.cdsCupomFiscalVLR_ICMS_EFET.AsFloat := 0;

  fDMCupomFiscal.cdsCupomFiscalVLR_PIS.AsFloat := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO.AsFloat := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_ESTADUAL.AsFloat := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_FEDERAL.AsFloat := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_MUNICIPAL.AsFloat := 0;
  //////////////////////////////////////////////

  vVlrParcelado := fDmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsCurrency - fDmCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsCurrency -
                   fDmCupomFiscal.vVlrEntrada + fDmCupomFiscal.cdsCupomFiscalVLR_OUTROS.AsCurrency;

  prc_ControleParcelas(vVlrParcelado, 0, vQtdParcelas);

  vVlrTotal := StrToFloat(FormatFloat('0.00', fDmCupomFiscal.vVlrEntrada + fDmCupomFiscal.vSomaParcelas));
  vVlrProdutos := fDmCupomFiscal.vSomaOriginal;

  ffrmCupomFiscalPgtoDet := TfrmCupomFiscalPgtoDet.Create(nil);
  prc_Calcular_Geral(fDmCupomFiscal);

end;

function TfCupomFiscalPgto.fnc_Aplicar_Desconto: Boolean;
var
  vDescValor: Double;
  vDescPerc: Double;
begin
  Result := False;
  if not mPagamentosSelecionados.IsEmpty then
  begin
    mPagamentosSelecionados.First;
    while not mPagamentosSelecionados.Eof do
    begin
      if SQLLocate('TIPOCOBRANCA','ID','TROCA',mPagamentosSelecionadosId.AsString) <> 'S' then
      begin
        edtValorPagamento.FloatValue := fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat;
        fDmCupomFiscal.cdsCupomFiscalVLR_RECEBIDO.AsFloat := fDmCupomFiscal.cdsCupomFiscalVLR_RECEBIDO.AsFloat - mPagamentosSelecionadosValor.AsFloat;
        EstadoFechVenda := InformandoFormaPagamento;
        mPagamentosSelecionados.Delete;
      end
      else
        mPagamentosSelecionados.Next;
    end;
  end;
  ffrmTelaTipoDescontoItem := TfrmTelaTipoDescontoItem.Create(nil);
  ffrmTelaTipoDescontoItem.vValorOriginal := fDmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsFloat;
  ffrmTelaTipoDescontoItem.ShowModal;
  if ffrmTelaTipoDescontoItem.ModalResult = mrCancel then
    Exit;
  with ffrmTelaTipoDescontoItem do
  begin
    //if vVlrDesconto_Ant > 0 then
    begin
      case tEnumTipoDesconto(rdgDescontoUnitario.ItemIndex) of
        tpPercentual:
          begin
            vDescPerc := EditDesconto.Value;
            vDescValor := 0;
          end;
        tpValor:
          begin
            vDescPerc := 0;
            vDescValor := EditDesconto.Value;
          end;
        tpValorPago:
          begin
            vDescPerc := 0;
            vDescValor := fdmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsFloat - EditDesconto.Value;
          end;
      end;
    end;
  end;

  if vDescPerc > 0 then
    //07/04/2020
    //vDescValor := fdmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsFloat * (vDescPerc / 100);
    vDescValor := (fdmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsFloat - vVlr_Desconto_Itens) * (vDescPerc / 100);

  if (vDescValor > 0) and (vDescValor > fdmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsFloat) then
  begin
    MessageDlg('O valor do desconto informado é maior que o valor total dos produtos!', mtInformation, [mbOK], 0);
    Result := False;
    Exit;
  end;
  fDmCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsCurrency := vDescValor + vVlr_Desconto_Itens;
  //fdmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsCurrency    := StrToFloat(FormatFloat('0.00',fdmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsCurrency -
  //                                                        (fdmCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsCurrency + fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat)));
  fdmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsCurrency    := StrToFloat(FormatFloat('0.00',fdmCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsCurrency -
                                                          (fdmCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsCurrency)));
  prc_Calcular_Geral(fDmCupomFiscal,vVlr_Desconto_Itens);
  Result := True;
end;

procedure TfCupomFiscalPgto.prc_InformaCliente;
begin
  if not fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.isnull then
    vCodPessoa_Pos := fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger;
  frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
  frmSel_Pessoa.vTipo_Pessoa := 'C';
  frmSel_Pessoa.ShowModal;

  if vCodPessoa_Pos > 0 then
  begin
    fdmCupomFiscal.prc_Localizar_Pessoa(vCodPessoa_Pos, '');
    if not fDmCupomFiscal.cdsPessoa.IsEmpty then
    begin
      fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger := vCodPessoa_Pos;

      fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString := Trim(fDmCupomFiscal.cdsPessoaNOME.AsString);
      edtNomeCliente.Text := Trim(fDmCupomFiscal.cdsPessoaNOME.AsString);

      if (not fDmCupomFiscal.cdsPessoaCNPJ_CPF.IsNull) then
      begin
        fDmCupomFiscal.cdsCupomFiscalCPF.AsString := fDmCupomFiscal.cdsPessoaCNPJ_CPF.AsString;
        vDocumentoClienteVenda := fDmCupomFiscal.cdsPessoaCNPJ_CPF.AsString;
      end;


      if (fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger = fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger) and
        (trim(fDmCupomFiscal.vNome_Consumidor) <> '') then
      begin
        fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString := Trim(fDmCupomFiscal.vNome_Consumidor);
      end
      else
      begin
        fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString :=  Trim(fDmCupomFiscal.cdsPessoaNOME.AsString);
        fDmCupomFiscal.cdsCupomFiscalCPF.AsString := fDmCupomFiscal.cdsPessoaCNPJ_CPF.AsString;
        //20/01/2017
        fDmCupomFiscal.cdsCupomFiscalCLIENTE_FONE.AsString := '';
        if trim(fDmCupomFiscal.cdsPessoaTELEFONE1.AsString) <> '' then
        begin
          if trim(fDmCupomFiscal.cdsPessoaDDDFONE1.AsString) <> '' then
            fDmCupomFiscal.cdsCupomFiscalCLIENTE_FONE.AsString := fDmCupomFiscal.cdsPessoaDDDFONE1.AsString + '.';
          fDmCupomFiscal.cdsCupomFiscalCLIENTE_FONE.AsString := Trim(fDmCupomFiscal.cdsCupomFiscalCLIENTE_FONE.AsString + fDmCupomFiscal.cdsPessoaTELEFONE1.AsString);
        end;
      end;
      if not (fDmCupomFiscal.cdsPessoaENDERECO.IsNull) and
        (trim(fDmCupomFiscal.cdsPessoaENDERECO.AsString) <> '') then
      begin
        fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := fDmCupomFiscal.cdsPessoaENDERECO.AsString + ', ' +
          fDmCupomFiscal.cdsPessoaNUM_END.AsString + ' - ' +
          fDmCupomFiscal.cdsPessoaCOMPLEMENTO_END.AsString + ' - ' +
          fDmCupomFiscal.cdsPessoaBAIRRO.AsString + ' - ' +
          fDmCupomFiscal.cdsPessoaCIDADE.AsString;
      end;
      fDmCupomFiscal.vClienteID := vCodPessoa_Pos;
    end
    else
    begin
      ShowMessage('Cliente: ' + IntToStr(vCodPessoa_Pos) + ', não localizado!');
    end;
  end;

end;

procedure TfCupomFiscalPgto.prc_InformaVendedor;
var
  vPerc_Venda: Real;
begin
  vSenha := '';
  vSenhaVendedor := fDmCupomFiscal.cdsVendedorSENHA.AsString;
  vPerc_Venda := 0;

  if not fDmCupomFiscal.cdsCupomFiscalID_VENDEDOR.isnull then
    vCodPessoa_Pos := fDmCupomFiscal.cdsCupomFiscalID_VENDEDOR.AsInteger;
  frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
  frmSel_Pessoa.vFilial_Vend := 0;
  if fDmCupomFiscal.qParametros_GeralUSAR_PESSOA_FILIAL.AsString = 'S' then
    frmSel_Pessoa.vFilial_Vend := fDmCupomFiscal.cdsCupomFiscalFILIAL.AsInteger;
  frmSel_Pessoa.vTipo_Pessoa := 'V';
  frmSel_Pessoa.ShowModal;
  vCancelar := False;
  if frmSel_Pessoa.ModalResult = mrCancel then
    vCancelar := True;
  FreeAndNil(frmSel_Pessoa);

  if vCodPessoa_Pos > 0 then
  begin
    vPerc_Venda := StrToFloatDef(SQLLocate('PESSOA', 'CODIGO', 'PERC_COMISSAO_VEND', IntToStr(vCodPessoa_Pos)), 0);
    fDmCupomFiscal.cdsCupomFiscalPERC_VENDEDOR.AsFloat := vPerc_Venda;
    fDmCupomFiscal.cdsCupomFiscalNOME_VENDEDOR.AsString := SQLLocate('PESSOA', 'CODIGO', 'NOME', IntToStr(vCodPessoa_Pos));
    edtNomeVendedor.Text := fDmCupomFiscal.cdsCupomFiscalNOME_VENDEDOR.AsString;
    fDmCupomFiscal.cdsCupomFiscalID_VENDEDOR.AsInteger := vCodPessoa_Pos;
  end
  else
    fDmCupomFiscal.cdsCupomFiscalPERC_VENDEDOR.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  if (fDmCupomFiscal.cdsCupomParametrosAUTENTICA_VENDEDOR.AsString = 'S') and (vSenha = '') and (trim(vSenhaVendedor) <> '') then
  begin
    frmSenha := TfrmSenha.Create(Self);
    frmSenha.Label2.Caption := 'Autenticar Vendedor';
    frmSenha.Label3.Caption := '';
    frmSenha.Label4.Caption := 'Informe a Senha';

    frmSenha.vSenha_Param := vSenhaVendedor;
    frmSenha.ShowModal;
    if trim(vSenha) <> trim(vSenhaVendedor) then
    begin
      ShowMessage('Senha inválida!');
      vCodPessoa_Pos := 0;
      fDmCupomFiscal.cdsCupomFiscalPERC_VENDEDOR.AsFloat := 0;
      fDmCupomFiscal.cdsCupomFiscalNOME_VENDEDOR.AsString := '';
      edtNomeVendedor.Text := '';
    end;
  end;

end;

procedure TfCupomFiscalPgto.DrawControl(Control: TWinControl);
var
  R: TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 10, 10);
    Perform(EM_GETRECT, 0, lParam(@r));
    InflateRect(r, -5, -5);
    Perform(EM_SETRECTNP, 0, lParam(@r));
    SetWindowRgn(Handle, rgn, True);
    Invalidate;
  end;
end;

procedure TfCupomFiscalPgto.edtPagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if EstadoFechVenda = InformandoFormaPagamento then
    begin
      if edtPagamento.Text <> '' then
      begin
        if fDmCupomFiscal.cdsTipoCobranca.Locate('ID',StrToInt(edtPagamento.Text), [loCaseInsensitive]) then
        begin
          EstadoFechVenda := InformandoValorRecebido;
          edtValorPagamento.SelectAll;
          edtValorPagamento.SetFocus;
        end
        else
        begin
          MessageDlg('Pagamento Informado não existe', mtError, [mbOK], 0);
          edtPagamento.SelectAll;
          edtPagamento.SetFocus;
        end;
      end;
    end
    else
    if EstadoFechVenda = InformandoValorRecebido then
    begin
      if fDmCupomFiscal.cdsTipoCobranca.Locate('ID',StrToInt(edtPagamento.Text), [loCaseInsensitive]) then
      begin
        edtValorPagamento.SelectAll;
        edtValorPagamento.SetFocus;
      end
      else
      begin
        MessageDlg('Pagamento Informado não existe', mtError, [mbOK], 0);
        edtPagamento.SelectAll;
        edtPagamento.SetFocus;
      end;
    end;
  end;
end;

procedure TfCupomFiscalPgto.prc_Grava_Pagto_Selecionado(ID: Integer; Valor:  Real);
var
  vGerarAux : String;
begin
  if mPagamentosSelecionados.Locate('ID', ID, [loCaseInsensitive]) then
    mPagamentosSelecionados.Edit
  else
    mPagamentosSelecionados.Insert;
  mPagamentosSelecionadosId.AsInteger  := ID;
  mPagamentosSelecionadosValor.AsFloat := mPagamentosSelecionadosValor.AsFloat + Valor;
  mPagamentosSelecionadosNome.AsString := Trim(SQLLocate('TIPOCOBRANCA', 'ID','NOME', IntToStr(ID)));
  mPagamentosSelecionadosTipo.AsString := Trim(SQLLocate('TIPOCOBRANCA', 'ID','FORMA_PGTO', IntToStr(ID)));
  if mPagamentosSelecionadosTipo.AsString = EmptyStr then
    mPagamentosSelecionadosTipo.AsString := 'V';
  mPagamentosSelecionados.Post;

  vGerarAux := fnc_Verifica_Cobranca;

//  Label10.Visible := (vGerarAux = 'O');
//  cbNFCe.Visible  := (vGerarAux = 'O');

  rdgEnviaNFce.Visible  := (vGerarAux = 'O');
  if vGerarAux = 'O' then
    rdgEnviaNFce.ItemIndex := 1
  else
  if vGerarAux = 'S' then
    rdgEnviaNFce.ItemIndex := 0
  else
  if vGerarAux = 'N' then
    rdgEnviaNFce.ItemIndex := 1;

  //Desabilita a barra de rolagem da grid
  ShowScrollBar(gridPagamento.Handle, SB_VERT, False);
end;

procedure TfCupomFiscalPgto.edtValorPagamento1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vValorTotal: Real;
  vValorRestante: Real;
  vValorTroco : Real;
  vValorRecebido : Real;
begin
  if key = Enter then
  begin
    if EstadoFechVenda = FinalizandoVenda then
      btConfirmar.SetFocus;
    if EstadoFechVenda = InformandoValorRecebido then
    begin
      if not (edtValorPagamento.FloatValue > 0) then
      begin
        Informa('Valor informado deve ser maior que Zero!') ;
        edtValorPagamento.SelectAll;
        Exit ;
      end;
      vValorRestante := 0;
      vValorTotal := 0;
      vValorTroco := 0;
      vValorRecebido := fnc_valor_recebido;
      vValorTotal := fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat;

      if vValorRecebido >= vValorTotal then
      begin
        Informa('Soma dos recebimento é maior que o total do cupom!') ;
        btConfirmar.SetFocus;
        Exit ;
      end;

      if FormatFloat('0.00', vValorTotal) = FormatFloat('0.00', vValorRecebido + edtValorPagamento.FloatValue) then
      begin
        vValorRestante :=  edtValorPagamento.FloatValue;
        EstadoFechVenda := FinalizandoVenda;
        prc_Grava_Pagto_Selecionado(StrToInt(edtPagamento.Text),vValorRestante);
        vValorRecebido := vValorRecebido + edtValorPagamento.FloatValue;
        edtPagamento.Clear;
        edtValorPagamento.Clear;
      end
      else
      if vValorTotal < (vValorRecebido + edtValorPagamento.FloatValue) then
      begin
        vValorRestante := vValorTotal - vValorRecebido;
        Calcula_Troco;
        EstadoFechVenda := FinalizandoVenda;
        prc_Grava_Pagto_Selecionado(StrToInt(edtPagamento.Text),vValorRestante);
        vValorRecebido := vValorRecebido + edtValorPagamento.FloatValue;
        edtPagamento.Clear;
        edtValorPagamento.Clear;
      end
      else
      begin
        vValorRestante := vValorTotal - (vValorRecebido + edtValorPagamento.FloatValue);
        prc_Grava_Pagto_Selecionado(StrToInt(edtPagamento.Text),edtValorPagamento.FloatValue);
        EstadoFechVenda := InformandoFormaPagamento;
        edtPagamento.Clear;
        edtPagamento.SetFocus;
        vValorRecebido := vValorRecebido + edtValorPagamento.FloatValue;
        edtValorPagamento.FloatValue := vValorRestante;
      end;
      fDmCupomFiscal.cdsCupomFiscalVLR_RECEBIDO.AsFloat := vValorRecebido;
    end;
  end;
end;

function TfCupomFiscalPgto.fnc_valor_recebido: Real;
begin
  Result := 0;
  if not mPagamentosSelecionados.IsEmpty then
  begin
    mPagamentosSelecionados.First;
    while not mPagamentosSelecionados.Eof do
    begin
      Result := Result + mPagamentosSelecionadosValor.AsFloat;
      mPagamentosSelecionados.Next;
    end;
  end;
end;

procedure TfCupomFiscalPgto.gridPagamentosDisponiveisDblClick(
  Sender: TObject);
begin
  edtPagamento.Text := IntToStr(fDmCupomFiscal.cdsTipoCobrancaID.AsInteger);
  edtPagamentoKeyDown(Sender, Enter, [ssAlt]);
end;

procedure TfCupomFiscalPgto.gridPagamentosDisponiveisKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Enter then
  begin
    edtPagamento.Text := IntToStr(fDmCupomFiscal.cdsTipoCobrancaID.AsInteger);
    edtPagamentoKeyDown(Sender, Enter, [ssAlt]);
  end;
end;

procedure TfCupomFiscalPgto.edtValorPagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vValorTotal: Real;
  vValorRestante: Real;
  vValorTroco : Real;
  vValorRecebido : Real;
begin
  if key = Enter then
  begin
    if EstadoFechVenda = FinalizandoVenda then
    begin
      btConfirmarClick(Sender);
      Exit;
    end;
    if EstadoFechVenda = InformandoValorRecebido then
    begin
      if not (edtValorPagamento.FloatValue > 0) then
      begin
        Informa('Valor informado deve ser maior que Zero!') ;
        edtValorPagamento.SelectAll;
        Exit ;
      end;
      vValorRestante := 0;
      vValorTotal := 0;
      vValorTroco := 0;
      vValorRecebido := fnc_valor_recebido;
      vValorTotal := fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat;

      if vValorRecebido >= vValorTotal then
      begin
        Informa('Soma dos recebimento é maior que o total do cupom!') ;
        btConfirmar.SetFocus;
        Exit ;
      end;

      if FormatFloat('0.00', vValorTotal) = FormatFloat('0.00', vValorRecebido + edtValorPagamento.FloatValue) then
      begin
        vValorRestante :=  edtValorPagamento.FloatValue;
        EstadoFechVenda := FinalizandoVenda;
        prc_Grava_Pagto_Selecionado(StrToInt(edtPagamento.Text),vValorRestante);
        vValorRecebido := vValorRecebido + edtValorPagamento.FloatValue;
        edtPagamento.Clear;
        edtValorPagamento.Clear;
      end
      else
      if vValorTotal < (vValorRecebido + edtValorPagamento.FloatValue) then
      begin
        vValorRestante := vValorTotal - vValorRecebido;
        Calcula_Troco;
        EstadoFechVenda := FinalizandoVenda;
        prc_Grava_Pagto_Selecionado(StrToInt(edtPagamento.Text),vValorRestante);
        vValorRecebido := vValorRecebido + edtValorPagamento.FloatValue;
        edtPagamento.Clear;
        edtValorPagamento.Clear;
      end
      else
      begin
        vValorRestante := vValorTotal - (vValorRecebido + edtValorPagamento.FloatValue);
        prc_Grava_Pagto_Selecionado(StrToInt(edtPagamento.Text),edtValorPagamento.FloatValue);
        EstadoFechVenda := InformandoFormaPagamento;
        edtPagamento.Clear;
        edtPagamento.SetFocus;
        vValorRecebido := vValorRecebido + edtValorPagamento.FloatValue;
        edtValorPagamento.FloatValue := vValorRestante;
      end;
      fDmCupomFiscal.cdsCupomFiscalVLR_RECEBIDO.AsFloat := vValorRecebido;
    end;
  end;
end;

procedure TfCupomFiscalPgto.btnClienteClick(Sender: TObject);
begin
  prc_InformaCliente;
end;

procedure TfCupomFiscalPgto.btnVendedorClick(Sender: TObject);
begin
  prc_InformaVendedor;
end;

procedure TfCupomFiscalPgto.edtCodigoClienteExit(Sender: TObject);
begin
  if StrToIntDef(edtCodigoCliente.Text,0) = 0 then
  begin
    prc_Limpa_Campo_Cliente;
  end;
end;

procedure TfCupomFiscalPgto.prc_Limpa_Campo_Cliente;
begin
  fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger := 0;
  edtNomeCliente.Text := '';
  fDmCupomFiscal.cdsCupomFiscalCPF.AsString := '';
  vDocumentoClienteVenda := '';
end;

procedure TfCupomFiscalPgto.prc_Recalcular_Pagamentos;
begin
  fDmCupomFiscal.cdsCupomFiscalVLR_RECEBIDO.AsFloat := fDmCupomFiscal.cdsCupomFiscalVLR_RECEBIDO.AsFloat - mPagamentosSelecionadosValor.AsFloat;
  EstadoFechVenda := InformandoFormaPagamento;
  edtPagamento.SetFocus;
  edtValorPagamento.FloatValue := fDmCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat - fDmCupomFiscal.cdsCupomFiscalVLR_RECEBIDO.AsFloat;
end;

function TfCupomFiscalPgto.fnc_Verifica_Cobranca: String;
var
  vTexto : String;
  vOpcional : Boolean;
begin
  Result    := 'O';
  vOpcional := False;
  mPagamentosSelecionados.First;
  while not mPagamentosSelecionados.Eof do
  begin
    vTexto := Trim(SQLLocate('TIPOCOBRANCA', 'ID','GERAR_NFCE', IntToStr(mPagamentosSelecionadosId.AsInteger)));
    if vTexto = 'S' then
      mPagamentosSelecionados.Last
    else
    if vTexto = 'O' then
      vOpcional := True;
    mPagamentosSelecionados.Next;
  end;
  Result := vTexto;
  if (vTexto <> 'S') and (vOpcional) then
    Result := 'O';
end;

procedure TfCupomFiscalPgto.prc_Remonta_Desconto;
begin
  fDmCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsFloat := vVlr_Desconto_Itens;
  prc_Calcular_Geral(fDmCupomFiscal,vVlr_Desconto_Itens);
end;

end.

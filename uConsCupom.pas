unit uConsCupom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxLookup, NxCollection, StdCtrls, Mask, ToolEdit, Grids,
  DBGrids, SMDBGrid, uDmCupomFiscal, uUtilPadrao, uNFCE_ACBr, uConsCupomItens,
  cxStyles, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins, rsDBUtils,
  dxSkinOffice2007Blue, dxSkinSeven, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxLookAndFeels, cxGrid, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  AdvPanel,Classe.Enviar.NFCe,
  Menus, RzPanel, CurrEdit, ComCtrls, JvStatusBar;
type
  TfrmConsCupom = class(TForm)
    pnlPrincipal: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1NUMCUPOM: TcxGridDBColumn;
    cxGrid1DBTableView1DTEMISSAO: TcxGridDBColumn;
    cxGrid1DBTableView1VLR_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1CANCELADO: TcxGridDBColumn;
    cxGrid1DBTableView1CPF: TcxGridDBColumn;
    cxGrid1DBTableView1NFECHAVEACESSO: TcxGridDBColumn;
    cxGrid1DBTableView1NFEPROTOCOLO: TcxGridDBColumn;
    cxGrid1DBTableView1NFERECIBO: TcxGridDBColumn;
    cxGrid1DBTableView1SERIE: TcxGridDBColumn;
    cxGrid1DBTableView1CLIENTE_NOME: TcxGridDBColumn;
    cxGrid1DBTableView1HREMISSAO: TcxGridDBColumn;
    cxGridViewRepository1: TcxGridViewRepository;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxStyleRepository1: TcxStyleRepository;
    AdvPanel1: TAdvPanel;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    ImprimirCupom1: TMenuItem;
    ImprimirCarne1: TMenuItem;
    ImprimiraConsulta1: TMenuItem;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    gbxVendedor: TRzGroupBox;
    SMDBGrid2: TSMDBGrid;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    Label5: TLabel;
    Label6: TLabel;
    PopupMenu2: TPopupMenu;
    BuscaNFCeWeb1: TMenuItem;
    ImprimirCNFPedido1: TMenuItem;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    cxGrid1DBTableView1Column10: TcxGridDBColumn;
    ImprimirComItensA41: TMenuItem;
    ImprimirItensSintticoA41: TMenuItem;
    cxGrid1DBTableView1Column11: TcxGridDBColumn;
    cxGrid1DBTableView1Column12: TcxGridDBColumn;
    NaoEnviado: TcxStyle;
    Normal: TcxStyle;
    Cancelado: TcxStyle;
    AdvPanel3: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    Label7: TLabel;
    dtInicial: TDateEdit;
    dtFinal: TDateEdit;
    cbNEnviados: TCheckBox;
    edtSerie: TEdit;
    ComboVendedor: TRxDBLookupCombo;
    ComboBox1: TComboBox;
    ComboTerminal: TRxDBLookupCombo;
    edtHoraInicial: TMaskEdit;
    edtHoraFinal: TMaskEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    pnlMensagem: TPanel;
    lblPedido: TLabel;
    btnConsultar: TNxButton;
    btnEnviar: TNxButton;
    btnReimprimir: TNxButton;
    btnExcluir: TNxButton;
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEnviarClick(Sender: TObject);
    procedure GridCupomDblClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure btnExcluirClick(Sender: TObject);
    procedure ImprimirCupom1Click(Sender: TObject);
    procedure ImprimirCarne1Click(Sender: TObject);
    procedure ImprimiraConsulta1Click(Sender: TObject);
    procedure BuscaNFCeWeb1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ImprimirCNFPedido1Click(Sender: TObject);
    procedure ImprimirComItensA41Click(Sender: TObject);
    procedure ImprimirItensSintticoA41Click(Sender: TObject);
    procedure cxGrid1DBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    { Private declarations }
    fNFCE_ACBr: TfNFCE_ACBR;
    procedure prc_Consultar(ID :Integer);
    procedure prc_Consultar_Total_FormaPagto;
    procedure prc_Ajusta_Tela;
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
    ffrmConsCupomItens: TfrmConsCupomItens;
    vCancelar: Boolean;
    vExcluir: Boolean;
    vAceita_Converter : Boolean;
    procedure evMensagem(Msg : String);
    procedure RetornoMSG(Msg : String);
  end;

var
  frmConsCupom: TfrmConsCupom;

implementation

uses DmdDatabase;


{$R *.dfm}

procedure TfrmConsCupom.FormShow(Sender: TObject);
var
  i: Integer;
  vTexto: String;
begin
  fNFCE_ACBr := TfNFCE_ACBR.Create(nil);
  if not Assigned(fDmCupomFiscal) then
    fDmCupomFiscal := TDmCupomFiscal.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  fDmCupomFiscal.vConverter_NFCe := False;
  if not fDmCupomFiscal.cdsVendedor.Active then
    fDmCupomFiscal.prc_Abrir_cdsVendedor;

  fDmCupomFiscal.cdsTerminal.Open;
  dtInicial.Date := Date;
  dtFinal.Date := Date;
  ComboTerminal.KeyValue := vTerminal;
  if vCancelar then
    btnEnviar.Caption := 'Cancelar';
  if vExcluir then
  begin
    btnEnviar.Caption := 'Excluir';
    btnEnviar.Glyph := nil;
  end;
  if (fDmCupomFiscal.cdsFilial.RecordCount = 1) and (vTerminal > 0) then
    ComboTerminal.KeyValue := vTerminal;
//  fNFCE_ACBr.evMsg := evMensagem;

  Label7.Visible           := (fDmCupomFiscal.cdsCupomParametrosUSA_CANAL_VENDA.AsString = 'S');
  RxDBLookupCombo1.Visible := (fDmCupomFiscal.cdsCupomParametrosUSA_CANAL_VENDA.AsString = 'S');
  btnConsultarClick(Sender);

  for i := 0 to cxGrid1DBTableView1.ColumnCount - 2 do
  begin
    vTexto := cxGrid1DBTableView1.Columns[i].DataBinding.FieldName;
    if vtexto = 'NOME_CANALVENDA' then
      cxGrid1DBTableView1.Columns[i].Visible := (fDmCupomFiscal.cdsCupomParametrosUSA_CANAL_VENDA.AsString = 'S');
  end;
  prc_Ajusta_Tela;  
end;

procedure TfrmConsCupom.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar(0);
  prc_Consultar_Total_FormaPagto;
end;

procedure TfrmConsCupom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fDmCupomFiscal.vAceita_Converter := False;
  if fDmCupomFiscal.Owner.ClassName  = Self.ClassName then
    FreeAndNil(fDmCupomFiscal);
  Action := Cafree;
  FreeAndNil(fNFCE_ACBr);
end;

procedure TfrmConsCupom.btnEnviarClick(Sender: TObject);
var
  NumCupom: string;
  i, Selecionado: integer;
  IDCupomAux : integer;
  vAux: Integer;
  RetornoUser: TInfoRetornoUser;
  RetornaCampoUsuario : String;
  aEnvioNFCe : TEnvioNFCe;

begin
  fDmCupomFiscal.vConverter_NFCe := False;
  if vCancelar then
  begin
    if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO_CANCELADA.AsString) <> EmptyStr then
    begin
      MessageDlg('*** Cupom já cancelado!', mtInformation, [mbOk], 0);
      exit;
    end;
    if fDmCupomFiscal.cdsCupomParametrosAUTENTICA_USUARIO.asString = 'S' then
    begin
      RetornaCampoUsuario := AutenticaUsuario(vUsuario,'',RetornoUser);
      if RetornaCampoUsuario <> 'S' then
        Exit;
    end;

    IDCupomAux := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
    NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);
    if MessageDlg('Tem certeza que deseja cancelar o Cupom Nº: ' + NumCupom, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;

    fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
    fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
    fNFCE_ACBr.ComboAmbiente.ItemIndex := StrToIntDef(fdmCupomFiscal.cdsFilialNFCEPRODUCAO.AsString, 1) - 1;
    fDmCupomFiscal.cdsCupomFiscal.Close;
    try
      fNFCE_ACBr.btCancelarClick(Sender);
      fDmCupomFiscal.prc_Voltar_Comanda(IDCupomAux);
    except
      on E: Exception do
      begin
        ShowMessage('Erro: ' + e.Message);
      end;
    end;
    btnConsultarClick(Sender);
  end
  else if vExcluir then
  begin
    if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO_CANCELADA.AsString) <> EmptyStr then
    begin
      MessageDlg('*** Cupom já cancelado!', mtInformation, [mbOk], 0);
      exit;
    end;
    if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO.AsString) <> EmptyStr then
    begin
      MessageDlg('*** Cupom já enviado!', mtInformation, [mbOk], 0);
      exit;
    end;

    NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);
    if MessageDlg('Tem certeza que deseja cancelar o Cupom Nº: ' + NumCupom, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
    fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
    fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
    fNFCE_ACBr.ComboAmbiente.ItemIndex := StrToIntDef(fdmCupomFiscal.cdsFilialNFCEPRODUCAO.AsString, 1) - 1;
    fDmCupomFiscal.cdsCupomFiscal.Close;
    try
      fNFCE_ACBr.btCancelarClick(Sender);
    except
      on E: Exception do
      begin
        ShowMessage('Erro: ' + e.Message);
      end;
    end;
    btnConsultarClick(Sender);
  end
  else

  begin
    try
      if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO.AsString) <> EmptyStr then
      begin
        MessageDlg('*** Cupom já enviado!', mtInformation, [mbOk], 0);
        exit;
      end;
      if (fDMCupomFiscal.cdsCupom_ConsTIPO.AsString <> 'NFC') and (fDMCupomFiscal.cdsCupom_ConsTIPO.AsString <> 'CNF') then
      begin
        MessageDlg('*** Tipo não é permitido enviar!', mtInformation, [mbOk], 0);
        exit;
      end;
      if (fDMCupomFiscal.cdsCupom_ConsTIPO.AsString = 'CNF') and not(fDmCupomFiscal.vAceita_Converter) then
      begin
        MessageDlg('*** Não é permitido converter pela consulta, precisa entrar com F11 na tela do Cupom Fiscal!', mtInformation, [mbOk], 0);
        exit;
      end;

      //23/03/2020
      if fDmCupomFiscal.cdsCupom_ConsTIPO.AsString = 'CNF' then
        if MessageDlg('Tem certeza que deseja converter? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
          Exit
        else
        begin
          fDmCupomFiscal.vConverter_NFCe := True;
          vID_Cupom_Pos   := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
          Close;
          exit;
        end;
      NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);
      if not fDmCupomFiscal.vConverter_NFCe then
        if MessageDlg('Tem certeza que deseja reenviar o Cupom Selecionado? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
          Exit;
      fDmCupomFiscal.cdsCupom_Cons.DisableControls;
      fDmCupomFiscal.cdsCupom_Cons.First;
      //não trocar o indice 0 na grid

      for i := 0 to cxGrid1DBTableView1.Controller.SelectedRowCount - 1 do
      begin

        aEnvioNFCe := TEnvioNFCe.Create(vFilial);
        try
          aEnvioNFCe.evMsg := evMensagem;
          aEnvioNFCe.evRetornoMsg := RetornoMSG;
          aEnvioNFCe.IDCupom := cxGrid1DBTableView1.Controller.SelectedRows[i].Values[1];
          aEnvioNFCe.Gerar_NFCe;
          aEnvioNFCe.AssinarNFCe;
          aEnvioNFCe.ValidarNFCe;
          aEnvioNFCe.Imprimir := False;
          if not aEnvioNFCe.Enviar then
          begin
            MessageDlg('Erro transmitir NFCe: ', mtInformation,[mbOK],0);
          end;
        finally
          aEnvioNFCe.Free;
        end;
      end;

      if not fDmCupomFiscal.vConverter_NFCe then
        btnConsultarClick(Sender);
    finally
      fDmCupomFiscal.cdsCupom_Cons.EnableControls;
    end;
  end;
  if fDmCupomFiscal.vConverter_NFCe then
    Close;
end;

procedure TfrmConsCupom.prc_Consultar(ID :Integer);
var
  vComando: string;
  vTipo: String;
begin
  fDmCupomFiscal.cdsCupom_Cons.Close;
  vComando := fDmCupomFiscal.ctConsCupom;
  if ID > 0 then
    vComando := vComando + 'WHERE CF.ID = ' + IntToStr(ID)
  else
  begin
    vComando := vComando + 'WHERE 0=0 ';
//    vComando := vComando + ' AND CF.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicial.date));
//    vComando := vComando + ' AND CF.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtFinal.date));
    vComando := vComando + ' AND CAST(CF.dtemissao|| ''' + ' ''||CF.hremissao as timestamp) >= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', dtInicial.date) + ' ' + edtHoraInicial.Text);
    vComando := vComando + ' AND CAST(CF.dtemissao|| ''' + ' ''||CF.hremissao as timestamp) <= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', dtFinal.date) + ' ' + edtHoraFinal.Text);

    if ComboTerminal.KeyValue > 0 then
      vComando := vComando + ' AND TERMINAL_ID = ' + ComboTerminal.Value;
    if vCancelar then
    begin
      cbNEnviados.Checked := False;
      cbNEnviados.Enabled := False;
      vComando := vComando + ' AND CF.NFEPROTOCOLO IS NOT NULL AND CF.NFEPROTOCOLO_CANCELADA IS NULL';
    end;
    if not vCancelar then
      if cbNEnviados.Checked then
        vComando := vComando + ' AND CF.NFECHAVEACESSO IS NULL';
    if edtSerie.Text <> EmptyStr then
      vComando := vComando + ' AND CF.SERIE = ' + QuotedStr(edtSerie.Text);
    if ComboVendedor.KeyValue > 0 then
      vComando := vComando + ' AND CF.ID_VENDEDOR = ' + ComboVendedor.Value;
    if ComboBox1.ItemIndex > 0 then
    begin
      case ComboBox1.ItemIndex of
        1: vTipo := 'CNF';
        2: vTipo := 'NFC';
        3: vTipo := 'PED';
        4: vTipo := 'ORC';
        5: vTipo := 'COM';
      end;
      vComando := vComando + ' AND TIPO = ' + QuotedStr(vTipo);
    end;
    if ComboBox1.ItemIndex <> 5 then
      vComando := vComando + ' AND ((TIPO <> ' + QuotedStr('COM') + ') or (TIPO = ' + QuotedStr('COM') +
                             ' AND  CF.ID_TIPOCOBRANCA IS NULL  and Coalesce(COPIADO,' + QuotedStr('N') +') <> ' + QuotedStr('S') + '))';

    if (RxDBLookupCombo1.Text <> '[Todos]') and (RxDBLookupCombo1.Text <> '') and (RxDBLookupCombo1.Visible) then
      vComando := vComando + ' AND CF.ID_CANAL_VENDA = ' + IntToStr(RxDBLookupCombo1.KeyValue);

    vComando := vComando + ' ORDER BY CF.HREMISSAO DESC';

  end;
  fDmCupomFiscal.sdsCupom_Cons.CommandText := vComando;
  fDmCupomFiscal.cdsCupom_Cons.Open;
end;

procedure TfrmConsCupom.GridCupomDblClick(Sender: TObject);
begin
  if fDmCupomFiscal.cdsCupom_Cons.IsEmpty then
    Exit;
  fDmCupomFiscal.prcLocalizar(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
  ffrmConsCupomItens := TfrmConsCupomItens.Create(nil);
  ffrmConsCupomItens.fDMCupomFiscal := fDmCupomFiscal;
  ffrmConsCupomItens.ShowModal;
  FreeAndNil(ffrmConsCupomItens);
end;

procedure TfrmConsCupom.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if fDmCupomFiscal.cdsCupom_Cons.IsEmpty then
    Exit;
  fDmCupomFiscal.prcLocalizar(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
  ffrmConsCupomItens := TfrmConsCupomItens.Create(nil);
  ffrmConsCupomItens.fDMCupomFiscal := fDmCupomFiscal;
  ffrmConsCupomItens.ShowModal;
  FreeAndNil(ffrmConsCupomItens);

end;

procedure TfrmConsCupom.btnExcluirClick(Sender: TObject);
var
  NumCupom: String;
  RetornoUser: TInfoRetornoUser;
  RetornaCampoUsuario : String;
begin
  if fDmCupomFiscal.cdsCupomParametrosAUTENTICA_USUARIO.asString = 'S' then
  begin
    RetornaCampoUsuario := AutenticaUsuario(vUsuario,'',RetornoUser);
    if RetornaCampoUsuario <> 'S' then
      Exit;
  end;

  if (trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO.AsString) <> EmptyStr) or (trim(fDMCupomFiscal.cdsCupom_ConsNFECHAVEACESSO.AsString) <> EmptyStr) then
  begin
    MessageDlg('*** Cupom já enviado!', mtInformation, [mbOk], 0);
    exit;
  end;
  fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
  NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);

  if MessageDlg('Tem certeza que deseja Excluir o Cupom Nº: ' + NumCupom, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  if (NumCupom <> EmptyStr) and (fDmCupomFiscal.cdsCupom_ConsTIPO.AsString = 'NFC') then
  begin
    if MessageDlg('Deseja inutilizar a No: ' + NumCupom, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        fNFCE_ACBr.prc_Inutilizar_Cupom(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
      except
        on E: Exception do
         ShowMessage('Não foi possível inutilizar a numeração do cupom ' + #10#13 + E.Message);
      end;
    end;
  end;
  fDmCupomFiscal.prc_Excluir_Cupom_Fiscal(fDmCupomFiscal.cdsCupom_ConsID.AsInteger,'S');
  btnConsultarClick(Sender);
end;

procedure TfrmConsCupom.ImprimirCupom1Click(Sender: TObject);
begin
  fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
  fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
  fDmCupomFiscal.cdsCupomFiscal.Close;
  try
    fNFCE_ACBr.btImprimirClick(Sender);
  except
    on E: Exception do
    begin
      ShowMessage('Erro: ' + e.Message);
    end;
  end;
  fDmCupomFiscal.cdsCupomFiscal.Close;
end;

procedure TfrmConsCupom.ImprimirCarne1Click(Sender: TObject);
var
  vArq: string;
begin
  if not (fDmCupomFiscal.cdsCupom_Cons.Active) or (fDmCupomFiscal.cdsCupom_Cons.IsEmpty) then
    Exit;
  fDmCupomFiscal.prcLocalizar(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
  if fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger <= 0 then
    exit;
  fDmCupomFiscal.cdsTipoCobranca.Locate('ID', fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger, [loCaseInsensitive]);
  if fDmCupomFiscal.cdsTipoCobrancaIMPRIME_CARNE.AsString <> 'S' then
    exit;
  if fDmCupomFiscal.cdsCupomParametrosCARNE_RELATORIO.AsString <> '' then
    vArq := fDmCupomFiscal.cdsCupomParametrosCARNE_RELATORIO.AsString
  else
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\CarnePgto1.fr3';
  if FileExists(vArq) then
    fDmCupomFiscal.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDmCupomFiscal.frxReport1.ShowReport;
end;

procedure TfrmConsCupom.ImprimiraConsulta1Click(Sender: TObject);
var
  vArq : String;
begin
  fDmCupomFiscal.cdsCupom_Cons.IndexFieldNames := 'TIPO;SERIE;NUMCUPOM';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Cupom_Cons.fr3';
  if FileExists(vArq) then
  begin
    fDmCupomFiscal.frxReport1.Report.LoadFromFile(vArq);
    fDmCupomFiscal.frxReport1.Variables['ImpData'] := QuotedStr('Inicio: ' + dtInicial.Text + ' a ' + dtFinal.Text);
    fDmCupomFiscal.frxReport1.ShowReport;
  end
  else
    ShowMessage('Relatório não localizado! ' + vArq);
end;

procedure TfrmConsCupom.prc_Consultar_Total_FormaPagto;
var
  vComando: String;
  vTipo: String;
  vVlrVendas : Real;
begin
  fDmCupomFiscal.cdsTotal_FormaPagto.Close;
  vComando := 'SELECT TC.NOME, SUM(PAGTO.valor) VALOR FROM CUPOMFISCAL CF '
            + 'INNER JOIN cupomfiscal_formapgto PAGTO ON CF.ID = PAGTO.ID '
            + 'INNER JOIN TIPOCOBRANCA TC ON (PAGTO.ID_TIPOCOBRANCA = TC.ID) '
            + 'WHERE TC.MOSTRARNOCUPOM = ' + QuotedStr('S')
            + ' AND TC.FATURAMENTO_LIQUIDO = ' + QuotedStr('S')
            + ' AND CF.CANCELADO = ' + QuotedStr('N')
            + ' AND coalesce(CF.nfedenegada,' + QuotedStr('N') + ') = ' + QuotedStr('N');
  if ComboVendedor.KeyValue > 0 then
    vComando := vComando + ' AND ID_VENDEDOR = ' + ComboVendedor.Value;
//  vComando := vComando + ' AND CF.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicial.date));
//  vComando := vComando + ' AND CF.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtFinal.date));
    vComando := vComando + ' AND CAST(CF.dtemissao|| ''' + ' ''||CF.hremissao as timestamp) >= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', dtInicial.date) + ' ' + edtHoraInicial.Text);
    vComando := vComando + ' AND CAST(CF.dtemissao|| ''' + ' ''||CF.hremissao as timestamp) <= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', dtFinal.date) + ' ' + edtHoraFinal.Text);

  if ComboTerminal.KeyValue > 0 then
    vComando := vComando + ' AND TERMINAL_ID = ' + ComboTerminal.Value;
  if cbNEnviados.Checked then
    vComando := vComando + ' AND CF.NFECHAVEACESSO IS NULL';
  if edtSerie.Text <> EmptyStr then
    vComando := vComando + ' AND CF.SERIE = ' + QuotedStr(edtSerie.Text);
  if ComboBox1.ItemIndex > 0 then
  begin
    case ComboBox1.ItemIndex of
      1: vTipo := 'CNF';
      2: vTipo := 'NFC';
      3: vTipo := 'PED';
      4: vTipo := 'ORC';
      5: vTipo := 'COM';
    end;
    vComando := vComando + ' AND TIPO = ' + QuotedStr(vTipo);
  end;
  if ComboBox1.ItemIndex <> 5 then
    vComando := vComando + ' AND TIPO <> ' + QuotedStr('COM');
  if (RxDBLookupCombo1.Text <> '[Todos]') and (RxDBLookupCombo1.Text <> '') and (RxDBLookupCombo1.Visible) then
    vComando := vComando + ' AND CF.ID_CANAL_VENDA = ' + IntToStr(RxDBLookupCombo1.KeyValue);

  fDmCupomFiscal.sdsTotal_FormaPagto.CommandText := vComando + ' GROUP BY NOME';
  fDmCupomFiscal.cdsTotal_FormaPagto.Open;
  vVlrVendas := 0;
  fDmCupomFiscal.cdsTotal_FormaPagto.First;
  while not fDmCupomFiscal.cdsTotal_FormaPagto.Eof do
  begin
    vVlrVendas := vVlrVendas + fDmCupomFiscal.cdsTotal_FormaPagtoVALOR.AsFloat;
    fDmCupomFiscal.cdsTotal_FormaPagto.Next;
  end;
  Label6.Caption := FormatFloat('###,###,##0.00',vVlrVendas);
end;

procedure TfrmConsCupom.BuscaNFCeWeb1Click(Sender: TObject);
begin
  if fDmCupomFiscal.cdsCupom_ConsNFEPROTOCOLO.AsString = EmptyStr then
  begin
    MessageDlg('A consulta na web só pode ser efetuada em cupons enviados',mtInformation,[mbOK],0);
    Exit;
  end;
  fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
  fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
  fNFCE_ACBr.btnConsultarNFCeWebClick(Sender);
end;

procedure TfrmConsCupom.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F9) and not(fDmCupomFiscal.cdsCupom_Cons.IsEmpty) and (fDmCupomFiscal.cdsCupom_ConsTIPO.AsString = 'PED') then
  begin
    vID_Cupom_Pos := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
    Close;
  end;
end;

procedure TfrmConsCupom.ImprimirCNFPedido1Click(Sender: TObject);
begin
  if (fDmCupomFiscal.cdsCupom_ConsTIPO.AsString <> 'PED') and (fDmCupomFiscal.cdsCupom_ConsTIPO.AsString <> 'CNF') then
  begin
    MessageDlg('Impressão somente de Pedido e Cupom não Fiscal!',mtInformation,[mbOK],0);
    Exit;
  end;
  fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
  fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
  fNFCE_ACBr.NroVias := StrToIntDef(SQLLocate('CUPOMFISCAL_PARAMETROS','ID','VIAS_CUPOM','1'),1);
  fNFCE_ACBr.btImpresaoPreVendaClick(Sender);
end;

procedure TfrmConsCupom.evMensagem(Msg: String);
begin
  pnlMensagem.Caption := Msg;
  pnlMensagem.Update;

//  if Msg <> EmptyStr then
//    MessageDlg(Msg,mtInformation,[mbOK],0);
end;

procedure TfrmConsCupom.ImprimirComItensA41Click(Sender: TObject);
var
  vArq: string;
begin
  fDmCupomFiscal.prcLocalizar(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\CarnePgto1.fr3';
  if FileExists(vArq) then
    fDmCupomFiscal.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDmCupomFiscal.frxReport1.ShowReport;
end;

procedure TfrmConsCupom.ImprimirItensSintticoA41Click(Sender: TObject);
var
  vArq : String;
begin
  if fDmCupomFiscal.cdsCupom_Cons.IsEmpty then
  begin
    ShowMessage('Nenhum Registro na consulta');
    Exit;
  end;
  fDmCupomFiscal.cdsListaItemAnalitico.Close;
  fDmCupomFiscal.cdsListaItemAnalitico.CreateDataSet;

  fDmCupomFiscal.cdsCupom_Cons.DisableControls;
  fDmCupomFiscal.cdsCupom_Cons.First;
  while not fDmCupomFiscal.cdsCupom_Cons.Eof do
  begin
    fDmCupomFiscal.prcLocalizar(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
    fDmCupomFiscal.cdsCupom_Itens.First;
    while not fDmCupomFiscal.cdsCupom_Itens.Eof do
    begin
      if fDmCupomFiscal.cdsListaItemAnalitico.Locate('ID',fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]) then
        fDmCupomFiscal.cdsListaItemAnalitico.Edit
      else
        fDmCupomFiscal.cdsListaItemAnalitico.Insert;
      fDmCupomFiscal.cdsListaItemAnaliticoID.AsInteger := fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger;
      fDmCupomFiscal.cdsListaItemAnaliticoNome.AsString := fDmCupomFiscal.cdsCupom_ItensNOMEPRODUTO.AsString;
      fDmCupomFiscal.cdsListaItemAnaliticoQtde.AsFloat := fDmCupomFiscal.cdsListaItemAnaliticoQtde.AsFloat + fDmCupomFiscal.cdsCupom_ItensQTD.AsFloat;
      fDmCupomFiscal.cdsListaItemAnaliticoReferencia.AsString := fDmCupomFiscal.cdsCupom_ItensREFERENCIA.AsString;
      fDmCupomFiscal.cdsListaItemAnaliticoUN.AsString := fDmCupomFiscal.cdsCupom_ItensUNIDADE.AsString;
      fDmCupomFiscal.cdsListaItemAnaliticoValorDesconto.AsFloat := fDmCupomFiscal.cdsListaItemAnaliticoValorDesconto.AsFloat +
                                                                   fDmCupomFiscal.cdsCupom_ItensVLR_DESCONTO.AsFloat +
                                                                   fDmCupomFiscal.cdsCupom_ItensVLR_DESCONTORATEIO.AsFloat;
      fDmCupomFiscal.cdsListaItemAnaliticoValorTotal.AsFloat := fDmCupomFiscal.cdsListaItemAnaliticoValorTotal.AsFloat + fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat;
      fDmCupomFiscal.cdsListaItemAnalitico.Post;
      fDmCupomFiscal.cdsCupom_Itens.Next;
    end;
    fDmCupomFiscal.cdsCupom_Cons.Next;
  end;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\CupomItensAnalitico.fr3';
  if FileExists(vArq) then
    fDmCupomFiscal.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDmCupomFiscal.frxReport1.Variables['DataReferencia'] := QuotedStr(dtInicial.Text + ' ' + edtHoraInicial.Text + ' a ' + dtFinal.Text + ' ' + edtHoraFinal.Text);
  fDmCupomFiscal.frxReport1.ShowReport;
  fDmCupomFiscal.cdsCupom_Cons.EnableControls;
  fDmCupomFiscal.cdsCupomFiscal.Close;
end;

procedure TfrmConsCupom.cxGrid1DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if ((ARecord.Values[cxGrid1DBTableView1NFEPROTOCOLO.Index] = null) or (ARecord.Values[cxGrid1DBTableView1NFEPROTOCOLO.Index] = EmptyStr)) and //(ARecord.Values[cxGrid1DBTableView1NFECHAVEACESSO.Index] <> null) and
    (ARecord.Values[cxGrid1DBTableView1Column2.Index] = 'NFC')  then
    AStyle := NaoEnviado
  else
  if ARecord.Values[cxGrid1DBTableView1CANCELADO.Index] = 'S' then
    AStyle := Cancelado
  else
    AStyle := Normal;
end;

procedure TfrmConsCupom.prc_Ajusta_Tela;
const
  Btn = 11.07;
  PnlDados = 47.14;
  PnlButton = 52.86;
begin
//  btnConsultar.Width  := Round((AdvPanel1.Width * Btn) / 100);
//  btnEnviar.Width     := Round((AdvPanel1.Width * Btn) / 100);
//  btnReimprimir.Width := Round((AdvPanel1.Width * Btn) / 100);
//  btnExcluir.Width    := Round((AdvPanel1.Width * Btn) / 100);
//  AdvPanel3.Width     := Round((AdvPanel1.Width * PnlDados) / 100);
//  AdvPanel2.Width     := Round((AdvPanel1.Width * PnlButton) / 100);
end;

procedure TfrmConsCupom.RetornoMSG(Msg: String);
begin
  pnlMensagem.Caption := Msg;
  pnlMensagem.Update;
end;

end.


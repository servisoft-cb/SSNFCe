unit USel_Comanda_CF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Grids, DBGrids, SMDBGrid, ExtCtrls,
  NxCollection, StdCtrls, Mask, ToolEdit, CurrEdit, DBCtrls, uDmCupomFiscal,
    RxLookup, rsDBUtils, dbXPress, SqlExpr, DB, Buttons, RzPanel, RXCtrls,
  RzButton;

type
  TfrmSel_Comanda_CF = class(TForm)
    Panel1: TPanel;
    gridItens: TSMDBGrid;
    ceNumCartao: TCurrencyEdit;
    Label4: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    Panel2: TPanel;
    gbxVendedor: TRzGroupBox;
    SMDBGrid2: TSMDBGrid;
    Panel5: TPanel;
    btnExcluir: TNxButton;
    NxButton1: TNxButton;
    RxLabel1: TRxLabel;
    Panel4: TPanel;
    gridComanda: TSMDBGrid;
    btnInserir: TRzBitBtn;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ceNumCartaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure gridComandaDblClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure SMDBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
    ctCupomFiscal: string;
    vVlr_Selecionado : Real;
    procedure Monta_sqlCupom_Cons(ID: Integer);
    procedure prc_Inserir_mCupom;

  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
  end;

var
  frmSel_Comanda_CF: TfrmSel_Comanda_CF;

implementation

uses uUtilPadrao, DmdDatabase, UCupomFiscal;

{$R *.dfm}

procedure TfrmSel_Comanda_CF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fdmCupomFiscal.cdsProduto.Close;
  fdmCupomFiscal.mCupom.Close;
  fdmCupomFiscal.mCupomItens.Close;

  Action := caFree;
end;

procedure TfrmSel_Comanda_CF.ceNumCartaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    Monta_sqlCupom_Cons(ceNumCartao.AsInteger);
    if ceNumCartao.AsInteger > 0 then
    begin
      if fdmCupomFiscal.cdsComandaRel.IsEmpty then
        ShowMessage('Comanda não localizada!')
      else
        prc_Inserir_mCupom;
      ceNumCartao.Clear;
    end;
  end;
end;

procedure TfrmSel_Comanda_CF.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir este cartão  ' + fDmCupomFiscal.mCupomCARTAO.AsString + '  da conta ', mtConfirmation,[mbOk, mbNo], 0) = mrOk then
  begin
    vVlr_Selecionado := StrToFloat(FormatFloat('0.00',vVlr_Selecionado - fDmCupomFiscal.mCupomVLR_TOTAL.AsFloat));
    fDmCupomFiscal.mCupom.Delete;
  end;
  RxLabel1.Caption := 'Vlr. Selecionado: ' + FormatFloat('###,###,##0.00',vVlr_Selecionado);
end;

procedure TfrmSel_Comanda_CF.Monta_sqlCupom_Cons(ID: Integer);
begin
  fDmCupomFiscal.cdsComandaRel.Close;
  fDmCupomFiscal.sdsComandaRel.CommandText :=
    'SELECT CF.ID, CF.NUMCUPOM, CF.DTEMISSAO, CF.VLR_TOTAL, CF.NUM_CARTAO, F.NOME_INTERNO FILIAL_NOME,' +
    'F.ENDERECO || '', '' || F.NUM_END AS FILIAL_END, F.BAIRRO || '' - '' || F.CIDADE AS FILIAL_CIDADE_BAIRRO, ' +
    '''('' || F.DDD1 || '')'' || F.FONE1 AS FILIAL_FONE, F.HOMEPAGE, F.EMAIL, CF.FILIAL ' +
    'FROM CUPOMFISCAL CF ' +
    'INNER JOIN FILIAL F ON (CF.FILIAL = F.ID) ' +
    ' WHERE COALESCE(COPIADO,' + QuotedStr('N') + ') = ' + QuotedStr('N') +
    ' AND CF.NUM_CARTAO > 0  ' +
    ' AND CF.TIPO = ' + QuotedStr('COM');
  if ID > 0 then
    fDmCupomFiscal.sdsComandaRel.CommandText :=
      fDmCupomFiscal.sdsComandaRel.CommandText + ' AND CF.NUM_CARTAO = ' +
      IntToStr(ID)
  else
    fDmCupomFiscal.sdsComandaRel.CommandText :=
      fDmCupomFiscal.sdsComandaRel.CommandText + ' AND CF.DTEMISSAO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Date - 2));
  fDmCupomFiscal.sdsComandaRel.CommandText :=
    fDmCupomFiscal.sdsComandaRel.CommandText + ' ORDER BY CF.NUM_CARTAO';
  fDmCupomFiscal.cdsComandaRel.Open;

  //fDmCupomFiscal.cdsComandaItem_Rel.Close;
  //  fDmCupomFiscal.sdsComandaItem_Rel.ParamByName('ID').AsInteger := fDmCupomFiscal.CdsComandaRelID.AsInteger;
  //fDmCupomFiscal.cdsComandaItem_Rel.Open;


end;

procedure TfrmSel_Comanda_CF.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  ctCupomFiscal := fDmCupomFiscal.sdsCupom_Cons.CommandText;
  if not fDmCupomFiscal.mCupom.Active then
  begin
    fDmCupomFiscal.mCupom.CreateDataSet;
    fDmCupomFiscal.mCupomItens.CreateDataSet;
    if not fDmCupomFiscal.mCupomItens.Active then
      fDmCupomFiscal.mCupomItens.Active := True;
    fDmCupomFiscal.mCupomItens.IndexFieldNames := 'CARTAO';
  end;
  Monta_sqlCupom_Cons(0);
  fDmCupomFiscal.mCupom.EmptyDataSet;
  fDmCupomFiscal.mCupomItens.EmptyDataSet;
  vVlr_Selecionado := 0;
end;

procedure TfrmSel_Comanda_CF.NxButton1Click(Sender: TObject);
begin
  fDmCupomFiscal.mCupomItens.First;
  while not fDmCupomFiscal.mCupomItens.Eof do
  begin
    fCupomFiscal.vCopiandoComanda := True;
    fCupomFiscal.Edit1.Text := fDmCupomFiscal.mCupomItensID_PRODUTO.AsString;
    fCupomFiscal.Edit1Exit(Sender);
    fCupomFiscal.CurrencyEdit1.Value := fDmCupomFiscal.mCupomItensQTD.AsFloat;
    fCupomFiscal.CurrencyEdit1Exit(Sender);
    fCupomFiscal.vVlrItem := fDmCupomFiscal.mCupomItensVLR_UNIT.AsCurrency;
    fCupomFiscal.prc_ConfirmaItem;
    fDmCupomFiscal.mCupomItens.Next;
    //    fDmCupomFiscal.mCupomItens.Delete;
  end;

  fCupomFiscal.vCopiandoComanda := False;

  //  while not fDmCupomFiscal.mCupom.IsEmpty do
  //  begin
  //    if fDmCupomFiscal.cdsCupomFiscal.State in [dsBrowse] then
  //      fDmCupomFiscal.cdsCupomFiscal.Edit;
  //    fDmCupomFiscal.cdsCupomFiscalQTD_PESSOA.AsInteger := fDmCupomFiscal.cdsCupomFiscalQTD_PESSOA.AsInteger + 1;
  //
  //    fDmCupomFiscal.SQLQuery1.SQL.Text := 'DELETE FROM CUPOMFISCAL_ITENS WHERE ID = ' + fDmCupomFiscal.mCupomID_CUPOM.AsString;
  //    fDmCupomFiscal.SQLQuery1.ExecSQL(True);
  //    fDmCupomFiscal.SQLQuery1.SQL.Text := 'DELETE FROM CUPOMFISCAL WHERE ID = ' + fDmCupomFiscal.mCupomID_CUPOM.AsString;
  //    fDmCupomFiscal.SQLQuery1.ExecSQL(True);
  //    fDmCupomFiscal.mCupom.Delete;
  //  end;
  Close;
end;

procedure TfrmSel_Comanda_CF.gridComandaDblClick(Sender: TObject);
begin
  if fDmCupomFiscal.cdsComandaRel.IsEmpty then
    exit;
  prc_Inserir_mCupom;
end;

procedure TfrmSel_Comanda_CF.prc_Inserir_mCupom;
begin
  if fDmCupomFiscal.mCupom.Locate('CARTAO',fDmCupomFiscal.cdsComandaRelNUM_CARTAO.AsInteger,[loCaseInsensitive]) then
    exit;
  fDmCupomFiscal.mCupom.Insert;
  fDmCupomFiscal.mCupomID_CUPOM.AsInteger := fDmCupomFiscal.cdsComandaRelID.AsInteger;
  fDmCupomFiscal.mCupomCARTAO.AsInteger   := fDmCupomFiscal.cdsComandaRelNUM_CARTAO.AsInteger;
  fDmCupomFiscal.mCupomVLR_TOTAL.AsFloat  := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsComandaRelVLR_TOTAL.AsFloat));
  fDmCupomFiscal.mCupom.Post;
  fDmCupomFiscal.cdsComandaItem_Rel.First;
  while not fDmCupomFiscal.cdsComandaItem_Rel.Eof do
  begin
    fDmCupomFiscal.mCupomItens.Insert;
    fDmCupomFiscal.mCupomItensID_PRODUTO.AsInteger  := fDmCupomFiscal.cdsComandaItem_RelID_PRODUTO.AsInteger;
    fDmCupomFiscal.mCupomItensCARTAO.AsInteger      := fDmCupomFiscal.cdsComandaRelNUM_CARTAO.AsInteger;
    fDmCupomFiscal.mCupomItensNOME_PRODUTO.AsString := fDmCupomFiscal.cdsComandaItem_RelPRODUTO_NOME.AsString;
    fDmCupomFiscal.mCupomItensQTD.AsFloat           := fDmCupomFiscal.cdsComandaItem_RelQTD.AsFloat;
    fDmCupomFiscal.mCupomItensVLR_UNIT.AsFloat      := fDmCupomFiscal.cdsComandaItem_RelVLR_UNITARIO.AsCurrency;
    fDmCupomFiscal.mCupomItensVLR_TOTAL.AsFloat     := fDmCupomFiscal.cdsComandaItem_RelVLR_TOTAL.AsCurrency;
    fDmCupomFiscal.mCupomItensID_CUPOM.AsInteger    := fDmCupomFiscal.cdsComandaRelID.AsInteger;
    fDmCupomFiscal.mCupomItensItem.AsInteger        := fDmCupomFiscal.cdsComandaItem_RelITEM.AsInteger;
    fDmCupomFiscal.mCupomItens.Post;
    fDmCupomFiscal.cdsComandaItem_Rel.Next;
  end;
  vVlr_Selecionado := StrToFloat(FormatFloat('0.00',vVlr_Selecionado + fDmCupomFiscal.mCupomVLR_TOTAL.AsFloat));
  RxLabel1.Caption := 'Vlr. Selecionado: ' + FormatFloat('###,###,##0.00',vVlr_Selecionado);
end;

procedure TfrmSel_Comanda_CF.btnInserirClick(Sender: TObject);
begin
  fDmCupomFiscal.cdsComandaRel.DisableControls;
  fDmCupomFiscal.cdsComandaRel.First;
  try
    while not fDmCupomFiscal.cdsComandaRel.Eof do
    begin
      if gridComanda.SelectedRows.CurrentRowSelected then
        prc_Inserir_mCupom;
      fDmCupomFiscal.cdsComandaRel.Next;
    end;

  finally
    fDmCupomFiscal.cdsComandaRel.EnableControls;
  end;
end;

procedure TfrmSel_Comanda_CF.SMDBGrid2DblClick(Sender: TObject);
begin
  btnExcluirClick(Sender);
end;

end.

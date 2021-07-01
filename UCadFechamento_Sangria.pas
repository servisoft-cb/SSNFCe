unit UCadFechamento_Sangria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, NxCollection, ExtCtrls, Grids,
  DBGrids, SMDBGrid, UDMCadFechamento, DB, StdCtrls, Mask, ToolEdit, CurrEdit, DBCtrls, dbXPress,
  RxLookup;

type
  TfrmCadFechamento_Sangria = class(TForm)
    SMDBGrid4: TSMDBGrid;
    Panel1: TPanel;
    btnCancelar: TNxButton;
    btnExcluir: TNxButton;
    Panel2: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    btnConfirmar: TNxButton;
    Label2: TLabel;
    Edit1: TEdit;
    DBText1: TDBText;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure SMDBGrid4GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    procedure prc_Gravar_Financeiro;

  public
    { Public declarations }
    fDMCadFechamento: TDMCadFechamento;
    vES: String;
  end;

var
  frmCadFechamento_Sangria: TfrmCadFechamento_Sangria;

implementation

uses rsDBUtils, uUtilPadrao, UDMGravarFinanceiro, DmdDatabase;

{$R *.dfm}

procedure TfrmCadFechamento_Sangria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if MessageDlg('Imprimir recibo?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    case fDMCadFechamento.qCupomParametrosIMPRESSORA_FISCAL.AsInteger of
      5: fDMCadFechamento.prc_Imprime_ReciboW(fDMCadFechamento.cdsFechamento_RetITEM.AsInteger,
                                        fDMCadFechamento.cdsFechamento_RetES.AsString);
      6: begin
           if vPorta <> vImpressora_Padrao then
             SetDefaultPrinter(vPorta);
           fDMCadFechamento.prc_Imprime_ReciboC(fDMCadFechamento.cdsFechamento_RetITEM.AsInteger,
                                                fDMCadFechamento.cdsFechamento_RetES.AsString);
           if vPorta <> vImpressora_Padrao then
             SetDefaultPrinter(vImpressora_Padrao);
         end;
    end;
  end;
  fDMCadFechamento.cdsTipoCobranca.Filtered := False;
  vID_Fechamento_Pos := 0;
  Action := Cafree;
end;

procedure TfrmCadFechamento_Sangria.btnCancelarClick(Sender: TObject);
begin
  if fDMCadFechamento.cdsFechamento_Ret.State in [dsEdit,dsInsert] then
    fDMCadFechamento.cdsFechamento.CancelUpdates;
  Close;
end;

procedure TfrmCadFechamento_Sangria.FormShow(Sender: TObject);
begin
  if not Assigned(fDMCadFechamento) then
    fDmCadFechamento := TDmCadFechamento.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadFechamento);

  if vID_Fechamento_Pos > 0 then
    fDMCadFechamento.prc_Localizar(vID_Fechamento_Pos);

  if not fDMCadFechamento.cdsFechamento_Ret.Active then
  begin
    fDMCadFechamento.cdsFechamento_Ret.Open;
    
  end;
  fDMCadFechamento.cdsFechamento_Ret.Last;
  fDMCadFechamento.vItem_Sangria := fDMCadFechamento.cdsFechamento_RetITEM.AsInteger;
  if vES = 'E' then
    Label1.Caption := 'Valor de Suprimento:'
  else
    Label1.Caption := 'Valor de Sangria:';

  try
    if vUsaGaveta then
      prc_AbreGaveta(); //Ver com Russimar 16/08/2020
  except
  end;

  fDMCadFechamento.cdsTipoCobranca.Filtered := False;
  fDMCadFechamento.cdsTipoCobranca.Filter := 'DINHEIRO = ' + QuotedStr('S') + ' or CHEQUE = ' + QuotedStr('S');
  fDMCadFechamento.cdsTipoCobranca.Filtered := True;

  fDMCadFechamento.cdsTipoCobranca.Locate('DINHEIRO','S',[loCaseInsensitive]);
  RxDBLookupCombo1.KeyValue := fDMCadFechamento.cdsTipoCobrancaID.AsInteger;

  RxDBLookupCombo1.Enabled := (vES = 'S');
  if vES = 'E' then
    RxDBLookupCombo1.Color := clSilver;
end;

procedure TfrmCadFechamento_Sangria.btnConfirmarClick(Sender: TObject);
var
  ID: TTransactionDesc;
begin
  if CurrencyEdit1.Value = 0 then
  begin
    MessageDlg('*** Valor não informado!', mtError, [mbOk], 0);
    exit;
  end;
  if (vES = 'S') and (RxDBLookupCombo1.Text = '') then
  begin
    MessageDlg('*** Não foi informada a forma da retirada!', mtError, [mbOk], 0);
    exit;
  end;
  if (vES = 'S') and (trim(Edit1.Text) = '') then
  begin
    MessageDlg('*** Não foi informado o motivo da retirada!', mtError, [mbOk], 0);
    exit;
  end;

  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    fDMCadFechamento.cdsFechamento_Ret.Insert;
    fDMCadFechamento.cdsFechamento_RetDATA.AsDateTime    := Now;
    fDMCadFechamento.cdsFechamento_RetVALOR.AsCurrency   := CurrencyEdit1.Value;
    fDMCadFechamento.cdsFechamento_RetDESCRICAO.AsString := Edit1.Text;
    fDMCadFechamento.cdsFechamento_RetES.AsString        := vES;
    if vES = 'S' then
      fDMCadFechamento.cdsFechamento_RetID_TIPOCOBRANCA.AsInteger := RxDBLookupCombo1.KeyValue;
    fDMCadFechamento.cdsFechamento_Ret.Post;
    fDMCadFechamento.cdsFechamento.ApplyUpdates(0);

    if vES = 'S' then
      prc_Gravar_Financeiro;

    dmDatabase.scoDados.Commit(ID);

    Edit1.Clear;
    CurrencyEdit1.Clear;
    CurrencyEdit1.SetFocus;
    btnCancelar.Caption := '(F10) Fechar';
    fDMCadFechamento.cdsFechamento_Ret.Last;

  except
    on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar ' + Label1.Caption + #13 + e.Message);
      end;
  end;

end;

procedure TfrmCadFechamento_Sangria.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro selecionado?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  fDMCadFechamento.cdsFechamento_Ret.Delete;
  fDMCadFechamento.cdsFechamento_Ret.ApplyUpdates(0);
end;

procedure TfrmCadFechamento_Sangria.SMDBGrid4GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadFechamento.cdsFechamento_RetES.AsString = 'S' then
    AFont.Color := clRed
  else
    AFont.Color := clBlue;
end;

procedure TfrmCadFechamento_Sangria.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F10) then
    btnCancelarClick(Sender);
end;

procedure TfrmCadFechamento_Sangria.prc_Gravar_Financeiro;
var
  fDMGravarFinanceiro: TDMGravarFinanceiro;
begin
  fDMGravarFinanceiro := TDMGravarFinanceiro.Create(Self);
  try

    fDMGravarFinanceiro.vTipo_ES         := 'S';
    fDmGravarFinanceiro.vAutoQuitado     := 'N';
    fDMGravarFinanceiro.vHistorico_Compl := fDMCadFechamento.cdsFechamento_RetDESCRICAO.AsString;

    fDMGravarFinanceiro.vID_Conta           := fDMCadFechamento.cdsFechamentoID_CONTA.AsInteger;
    fDMGravarFinanceiro.vID_Fechamento      := fDMCadFechamento.cdsFechamentoID.AsInteger;
    fDMGravarFinanceiro.vID_ModDuplicata    := 0;
    fDMGravarFinanceiro.vItem_MovDuplicata  := 0;
    fDMGravarFinanceiro.vID_Historico       := 0;
    fDMGravarFinanceiro.vID_Pessoa          := 0;
    fDMGravarFinanceiro.vID_Forma_Pagamento := fDMCadFechamento.cdsFechamento_RetID_TIPOCOBRANCA.AsInteger;
    fDMGravarFinanceiro.vID_ExtComissao     := 0;
    fDMGravarFinanceiro.vDtMovimento        := fDMCadFechamento.cdsFechamento_RetDATA.AsDateTime;
    fDMGravarFinanceiro.vVlr_Movimento      := fDMCadFechamento.cdsFechamento_RetVALOR.AsFloat; 
    fDMGravarFinanceiro.vID_Conta_Orcamento := 0;
    fDMGravarFinanceiro.vID_Cupom           := 0;
    fDMGravarFinanceiro.vItem_Sangria       := fDMCadFechamento.cdsFechamento_RetITEM.AsInteger;

    fDMGravarFinanceiro.prc_Gravar;
  finally
    FreeAndNil(fDMGravarFinanceiro);
  end;

end;

end.

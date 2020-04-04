unit UCadProduto_Consumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, UDMCadProduto, StdCtrls,
  Buttons, RxLookup, DBCtrls, DB, Mask, RxDBComb, ToolEdit, RXDBCtrl, UCadUnidade, Grids, DBVGrids;

type
  TfrmCadProduto_Consumo = class(TForm)
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label4: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBEdit3: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label12: TLabel;
    lblID: TLabel;
    dbedtID: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure RxDBComboBox1Enter(Sender: TObject);
//    procedure prc_Localiza_Material;
    procedure dbedtIDEnter(Sender: TObject);
    procedure dbedtIDExit(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
  private
    { Private declarations }
    vQtd_Consumo : Real;
    vID_Material_Loc : Integer;
    vItem_Loc : Integer;

    function  fnc_Erro: Boolean;

  public
    { Public declarations }
    fDMCadProduto: TDMCadProduto;
    vTipo_Consumo: String;

  end;

var
  frmCadProduto_Consumo: TfrmCadProduto_Consumo;

implementation

uses rsDBUtils, USel_Produto, uUtilPadrao;


{$R *.dfm}

procedure TfrmCadProduto_Consumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMCadProduto.cdsProduto_Consumo.State in [dsEdit,dsInsert] then
    fDMCadProduto.cdsProduto_Consumo.Cancel;
  Action := Cafree;
end;

procedure TfrmCadProduto_Consumo.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadProduto);

  if fDMCadProduto.cdsProduto_Consumo.State in [dsInsert] then
  begin
    vID_Material_Loc := 0;
    vItem_Loc        := 0;
  end
  else
  begin
    vQtd_Consumo     := StrToFloat(FormatFloat('0.00000',fDMCadProduto.cdsProduto_ConsumoQTD_CONSUMO.AsFloat));
    vID_Material_Loc := fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger;
    vItem_Loc        := fDMCadProduto.cdsProduto_ConsumoITEM.AsInteger;
  end;

  dbedtID.Visible := (fDMCadProduto.qParametros_ProdUSA_ID_MATERIAL_CONS.AsString = 'S');
  lblID.Visible   := (fDMCadProduto.qParametros_ProdUSA_ID_MATERIAL_CONS.AsString = 'S');

  if Panel2.Enabled then
    if dbedtID.Visible then
      dbedtID.SetFocus
    else
      RxDBLookupCombo1.SetFocus;

  fDMCadProduto.prc_Abrir_Material;

  vTipo_Baixa_Ped := fDMCadProduto.cdsProduto_ConsumoTIPO_CONSUMO.AsString;
  if DBEdit2.ReadOnly then
    DBEdit2.Color := clSilver
  else
    DBEdit2.Color := clWindow;
end;

procedure TfrmCadProduto_Consumo.BitBtn1Click(Sender: TObject);
var
  vFlagErro: Boolean;
  vQtd: Real;
  vAux: String;
  
begin
  if (fDMCadProduto.cdsProduto_Consumo.State in [dsEdit,dsInsert]) then
    fDMCadProduto.cdsProduto_Consumo.Post;
  if (fDMCadProduto.cdsProduto_Consumo_Tam.State in [dsEdit, dsInsert]) and (trim(fDMCadProduto.cdsProduto_Consumo_TamTAMANHO.AsString) = '') then
    fDMCadProduto.cdsProduto_Consumo_Tam.Cancel;

  if not(fDMCadProduto.cdsProduto_Consumo.State in [dsEdit,dsInsert]) then
    fDMCadProduto.cdsProduto_Consumo.Edit;
  if fDMCadProduto.cdsProduto_ConsumoTIPO_CONSUMO.AsString = 'T' then
  begin
    vQtd := 0;
    fDMCadProduto.cdsProduto_Consumo_Tam.First;
    while not fDMCadProduto.cdsProduto_Consumo_Tam.Eof do
    begin
      if trim(fDMCadProduto.cdsProduto_Consumo_TamTAMANHO.AsString) = '' then
        fDMCadProduto.cdsProduto_Consumo_Tam.Delete
      else
      begin
        vQtd := vQtd + fDMCadProduto.cdsProduto_Consumo_TamQTD_CONSUMO.AsFloat;
        fDMCadProduto.cdsProduto_Consumo_Tam.Next;
      end;
    end;
    fDMCadProduto.cdsProduto_ConsumoQTD_CONSUMO.AsFloat := StrToFloat(FormatFloat('0.000000',vQtd));
  end;

  if RxDBLookupCombo1.KeyValue <> fDMCadProduto.cdsMaterialID.AsInteger then
    fDMCadProduto.cdsMaterial.Locate('ID',RxDBLookupCombo1.KeyValue,([Locaseinsensitive]));

  if fnc_Erro then
    exit;

  vFlagErro := False;

  try
    fDMCadProduto.cdsProduto_ConsumoNOMEMATERIAL.AsString := RxDBLookupCombo2.Text;
    fDMCadProduto.cdsProduto_ConsumoREFERENCIA.AsString   := RxDBLookupCombo1.Text;
    if fDMCadProduto.qParametros_ProdOPCAO_PRECO_CONSUMO.AsString = 'C' then
      fDMCadProduto.cdsProduto_ConsumoPRECO_CUSTO.AsFloat   := StrToFloat(FormatFloat('0.00000',fDMCadProduto.cdsMaterialPRECO_CUSTO_TOTAL.AsFloat))
    else
      fDMCadProduto.cdsProduto_ConsumoPRECO_CUSTO.AsFloat   := StrToFloat(FormatFloat('0.00000',fDMCadProduto.cdsMaterialPRECO_CUSTO.AsFloat));
    fDMCadProduto.cdsProduto_Consumo.Post;

    if fDMCadProduto.cdsProduto_ConsumoTIPO_CONSUMO.AsString = 'G' then
    begin
      fDMCadProduto.cdsProduto_Consumo_Tam.First;
      while not fDMCadProduto.cdsProduto_Consumo_Tam.Eof do
        fDMCadProduto.cdsProduto_Consumo_Tam.Delete;
    end;

  except
    on E: exception do
    begin
      vFlagErro := True;  
      raise Exception.Create('Erro ao gravar, ' + E.Message);
    end;
  end;

  if not vFlagErro then
    Close;
end;

function TfrmCadProduto_Consumo.fnc_Erro: Boolean;
var
  vMsgErro: String;
begin
  Result   := True;
  vMsgErro := '';
  if fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger < 1 then
    vMsgErro := vMsgErro + #13 + '*** Material não informado!';
  if vMsgErro <> '' then
  begin
    MessageDlg(vMsgErro, mtError, [mbOk], 0);
    exit;
  end;
  Result := False;
end;

procedure TfrmCadProduto_Consumo.BitBtn4Click(Sender: TObject);
begin
  if fDMCadProduto.cdsProduto_Consumo.State in [dsEdit,dsInsert] then
    if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;
  Close;
end;

procedure TfrmCadProduto_Consumo.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F10) then
    BitBtn4Click(Sender)
  else
  if (Key = Vk_F2) then
  begin
    vCodProduto_Pos := fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger;
    frmSel_Produto := TfrmSel_Produto.Create(Self);
    frmSel_Produto.vTipo_Prod := 'M';
    frmSel_Produto.ShowModal;
    fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger := vCodProduto_Pos;
    if fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger > 0 then
      RxDBLookupCombo1.SetFocus;
    RxDBLookupCombo1Exit(Sender);
  end;
end;

procedure TfrmCadProduto_Consumo.RxDBLookupCombo1Enter(Sender: TObject);
begin
  fDMCadProduto.cdsMaterial.IndexFieldNames := 'REFERENCIA';
end;

procedure TfrmCadProduto_Consumo.RxDBLookupCombo2Enter(Sender: TObject);
begin
  fDMCadProduto.cdsMaterial.IndexFieldNames := 'NOME';
end;

procedure TfrmCadProduto_Consumo.DBEdit2Exit(Sender: TObject);
var
  vQtdAux: Real;
begin
  vQtdAux := 0;
  if fDMCadProduto.cdsProduto_ConsumoQTD_CONSUMO.AsFloat > 0 then
    vQtdAux := 1 / fDMCadProduto.cdsProduto_ConsumoQTD_CONSUMO.AsFloat;
  fDMCadProduto.cdsProduto_ConsumoQTD_UNIDADE.AsFloat := StrToFloat(FormatFloat('0.0000',vQtdAux));
end;

procedure TfrmCadProduto_Consumo.RxDBComboBox1Enter(Sender: TObject);
begin
  vTipo_Consumo := fDMCadProduto.cdsProduto_ConsumoTIPO_CONSUMO.AsString;
end;

procedure TfrmCadProduto_Consumo.dbedtIDEnter(Sender: TObject);
begin
  fDMCadProduto.cdsMaterial.IndexFieldNames := 'ID';
end;

procedure TfrmCadProduto_Consumo.dbedtIDExit(Sender: TObject);
begin
  if fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger > 0 then
  begin
    if not fDMCadProduto.cdsMaterial.Locate('ID',fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger,([Locaseinsensitive])) then
    begin
      MessageDlg('Produto/Material não encontrado!', mtError,[mbOK],0);
      dbedtID.SetFocus;
      Exit;
    end;
    fDMCadProduto.cdsProduto_ConsumoUNIDADE.AsString := fDMCadProduto.cdsMaterialUNIDADE.AsString;
  end;
end;

procedure TfrmCadProduto_Consumo.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if fDMCadProduto.cdsMaterial.Locate('ID',fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger,([Locaseinsensitive])) then
    fDMCadProduto.cdsProduto_ConsumoUNIDADE.AsString := fDMCadProduto.cdsMaterialUNIDADE.AsString;
end;

procedure TfrmCadProduto_Consumo.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if fDMCadProduto.cdsMaterial.Locate('ID',fDMCadProduto.cdsProduto_ConsumoID_MATERIAL.AsInteger,([Locaseinsensitive])) then
    fDMCadProduto.cdsProduto_ConsumoUNIDADE.AsString := fDMCadProduto.cdsMaterialUNIDADE.AsString;
end;

end.

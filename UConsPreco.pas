unit UConsPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, RxLookup,
  DBCtrls, ValEdit, AdvSmoothPanel, ComCtrls, AdvPanel;

type
  TfrmConsPreco = class(TForm)
    qParametros: TSQLQuery;
    qParametrosUSA_COD_BARRAS: TStringField;
    qParametrosUSA_COD_REF: TStringField;
    qParametrosUSA_NFCE_LOCAL: TStringField;
    sdsEstoque_Serv: TSQLDataSet;
    dspEstoque_Serv: TDataSetProvider;
    cdsEstoque_Serv: TClientDataSet;
    cdsEstoque_ServQTD: TFMTBCDField;
    cdsEstoque_ServNOME_INTERNO: TStringField;
    cdsEstoque_ServFILIAL: TIntegerField;
    dsEstoque_Serv: TDataSource;
    SMDBGrid1: TSMDBGrid;
    pnlPrincipal: TAdvPanel;
    ProgressBar1: TProgressBar;
    AdvSmoothPanel1: TAdvSmoothPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    ctProdutoLocal: String;
    procedure prc_Pesquisa_Prod;
  public
    { Public declarations }
    vTipo_Prod: String; //P=Produto  M=Material  'Vázio'=Ambos
  end;

var
  frmConsPreco: TfrmConsPreco;

implementation

uses DmdDatabase, uUtilPadrao;

{$R *.dfm}

procedure TfrmConsPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vTipo_Prod     := '';
  vCodPessoa_Pos := 0;
  Action         := Cafree;
end;

procedure TfrmConsPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;

procedure TfrmConsPreco.FormShow(Sender: TObject);
begin
  qParametros.Close;
  qParametros.Open;
  SMDBGrid1.Visible := (qParametrosUSA_NFCE_LOCAL.AsString = 'S');
  if qParametrosUSA_NFCE_LOCAL.AsString = 'S' then
    Height := 472
  else
    Height := 270;
end;

procedure TfrmConsPreco.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    prc_Pesquisa_Prod;
end;

procedure TfrmConsPreco.prc_Pesquisa_Prod;
var
  sds: TSQLDataSet;
  vCampo: String;
begin
  if trim(Edit3.Text) = '' then
    exit;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT P.ID, P.REFERENCIA, P.COD_BARRA, P.NOME, P.PRECO_VENDA, EA.QTD ';
    sds.CommandText   := sds.CommandText + 'FROM PRODUTO P ';
    sds.CommandText   := sds.CommandText + 'LEFT JOIN ESTOQUE_ATUAL EA ON (P.ID = EA.ID_PRODUTO) ';
    if vLocalEstoque > 0 then
      sds.CommandText   := sds.CommandText + ' AND (EA.id_local_estoque = ' + IntToStr(vLocalEstoque) + ') ';
    if qParametrosUSA_COD_BARRAS.AsString = 'S' then
    begin
      if copy(Edit3.Text,1,1) = '0' then
        sds.CommandText := sds.CommandText + ' WHERE (ID = ' + IntToStr(StrToInt(Edit3.Text)) + ')'
      else
      sds.CommandText := sds.CommandText + ' WHERE (COD_BARRA = ' + QuotedStr(Edit3.Text) + ')';
    end
    else
    if qParametrosUSA_COD_REF.AsString = 'R' then
      sds.CommandText := sds.CommandText + ' WHERE (REFERENCIA = ' + QuotedStr(Edit3.Text) + ')'
    else
    begin
      if copy(Edit3.Text,1,1) = '0' then
        sds.CommandText := sds.CommandText + ' WHERE (ID = ' + IntToStr(StrToInt(Edit3.Text)) + ')'
      else
        sds.CommandText := sds.CommandText + ' WHERE (ID = ' + Edit3.Text + ')';
    end;
//    sds.CommandText   := sds.CommandText + ' AND ID_LOCAL_ESTOQUE = ' + IntToStr(vLocalEstoque);
    sds.Open;
    if sds.IsEmpty then
      MessageDlg('Produto não encontrado!',mtInformation,[mbOk],0)
    else
    begin
      Label1.Caption := sds.FieldByName('NOME').AsString;
      Label2.Caption := 'Preço:     ' + FormatFloat('###,###,##0.00',sds.FieldByName('PRECO_VENDA').AsFloat);
      Label3.Caption := 'Estoque:    ' + FormatFloat('###,###,##0.00',sds.FieldByName('QTD').AsFloat);

      if qParametrosUSA_NFCE_LOCAL.AsString = 'S' then
      begin
        cdsEstoque_Serv.Close;
        sdsEstoque_Serv.ParamByName('ID_PRODUTO').AsInteger := sds.FieldByName('ID').AsInteger;
        cdsEstoque_Serv.Open;
      end;
    end;
  finally
    FreeAndNil(sds);
  end;
end;

end.

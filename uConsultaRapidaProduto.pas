unit uConsultaRapidaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, ExtCtrls, AdvPanel, Grids, DBGrids, SMDBGrid, RxLookup,
  StdCtrls, DB, uDmCupomFiscal, rsDBUtils;

type
  TfrmConsultaRapidaProduto = class(TForm)
    scrollPrincipal: TScrollBox;
    scrollEsquerda: TScrollBox;
    scrollDiretia: TScrollBox;
    lblProduto: TRxLabel;
    pnlCabecalho: TAdvPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel4: TRxLabel;
    edtDescricao: TEdit;
    edtReferencia: TEdit;
    RxLabel3: TRxLabel;
    edtCodigoBarra: TEdit;
    comboGrupo: TRxDBLookupCombo;
    pnlPrincipal: TAdvPanel;
    pnlDivisao: TAdvPanel;
    gridProduto: TSMDBGrid;
    procedure FormShow(Sender: TObject);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridProdutoDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReferenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure comboGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure MakeRounded(Control: TWinControl);
  public
    fdmCupomFiscal : TdmCupomFiscal;
    codigoProdutoRetorno : Integer;
    referenciaRetorno : String;
    procedure prc_Consultar(Edt : TEdit ; combo : TRxDBLookupCombo);
    //procedure prc_Consultar(Campo, Tipo : String);
    { Public declarations }
  end;

var
  frmConsultaRapidaProduto: TfrmConsultaRapidaProduto;

implementation

{$R *.dfm}

{ TfrmConsultaRapidaProduto }

procedure TfrmConsultaRapidaProduto.MakeRounded(Control: TWinControl);
var
  R: TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 20, 20);
    Perform(EM_GETRECT, 0, lParam(@R));
    InflateRect(R, -5, -5);
    Perform(EM_SETRECTNP, 0, lParam(@R));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;
end;

procedure TfrmConsultaRapidaProduto.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  fdmCupomFiscal.cdsGrupo.Open;
  pnlCabecalho.BorderStyle := bsNone;
  MakeRounded(pnlCabecalho);
  pnlPrincipal.BorderStyle := bsNone;
  MakeRounded(pnlPrincipal);
  if (edtDescricao.Text <> EmptyStr) or (edtCodigoBarra.Text <> EmptyStr) or (edtReferencia.Text <> EmptyStr) then
    prc_Consultar(edtDescricao,nil);
end;

procedure TfrmConsultaRapidaProduto.prc_Consultar(Edt : TEdit ; combo : TRxDBLookupCombo);
//procedure TfrmConsultaRapidaProduto.prc_Consultar(Campo, Tipo : String);
var
  filtro : String;
begin
  filtro := fDmCupomFiscal.ctConsProduto;
  filtro := filtro + ' WHERE 0 = 0 AND P.INATIVO = ' + QuotedStr('N');
  if fdmCupomFiscal.cdsCupomParametrosMOSTRAR_MATERIAL.AsString = 'S' then
    filtro := filtro + ' AND (P.TIPO_REG = ' + QuotedStr('P') + ' OR P.TIPO_REG = ' + QuotedStr('M') + ')'
  else
    filtro := filtro + ' AND P.TIPO_REG = ' + QuotedStr('P');
  fDmCupomFiscal.cdsConsProduto.Close;
  if edtDescricao.Text <> EmptyStr then
    filtro := filtro + ' AND P.NOME LIKE ' + '''' + edtDescricao.Text + '%''';
  if edtReferencia.Text <> EmptyStr then
    filtro := filtro + ' AND P.REFERENCIA LIKE' + '''' + edtReferencia.Text + '%''';
  if edtCodigoBarra.Text <> EmptyStr then
    filtro := filtro + ' AND P.COD_BARRA = ' + QuotedStr(edtCodigoBarra.Text);
  if comboGrupo.KeyValue > 0 then
    filtro := filtro + ' AND G.CODIGO LIKE' + '''' + fdmCupomFiscal.cdsConsProdutoCODIGO.AsString + '%''';
  fDmCupomFiscal.sdsConsProduto.CommandText := filtro;
  fDmCupomFiscal.cdsConsProduto.Open;
  if fdmCupomFiscal.cdsConsProduto.RecordCount > 0 then
    gridProduto.SetFocus
  else
  if edt <> nil then
    Edt.SetFocus
  else
    combo.SetFocus;
end;

procedure TfrmConsultaRapidaProduto.edtDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    //VK_RETURN : edtReferencia.SetFocus; // 06/03/2020  Cleomar
    VK_RETURN, VK_DOWN : prc_Consultar(edtDescricao,nil);
  end;
end;

procedure TfrmConsultaRapidaProduto.gridProdutoDblClick(Sender: TObject);
begin
  if fdmCupomFiscal.cdsConsProduto.IsEmpty then
  begin
    ModalResult := mrCancel;
    close;
  end
  else
  begin
    codigoProdutoRetorno := fdmCupomFiscal.cdsConsProdutoID.AsInteger;
    referenciaRetorno := fdmCupomFiscal.cdsConsProdutoREFERENCIA.AsString;
    ModalResult := mrOk;
  end;

end;

procedure TfrmConsultaRapidaProduto.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
    ModalResult := mrCancel;
  end
  else if key = vk_F3 then edtDescricao.SetFocus
  else if key = vk_F4 then edtReferencia.SetFocus
  else if key = vk_F5 then edtCodigoBarra.SetFocus
  else if key = vk_F6 then comboGrupo.SetFocus;

  //if Key = VK_RETURN then  Ver com Russimar
  //  gridProdutoDblClick(sender);
end;

procedure TfrmConsultaRapidaProduto.edtReferenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    //VK_RETURN : edtCodigoBarra.SetFocus; //06/03/2020  Cleomar
    VK_RETURN, VK_DOWN : prc_Consultar(edtReferencia,nil);
  end;

end;

procedure TfrmConsultaRapidaProduto.edtCodigoBarraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    //VK_RETURN : comboGrupo.SetFocus;  06/03/2020 Cleomar
    VK_RETURN, VK_DOWN : prc_Consultar(edtCodigoBarra,nil);
  end;
end;

procedure TfrmConsultaRapidaProduto.comboGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    //VK_RETURN : prc_Consultar;   06/03/2020  Cleomar
    VK_RETURN, VK_DOWN : prc_Consultar(nil,comboGrupo);
  end;

end;

procedure TfrmConsultaRapidaProduto.gridProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    gridProdutoDblClick(Sender);
end;

end.


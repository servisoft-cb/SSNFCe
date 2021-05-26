unit USel_Adicional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, RxLookup,
  DBCtrls, ValEdit, AdvSmoothPanel, ComCtrls, AdvPanel, NxCollection, uDmCupomFiscal;

type
  TfrmSel_Adicional = class(TForm)
    pnlPrincipal: TAdvPanel;
    ProgressBar1: TProgressBar;
    AdvSmoothPanel1: TAdvSmoothPanel;
    NxPanel2: TNxPanel;
    NxPanel1: TNxPanel;
    smdbgridAdicional: TSMDBGrid;
    NxPanel3: TNxPanel;
    NxPanel4: TNxPanel;
    NxPanel5: TNxPanel;
    smdbgridConsumo: TSMDBGrid;
    pnlConfirmar: TNxPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure pnlConfirmarClick(Sender: TObject);
    procedure smdbgridAdicionalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure smdbgridConsumoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
    
  end;

var
  frmSel_Adicional: TfrmSel_Adicional;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils;

{$R *.dfm}

procedure TfrmSel_Adicional.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close
  else
  if Key = VK_F10 then
  begin
    pnlConfirmarClick(Sender);
    Close;
  end;
end;

procedure TfrmSel_Adicional.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key = Vk_Return then
  //  prc_Pesquisa_Prod;
end;

procedure TfrmSel_Adicional.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  if fDmCupomFiscal.cdsProduto_Consumo.RecordCount > 0 then
    smdbgridConsumo.SelectAllClick(Sender);
end;

procedure TfrmSel_Adicional.pnlConfirmarClick(Sender: TObject);
begin
  fDmCupomFiscal.cdsProduto_Consumo.First;
  while not fDmCupomFiscal.cdsProduto_Consumo.eof do
  begin
    if not smdbgridConsumo.SelectedRows.CurrentRowSelected then
    begin
      fDmCupomFiscal.mAdicional.Insert;
      fDmCupomFiscal.mAdicionalAdicional.AsString   := 'N';
      fDmCupomFiscal.mAdicionalID_Produto.AsInteger := fDmCupomFiscal.cdsProduto_ConsumoID_MATERIAL.AsInteger;
      fDmCupomFiscal.mAdicionalNome.AsString        := fDmCupomFiscal.cdsProduto_ConsumoNOME_MATERIAL.AsString;
      fDmCupomFiscal.mAdicionalValor.AsFloat        := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsProduto_ConsumoPRECO_VENDA.AsFloat));
      fDmCupomFiscal.mAdicionalQtd.AsFloat          := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsProduto_ConsumoQTD_CONSUMO.AsFloat));
      fDmCupomFiscal.mAdicional.Post;
    end;
    fDmCupomFiscal.cdsProduto_Consumo.Next;
  end;

  fDmCupomFiscal.cdsProduto_Adicional.First;
  while not fDmCupomFiscal.cdsProduto_Adicional.eof do
  begin
    if smdbgridAdicional.SelectedRows.CurrentRowSelected then
    begin
      fDmCupomFiscal.mAdicional.Insert;
      fDmCupomFiscal.mAdicionalAdicional.AsString   := 'S';
      fDmCupomFiscal.mAdicionalID_Produto.AsInteger := fDmCupomFiscal.cdsProduto_AdicionalID_MATERIAL.AsInteger;
      fDmCupomFiscal.mAdicionalNome.AsString        := fDmCupomFiscal.cdsProduto_AdicionalNOME_MATERIAL.AsString;
      fDmCupomFiscal.mAdicionalValor.AsFloat        := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsProduto_AdicionalPRECO_VENDA.AsFloat));
      fDmCupomFiscal.mAdicionalQtd.AsFloat          := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsProduto_AdicionalQTD_CONSUMO.AsFloat));
      fDmCupomFiscal.mAdicional.Post;
    end;
    fDmCupomFiscal.cdsProduto_Adicional.Next;
  end;

end;

procedure TfrmSel_Adicional.smdbgridAdicionalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((Key = VK_Return) or (Key = 32)) and (fDmCupomFiscal.cdsProduto_AdicionalID_MATERIAL.AsInteger > 0) then
    smdbgridAdicional.SelectedRows.CurrentRowSelected := not(smdbgridAdicional.SelectedRows.CurrentRowSelected);
end;

procedure TfrmSel_Adicional.smdbgridConsumoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((Key = VK_Return) or (Key = 32)) and (fDmCupomFiscal.cdsProduto_ConsumoID_MATERIAL.AsInteger > 0) then
    smdbgridConsumo.SelectedRows.CurrentRowSelected := not(smdbgridConsumo.SelectedRows.CurrentRowSelected);
end;

end.

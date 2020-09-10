unit uCupomFiscalPgtoDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins,
  dxSkinOffice2007Blue, dxSkinSeven, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  AdvPanel, ExtCtrls, Buttons, uDmCupomFiscal, Grids, DBGrids, SMDBGrid,
  StdCtrls, RXCtrls, RxLookup, rsDBUtils, NxCollection;

type
  TfrmCupomFiscalPgtoDet = class(TForm)
    scrollEsquerda: TScrollBox;
    scrollDiretia: TScrollBox;
    scrollPrincipal: TScrollBox;
    lblProduto: TRxLabel;
    pnlCabecalho: TAdvPanel;
    RxLabel1: TRxLabel;
    pnlPrincipal: TAdvPanel;
    gridParcelas: TSMDBGrid;
    pnlDivisao: TAdvPanel;
    comboCondicaoPagto: TRxDBLookupCombo;
    btCancelar: TNxButton;
    btConfirmar: TNxButton;
    procedure comboCondicaoPagtoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    fdmCupomFiscal : TdmCupomFiscal;
    vVlr_Recebido : Currency;
    { Public declarations }
  end;

var
  frmCupomFiscalPgtoDet: TfrmCupomFiscalPgtoDet;

implementation

uses
  uCupomFiscalPgto, uCalculo_CupomFiscal;


{$R *.dfm}

procedure TfrmCupomFiscalPgtoDet.comboCondicaoPagtoChange(Sender: TObject);
begin
  if comboCondicaoPagto.Value = '' then
    Raise Exception.Create('Forma de pagamento obrigatória!');

  if ((fDmCupomFiscal.cdsCondPgtoTIPO.AsString = 'P') or
     (StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_RECEBIDO.AsFloat)) <= 0)) and
     (comboCondicaoPagto.Text = '')  then
    Raise Exception.Create('Condição de pagamento obrigatória!');

  fDmCupomFiscal.cdsCupomFiscalTIPO_PGTO.AsString :=  fdmCupomFiscal.cdsCondPgtoTIPO.AsString;
  fDmCupomFiscal.vCondicaoPgto := comboCondicaoPagto.KeyValue;

  fDmCupomFiscal.prc_Calcular_CondPagto(Sender,vVlr_Recebido);

//  prc_Calcular_Geral(fdmCupomFiscal);
end;

procedure TfrmCupomFiscalPgtoDet.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  if comboCondicaoPagto.Text <> '' then
    comboCondicaoPagtoChange(Sender);
end;

procedure TfrmCupomFiscalPgtoDet.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F10 then
    btConfirmarClick(Sender);
  if Key = VK_ESCAPE then
    btCancelarClick(Sender);
end;

procedure TfrmCupomFiscalPgtoDet.btConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmCupomFiscalPgtoDet.btCancelarClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

end.

unit uConsTrocas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxLookup, NxCollection, StdCtrls, Mask, ToolEdit, Grids,
  DBGrids, uDMConsCupom, uUtilPadrao,
  cxStyles, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins, rsDBUtils,
  dxSkinOffice2007Blue, dxSkinSeven, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxLookAndFeels, cxGrid, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  AdvPanel, CurrEdit;

type
  TfrmConsTrocas = class(TForm)
    pnlPrincipal: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridViewRepository1: TcxGridViewRepository;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    dtInicial: TDateEdit;
    dtFinal: TDateEdit;
    btnConsultar: TNxButton;
    ComboTerminal: TRxDBLookupCombo;
    edtSerie: TEdit;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1ITEM: TcxGridDBColumn;
    cxGrid1DBTableView1ITEM_TROCA: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CUPOM_TROCA: TcxGridDBColumn;
    cxGrid1DBTableView1QTD: TcxGridDBColumn;
    cxGrid1DBTableView1VLR_UNITARIO: TcxGridDBColumn;
    cxGrid1DBTableView1VLR_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1NUMCUPOM: TcxGridDBColumn;
    cxGrid1DBTableView1DTEMISSAO: TcxGridDBColumn;
    cxGrid1DBTableView1ID_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1REFERENCIA: TcxGridDBColumn;
    Label4: TLabel;
    edtNome_Produto: TEdit;
    Label5: TLabel;
    ceID_Produto: TCurrencyEdit;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fDMConsCupom: TDMConsCupom;
    
    procedure prc_Consultar;
  public
    { Public declarations }

  end;

var
  frmConsTrocas: TfrmConsTrocas;

implementation


{$R *.dfm}

procedure TfrmConsTrocas.FormShow(Sender: TObject);
begin
  fDmConsCupom := TDmConsCupom.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsCupom);

  dtInicial.Date := Date;
  dtFinal.Date   := Date;
  ComboTerminal.KeyValue := vTerminal;
end;

procedure TfrmConsTrocas.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConsTrocas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(fDMConsCupom);
  Action := Cafree;
end;

procedure TfrmConsTrocas.prc_Consultar;
var
  vComando: string;
begin
  fDMConsCupom.cdsConsTroca.Close;
  vComando := fDMConsCupom.ctConsTrocas;
  vComando := vComando + 'WHERE 0=0';
  if dtInicial.Date > 10 then
    vComando := vComando + ' AND C.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicial.date));
  if dtFinal.Date > 10 then
    vComando := vComando + ' AND C.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtFinal.date));
  if ComboTerminal.KeyValue > 0 then
    vComando := vComando + ' AND TERMINAL_ID = ' + ComboTerminal.Value;
  if edtSerie.Text <> EmptyStr then
    vComando := vComando + ' AND C.SERIE = ' + edtSerie.Text;
  if ceID_Produto.AsInteger > 0 then
    vComando := vComando + ' AND T.ID_PRODUTO = ' + IntToStr(ceID_Produto.AsInteger);
  if trim(edtNome_Produto.Text) <> '' then
    vComando := vComando + ' AND P.NOME LIKE ' + QuotedStr('%'+edtNome_Produto.Text+'%');
  fDMConsCupom.sdsConsTroca.CommandText := vComando;
  fDMConsCupom.cdsConsTroca.Open;
end;

end.


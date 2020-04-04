unit uConsRapidaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins,
  dxSkinOffice2007Blue, dxSkinSeven, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  StdCtrls, RxLookup, NxCollection, Mask, ToolEdit, AdvPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls;

type
  TfrmConsRapidaPedido = class(TForm)
    pnlPrincipal: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1DTEMISSAO: TcxGridDBColumn;
    cxGrid1DBTableView1HREMISSAO: TcxGridDBColumn;
    cxGrid1DBTableView1NUMCUPOM: TcxGridDBColumn;
    cxGrid1DBTableView1SERIE: TcxGridDBColumn;
    cxGrid1DBTableView1VLR_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1CANCELADO: TcxGridDBColumn;
    cxGrid1DBTableView1CPF: TcxGridDBColumn;
    cxGrid1DBTableView1NFECHAVEACESSO: TcxGridDBColumn;
    cxGrid1DBTableView1NFEPROTOCOLO: TcxGridDBColumn;
    cxGrid1DBTableView1NFERECIBO: TcxGridDBColumn;
    cxGrid1DBTableView1CLIENTE_NOME: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    dtInicial: TDateEdit;
    dtFinal: TDateEdit;
    btnConsultar: TNxButton;
    ComboTerminal: TRxDBLookupCombo;
    cbNEnviados: TCheckBox;
    btnEnviar: TNxButton;
    btnReimprimir: TNxButton;
    edtSerie: TEdit;
    chkNFCE: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsRapidaPedido: TfrmConsRapidaPedido;

implementation

{$R *.dfm}

end.

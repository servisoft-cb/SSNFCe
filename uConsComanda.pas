unit uConsComanda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxLookup, NxCollection, StdCtrls, Mask, ToolEdit, Grids,
  DBGrids, SMDBGrid, uDmCupomFiscal, uUtilPadrao, 
  cxStyles, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins, rsDBUtils,
  dxSkinOffice2007Blue, dxSkinSeven, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxLookAndFeels, cxGrid, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  AdvPanel;

type
  TfrmConsComanda = class(TForm)
    pnlPrincipal: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DTEMISSAO: TcxGridDBColumn;
    cxGrid1DBTableView1VLR_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1CLIENTE_NOME: TcxGridDBColumn;
    cxGrid1DBTableView1HREMISSAO: TcxGridDBColumn;
    cxGridViewRepository1: TcxGridViewRepository;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtInicial: TDateEdit;
    dtFinal: TDateEdit;
    btnConsultar: TNxButton;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cbOpcao: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    procedure prc_Consultar;
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
    vCancelar : Boolean;
    vExcluir : Boolean;
  end;

var
  frmConsComanda: TfrmConsComanda;

implementation

uses uConsCupomItens;


{$R *.dfm}

procedure TfrmConsComanda.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);

  dtInicial.Date := Date;
  dtFinal.Date   := Date;
  btnConsultarClick(Sender);
end;

procedure TfrmConsComanda.btnConsultarClick(Sender: TObject);
begin
  if dtInicial.Date <= 10 then
    dtInicial.Date := Date;
  if dtFinal.Date <= 10 then
    dtFinal.Date := Date;
  prc_Consultar;
end;

procedure TfrmConsComanda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TfrmConsComanda.prc_Consultar;
var
  vComando: string;
begin
  fDmCupomFiscal.cdsCupom_Cons.Close;
  vComando := fDmCupomFiscal.ctConsCupom;
  vComando := vComando + 'WHERE 0=0';
  vComando := vComando + ' AND CF.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicial.date));
  vComando := vComando + ' AND CF.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtFinal.date));
  vComando := vComando + ' AND TIPO = ' + QuotedStr('COM');
  if cbOpcao.Checked then
    vComando := vComando + ' AND CF.ID_TIPOCOBRANCA IS NULL';
  vComando := vComando + ' ORDER BY CF.HREMISSAO DESC';
  fDmCupomFiscal.sdsCupom_Cons.CommandText := vComando;
  fDmCupomFiscal.cdsCupom_Cons.Open;
end;

procedure TfrmConsComanda.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  ffrmConsCupomItens : TfrmConsCupomItens;
begin
  if fDmCupomFiscal.cdsCupom_Cons.IsEmpty then
    Exit;
  fDmCupomFiscal.prcLocalizar(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
  ffrmConsCupomItens := TfrmConsCupomItens.Create(nil);
  ffrmConsCupomItens.fDMCupomFiscal := fDmCupomFiscal;
  ffrmConsCupomItens.ShowModal;
  FreeAndNil(ffrmConsCupomItens);

end;

end.


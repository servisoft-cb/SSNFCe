unit uConsCashBack;

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
  AdvPanel, CurrEdit, NxEdit, RzTabs;

type
  TfrmConsCashBack = class(TForm)
    pnlPrincipal: TPanel;
    cxGridViewRepository1: TcxGridViewRepository;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    dtInicial: TDateEdit;
    dtFinal: TDateEdit;
    btnConsultar: TNxButton;
    ComboFilial: TRxDBLookupCombo;
    btnImprimir: TNxButton;
    Label3: TLabel;
    Edit1: TEdit;
    RzPageControl1: TRzPageControl;
    TS_Historico: TRzTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1DATA: TcxGridDBColumn;
    cxGrid1DBTableView1HORA: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CUPOM: TcxGridDBColumn;
    cxGrid1DBTableView1NUMCUPOM: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR2: TcxGridDBColumn;
    cxGrid1DBTableView1TIPO_ES: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsCupom: TDMConsCupom;
    
    procedure prc_Consultar;
  public
    { Public declarations }

  end;

var
  frmConsCashBack: TfrmConsCashBack;

implementation


{$R *.dfm}

procedure TfrmConsCashBack.FormShow(Sender: TObject);
begin
  fDmConsCupom := TDmConsCupom.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsCupom);
  dtInicial.Date := Date;
end;

procedure TfrmConsCashBack.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConsCashBack.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(fDMConsCupom);
  Action := Cafree;
end;

procedure TfrmConsCashBack.prc_Consultar;
var
  vComando: string;
begin
  fDMConsCupom.cdsConsCash.Close;
  vComando := fDMConsCupom.ctConsCash;
  vComando := vComando + 'WHERE 0 = 0';
  if dtInicial.Date > 10 then
    vComando := vComando + ' AND C.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicial.date));
  if dtFinal.Date > 10 then
    vComando := vComando + ' AND C.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtFinal.date));
  if ComboFilial.KeyValue > 0 then
    vComando := vComando + ' AND CF.FILIAL = ' + ComboFilial.Value;
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND P.NOME LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  fDMConsCupom.sdsConsCash.CommandText := vComando;
  fDMConsCupom.cdsConsCash.Open;
  fDMConsCupom.cdsConsCash.IndexFieldNames := 'NOME_CLIENTE;DATA';
end;

procedure TfrmConsCashBack.btnImprimirClick(Sender: TObject);
var
  vArq: String;
  vOpcao: String;
begin
  fDMConsCupom.cdsConsCash.IndexFieldNames := 'NOME_CLIENTE;DATA';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Cons_CashBack.fr3';
  if not FileExists(vArq) then
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    exit;
  end;
  vOpcao := '';
  if ComboFilial.Text <> '' then
    vOpcao := vOpcao + ' (Filial: ' + ComboFilial.Text + ')';
  if (dtInicial.Date > 10) and (dtFinal.Date > 10) then
    vOpcao := vOpcao + ' (Data: ' + dtInicial.Text + ' até ' + dtFinal.Text + ')'
  else
  if (dtInicial.Date > 10) then
    vOpcao := vOpcao + ' (Data Inicial: ' + dtInicial.Text + ')'
  else
  if (dtFinal.Date > 10) then
    vOpcao := vOpcao + ' (Data Final: ' + dtFinal.Text + ')';
  if trim(Edit1.Text) <> '' then
    vOpcao := vOpcao + ' (Cliente: ' + Edit1.Text + ')';
  fDMConsCupom.frxReport1.Report.LoadFromFile(vArq);
  fDMConsCupom.frxReport1.Variables['OpcaoImp'] := QuotedStr(vOpcao);
  fDMConsCupom.frxReport1.ShowReport
end;

end.


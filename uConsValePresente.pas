unit uConsValePresente;

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
  AdvPanel, CurrEdit, NxEdit;

type
  TfrmConsValePresente = class(TForm)
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
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1DATA: TcxGridDBColumn;
    cxGrid1DBTableView1HORA: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR: TcxGridDBColumn;
    cxGrid1DBTableView1NUMCUPOM: TcxGridDBColumn;
    cxGrid1DBTableView1SERIE: TcxGridDBColumn;
    cxGrid1DBTableView1TIPO_CUPOM: TcxGridDBColumn;
    cxGrid1DBTableView1NUMCUPOM_USADO: TcxGridDBColumn;
    cxGrid1DBTableView1SERIE_USADO: TcxGridDBColumn;
    cxGrid1DBTableView1TIPO_USADO: TcxGridDBColumn;
    cxGrid1DBTableView1DTEMISSAO_USADO: TcxGridDBColumn;
    cxGrid1DBTableView1DESC_TIPO: TcxGridDBColumn;
    NxComboBox1: TNxComboBox;
    Label3: TLabel;
    btnImprimir: TNxButton;
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
  frmConsValePresente: TfrmConsValePresente;

implementation


{$R *.dfm}

procedure TfrmConsValePresente.FormShow(Sender: TObject);
begin
  fDmConsCupom := TDmConsCupom.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsCupom);
  dtInicial.Date := Date;
end;

procedure TfrmConsValePresente.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConsValePresente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(fDMConsCupom);
  Action := Cafree;
end;

procedure TfrmConsValePresente.prc_Consultar;
var
  vComando: string;
begin
  fDMConsCupom.cdsConsRecibo.Close;
  vComando := fDMConsCupom.ctConsRecibo;
  vComando := vComando + 'WHERE 0=0';
  if dtInicial.Date > 10 then
    vComando := vComando + ' AND REC.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicial.date));
  if dtFinal.Date > 10 then
    vComando := vComando + ' AND REC.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtFinal.date));
  if ComboFilial.KeyValue > 0 then
    vComando := vComando + ' AND C.FILIAL = ' + ComboFilial.Value;
  case NxComboBox1.ItemIndex of
    1 : vComando := vComando + ' AND REC.USADO = ' + QuotedStr('N');
    2 : vComando := vComando + ' AND REC.USADO = ' + QuotedStr('S');
  end;
  fDMConsCupom.sdsConsRecibo.CommandText := vComando;
  fDMConsCupom.cdsConsRecibo.Open;
end;

procedure TfrmConsValePresente.btnImprimirClick(Sender: TObject);
var
  vArq: String;
  vOpcao: String;
begin
  fDMConsCupom.cdsConsRecibo.IndexFieldNames := 'TIPO;NUMCUPOM';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Cons_ReciboVale.fr3';
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
  case NxComboBox1.ItemIndex of
    1 : vOpcao := vOpcao + ' (Opção: Pendente)';
    2 : vOpcao := vOpcao + ' (Opção: Trocados)';
  end;
  fDMConsCupom.frxReport1.Report.LoadFromFile(vArq);
  fDMConsCupom.frxReport1.Variables['OpcaoImp'] := QuotedStr(vOpcao);
  fDMConsCupom.frxReport1.ShowReport
end;

end.


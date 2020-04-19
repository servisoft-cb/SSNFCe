unit uConsCupomItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, rsDBUtils,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, SMDBGrid, uDmCupomFiscal,
  RzTabs;

type
  TfrmConsCupomItens = class(TForm)
    pnlTop: TPanel;
    dbtDataEmissao: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    dbtHoraEmissao: TDBText;
    Label3: TLabel;
    dbtNumCupom: TDBText;
    Label4: TLabel;
    dbtChaveAcesso: TDBText;
    Label5: TLabel;
    dbtProtocolo: TDBText;
    Label6: TLabel;
    dbtSerie: TDBText;
    Label7: TLabel;
    dbtTerminal: TDBText;
    Label8: TLabel;
    dbtRecibo: TDBText;
    RzPageControl1: TRzPageControl;
    TS_Itens: TRzTabSheet;
    TS_Pagamentos: TRzTabSheet;
    pnlPrincipal: TPanel;
    gridConsulta: TSMDBGrid;
    pnlTroca: TPanel;
    GroupBox1: TGroupBox;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    SMDBGrid3: TSMDBGrid;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  fDMCupomFiscal : TdmCupomFiscal;
  end;

var
  frmConsCupomItens: TfrmConsCupomItens;

implementation

{$R *.dfm}

procedure TfrmConsCupomItens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMCupomFiscal.cdsCupomFiscal.Active then
    fDMCupomFiscal.cdsCupomFiscal.Close;
  Close
end;

procedure TfrmConsCupomItens.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  pnlTroca.Visible := (StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat)) > 0);
  if StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat)) > 0 then
  begin
    fDMCupomFiscal.cdsCupom_Troca.Close;
    fDMCupomFiscal.sdsCupom_Troca.ParamByName('ID_CUPOM').AsInteger := fDMCupomFiscal.cdsCupomFiscalID.AsInteger;
    fDMCupomFiscal.cdsCupom_Troca.Open;
  end;
  fDMCupomFiscal.cdsConsCupom_FormaPagto.Close;
  fDMCupomFiscal.sdsConsCupom_FormaPagto.ParamByName('ID').AsInteger := fDMCupomFiscal.cdsCupomFiscalID.AsInteger;
  fDMCupomFiscal.cdsConsCupom_FormaPagto.Open;
end;
end.

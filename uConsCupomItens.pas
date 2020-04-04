unit uConsCupomItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, rsDBUtils,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, SMDBGrid, uDmCupomFiscal;

type
  TfrmConsCupomItens = class(TForm)
    pnlTop: TPanel;
    pnlPrincipal: TPanel;
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
    gridConsulta: TSMDBGrid;
    Label7: TLabel;
    dbtTerminal: TDBText;
    Label8: TLabel;
    dbtRecibo: TDBText;
    pnlTroca: TPanel;
    GroupBox1: TGroupBox;
    SMDBGrid1: TSMDBGrid;
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
end;
end.

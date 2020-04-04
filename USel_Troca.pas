unit USel_Troca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, NxCollection,
  Grids, DBGrids, SMDBGrid, FMTBcd, DB, SqlExpr, Provider, DBClient, UDMCupomFiscal;

type
  TfrmSel_Troca = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    btnConsulta: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    Label5: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Panel2: TPanel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
    
  end;

var
  frmSel_Troca: TfrmSel_Troca;

implementation

uses DmdDatabase, rsDBUtils, uUtilPadrao;

{$R *.dfm}

procedure TfrmSel_Troca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmSel_Troca.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  fDmCupomFiscal.cdsTroca.Close;
  DateEdit1.Date := Date - 15;
end;

procedure TfrmSel_Troca.btnConsultaClick(Sender: TObject);
begin
  fDmCupomFiscal.prc_Consultar_Troca(CurrencyEdit2.AsInteger,CurrencyEdit1.AsInteger,'',Edit1.Text,Edit2.Text,DateEdit1.Date);
  if not fDmCupomFiscal.cdsTroca.IsEmpty then
    SMDBGrid1.SetFocus;
end;

procedure TfrmSel_Troca.SMDBGrid1DblClick(Sender: TObject);
begin
  if not (fDmCupomFiscal.cdsTroca.Active) or (fDmCupomFiscal.cdsTroca.IsEmpty) then
    exit;
  fDmCupomFiscal.vID_Troca    := fDmCupomFiscal.cdsTrocaID.AsInteger;
  fDmCupomFiscal.vItem_Troca  := fDmCupomFiscal.cdsTrocaITEM.AsInteger;
  Close;
end;

procedure TfrmSel_Troca.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then
   btnConsultaClick(Sender);

end;

procedure TfrmSel_Troca.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    SMDBGrid1DblClick(Sender);
end;

procedure TfrmSel_Troca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Escape then
    Close;
end;

end.

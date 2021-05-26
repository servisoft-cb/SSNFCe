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
    SMDBGrid1: TSMDBGrid;
    NxButton1: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
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

procedure TfrmSel_Adicional.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action         := Cafree;
end;

procedure TfrmSel_Adicional.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
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
end;

end.

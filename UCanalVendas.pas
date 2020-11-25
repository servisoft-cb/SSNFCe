unit uCanalVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit,
  uDmCupomFiscal, RxLookup, Grids, DBGrids, DBCtrls, DB;

type
  TfrmCanalVendas = class(TForm)
    Label1: TLabel;
    gridPagamentosDisponiveis: TDBGrid;
    CurrencyEdit1: TCurrencyEdit;
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridPagamentosDisponiveisDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
  end;

var
  frmCanalVendas: TfrmCanalVendas;

implementation

{$R *.dfm}

procedure TfrmCanalVendas.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    if not fDmCupomFiscal.cdsCanalVendas.Locate('ID', CurrencyEdit1.AsInteger, [loCaseInsensitive]) then
    begin
      MessageDlg('*** Canal de Vendas não encontrado!', mtInformation, [mbOk], 0);
      CurrencyEdit1.Clear;
    end
    else
    begin
      fDmCupomFiscal.vID_Canal_Vendas := CurrencyEdit1.AsInteger;
      fDmCupomFiscal.vID_TabPreco_CV  := fDmCupomFiscal.cdsCanalVendasID_TABPRECO.AsInteger;
      Close;
    end;
  end
  else
  if (Key = VK_ESCAPE) then
    Close;

end;

procedure TfrmCanalVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCanalVendas.gridPagamentosDisponiveisDblClick(
  Sender: TObject);
begin
  if fDmCupomFiscal.cdsCanalVendasID.AsInteger > 0 then
  begin
    CurrencyEdit1.AsInteger        := fDmCupomFiscal.cdsCanalVendasID.AsInteger;
    fDmCupomFiscal.vID_TabPreco_CV := fDmCupomFiscal.cdsCanalVendasID_TABPRECO.AsInteger;
    Close;
  end;
end;

end.

unit uCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit,
  uDmCupomFiscal, ExtCtrls, uUtilPadrao;

type
  TfCartao = class(TForm)
    Panel1: TPanel;
    pnlCartao: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    pnlFechar: TPanel;
    Panel2: TPanel;
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
  end;

var
  fCartao: TfCartao;

implementation

{$R *.dfm}

procedure TfCartao.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    fDmCupomFiscal.vNumCartao := CurrencyEdit1.AsInteger;
    Close;
    ModalResult := mrOk;
  end;
end;

procedure TfCartao.Panel2Click(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

end.

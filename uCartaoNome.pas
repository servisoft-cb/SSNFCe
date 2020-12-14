unit uCartaoNome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit,
  uDmCupomFiscal, ExtCtrls, uUtilPadrao;

type
  TfCartaoNome = class(TForm)
    Panel1: TPanel;
    pnlCartao: TPanel;
    pnlFechar: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    edtNome: TEdit;
    procedure Panel2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
  end;

var
  fCartaoNome: TfCartaoNome;

implementation

{$R *.dfm}

procedure TfCartaoNome.Panel2Click(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TfCartaoNome.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    Close;
    ModalResult := mrOk;
  end;
end;

end.

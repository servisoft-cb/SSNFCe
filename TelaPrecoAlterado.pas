unit TelaPrecoAlterado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, RXCtrls, ComCtrls, Grids, DBGrids, RXDBCtrl, Mask,
  ToolEdit, CurrEdit;

type
  TFormTelaPrecoAlterado = class(TForm)
    PanelPrincipal: TPanel;
    lbVlrUnitario: TRxLabel;
    RxLabel2: TRxLabel;
    EditValorTotal: TCurrencyEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Controla_Dig_Preco : String;
    Altera_Preco_Pedido : String;
    Valor_Original : Real;

    { Public declarations }
  end;

var
  FormTelaPrecoAlterado: TFormTelaPrecoAlterado;

implementation

{$R *.DFM}

procedure TFormTelaPrecoAlterado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Close;
end;

procedure TFormTelaPrecoAlterado.RxDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vDouble: Double;
begin
  if Key = 13 then
    ModalResult := MrOK;
  if Key = 27 then
    ModalResult := MrCancel;
  if Key = 13 then
  begin
    if EditValorTotal.Text <> '' then
    begin
      vDouble := StrToFloat(EditValorTotal.Text);
      if (vDouble <= 0) then
      begin
        ModalResult := mrCancel;
      end;
      if (Controla_Dig_Preco = 'S') and
         (Altera_Preco_Pedido = 'C') and
         (StrToFloat(FormatFloat('0.000000', EditValorTotal.Value)) < StrToFloat(FormatFloat('0.000000', Valor_Original))) then
      begin
        MessageDlg('*** Preço não pode ser menor que ' + FormatFloat('0.00####', Valor_Original), mtError, [mbOk], 0);
        EditValorTotal.Value := Valor_Original;
        ModalResult := mrCancel;
      end;
    end
    else
    begin
      ModalResult := mrCancel;
    end;
  end;
end;

procedure TFormTelaPrecoAlterado.FormCreate(Sender: TObject);
begin
  EditValorTotal.DisplayFormat := 'R$ ,0.00;-R$ ,0.00';
  EditValorTotal.DecimalPlaces := 2;
end;

end.


unit uTipoDescontoItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RXCtrls, Mask, ToolEdit, CurrEdit, AdvPanel,
  cxLookAndFeelPainters, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup;

type
  TfrmTelaTipoDescontoItem = class(TForm)
    AdvPanel1: TAdvPanel;
    EditDesconto: TCurrencyEdit;
    rdgDescontoUnitario: TcxRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EditDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DescValorClick(Sender: TObject);
    procedure DescPercClick(Sender: TObject);
    procedure rdgDescontoUnitarioFocusChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    vValorOriginal : Double;
    { Public declarations }
  end;

var
  frmTelaTipoDescontoItem: TfrmTelaTipoDescontoItem;

implementation

uses
  UCupomFiscal;

{$R *.DFM}

procedure TfrmTelaTipoDescontoItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree ;
end;

procedure TfrmTelaTipoDescontoItem.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;
end;

procedure TfrmTelaTipoDescontoItem.EditDescontoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : begin
                  Close ;
                  ModalResult := MrOK;
                end;
  end;
end;

procedure TfrmTelaTipoDescontoItem.DescValorClick(Sender: TObject);
begin
  EditDesconto.setfocus;
end;

procedure TfrmTelaTipoDescontoItem.DescPercClick(Sender: TObject);
begin
  EditDesconto.setfocus;
end;

procedure TfrmTelaTipoDescontoItem.rdgDescontoUnitarioFocusChanged(
  Sender: TObject);
begin
  if rdgDescontoUnitario.ItemIndex = 2 then
    EditDesconto.Value := vValorOriginal
  else

end;

procedure TfrmTelaTipoDescontoItem.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Escape : begin
                  Close ;
                end ;

    39 : begin
           if rdgDescontoUnitario.ItemIndex = 2 then
             rdgDescontoUnitario.ItemIndex := 0
           else
            rdgDescontoUnitario.ItemIndex := rdgDescontoUnitario.ItemIndex + 1;
         end;
  end ;

end;

end.

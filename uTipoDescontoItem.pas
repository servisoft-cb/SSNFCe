unit uTipoDescontoItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RXCtrls, Mask, ToolEdit, CurrEdit, AdvPanel,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins,
  dxSkinOffice2007Blue, dxSkinSeven, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup;

type
  TfrmTelaTipoDescontoItem = class(TForm)
    AdvPanel1: TAdvPanel;
    EditDesconto: TCurrencyEdit;
    rdgDescontoUnitario: TcxRadioGroup;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EditDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DescValorClick(Sender: TObject);
    procedure DescPercClick(Sender: TObject);
    procedure rdgDescontoUnitarioFocusChanged(Sender: TObject);
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

procedure TfrmTelaTipoDescontoItem.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Escape : begin
//                  TipoDescItem := '' ;
                  Close ;
                end ;
//    VK_Return : begin
//                   if DescValor.Checked Then
//                   begin
//                     TipoDescItem := 'VALOR' ;
//                     TipoDescFech := 'VALOR' ;
//                   end ;
//                   if DescPerc.Checked Then
//                   begin
//                     TipoDescItem := 'PERCENTUAL' ;
//                     TipoDescFech := 'PERCENTUAL' ;
//                   end ;
//                   EditDesconto.SetFocus;
//                end ;
//    37 : begin
//           DescValor.Checked := True;
//           DescPerc.Checked := False;
//         end;
//    39 : begin
//           DescValor.Checked := False;
//           DescPerc.Checked := True;
//         end;
  end ;
end;

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

end.

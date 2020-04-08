unit uTipoFormaPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RXCtrls, Mask, ToolEdit, CurrEdit, AdvPanel,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins,
  dxSkinOffice2007Blue, dxSkinSeven, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup, dxSkinBlack, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmTelaTipoFormaPagto = class(TForm)
    AdvPanel1: TAdvPanel;
    rdgTipoFormaPagto: TcxRadioGroup;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EditDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    vValorOriginal : Double;
    { Public declarations }
  end;

var
  frmTelaTipoFormaPagto: TfrmTelaTipoFormaPagto;

implementation

uses
  UCupomFiscal;

{$R *.DFM}

procedure TfrmTelaTipoFormaPagto.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Escape : begin
//                  TipoDescItem := '' ;
                  Close ;
                end ;
    VK_Return : begin
                  Close ;
                  ModalResult := MrOK;
                end;
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

procedure TfrmTelaTipoFormaPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree ;
end;

procedure TfrmTelaTipoFormaPagto.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;
end;

procedure TfrmTelaTipoFormaPagto.EditDescontoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : begin
                  Close ;
                  ModalResult := MrOK;
                end;
  end;
end;

end.

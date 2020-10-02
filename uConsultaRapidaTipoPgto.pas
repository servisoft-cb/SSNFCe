unit uConsultaRapidaTipoPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, AdvSmoothPanel, RXCtrls, uDmPagamento;

type
  TfrmConsultaRapidaTipoPagto = class(TForm)
    ScrollBoxPrincipal: TScrollBox;
    LblTituloTela: TRxLabel;
    AdvSmoothPanel3: TAdvSmoothPanel;
    DBGridLista: TDBGrid;
    VALOR: TEdit;
    procedure FormShow(Sender: TObject);
    procedure DBGridListaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmPagamento : TdmPagamento;
  end;

var
  frmConsultaRapidaTipoPagto: TfrmConsultaRapidaTipoPagto;

implementation

uses
  uUtilPadrao;

{$R *.dfm}

procedure TfrmConsultaRapidaTipoPagto.FormShow(Sender: TObject);
begin
  fDmPagamento.cdsTipoCobranca.Close;
  fDmPagamento.cdsTipoCobranca.Open;
end;

procedure TfrmConsultaRapidaTipoPagto.DBGridListaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return :
    begin
      if fDmPagamento.cdsTipoCobrancaID.AsInteger > 0 then
      begin
        vid_TipoCobranca := fDmPagamento.cdsTipoCobrancaID.AsInteger;
      end;
      Close;
      ModalResult := mrOk;
    end;
    VK_Escape :
    begin
      Close;
      ModalResult := mrCancel;
    end;
  end;

end;

end.

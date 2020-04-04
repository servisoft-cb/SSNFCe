unit uSel_CorTamanho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, uDmCupomFiscal,
  NxCollection, ExtCtrls, RxLookup, StdCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr, rsDBUtils;

type
  TfSel_CorTamanho = class(TForm)
    Panel1: TPanel;
    btConfirmar: TNxButton;
    brCancelar: TNxButton;
    Label1: TLabel;
    Label2: TLabel;
    comboCor: TRxDBLookupCombo;
    comboTamanho: TRxDBLookupCombo;
    procedure brCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
    vProd: Integer;
  end;

var
  fSel_CorTamanho: TfSel_CorTamanho;

implementation

{$R *.dfm}

procedure TfSel_CorTamanho.brCancelarClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TfSel_CorTamanho.btConfirmarClick(Sender: TObject);
begin
  if (comboCor.Text = EmptyStr) and (fdmCupomFiscal.cdsCombinacao.RecordCount > 0) then
  begin
    MessageDlg('Informe uma Cor!',mtInformation,[mbOK],0);
    comboCor.SetFocus;
    Exit;
  end;
  if (comboTamanho.Text = EmptyStr) and (fdmCupomFiscal.cdsTamanho.RecordCount > 0) then
  begin
    MessageDlg('Informe um Tamanho!',mtInformation,[mbOK],0);
    comboTamanho.SetFocus;
    Exit;
  end;
  if fdmCupomFiscal.cdsCombinacaoID_COR_COMBINACAO.AsInteger > 0 then
  begin
    fDmCupomFiscal.vCombinacao   := comboCor.Text;
    fDmCupomFiscal.vIdCombinacao := comboCor.KeyValue;
  end;
  if fdmCupomFiscal.cdsTamanhoTAMANHO.AsString <> EmptyStr then
    fDmCupomFiscal.vTamanho      := comboTamanho.KeyValue;
  Close;
  ModalResult := mrOk;
end;

procedure TfSel_CorTamanho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfSel_CorTamanho.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);

  fdmCupomFiscal.cdsCombinacao.Close;
  fdmCupomFiscal.sdsCombinacao.ParamByName('P1').AsInteger := vProd;
  fdmCupomFiscal.cdsCombinacao.Open;

  fdmCupomFiscal.cdsTamanho.Close;
  fdmCupomFiscal.sdsTamanho.ParamByName('P1').AsInteger := vProd;
  fdmCupomFiscal.cdsTamanho.Open;

end;

end.

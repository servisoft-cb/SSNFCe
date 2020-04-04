unit uCupomFiscalParcela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  RxDBComb, Mask, DBCtrls, uDmCupomFiscal, RxLookup, rsDBUtils, ToolEdit, RXDBCtrl,
  NxCollection, CurrEdit;

type
  TfCupomFiscalParcela = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboFormaPgto: TRxDBLookupCombo;
    btFinalizar: TNxButton;
    btCancelar: TNxButton;
    Label5: TLabel;
    dateDataEntrada: TDateEdit;
    edtValor: TCurrencyEdit;
    edtParcela: TCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure ComboFormaPgtoEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFinalizarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmCupomFiscal: TdmCupomFiscal;
  end;

var
  fCupomFiscalParcela: TfCupomFiscalParcela;

implementation

uses DB;

{$R *.dfm}

procedure TfCupomFiscalParcela.FormShow(Sender: TObject);
begin
//  oDBUtils.SetDataSourceProperties(Self,fDmCupomFiscal);
//  Label5.Visible := fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger = 0;
//  if fDmCupomFiscal.cdsCupomParametrosRACHAR_CONTA.AsString <> 'S' then
//  begin
//    DBEdit3.ReadOnly := (Tag = 1) or (fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger > 1); //Somente pode atualizar a primeira parcela
//    DBEdit3.TabStop := not DBEdit3.ReadOnly;
//  end;

  dateDataEntrada.Date := Date;
  edtValor.SelectAll;
  edtValor.SetFocus;
end;

procedure TfCupomFiscalParcela.ComboFormaPgtoEnter(Sender: TObject);
begin
//  fDmCupomFiscal.cdsTipoCobranca.IndexFieldNames := 'NOME';
end;

procedure TfCupomFiscalParcela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCupomFiscalParcela.btFinalizarClick(Sender: TObject);
begin
  if (edtParcela.Value = 0) and (edtValor.Value = 0) then
  begin
    ShowMessage('Valor de entrada deve ser informado!');
    Exit;
    Close;
  end;
//  fDmCupomFiscal.cdsCupom_ParcTIPO_COBRANCA.AsString := ComboFormaPgto.Text;
//  fDmCupomFiscal.cdsCupom_Parc.Post;
//  if fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger = 0 then
//    fDmCupomFiscal.vVlrEntrada := fDmCupomFiscal.cdsCupom_ParcVLR_VENCIMENTO.AsCurrency;
//  if (fDmCupomFiscal.cdsCupom_ParcPARCELA.AsInteger = 0) then
//    fDmCupomFiscal.vDataEntrada := DBDateEdit1.Date;
  Close;
  ModalResult := mrOk;
end;

procedure TfCupomFiscalParcela.btCancelarClick(Sender: TObject);
begin
  Close;
end;

end.

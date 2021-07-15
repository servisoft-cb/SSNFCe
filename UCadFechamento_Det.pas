unit UCadFechamento_Det;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UDMCadFechamento, ExtCtrls, RzPanel,
  Grids, DBGrids, SMDBGrid, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons,
  AdvPanel, NxCollection;

type
  TfrmCadFechamento_Det = class(TForm)
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel1: TNxPanel;
    RzGroupBox1: TRzGroupBox;
    SMDBGrid2: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure prc_Consultar;

  public
    { Public declarations }
    fDMCadFechamento: TDMCadFechamento;    
  end;

var
  frmCadFechamento_Det: TfrmCadFechamento_Det;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmCadFechamento_Det.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadFechamento_Det.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadFechamento);

  prc_Consultar;
end;

procedure TfrmCadFechamento_Det.prc_Consultar;
begin
  fDMCadFechamento.cdsCupomFecDet.Close;
  fDMCadFechamento.sdsCupomFecDet.ParamByName('FILIAL').AsInteger        := fDMCadFechamento.cdsFechamentoFILIAL.AsInteger;
  fDMCadFechamento.sdsCupomFecDet.ParamByName('DTMOVIMENTO').AsDate      := fDMCadFechamento.cdsFechamentoDATA.AsDateTime;
  fDMCadFechamento.sdsCupomFecDet.ParamByName('TERMINAL').AsInteger      := fDMCadFechamento.cdsFechamentoTERMINAL_ID.AsInteger;
  fDMCadFechamento.sdsCupomFecDet.ParamByName('ID_FECHAMENTO').AsInteger := fDMCadFechamento.cdsFechamentoID.AsInteger;
  fDMCadFechamento.sdsCupomFecDet.ParamByName('ID_CONTA').AsInteger      := fDMCadFechamento.cdsFechamentoID_CONTA.AsInteger;
  fDMCadFechamento.sdsCupomFecDet.ParamByName('ID_CONTA_PER').AsInteger  := fDMCadFechamento.cdsFechamentoID_CONTA.AsInteger;
  fDMCadFechamento.cdsCupomFecDet.Open;

  fDMCadFechamento.cdsCupomFecDet.IndexFieldNames := 'TIPO;TIPO_DOC;NUM_DOC';

  fDMCadFechamento.cdsCupomFecTotal.Close;
  fDMCadFechamento.sdsCupomFecTotal.ParamByName('FILIAL').AsInteger        := fDMCadFechamento.cdsFechamentoFILIAL.AsInteger;
  fDMCadFechamento.sdsCupomFecTotal.ParamByName('DTMOVIMENTO').AsDate      := fDMCadFechamento.cdsFechamentoDATA.AsDateTime;
  fDMCadFechamento.sdsCupomFecTotal.ParamByName('TERMINAL').AsInteger      := fDMCadFechamento.cdsFechamentoTERMINAL_ID.AsInteger;
  fDMCadFechamento.sdsCupomFecTotal.ParamByName('ID_FECHAMENTO').AsInteger := fDMCadFechamento.cdsFechamentoID.AsInteger;
  fDMCadFechamento.sdsCupomFecTotal.ParamByName('ID_CONTA').AsInteger      := fDMCadFechamento.cdsFechamentoID_CONTA.AsInteger;
  fDMCadFechamento.sdsCupomFecTotal.ParamByName('ID_CONTA_PER').AsInteger  := fDMCadFechamento.cdsFechamentoID_CONTA.AsInteger;
  fDMCadFechamento.cdsCupomFecTotal.Open;

end;

procedure TfrmCadFechamento_Det.SMDBGrid1TitleClick(Column: TColumn);
begin
  fDMCadFechamento.cdsCupomFecDet.IndexFieldNames := Column.FieldName;
end;

end.

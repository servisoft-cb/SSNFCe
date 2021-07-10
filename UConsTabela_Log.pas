unit UConsTabela_Log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NxEdit, ExtCtrls, NxCollection, Grids, DBGrids,
  SMDBGrid, AdvPanel, DB, UDMConsTabela_Log;

type
  TfrmConsTabela_Log = class(TForm)
    Panel1: TPanel;
    cbLocalServidor: TNxComboBox;
    NxButton1: TNxButton;
    Label1: TLabel;
    lblTerminal: TLabel;
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel1: TNxPanel;
    AdvPanel1: TAdvPanel;
    SMDBGrid2: TSMDBGrid;
    NxPanel2: TNxPanel;
    NxSplitter1: TNxSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure cbLocalServidorChange(Sender: TObject);
  private
    { Private declarations }
    fDMConsTabela_Log: TDMConsTabela_Log;

    procedure prc_scroll(DataSet: TDataSet);

  public
    { Public declarations }
  end;

var
  frmConsTabela_Log: TfrmConsTabela_Log;

implementation

uses uUtilPadrao, rsDBUtils, DmdDatabase, SqlExpr;

{$R *.dfm}

procedure TfrmConsTabela_Log.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsTabela_Log.FormShow(Sender: TObject);
begin
  fDMConsTabela_Log := TDMConsTabela_Log.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsTabela_Log);

  lblTerminal.Caption := IntToStr(vTerminal);
end;

procedure TfrmConsTabela_Log.prc_scroll(DataSet: TDataSet);
var
  vComando : String;
begin
  if trim(fDMConsTabela_Log.cdsTabelasNOME.AsString) = 'CUPOMFISCAL_LOG' then
    vComando := 'select ID, ID_TERMINAL, TIPO, NUMCUPOM, FILIAL, TIPO_CUPOM '
  else
    vComando := 'select ID, ID_TERMINAL, TIPO, 0 NUMCUPOM, 0 FILIAL, ' + QuotedStr(' ') + ' TIPO_CUPOM ';
  vComando := vComando + ' from ' + fDMConsTabela_Log.cdsTabelasNOME.AsString;
  fDMConsTabela_Log.cdsLog.Close;
  fDMConsTabela_Log.sdsLog.CommandText := vComando;
  fDMConsTabela_Log.cdsLog.Open;
end;

procedure TfrmConsTabela_Log.NxButton1Click(Sender: TObject);
begin
  fDMConsTabela_Log.cdsTabelas.AfterScroll := nil;
  fDMConsTabela_Log.cdsTabelas.Close;
  fDMConsTabela_Log.cdsLog.Close;
  case cbLocalServidor.ItemIndex of
    0 : fDMConsTabela_Log.sdsTabelas.SQLConnection := dmDatabase.scoDados;
    1 : fDMConsTabela_Log.sdsTabelas.SQLConnection := dmDatabase.scoServidor;
  end;
  fDMConsTabela_Log.sdsLog.SQLConnection := fDMConsTabela_Log.sdsTabelas.SQLConnection;
  if cbLocalServidor.ItemIndex = 1 then
  begin
    dmDatabase.scoServidor.Connected := False;
    dmDatabase.scoServidor.Connected := True;
  end
  else
  begin
    dmDatabase.scoDados.Connected := False;
    dmDatabase.scoDados.Connected := True;
  end;


  //Consulta Tabelas
  fDMConsTabela_Log.cdsTabelas.Close;
  fDMConsTabela_Log.cdsTabelas.Open;

  fDMConsTabela_Log.cdsTabelas.AFTERSCROLL := prc_scroll;
  fDMConsTabela_Log.cdsTabelas.Last;
  fDMConsTabela_Log.cdsTabelas.First;
end;

procedure TfrmConsTabela_Log.cbLocalServidorChange(Sender: TObject);
begin
  fDMConsTabela_Log.cdsTabelas.Close;
  fDMConsTabela_Log.cdsLog.Close;
end;

end.

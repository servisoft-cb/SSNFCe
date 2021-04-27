unit uSel_Terminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  NxCollection, ExtCtrls, RxLookup, StdCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr, rsDBUtils,
  Grids, DBGrids, SMDBGrid;

type
  TfrmSel_Terminal = class(TForm)
    SMDBGrid1: TSMDBGrid;
    sdsTerminal: TSQLDataSet;
    dspTerminal: TDataSetProvider;
    cdsTerminal: TClientDataSet;
    cdsTerminalID: TSmallintField;
    cdsTerminalNOME: TStringField;
    cdsTerminalSERIE: TStringField;
    cdsTerminalINATIVO: TStringField;
    cdsTerminalFILIAL: TIntegerField;
    dsTerminal: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSel_Terminal: TfrmSel_Terminal;

implementation

uses uUtilPadrao, DmdDatabase;

{$R *.dfm}

procedure TfrmSel_Terminal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSel_Terminal.FormShow(Sender: TObject);
var
  sds: TSQLDataSet;
  vIDAux : Integer;
begin
  cdsTerminal.Close;
  sdsTerminal.SQLConnection := dmDatabase.scoDados;
  vIDAux := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT USA_NFCE_LOCAL from PARAMETROS_GERAL';
    sds.Open;
    if sds.FieldByName('USA_NFCE_LOCAL').AsString = 'S' then
    begin
      sds.Close;
      sds.CommandText   := 'SELECT ID FROM FILIAL WHERE INATIVO = ' + QuotedStr('N');
      sds.Open;
      if sds.IsEmpty then
        vIDAux := sds.FieldByName('ID').AsInteger;
      sdsTerminal.SQLConnection := dmDatabase.scoServidor;
    end;
  finally
    FreeAndNil(sds);
  end;

  sdsTerminal.ParamByName('FILIAL').AsInteger := vIDAux;
  cdsTerminal.Open;
end;

procedure TfrmSel_Terminal.SMDBGrid1DblClick(Sender: TObject);
begin
  if cdsTerminalID.AsInteger > 0 then
  begin
    vTerminal  := cdsTerminalID.AsInteger;
  end;
  Close;
end;

end.

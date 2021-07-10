unit UDMConsTabela_Log;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TDMConsTabela_Log = class(TDataModule)
    sdsTabelas: TSQLDataSet;
    dspTabelas: TDataSetProvider;
    cdsTabelas: TClientDataSet;
    cdsTabelasNOME: TStringField;
    dsTabelas: TDataSource;
    sdsLog: TSQLDataSet;
    dspLog: TDataSetProvider;
    cdsLog: TClientDataSet;
    dsLog: TDataSource;
    cdsLogID: TIntegerField;
    cdsLogID_TERMINAL: TIntegerField;
    cdsLogTIPO: TIntegerField;
    cdsLogNUMCUPOM: TIntegerField;
    cdsLogFILIAL: TIntegerField;
    cdsLogTIPO_CUPOM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConsTabela_Log: TDMConsTabela_Log;

implementation

uses DmdDatabase;

{$R *.dfm}

end.

unit UDMConsCupom;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DBClient, frxClass,
  frxDBSet;

type
  TDMConsCupom = class(TDataModule)
    sdsConsTroca: TSQLDataSet;
    dspConsTroca: TDataSetProvider;
    cdsConsTroca: TClientDataSet;
    dsConsTroca: TDataSource;
    cdsConsTrocaID: TIntegerField;
    cdsConsTrocaITEM: TIntegerField;
    cdsConsTrocaID_CUPOM: TIntegerField;
    cdsConsTrocaID_CUPOM_TROCA: TIntegerField;
    cdsConsTrocaITEM_TROCA: TIntegerField;
    cdsConsTrocaNUM_CUPOM_TROCA: TIntegerField;
    cdsConsTrocaQTD: TFloatField;
    cdsConsTrocaVLR_UNITARIO: TFloatField;
    cdsConsTrocaVLR_TOTAL: TFloatField;
    cdsConsTrocaNUMCUPOM: TIntegerField;
    cdsConsTrocaDTEMISSAO: TDateField;
    cdsConsTrocaID_PRODUTO: TIntegerField;
    cdsConsTrocaNOME_PRODUTO: TStringField;
    cdsConsTrocaREFERENCIA: TStringField;
    cdsConsTrocaSERIE_TROCA: TStringField;
    cdsConsTrocaSERIE: TStringField;
    frxReport1: TfrxReport;
    frxCupom_Cons: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctConsTrocas : String;

  end;

var
  DMConsCupom: TDMConsCupom;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsCupom.DataModuleCreate(Sender: TObject);
begin
  ctConsTrocas := sdsConsTroca.CommandText;
end;

end.

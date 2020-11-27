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
    sdsConsRecibo: TSQLDataSet;
    dspConsRecibo: TDataSetProvider;
    cdsConsRecibo: TClientDataSet;
    dsConsRecibo: TDataSource;
    cdsConsReciboID: TIntegerField;
    cdsConsReciboID_CUPOM: TIntegerField;
    cdsConsReciboID_CUPOM_USADO: TIntegerField;
    cdsConsReciboDATA: TDateField;
    cdsConsReciboHORA: TTimeField;
    cdsConsReciboVALOR: TFloatField;
    cdsConsReciboUSADO: TStringField;
    cdsConsReciboITEM_CUPOM: TIntegerField;
    cdsConsReciboTIPO: TStringField;
    cdsConsReciboNUMCUPOM: TIntegerField;
    cdsConsReciboSERIE: TStringField;
    cdsConsReciboTIPO_CUPOM: TStringField;
    cdsConsReciboDTEMISSAO: TDateField;
    cdsConsReciboNUMCUPOM_USADO: TIntegerField;
    cdsConsReciboSERIE_USADO: TStringField;
    cdsConsReciboTIPO_USADO: TStringField;
    cdsConsReciboDTEMISSAO_USADO: TDateField;
    cdsConsReciboDESC_TIPO: TStringField;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    cdsFilialCNPJ_CPF: TStringField;
    frxConsRecibo: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctConsTrocas: String;
    ctConsRecibo: String;

  end;

var
  DMConsCupom: TDMConsCupom;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsCupom.DataModuleCreate(Sender: TObject);
begin
  ctConsTrocas := sdsConsTroca.CommandText;
  ctConsRecibo := sdsConsRecibo.CommandText;
  cdsFilial.Close;
  cdsFilial.Open;
end;

end.

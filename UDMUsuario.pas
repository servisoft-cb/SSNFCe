unit UDMUsuario;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, logTypes;

type
  TDMUsuario = class(TDataModule)
    sdsUsuario: TSQLDataSet;
    sdsUsuarioUCIDUSER: TIntegerField;
    sdsUsuarioUCUSERNAME: TStringField;
    sdsUsuarioUCLOGIN: TStringField;
    sdsUsuarioSENHAHASH: TStringField;
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    cdsUsuarioUCIDUSER: TIntegerField;
    cdsUsuarioUCUSERNAME: TStringField;
    cdsUsuarioUCLOGIN: TStringField;
    cdsUsuarioSENHAHASH: TStringField;
    dsUsuario: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    { Public declarations }

    procedure prc_Abrir_Usuario(Usuario : String);

  end;

var
  DMUsuario: TDMUsuario;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider;

{$R *.dfm}

{ TDMUsuario }

procedure TDMUsuario.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMUsuario.DataModuleCreate(Sender: TObject);
var
  i, x: Word;
  vIndices: string;
  aIndices: array of string;
begin
  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
end;

procedure TDMUsuario.prc_Abrir_Usuario(Usuario: String);
begin
  cdsUsuario.Close;
  sdsUsuario.ParamByName('UCLOGIN').AsString := Usuario;
  cdsUsuario.Open;
end;

end.

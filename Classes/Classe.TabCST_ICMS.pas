unit Classe.TabCST_ICMS;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Controls,
  Forms,
  ComCtrls,
  classe.Controle;
type
  TTabCST_ICMS = class
  private
    Fcontrole: TControle;
    FCST_ICMS: String;
    procedure SetCST_ICMS(const Value: String);
  public
    property CST_ICMS : String read FCST_ICMS write SetCST_ICMS;
    constructor Create(pConexaoControle: TControle);
    destructor Destroy; override;
    function PesquisaTAB_CST(pID: Integer): TTabCST_ICMS;
  end;

implementation
{ TClienteControle }

constructor TTabCST_ICMS.Create(pConexaoControle: TControle);
begin
  Fcontrole := pConexaoControle;
end;

destructor TTabCST_ICMS.Destroy;
begin
  inherited;

end;

function TTabCST_ICMS.PesquisaTAB_CST(pID: Integer): TTabCST_ICMS;
begin
  FControle.sqlGeral.Close;
  FControle.sqlGeral.SQL.Clear;
  FControle.sqlGeral.SQL.Add('select COD_CST ');
  FControle.sqlGeral.SQL.Add('from TAB_CSTICMS ');
  FControle.sqlGeral.SQL.Add(' WHERE ID = ' + IntToStr(pID));
  FControle.sqlGeral.Open;
  if FControle.sqlGeral.IsEmpty then
  begin
    Self.CST_ICMS := '';
  end
  else
  begin
    Self.CST_ICMS := FControle.sqlGeral.FieldByName('COD_CST').AsString;
  end;

end;

procedure TTabCST_ICMS.SetCST_ICMS(const Value: String);
begin
  FCST_ICMS := Value;
end;

end.

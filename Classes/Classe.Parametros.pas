unit Classe.Parametros;

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
  TParametroControle = class
  private
    Fcontrole: TControle;
    FEndXMLNFCe: String;
    procedure SetEndXMLNFCe(const Value: String);
  public
    property EndXMLNFCe : String read FEndXMLNFCe write SetEndXMLNFCe;
    constructor Create(pConexaoControle: TControle);
    destructor Destroy; override;
    function PesquisaParametro(pID: Integer): TParametroControle;
  end;

implementation
{ TClienteControle }

constructor TParametroControle.Create(pConexaoControle: TControle);
begin
  Fcontrole := pConexaoControle;
end;

destructor TParametroControle.Destroy;
begin
  inherited;

end;

function TParametroControle.PesquisaParametro(pId: Integer): TParametroControle;
begin
  FControle.sqlGeral.Close;
  FControle.sqlGeral.SQL.Clear;
  FControle.sqlGeral.SQL.Add('select ENDXMLNFCE ');
  FControle.sqlGeral.SQL.Add('from Parametros ');
  FControle.sqlGeral.SQL.Add(' WHERE ID = ' + IntToStr(pID));
  FControle.sqlGeral.Open;
  if FControle.sqlGeral.IsEmpty then
  begin
//    Self.Codigo := 0;
  end
  else
  begin
    Self.EndXMLNFCe := FControle.sqlGeral.FieldByName('ENDXMLNFCE').AsString;
  end;
end;

procedure TParametroControle.SetEndXMLNFCe(const Value: String);
begin
  FEndXMLNFCe := Value;
end;

end.

unit Classe.Filial;

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
  TFilialControle = class
  private
    Fcontrole: TControle;
    FNumeroSerie: String;
    FSenha: String;
    procedure SetNumeroSerie(const Value: String);
    procedure SetSenha(const Value: String);
  public
    property NumeroSerie : String read FNumeroSerie write SetNumeroSerie;
    property Senha : String read FSenha write SetSenha;
    constructor Create(pConexaoControle: TControle);
    destructor Destroy; override;
    function PesquisaFilial(pID: Integer): TFilialControle;
  end;

implementation
{ TClienteControle }

constructor TFilialControle.Create(pConexaoControle: TControle);
begin
  Fcontrole := pConexaoControle;
end;

destructor TFilialControle.Destroy;
begin
  inherited;

end;

function TFilialControle.PesquisaFilial(pId: Integer): TFilialControle;
begin
  FControle.sqlGeral.Close;
  FControle.sqlGeral.SQL.Clear;
  FControle.sqlGeral.SQL.Add('select FC.NUMERO_SERIE, ');
  FControle.sqlGeral.SQL.Add('FC.SENHA, ');
  FControle.sqlGeral.SQL.Add('from FILIAL F ');
  FControle.sqlGeral.SQL.Add('inner join FILIAL_CERTIFICADOS FC on F.ID = FC.ID ');
  FControle.sqlGeral.SQL.Add(' WHERE ID = ' + IntToStr(pID));
  FControle.sqlGeral.Open;
  if FControle.sqlGeral.IsEmpty then
  begin
//    Self.Codigo := 0;
  end
  else
  begin
    Self.NumeroSerie := FControle.sqlGeral.ParamByName('NUMERO_SERIE').AsString;
    Self.Senha := FControle.sqlGeral.ParamByName('Senha').AsString;
  end;
end;

procedure TFilialControle.SetNumeroSerie(const Value: String);
begin
  FNumeroSerie := Value;
end;

procedure TFilialControle.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

end.

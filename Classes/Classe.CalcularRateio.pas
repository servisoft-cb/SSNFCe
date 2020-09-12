unit Classe.CalcularRateio;

interface

type
  TCalculaRateio = class
  private
    FValorRateio: Real;
    FValorTotalProdutos: Real;
    FValorProduto: Real;
    FValorDiferenca: Real;
    procedure SetValorProduto(const Value: Real);
    procedure SetValorRateio(const Value: Real);
    procedure SetValorTotalProdutos(const Value: Real);
    procedure SetValorDiferenca(const Value: Real);

  public
    constructor create;
    destructor destroy; override;
    property ValorTotalProdutos : Real read FValorTotalProdutos write SetValorTotalProdutos;
    property ValorProduto : Real read FValorProduto write SetValorProduto;
    property ValorRateio : Real read FValorRateio write SetValorRateio;
    property ValorDiferenca : Real read FValorDiferenca write SetValorDiferenca;
    function CalcularRateio : Real;
  end;

implementation

uses SysUtils;

{ TCalculaRateio }

function TCalculaRateio.CalcularRateio: Real;
begin
  Result := StrToFloatDef(FormatFloat('0.00', FValorProduto / FValorTotalProdutos * FValorRateio),0);
  FValorDiferenca := FValorDiferenca + Result;
end;

constructor TCalculaRateio.create;
begin

end;

destructor TCalculaRateio.destroy;
begin

  inherited;
end;

procedure TCalculaRateio.SetValorDiferenca(const Value: Real);
begin
  FValorDiferenca := Value;
end;

procedure TCalculaRateio.SetValorProduto(const Value: Real);
begin
  FValorProduto := Value;
end;

procedure TCalculaRateio.SetValorRateio(const Value: Real);
begin
  FValorRateio := Value;
end;

procedure TCalculaRateio.SetValorTotalProdutos(const Value: Real);
begin
  FValorTotalProdutos := Value;
end;

end.
 
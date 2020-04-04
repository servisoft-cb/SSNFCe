unit uClasseCalculaPagto;

interface

uses DBClient;

type
  TCalculaPagto = class
  private
    FTaxaJuros: Real;
    FValorRestante: Real;
    FVlrEntrada: Real;
    FValorParcela: Real;
    FTipo: String;
    FTipoCondicao: String;
    FDataEntrada: TDateTime;

  public
    property ValorParcela : Real read FValorParcela write FValorParcela;
    property ValorRestante : Real read FValorRestante write FValorRestante;
    property TaxaJuros : Real read FTaxaJuros write FTaxaJuros;
    property VlrEntrada : Real read FVlrEntrada write FVlrEntrada;
    property DataEntrada : TDateTime read FDataEntrada write FDataEntrada;
    property Tipo : String read FTipo write FTipo;
    property TipoCondicao : String read FTipoCondicao write FTipoCondicao;

    function CalcularParcelas(SQLParcelas : TClientDataSet) : Boolean;
  end;


implementation

{ TCalculaPagto }

function TCalculaPagto.CalcularParcelas(
  SQLParcelas: TClientDataSet): Boolean;
begin
//
end;

end.

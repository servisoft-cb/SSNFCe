unit Classe.CupomFiscalItem;

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
  TCupomItemControle = class
  private
    FControle : TControle;
    FItem: Integer;
    FVlr_ICMS: Real;
    FQtd: Real;
    FVlr_Total: Real;
    FVlr_Desconto: Real;
    FVlr_Unitario: Real;
    FBase_ICMS: Real;
    FPerc_ICMS: Real;
    FPerc_Desconto: Real;
    FID_CSTICMS: Integer;
    FID_NCM: Integer;
    FID_CFOP: Integer;
    FSitTrib: String;
    FNome_Produto: String;
    FReferencia: String;
    FUnidade: String;
    FCod_CBenef: String;
    FID: Integer;
    procedure SetBase_ICMS(const Value: Real);
    procedure SetItem(const Value: Integer);
    procedure SetPerc_Desconto(const Value: Real);
    procedure SetPerc_ICMS(const Value: Real);
    procedure SetQtd(const Value: Real);
    procedure SetVlr_Desconto(const Value: Real);
    procedure SetVlr_ICMS(const Value: Real);
    procedure SetVlr_Total(const Value: Real);
    procedure SetVlr_Unitario(const Value: Real);
    procedure SetCod_CBenef(const Value: String);
    procedure SetID_CFOP(const Value: Integer);
    procedure SetID_CSTICMS(const Value: Integer);
    procedure SetID_NCM(const Value: Integer);
    procedure SetNome_Produto(const Value: String);
    procedure SetReferencia(const Value: String);
    procedure SetSitTrib(const Value: String);
    procedure SetUnidade(const Value: String);
    procedure SetID(const Value: Integer);

  public
    property Item : Integer read FItem write SetItem;
    property Qtd : Real read FQtd write SetQtd;
    property Perc_ICMS : Real read FPerc_ICMS write SetPerc_ICMS;
    property Vlr_Unitario : Real read FVlr_Unitario write SetVlr_Unitario;
    property Perc_Desconto : Real read FPerc_Desconto write SetPerc_Desconto;
    property Vlr_Desconto : Real read FVlr_Desconto write SetVlr_Desconto;
    property Base_ICMS : Real read FBase_ICMS write SetBase_ICMS;
    property Vlr_ICMS : Real read FVlr_ICMS write SetVlr_ICMS;
    property Vlr_Total : Real read FVlr_Total write SetVlr_Total;
    property ID_CFOP : Integer read FID_CFOP write SetID_CFOP;
    property Unidade : String read FUnidade write SetUnidade;
    property SitTrib : String read FSitTrib write SetSitTrib;
    property Referencia : String read FReferencia write SetReferencia;
    property ID_NCM : Integer read FID_NCM write SetID_NCM;
    property ID_CSTICMS : Integer read FID_CSTICMS write SetID_CSTICMS;
    property Nome_Produto : String read FNome_Produto write SetNome_Produto;
    property Cod_CBenef : String read FCod_CBenef write SetCod_CBenef;
    property ID : Integer read FID write SetID;
    constructor Create(pConexaoControle: TControle);
    destructor Destroy; override;
    function AlteraCupomItem: Boolean;
    function AtualizaNCM: Boolean;

    function PesquisaCupomItem(pID: Integer): TCupomItemControle;
  end;


implementation

{ TClienteControle }

function TCupomItemControle.AlteraCupomItem: Boolean;
begin
  FControle.sqlGeral.Close;
  FControle.sqlGeral.SQL.Clear;
  FControle.sqlGeral.SQL.Add(' UPDATE CUPOMFISCAL_ITENS ');
  FControle.sqlGeral.SQL.Add(' SET ID = :vID, ');
  FControle.sqlGeral.SQL.Add(' ITEM = :vITEM, ');
  FControle.sqlGeral.SQL.Add(' WHERE (ID = :vID) ');
  FControle.sqlGeral.ParamByName('vItem').AsInteger := Self.Item;
  try
    FControle.sqlGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TCupomItemControle.AtualizaNCM: Boolean;
begin
  FControle.sqlGeral.Close;
  FControle.sqlGeral.SQL.Clear;
  FControle.sqlGeral.SQL.Add(' UPDATE CUPOMFISCAL_ITENS ');
  FControle.sqlGeral.SQL.Add(' SET ID_NCM =  ' + IntToStr(Self.ID_NCM));
  FControle.sqlGeral.SQL.Add(' WHERE ID = :vID and ');
  FControle.sqlGeral.SQL.Add(' Item = :vItem');
  FControle.sqlGeral.ParamByName('vID').AsInteger := Self.ID;
  FControle.sqlGeral.ParamByName('vItem').AsInteger := Self.Item;
  try
    FControle.sqlGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

constructor TCupomItemControle.Create(pConexaoControle: TControle);
begin
  Fcontrole := pConexaoControle;
end;

destructor TCupomItemControle.Destroy;
begin

  inherited;
end;

function TCupomItemControle.PesquisaCupomItem(pID: Integer): TCupomItemControle;
begin
  FControle.sqlGeral.Close;
  FControle.sqlGeral.SQL.Clear;
  FControle.sqlGeral.SQL.Add('Select ');
  FControle.sqlGeral.SQL.Add('CI.ITEM, ');
  FControle.sqlGeral.SQL.Add('CI.QTD, ');
  FControle.sqlGeral.SQL.Add('CI.PERC_ICMS, ');
  FControle.sqlGeral.SQL.Add('CI.VLR_UNITARIO, ');
  FControle.sqlGeral.SQL.Add('CI.PERC_DESCONTO, ');
  FControle.sqlGeral.SQL.Add('CI.VLR_DESCONTO, ');
  FControle.sqlGeral.SQL.Add('CI.BASE_ICMS, ');
  FControle.sqlGeral.SQL.Add('CI.VLR_ICMS, ');
  FControle.sqlGeral.SQL.Add('CI.VLR_TOTAL, ');
  FControle.sqlGeral.SQL.Add('CI.ID_CFOP, ');
  FControle.sqlGeral.SQL.Add('CI.UNIDADE, ');
  FControle.sqlGeral.SQL.Add('CI.SITTRIB, ');
  FControle.sqlGeral.SQL.Add('CI.REFERENCIA, ');
  FControle.sqlGeral.SQL.Add('CI.ID_NCM, ');
  FControle.sqlGeral.SQL.Add('CI.ID_CSTICMS, ');
  FControle.sqlGeral.SQL.Add('CI.NOME_PRODUTO, ');
  FControle.sqlGeral.SQL.Add('CI.COD_CBENEF ');
  FControle.sqlGeral.SQL.Add('from CUPOMFISCAL_ITENS CI where CI.ID = ' + IntToStr(pID));
  FControle.sqlGeral.Open;
  FControle.sqlGeral.First;
  while not FControle.sqlGeral.Eof do
  begin
    Self.Item := FControle.sqlGeral.ParamByName('ITEM').AsInteger;
    Self.Qtd := FControle.sqlGeral.ParamByName('QTD').AsFloat;
    Self.Perc_Desconto := FControle.sqlGeral.ParamByName('PERC_ICMS').AsFloat;
    Self.Vlr_Unitario := FControle.sqlGeral.ParamByName('VLR_UNITARIO').AsFloat;
    Self.Perc_Desconto := FControle.sqlGeral.ParamByName('PERC_DESCONTO').AsFloat;
    Self.Vlr_Desconto := FControle.sqlGeral.ParamByName('VLR_DESCONTO').AsFloat;
    Self.Base_ICMS := FControle.sqlGeral.ParamByName('BASE_ICMS').AsFloat;
    Self.Vlr_ICMS := FControle.sqlGeral.ParamByName('VLR_ICMS').AsFloat;
    Self.Vlr_Total := FControle.sqlGeral.ParamByName('VLR_TOTAL').AsFloat;
    Self.ID_CFOP := FControle.sqlGeral.ParamByName('ID_CFOP').AsInteger;
    Self.Unidade := FControle.sqlGeral.ParamByName('UNIDADE').AsString;
    Self.SitTrib := FControle.sqlGeral.ParamByName('SITTRIB').AsString;
    Self.Referencia := FControle.sqlGeral.ParamByName('REFERENCIA').AsString;
    Self.ID_NCM := FControle.sqlGeral.ParamByName('ID_NCM').AsInteger;
    Self.ID_CSTICMS := FControle.sqlGeral.ParamByName('ID_CSTICMS').AsInteger;
    Self.Nome_Produto := FControle.sqlGeral.ParamByName('NOME_PRODUTO').AsString;
    Self.COD_CBENEF := FControle.sqlGeral.ParamByName('COD_CBENEF').AsString;
    FControle.sqlGeral.Next;
  end;
end;

procedure TCupomItemControle.SetBase_ICMS(const Value: Real);
begin
  FBase_ICMS := Value;
end;

procedure TCupomItemControle.SetCod_CBenef(const Value: String);
begin
  FCod_CBenef := Value;
end;

procedure TCupomItemControle.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TCupomItemControle.SetID_CFOP(const Value: Integer);
begin
  FID_CFOP := Value;
end;

procedure TCupomItemControle.SetID_CSTICMS(const Value: Integer);
begin
  FID_CSTICMS := Value;
end;

procedure TCupomItemControle.SetID_NCM(const Value: Integer);
begin
  FID_NCM := Value;
end;

procedure TCupomItemControle.SetItem(const Value: Integer);
begin
  FItem := Value;
end;

procedure TCupomItemControle.SetNome_Produto(const Value: String);
begin
  FNome_Produto := Value;
end;

procedure TCupomItemControle.SetPerc_Desconto(const Value: Real);
begin
  FPerc_Desconto := Value;
end;

procedure TCupomItemControle.SetPerc_ICMS(const Value: Real);
begin
  FPerc_ICMS := Value;
end;

procedure TCupomItemControle.SetQtd(const Value: Real);
begin
  FQtd := Value;
end;

procedure TCupomItemControle.SetReferencia(const Value: String);
begin
  FReferencia := Value;
end;

procedure TCupomItemControle.SetSitTrib(const Value: String);
begin
  FSitTrib := Value;
end;

procedure TCupomItemControle.SetUnidade(const Value: String);
begin
  FUnidade := Value;
end;

procedure TCupomItemControle.SetVlr_Desconto(const Value: Real);
begin
  FVlr_Desconto := Value;
end;

procedure TCupomItemControle.SetVlr_ICMS(const Value: Real);
begin
  FVlr_ICMS := Value;
end;

procedure TCupomItemControle.SetVlr_Total(const Value: Real);
begin
  FVlr_Total := Value;
end;

procedure TCupomItemControle.SetVlr_Unitario(const Value: Real);
begin
  FVlr_Unitario := Value;
end;

end.

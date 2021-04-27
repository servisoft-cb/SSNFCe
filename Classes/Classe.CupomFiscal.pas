unit Classe.CupomFiscal;

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
  TCupomControle = class
  private
    Fcontrole: TControle;
    FNum_Cupom: Integer;
    FID_Cliente: Integer;
    FNum_Cupomwrite: Integer;
    FVlr_Troco: Real;
    FVlr_Desconto: Real;
    FVlr_Total: Real;
    FCPF: String;
    FDTEmissao: TDateTime;
    FID_Vendedor: Integer;
    FCliente_Endereco: String;
    FCliente_Nome: String;
    FCliente_Fone: String;
    FFilial: Integer;
    FNFEChaveAcesso: String;
    FTipo_Emissao: String;
    FSerie: String;
    procedure SetNum_Cupom(const Value: Integer);
    procedure SetCPF(const Value: String);
    procedure SetDTEmissao(const Value: TDateTime);
    procedure SetID_Cliente(const Value: Integer);
    procedure SetVlr_Desconto(const Value: Real);
    procedure SetVlr_Total(const Value: Real);
    procedure SetVlr_Troco(const Value: Real);
    procedure SetCliente_Endereco(const Value: String);
    procedure SetCliente_Fone(const Value: String);
    procedure SetCliente_Nome(const Value: String);
    procedure SetID_Vendedor(const Value: Integer);
    procedure SetFilial(const Value: Integer);
    procedure SetNFEChaveAcesso(const Value: String);
    procedure SetSerie(const Value: String);
    procedure SetTipo_Emissao(const Value: String);

  public
    property Num_Cupom : Integer read FNum_Cupomwrite write SetNum_Cupom;
    property Vlr_Desconto : Real read FVlr_Desconto write SetVlr_Desconto;
    property Vlr_Total : Real read FVlr_Total write SetVlr_Total;
    property DTEmissao : TDateTime read FDTEmissao write SetDTEmissao;
    property CPF : String read FCPF write SetCPF;
    property ID_Cliente : Integer read FID_Cliente write SetID_Cliente;
    property Vlr_Troco : Real read FVlr_Troco write SetVlr_Troco;
    property Cliente_Nome : String read FCliente_Nome write SetCliente_Nome;
    property Cliente_Fone : String read FCliente_Fone write SetCliente_Fone;
    property Cliente_Endereco : String read FCliente_Endereco write SetCliente_Endereco;
    property ID_Vendedor : Integer read FID_Vendedor write SetID_Vendedor;
    property Serie : String read FSerie write SetSerie;
    property Filial : Integer read FFilial write SetFilial;
    property NFEChaveAcesso : String read FNFEChaveAcesso write SetNFEChaveAcesso;
    property Tipo_Emissao : String read FTipo_Emissao write SetTipo_Emissao;
    constructor Create(pConexaoControle: TControle);
    destructor Destroy; override;
    function AlteraCupom: Boolean;
    function PesquisaCupom(pID: Integer): TCupomControle;
  end;

implementation
{ TClienteControle }

function TCupomControle.AlteraCupom: Boolean;
begin
  FControle.sqlGeral.Close;
  FControle.sqlGeral.SQL.Clear;
  FControle.sqlGeral.SQL.Add(' UPDATE CUPOMFISCAL ');
  FControle.sqlGeral.SQL.Add(' SET ID = :vID, ');
  FControle.sqlGeral.SQL.Add(' NUM_CUPOM = :vNUM_CUPOM, ');
  FControle.sqlGeral.SQL.Add(' WHERE (ID = :vID) ');
  FControle.sqlGeral.ParamByName('vNUM_CUPOM').AsInteger := Self.Num_cupom;

  try
    FControle.sqlGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

constructor TCupomControle.Create(pConexaoControle: TControle);
begin
  Fcontrole := pConexaoControle;
end;

destructor TCupomControle.Destroy;
begin
  inherited;

end;

function TCupomControle.PesquisaCupom(pID: Integer): TCupomControle;
begin
  FControle.sqlGeral.Close;
  FControle.sqlGeral.SQL.Clear;
  FControle.sqlGeral.SQL.Add('Select C.NUMCUPOM, ');
  FControle.sqlGeral.SQL.Add('C.VLR_TOTAL, ');
  FControle.sqlGeral.SQL.Add('C.VLR_DESCONTO, ');
  FControle.sqlGeral.SQL.Add('C.DTEMISSAO, ');
  FControle.sqlGeral.SQL.Add('C.CPF, ');
  FControle.sqlGeral.SQL.Add('C.ID_CLIENTE, ');
  FControle.sqlGeral.SQL.Add('C.VLR_TROCO, ');
  FControle.sqlGeral.SQL.Add('C.CLIENTE_NOME, ');
  FControle.sqlGeral.SQL.Add('C.CLIENTE_FONE, ');
  FControle.sqlGeral.SQL.Add('C.CLIENTE_ENDERECO, ');
  FControle.sqlGeral.SQL.Add('C.ID_VENDEDOR, ');
  FControle.sqlGeral.SQL.Add('C.SERIE, ');
  FControle.sqlGeral.SQL.Add('C.FILIAL, ');
  FControle.sqlGeral.SQL.Add('C.NFECHAVEACESSO, ');
  FControle.sqlGeral.SQL.Add('C.TIPO_EMISSAO ');
  FControle.sqlGeral.SQL.Add('from CUPOMFISCAL C where C.ID = ' + IntToStr(pID));
  FControle.sqlGeral.Open;
  if FControle.sqlGeral.IsEmpty then
  begin
    Self.Num_Cupom := 0;
  end
  else
  begin
    Self.Num_Cupom := FControle.sqlGeral.FieldByName('NUMCUPOM').AsInteger;
    Self.Vlr_Total := FControle.sqlGeral.FieldByName('VLR_TOTAL').AsFloat;
    Self.Vlr_Desconto := FControle.sqlGeral.FieldByName('VLR_DESCONTO').AsFloat;
    Self.DTEmissao := FControle.sqlGeral.FieldByName('DTEMISSAO').AsDateTime;
    Self.cpf := FControle.sqlGeral.FieldByName('CPF').AsString;
    Self.ID_Cliente := FControle.sqlGeral.FieldByName('ID_CLIENTE').AsInteger;
    Self.Vlr_Troco := FControle.sqlGeral.FieldByName('VLR_TROCO').AsFloat;
    Self.Cliente_Nome := FControle.sqlGeral.FieldByName('CLIENTE_NOME').AsString;
    Self.Cliente_Fone := FControle.sqlGeral.FieldByName('CLIENTE_FONE').AsString;
    Self.Cliente_Endereco := FControle.sqlGeral.FieldByName('CLIENTE_ENDERECO').AsString;
    Self.ID_Vendedor := FControle.sqlGeral.FieldByName('ID_VENDEDOR').AsInteger;
    Self.Serie := FControle.sqlGeral.FieldByName('SERIE').AsString;
    Self.Filial := FControle.sqlGeral.FieldByName('FILIAL').AsInteger;
    Self.NFEChaveAcesso := FControle.sqlGeral.FieldByName('NFECHAVEACESSO').AsString;
    Self.Tipo_Emissao := FControle.sqlGeral.FieldByName('TIPO_EMISSAO').AsString;
  end;

end;

procedure TCupomControle.SetCliente_Endereco(const Value: String);
begin
  FCliente_Endereco := Value;
end;

procedure TCupomControle.SetCliente_Fone(const Value: String);
begin
  FCliente_Fone := Value;
end;

procedure TCupomControle.SetCliente_Nome(const Value: String);
begin
  FCliente_Nome := Value;
end;

procedure TCupomControle.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TCupomControle.SetDTEmissao(const Value: TDateTime);
begin
  FDTEmissao := Value;
end;

procedure TCupomControle.SetFilial(const Value: Integer);
begin
  FFilial := Value;
end;

procedure TCupomControle.SetID_Cliente(const Value: Integer);
begin
  FID_Cliente := Value;
end;

procedure TCupomControle.SetID_Vendedor(const Value: Integer);
begin
  FID_Vendedor := Value;
end;

procedure TCupomControle.SetNFEChaveAcesso(const Value: String);
begin
  FNFEChaveAcesso := Value;
end;

procedure TCupomControle.SetNUM_CUPOM(const Value: Integer);
begin
  FNUM_CUPOM := Value;
end;

procedure TCupomControle.SetSerie(const Value: String);
begin
  FSerie := Value;
end;

procedure TCupomControle.SetTipo_Emissao(const Value: String);
begin
  FTipo_Emissao := Value;
end;

procedure TCupomControle.SetVlr_Desconto(const Value: Real);
begin
  FVlr_Desconto := Value;
end;

procedure TCupomControle.SetVlr_Total(const Value: Real);
begin
  FVlr_Total := Value;
end;

procedure TCupomControle.SetVlr_Troco(const Value: Real);
begin
  FVlr_Troco := Value;
end;

end.

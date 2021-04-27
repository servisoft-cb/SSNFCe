unit Classe.Danfe.EscPos;

interface

uses
  ACBrNFeDANFeESCPOS,
  Classe.PosPrinter,
  DBTables,
  DmdDatabase,
  ACBrPosPrinter,
  Forms,
  uUtilPadrao,
  Dialogs,
  ACBrDevice,
  SysUtils;

type
  TDanfeEscPos = class
  private
    FDanfeEscPos: TACBrNFeDANFeESCPOS;
    FPosPrinter: TPosPrinter;
    FTerminal: Integer;
    procedure SetDanfeEscPos(const Value: TACBrNFeDANFeESCPOS);
    procedure SetPosPrinter(const Value: TPosPrinter);
    function GetTerminal : Boolean;
    procedure SetTerminal(const Value: Integer);

  public
    constructor create;
    destructor destroy; override;
    property DanfeEscPos : TACBrNFeDANFeESCPOS read FDanfeEscPos write SetDanfeEscPos;
    property PosPrinter : TPosPrinter read FPosPrinter write SetPosPrinter;
    property Terminal : Integer read FTerminal write SetTerminal;
  end;

implementation

uses DB;

{ TDanfeEscPos }

constructor TDanfeEscPos.create;
begin
  DanfeEscPos := TACBrNFeDANFeESCPOS.Create(nil);
  DanfeEscPos.ViaConsumidor := True;
  DanfeEscPos.ImprimeItens := True;
  DanfeEscPos.MargemInferior := 0.7;
  DanfeEscPos.MargemSuperior := 0.7;
  DanfeEscPos.MargemEsquerda := 0.7;
  DanfeEscPos.MargemInferior := 0.7;
  DanfeEscPos.ImprimeEmUmaLinha := True;
  DanfeEscPos.ImprimeDescAcrescItem := True;
  DanfeEscPos.Sistema := 'SSNFCe - Emissor de Cupom Eletronico';
  FPosPrinter := TPosPrinter.create;
  if not GetTerminal then
  begin
    MessageDlg('Impressora não configurada, verifique!',mtError,[mbOK],0);
    Exit;
  end;
  DanfeEscPos.PosPrinter := FPosPrinter.PosPrinter;
  FPosPrinter.Configurar;
end;

destructor TDanfeEscPos.destroy;
begin

  inherited;
end;

function TDanfeEscPos.GetTerminal: Boolean;
begin
  try
    if vModeloImpressora = 'DR700' then FPosPrinter.Modelo := ppEscDaruma;
    if vModeloImpressora = 'DR800' then FPosPrinter.Modelo := ppEscDaruma;
    if vModeloImpressora = 'BEMATECH' then FPosPrinter.Modelo := ppEscBematech;
    if vModeloImpressora = 'ELGIN' then FPosPrinter.Modelo := ppEscPosEpson;
    if vModeloImpressora = 'EPSON' then
    begin
      FPosPrinter.Modelo := ppEscPosEpson;
      FPosPrinter.PosPrinter.ColunasFonteNormal := 42;
    end;

    FPosPrinter.Porta := vPorta;
    if FPosPrinter.Porta = 'USB' then
      FPosPrinter.Porta := ExtractFilePath(Application.ExeName) + '\nfceOffline.txt';
    FPosPrinter.Velocidade := StrToIntDef(vVelocidade,0);
    if FPosPrinter.Velocidade = 0 then
    begin
      FPosPrinter.Porta := ExtractFilePath(Application.ExeName) + '\nfceOffline.txt';
      FPosPrinter.PosPrinter.ControlePorta := False;
      FPosPrinter.PosPrinter.Device.DeviceType := dtFile;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TDanfeEscPos.SetDanfeEscPos(const Value: TACBrNFeDANFeESCPOS);
begin
  FDanfeEscPos := Value;
end;

procedure TDanfeEscPos.SetPosPrinter(const Value: TPosPrinter);
begin
  FPosPrinter := Value;
end;

procedure TDanfeEscPos.SetTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

end.

unit Classe.PosPrinter;

interface

uses
  ACBrPosPrinter,
  SysUtils;

type
  TPosPrinter = class
  private
    FModelo: TACBrPosPrinterModelo;
    FPorta: String;
    FVelocidade: Integer;
    FTerminal: Integer;
    procedure SetModelo(const Value: TACBrPosPrinterModelo);
    procedure SetPorta(const Value: String);
    procedure SetVelocidade(const Value: Integer);
    procedure SetTerminal(const Value: Integer);

  public
    PosPrinter : TACBrPosPrinter;
    constructor create;
    destructor destroy; override;
    property Modelo : TACBrPosPrinterModelo read FModelo write SetModelo;
    property Porta : String read FPorta write SetPorta;
    property Velocidade : Integer read FVelocidade write SetVelocidade;
    property Terminal : Integer read FTerminal write SetTerminal;
    procedure Configurar;
  end;

implementation

{ TPosPrinter }

procedure TPosPrinter.Configurar;
begin
  PosPrinter.Modelo      := FModelo;
  PosPrinter.Porta       := FPorta;
  PosPrinter.Device.Baud := FVelocidade;
  PosPrinter.ControlePorta := True;
  PosPrinter.LinhasEntreCupons := 3;
end;

constructor TPosPrinter.create;
begin
  PosPrinter := TACBrPosPrinter.Create(nil);
end;

destructor TPosPrinter.destroy;
begin
  FreeAndNil(PosPrinter);
  inherited;
end;

procedure TPosPrinter.SetModelo(const Value: TACBrPosPrinterModelo);
begin
  FModelo := Value;
end;

procedure TPosPrinter.SetPorta(const Value: String);
begin
  FPorta := Value;
end;

procedure TPosPrinter.SetTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

procedure TPosPrinter.SetVelocidade(const Value: Integer);
begin
  FVelocidade := Value;
end;

end.

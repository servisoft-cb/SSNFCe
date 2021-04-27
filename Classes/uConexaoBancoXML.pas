unit uConexaoBancoXML;

interface

uses
  SqlExpr,
  inifiles,
  SysUtils,
  Forms,
  uGFunctions,
  IdCoderMIME;

type
  TConexaoBanco = class
  private
    FConexaoBanco: TSQLConnection;
    Decoder64: TIdDecoderMIME;

  public
    constructor Create;
    destructor Destroy; override;
    function GetConexao: TSQLConnection;
    property ConexaoBanco: TSQLConnection read GetConexao;
  end;

implementation

{ TConexaoBanco }

constructor TConexaoBanco.Create;

var
  ArquivoINI, Servidor, Caminho, DriverName, UserName, PassWord: string;
  LocalServer: Integer;
  Configuracoes: TIniFile;
begin
  Decoder64 := TIdDecoderMIME.Create;

  ArquivoINI := ExtractFilePath(Application.ExeName) + '\configXML.ini';
  if not FileExists(ArquivoINI) then
  begin
    Erro('Arquivo de Config não Encontrado - Entre em contato como suporte técnico!');
    Exit;
  end;
  Configuracoes := TIniFile.Create(ArquivoINI);
  try
    Servidor := Configuracoes.ReadString('XML', 'Servidor', Servidor);
    Caminho := Configuracoes.ReadString('XML', 'DataBase', Caminho);
    DriverName := Configuracoes.ReadString('XML', 'DriverName', DriverName);
    UserName := Configuracoes.ReadString('XML', 'UserName', UserName);
    PassWord :=  Decoder64.DecodeString(Configuracoes.ReadString('XML', 'PassWord', PassWord));
  finally
    Configuracoes.Free;
  end;

  try
    FConexaoBanco := TSQLConnection.Create(Application);
    FConexaoBanco.ConnectionName := 'FBConnection';
    FConexaoBanco.DriverName := 'Firebird';
    FConexaoBanco.LibraryName := 'dbxfb.dll';
    FConexaoBanco.VendorLib := 'fbclient.dll';
    FConexaoBanco.GetDriverFunc := 'getSQLDriverINTERBASE';
    FConexaoBanco.LoginPrompt := False;
    //
    FConexaoBanco.Connected := False;
    FConexaoBanco.Params.Values['DataBase'] := Servidor + ':' + Caminho;
    FConexaoBanco.Params.Values['User_Name'] := UserName;
    FConexaoBanco.Params.Values['Password'] := PassWord;
    FConexaoBanco.Connected := True;
  except
    Erro('Erro ao Conectar o Banco de dados. Verifique as preferencias do sistema!');
  end;

end;

destructor TConexaoBanco.Destroy;
begin
  FConexaoBanco.Free;
  inherited;
end;

function TConexaoBanco.GetConexao: TSQLConnection;
begin
  Result := FConexaoBanco;
end;

end.

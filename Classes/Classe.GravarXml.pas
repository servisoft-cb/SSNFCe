unit Classe.GravarXml;

interface

uses
  Classes,
//  udmXML,
  DB,
  SysUtils,
  Inifiles,
  Forms,
  Dialogs,
  DBClient;

type
  TGravarXml = class
  private
    FNumeroNota: integer;
    FStatus: integer;
    FSerie: String;
    FIDDocumento: String;
    FProtocolo: String;
    FChave: String;
    FTipo: string;
    FDataRecebimento: TDateTime;
    Fxml: TStringList;
    FPathArquivoXML: String;
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FDiretorio: String;
    FIDEmpresa: Integer;
    procedure SetChave(const Value: String);
    procedure SetDataRecebimento(const Value: TDateTime);
    procedure SetIDDocumento(const Value: String);
    procedure SetNumeroNota(const Value: integer);
    procedure SetProtocolo(const Value: String);
    procedure SetSerie(const Value: String);
    procedure SetStatus(const Value: integer);
    procedure SetTipo(const Value: string);
    procedure Setxml(const Value: TStringList);
    function InserirXMLdaNFe(aCampo : TField): Boolean;
    procedure SetPathArquivoXML(const Value: String);
    procedure SetDataFinal(const Value: TDateTime);
    procedure SetDataInicial(const Value: TDateTime);
    procedure SetDiretorio(const Value: String);
    procedure SetIDEmpresa(const Value: Integer);
  public
    fdmXML : TdmXML;
    constructor Create;
    destructor Destroy; override;
    property IDDocumento : String read FIDDocumento write SetIDDocumento;
    property NumeroNota : integer read FNumeroNota write SetNumeroNota;
    property Serie : String read FSerie write SetSerie;
    property Chave : String read FChave write SetChave;
    property Protocolo : String read FProtocolo write SetProtocolo;
    property DataRecebimento : TDateTime read FDataRecebimento write SetDataRecebimento;
    property Status : integer read FStatus write SetStatus;
    property Tipo : string read FTipo write SetTipo;
    property xml : TStringList read Fxml write Setxml;
    property PathArquivoXML : String read FPathArquivoXML write SetPathArquivoXML;
    property DataInicial : TDateTime read FDataInicial write SetDataInicial;
    property DataFinal : TDateTime read FDataFinal write SetDataFinal;
    property Diretorio : String read FDiretorio write SetDiretorio;
    property IDEmpresa : Integer read FIDEmpresa write SetIDEmpresa;
    function Gravar_XML : Boolean;
    function ConectarBancoXml : Boolean;
    procedure DesConectarBancoXml;
    procedure AbrirSQLXML;
    procedure AbrirSQLLoadXML;
    function ClearDirectory(aDirectory : String) : Boolean;
  end;

implementation

uses DateUtils;

{ TGravarXml }

procedure TGravarXml.AbrirSQLLoadXML;
var
  Dados : TClientDataSet;
begin
  if not ConectarBancoXml then
  begin
    MessageDlg('Erro ao conectar no banco XML',mtError,[mbOK],0);
    exit;
  end;

  with fdmXML do
  begin
    zSQLLoadXML.Close;
    FDataFinal := IncHour(FDataFinal,23);
    FDataFinal := IncMinute(FDataFinal,59);
    zSQLLoadXML.ParamByName('DTINICIAL').AsDateTime := FDataInicial;
    zSQLLoadXML.ParamByName('DTFINAL').AsDateTime := FDataFinal;
    zSQLLoadXML.Open;
    if zSQLLoadXML.IsEmpty then
    begin
      MessageDlg('Não há xml para envio neste período',mtError,[mbOK],0);
      exit;
    end;
    if not ClearDirectory(FDiretorio) then
      exit;
    Dados := TClientDataSet.Create(nil);
    Dados.FieldDefs.Add('XML', ftBlob);
    Dados.CreateDataSet;
    Dados.Active := True;
    while not zSQLLoadXML.Eof do
    begin
      Dados.Insert;
      Dados.FieldByName('XML').asString := zSQLLoadXML.FieldByName('XML').AsString;
      (Dados.FieldByName('XML') as TBlobField).SaveToFile(FDiretorio + 'NFe_' + zSQLLoadXML.FieldByName('CHAVE').AsString + '.xml');
      zSQLLoadXML.Next;
    end;
  end;

end;

procedure TGravarXml.AbrirSQLXML;
begin
  with fdmXML do
  begin
    zSQLXML.Close;
    zSQLXML.ParamByName('ID_DOCUMENTO').Value := FIDDocumento;
    zSQLXML.ParamByName('TIPO').Value := FTipo;
    zSQLXML.ParamByName('STATUS').Value := FStatus;
    zSQLXML.Open;
  end;
end;

function TGravarXml.ClearDirectory(aDirectory: String): Boolean;
var
  SR: TSearchRec;
  I: integer;
begin
  I := FindFirst(aDirectory + '*.*', faAnyFile, SR);
  while I = 0 do
  begin
    if (SR.Attr and faDirectory) <> faDirectory then
    begin
      if not DeleteFile(PChar(aDirectory + SR.Name)) then
      begin
        Result := False;
        Exit;
      end;
    end;

    I := FindNext(SR);
  end;
  Result := True;
end;

function TGravarXml.ConectarBancoXml: Boolean;
var
  Inifile : TIniFile;
begin
  Result := False;
  Inifile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Parceiro.ini');
  try
    with fdmXML do
    begin
      ZdbXML.Connected := False;
      try
        ZdbXML.HostName := IniFile.ReadString('XML', 'HostName', '');
        ZdbXML.Database := IniFile.ReadString('XML', 'Database_PDV', '');
        ZdbXML.Connected := True;
      finally
        Inifile.Free;
      end;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

constructor TGravarXml.Create;
begin
  fdmXML := tdmXML.Create(nil);
  Fxml := TStringList.Create;
end;

procedure TGravarXml.DesConectarBancoXml;
begin
  if fdmXML.zdbXML.Connected then
    fdmXML.zdbXML.Connected := False;
end;

destructor TGravarXml.Destroy;
begin
  fdmXML.Free;
  Fxml.Free;
  inherited;
end;

function TGravarXml.Gravar_XML: Boolean;
var
  xCaminho : String;
begin
  if not ConectarBancoXml then
  begin
    MessageDlg('Erro ao conectar no banco XML',mtError,[mbOK],0);
    exit;
  end;
  AbrirSQLXML;
  with fdmXML do
  begin
    if zSQLXML.IsEmpty then
      zSQLXML.Insert
    else
      zSQLXML.Edit;
    if InserirXMLdaNFe(fdmXML.zSQLXML.FieldByName('XML')) then
    begin
      zSQLXML.FieldByName('ID_DOCUMENTO').AsString := FIDDocumento;
      zSQLXML.FieldByName('NUMERO_NOTA').AsInteger := FNumeroNota;
      zSQLXML.FieldByName('SERIE').AsString := FSerie;
      zSQLXML.FieldByName('CHAVE').AsString := FChave;
      zSQLXML.FieldByName('PROTOCOLO').AsString := FProtocolo;
      zSQLXML.FieldByName('DATA_RECEBIMENTO').AsDateTime := FDataRecebimento;
      zSQLXML.FieldByName('STATUS').AsInteger := FStatus;
      zSQLXML.FieldByName('TIPO').AsString := FTipo;
      zSQLXML.FieldByName('ID_Empresa').AsInteger := FIDEmpresa;
      zSQLXML.Post;
    end
    else
      zSQLXML.Cancel;
  end;
  desConectarBancoXml;
end;

function TGravarXml.InserirXMLdaNFe(aCampo : TField) : Boolean;
var
  FileStream : TFileStream;
  BlobStream : TStream;
begin
  Result := True;
  try
    FileStream := TFileStream.Create(FPathArquivoXML, fmOpenRead or fmShareDenyWrite);
    BlobStream := fdmXML.zSQLXML.CreateBlobStream(aCampo , bmWrite);
    try
      BlobStream.CopyFrom(FileStream, FileStream.Size);
    finally
      FileStream.Free;
      BlobStream.Free;
    end;
  except
    Result := False;
  end;
end;

procedure TGravarXml.SetChave(const Value: String);
begin
  FChave := Value;
end;

procedure TGravarXml.SetDataFinal(const Value: TDateTime);
begin
  FDataFinal := Value;
end;

procedure TGravarXml.SetDataInicial(const Value: TDateTime);
begin
  FDataInicial := Value;
end;

procedure TGravarXml.SetDataRecebimento(const Value: TDateTime);
begin
  FDataRecebimento := Value;
end;

procedure TGravarXml.SetDiretorio(const Value: String);
begin
  FDiretorio := Value;
end;

procedure TGravarXml.SetIDDocumento(const Value: String);
begin
  FIDDocumento := Value;
end;

procedure TGravarXml.SetIDEmpresa(const Value: Integer);
begin
  FIDEmpresa := Value;
end;

procedure TGravarXml.SetNumeroNota(const Value: integer);
begin
  FNumeroNota := Value;
end;

procedure TGravarXml.SetPathArquivoXML(const Value: String);
begin
  FPathArquivoXML := Value;
end;

procedure TGravarXml.SetProtocolo(const Value: String);
begin
  FProtocolo := Value;
end;

procedure TGravarXml.SetSerie(const Value: String);
begin
  FSerie := Value;
end;

procedure TGravarXml.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TGravarXml.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

procedure TGravarXml.Setxml(const Value: TStringList);
begin
  Fxml := Value;
end;

end.

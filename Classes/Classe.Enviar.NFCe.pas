unit Classe.Enviar.NFCe;

interface

uses
  ACBrBase,
  ACBrDFe,
  ACBrNFe,
  ACBrDFeDANFeReport,
  ACBrNFeNotasFiscais,
  ACBrPosPrinter,
  pcnConversao,
  pcnConversaoNFe,
  ACBrDFeConfiguracoes,
  ACBrDFeSSL,
  SysUtils,
  DateUtils,
  Forms,
  ACBrUtil,
  DmdDatabase,
  SqlExpr,
  ACBrDFeUtil,
  Math,
  uUtilPadrao,
  Classe.CalcularRateio,
  Classe.Danfe.EscPos,
  classe.Controle,
  Classe.CupomFiscal,
  Classe.Filial,
  Classe.Parametros,
  Classe.TabCST_ICMS,
  blcksock;
//  Classe.GravarXml;

type
  tEvMensagem = procedure(Mensagem : String) of Object;
  tEvRetornoNFCe = procedure(Mensagem : String) of Object;
  tpErro = (tpConexao, tpDados, tpDuplicidade);
type
  TEnvioNFCe = class
  private
    sqlCupom : TSQLQuery;
    sqlCupomItem : TSQLQuery;
    sqlCliente : TSQLQuery;
    sqlProduto : TSQLQuery;
    sqlNumerario : TSQLQuery;
    FSenha: String;
    FPortaPrinter: String;
    FVelocidadePrinter: String;
    FIDCupom: Integer;
    FIDCliente: String;
    FNumNFCe: Integer;
    FTerminal: String;
    FContingencia: Boolean;
    FDataSaida: TDateTime;
    FDataEmissao: TDateTime;
    FEmpresa: string;
    FValorTroco: Real;
    FValorFrete: Real;
    FValorTotalItens: Real;
    FCodigoMunicipioCliente: Integer;
    FNumeroItens: Integer;
    FItemAtual: Integer;
    FcodigoProduto: Integer;
    FPercSTEfetivo: Real;
    FTotalItem : Real;
    FevMsg: tEvMensagem;
    FevRetornoMsg: tEvRetornoNFCe;
    FMsg: String;
    FPercFCP: Real;
    FValorTroca: Real;
    FValorTrocaRateio: Real;
    FCodigoTransportadora: Integer;
    FTipoPagamento: String;
    FValorDesconto: Real;
    FCodigoCupom: Integer;
    FObs_Venda: String;
    FCalcularRateio : TCalculaRateio;
    FChave: String;
    FCodigoNF : Integer;
    FDanfeEscPos : TDanfeEscPos;
    FProtocolo: String;
    FTP_Emissao: String;
    FCStat: String;
    FCSC: String;
    FNumeroSerie: String;
    FidCSC: String;
    FImprimir: Boolean;
    FRetornoMsg: String;
    FDhRecbto: TDateTime;
    FCancelamento: Boolean;
    FCupomControle : TCupomControle;
    FControle : TControle;
    FFilialControle : TFilialControle;
    FParametroControle : TParametroControle;
    FTab_CSTICMSControle : TTabCST_ICMS;
    FCST_Cofins: string;
    FCST_Pis: string;
    FValor_Total: Real;
    FDadosAdicionais: String;
    FRecibo: String;
    FHoraEmissao: TDateTime;
    FCPFCNPJ: String;
    procedure SetSenha(const Value: String);
    procedure SetPortaPrinter(const Value: String);
    procedure SetVelocidadePrinter(const Value: String);
    procedure SetIDCupom(const Value: Integer);
    procedure SetIDCliente(const Value: String);
    procedure SetNumNFCe(const Value: Integer);
    procedure SetTerminal(const Value: String);
    procedure SetContingencia(const Value: Boolean);
    procedure SetDataEmissao(const Value: TDateTime);
    procedure SetDataSaida(const Value: TDateTime);
    procedure SetEmpresa(const Value: string);
    procedure SetValorFrete(const Value: Real);
    procedure SetValorTroco(const Value: Real);
    procedure SetValorTotalItens(const Value: Real);
    procedure SetCodigoMunicipioCliente(const Value: Integer);
    procedure SetNumeroItens(const Value: Integer);
    procedure SetItemAtual(const Value: Integer);
    procedure SetcodigoProduto(const Value: Integer);
    procedure SetPercSTEfetivo(const Value: Real);
    procedure SetMsg(const Value: String);
    procedure SetPercFCP(const Value: Real);
    procedure SetValorTroca(const Value: Real);
    procedure SetValorTrocaRateio(const Value: Real);
    procedure SetCodigoTransportadora(const Value: Integer);
    procedure SetTipoPagamento(const Value: String);
    procedure SetValorDesconto(const Value: Real);
    procedure SetCodigoCupom(const Value: Integer);
    procedure SetObs_Venda(const Value: String);
    procedure SetChave(const Value: String);
    procedure SetCStat(const Value: String);
    procedure SetProtocolo(const Value: String);
    procedure SetTP_Emissao(const Value: String);
    procedure SetCSC(const Value: String);
    procedure SetNumeroSerie(const Value: String);
    procedure SetidCSC(const Value: String);
    procedure SetImprimir(const Value: Boolean);
    procedure SetRetornoMsg(const Value: String);
    procedure SetDhRecbto(const Value: TDateTime);
    procedure SetCancelamento(const Value: Boolean);
    procedure SetCST_Cofins(const Value: string);
    procedure SetCST_Pis(const Value: string);
    procedure SetValor_Total(const Value: Real);
    procedure SetDadosAdicionais(const Value: String);
    procedure SetRecibo(const Value: String);
    procedure SetHoraEmissao(const Value: TDateTime);
    procedure SetCPFCNPJ(const Value: String);

  public
    ACBrNFCe : TACBrNFe;
    constructor create(aEmpresa : Integer);
    destructor destroy; override;
    procedure GetCupom;
    procedure GetCupomItem;
    procedure GetCliente;
    procedure GetProduto;
    procedure GetNumerario;
    property Senha : String read FSenha write SetSenha;
    property PortaPrinter : String read FPortaPrinter write SetPortaPrinter;
    property VelocidadePrinter : String read FVelocidadePrinter write SetVelocidadePrinter;
    property IDCupom : Integer read FIDCupom write SetIDCupom;
    property IDCliente : String read FIDCliente write SetIDCliente;
    property NumNFCe : Integer read FNumNFCe write SetNumNFCe;
    property Terminal : String read FTerminal write SetTerminal;
    property Contingencia : Boolean read FContingencia write SetContingencia;
    property DataEmissao : TDateTime read FDataEmissao write SetDataEmissao;
    property HoraEmissao : TDateTime read FHoraEmissao write SetHoraEmissao;
    property DataSaida : TDateTime read FDataSaida write SetDataSaida;
    property Empresa : string read FEmpresa write SetEmpresa;
    property ValorTroco : Real read FValorTroco write SetValorTroco;
    property ValorFrete : Real read FValorFrete write SetValorFrete;
    property ValorTotalItens : Real read FValorTotalItens write SetValorTotalItens;
    property CodigoMunicipioCliente : Integer read FCodigoMunicipioCliente write SetCodigoMunicipioCliente;
    property NumeroItens : Integer read FNumeroItens write SetNumeroItens;
    property ItemAtual : Integer read FItemAtual write SetItemAtual;
    property codigoProduto : Integer read FcodigoProduto write SetcodigoProduto;
    property PercSTEfetivo : Real read FPercSTEfetivo write SetPercSTEfetivo;
    property PercFCP : Real read FPercFCP write SetPercFCP;
    property evMsg : tEvMensagem read FevMsg write FevMsg;
    property evRetornoMsg : tEvRetornoNFCe read FevRetornoMsg write FevRetornoMsg;
    property Msg : String read FMsg write SetMsg;
    property RetornoMsg : String read FRetornoMsg write SetRetornoMsg;
    property ValorTroca : Real read FValorTroca write SetValorTroca;
    property ValorTrocaRateio : Real read FValorTrocaRateio write SetValorTrocaRateio;
    property CodigoTransportadora : Integer read FCodigoTransportadora write SetCodigoTransportadora;
    property TipoPagamento : String read FTipoPagamento write SetTipoPagamento;
    property ValorDesconto : Real read FValorDesconto write SetValorDesconto;
    property CodigoCupom : Integer read FCodigoCupom write SetCodigoCupom;
    property Obs_Venda : String read FObs_Venda write SetObs_Venda;
    property Chave : String read FChave write SetChave;
    property CStat : String read FCStat write SetCStat;
    property Protocolo : String read FProtocolo write SetProtocolo;
    property TP_Emissao : String read FTP_Emissao write SetTP_Emissao;
    property CSC : String read FCSC write SetCSC;
    property idCSC : String read FidCSC write SetidCSC;
    property NumeroSerie : String read FNumeroSerie write SetNumeroSerie;
    property Imprimir : Boolean read FImprimir write SetImprimir;
    property DhRecbto : TDateTime read FDhRecbto write SetDhRecbto;
    property Cancelamento : Boolean read FCancelamento write SetCancelamento;
    property CST_Pis : string read FCST_Pis write SetCST_Pis;
    property CST_Cofins : string read FCST_Cofins write SetCST_Cofins;
    property Valor_Total : Real read FValor_Total write SetValor_Total;
    property DadosAdicionais : String read FDadosAdicionais write SetDadosAdicionais;
    property Recibo : String read FRecibo write SetRecibo;
    property CPFCNPJ : String read FCPFCNPJ write SetCPFCNPJ;
    procedure CalcularImpostos;
    function Gerar_NFCe : string;
    function MontarDadosCliente : String;
    procedure ValidarNFCe;
    function ValidarRegraNegocio : Boolean;
    procedure ImprimirNFCe;
    procedure AssinarNFCe;
    function Enviar : Boolean;
    function EnviarNFCe : tpErro;
    procedure GravarNFCe;
    procedure GravarNumeroNFCe;
    procedure GravarLogErro(aValue : String);
//    procedure GravarXMLNFCe;
    function ConsultarNFCe : Boolean;
    function CancelamentoNFCe : Boolean;
    function TestaStatusServidor : Boolean;
  end;

implementation

uses
  Classes,
  DB,
  Dialogs,
  pcnNFe,
  Contnrs;

{ TEnvioNFCe }

constructor TEnvioNFCe.create(aEmpresa : Integer);
var
  RetornoOK : Boolean;
begin
  ACBrNFCe := TACBrNFe.Create(nil);
  with ACBrNFCe do
  begin
    FControle := TControle.Create;
    FParametroControle := TParametroControle.Create(FControle);
    FParametroControle.PesquisaParametro(1);
    Configuracoes.Arquivos.PathEvento                  := FParametroControle.EndXMLNFCe;
    Configuracoes.Arquivos.PathInu                     := FParametroControle.EndXMLNFCe;
    Configuracoes.Arquivos.PathNFe                     := FParametroControle.EndXMLNFCe;
    Configuracoes.Arquivos.PathSalvar                  := FParametroControle.EndXMLNFCe;
    if DirectoryExists('c:\$Servisoft\Schemas') then
      Configuracoes.Arquivos.PathSchemas               := 'c:\$Servisoft\Schemas';

    Configuracoes.Arquivos.Salvar                      := True;
    Configuracoes.Arquivos.SepararPorMes               := True;

    Configuracoes.Certificados.VerificarValidade       := True;

    Configuracoes.Geral.AtualizarXMLCancelado          := True;
    Configuracoes.Geral.CamposFatObrigatorios          := True;
    Configuracoes.Geral.ExibirErroSchema               := True;
    Configuracoes.Geral.ForcarGerarTagRejeicao938      := fgtNunca;
    Configuracoes.Geral.FormaEmissao                   := teNormal;
    Configuracoes.Geral.FormatoAlerta                  := 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.';
    Configuracoes.Geral.ModeloDF                       := moNFCe;
    Configuracoes.Geral.Name                           := 'GeralConf';
    Configuracoes.Geral.RetirarAcentos                 := True;
    Configuracoes.Geral.RetirarEspacos                 := True;
    Configuracoes.Geral.Salvar                         := True;

    if (POS('10',WinVersion) > 0) or (POS('2016',WinVersion) > 0) then
      Configuracoes.WebServices.SSLType                := LT_TLSv1_2
    else
      Configuracoes.WebServices.SSLType                := LT_TLSv1_2;

    Configuracoes.Geral.SSLCryptLib                    := cryWinCrypt;
    Configuracoes.Geral.SSLHttpLib                     := httpWinHttp;
    Configuracoes.Geral.SSLLib                         := libWinCrypt;
    Configuracoes.Geral.SSLXmlSignLib                  := xsLibXml2;

    Configuracoes.Geral.VersaoDF                       := ve400;
    Configuracoes.Geral.VersaoQRCode                   := veqr200;
    NumeroSerie                                        := SQLLocate('FILIAL_CERTIFICADOS','ID','NUMERO_SERIE', IntToStr(aEmpresa));
    idCSC                                              := SQLLocate('FILIAL_NFCE','ID','CLDTOKEN', IntToStr(aEmpresa));
    CSC                                                := SQLLocate('FILIAL_NFCE','ID','CSC', IntToStr(aEmpresa));
    Configuracoes.Geral.IdCSC                          := idCSC;
    Configuracoes.Geral.CSC                            := FCSC;
    Configuracoes.Certificados.NumeroSerie             := FNumeroSerie;
    Configuracoes.WebServices.Ambiente                 := StrToTpAmb(RetornoOK, SQLLocate('FILIAL','ID','NFCEPRODUCAO',IntToStr(aEmpresa)));
    Configuracoes.WebServices.AguardarConsultaRet      := 1500;
    Configuracoes.WebServices.AjustaAguardaConsultaRet := True;
    Configuracoes.WebServices.IntervaloTentativas      := 1000;
    Configuracoes.WebServices.Name                     := 'WebServicesConf';
    Configuracoes.WebServices.Tentativas               := 1;
    Configuracoes.WebServices.TimeOut                  := 5000;
    Configuracoes.WebServices.UF                       := SQLLocate('FILIAL','ID','UF',IntToStr(aEmpresa));
    Name                                               := 'ACBrNFe';
    FDanfeEscPos                                       := TDanfeEscPos.Create;
    DANFE                                              := FDanfeEscPos.DanfeEscPos;
    NotasFiscais.Clear;
  end;

  FCalcularRateio := TCalculaRateio.Create;

  sqlCliente := TSQLQuery.Create(dmDatabase);
  sqlCliente.SQLConnection := dmDatabase.scoDados;

  sqlCupom := TSQLQuery.Create(dmDatabase);
  sqlCupom.SQLConnection := dmDatabase.scoDados;

  sqlCupomItem := TSQLQuery.Create(dmDatabase);
  sqlCupomItem.SQLConnection := dmDatabase.scoDados;

  sqlProduto := TSQLQuery.Create(dmDatabase);
  sqlProduto.SQLConnection := dmDatabase.scoDados;

  sqlNumerario := TSQLQuery.Create(dmDatabase);
  sqlNumerario.SQLConnection := dmDatabase.scoDados;

  Imprimir := True;
  Cancelamento := False;

  FControle := TControle.Create;
  FFilialControle := TFilialControle.Create(FControle);
  FCupomControle := TCupomControle.Create(FControle);
  FParametroControle := TParametroControle.Create(FControle);
  FTab_CSTICMSControle := TTabCST_ICMS.Create(FControle);
end;

destructor TEnvioNFCe.destroy;
begin
  inherited;
  Msg := '';
  FreeAndNil(sqlCliente);
  FreeAndNil(sqlCupom);
  FreeAndNil(FCalcularRateio);
  FreeAndNil(ACBrNFCe);

  FreeAndNil(FFilialControle);
  FreeAndNil(FCupomControle);
  FreeAndNil(FControle);
  FreeAndNil(FParametroControle);
  FreeAndNIl(FTab_CSTICMSControle);

end;

function TEnvioNFCe.Gerar_NFCe: string;
var
  RetornoOK : Boolean;
  aCodCSTICMS : String;
begin
  GetCupom;
//  GravarNumeroNFCe;
  Contingencia    := TP_Emissao = '9';

  if Contingencia then
    Msg :=  'Aguarde... Montando NFCe em Contingência'
  else
    Msg :=  'Aguarde... Montando NFCe';

//  if ValorTroca > 0 then
//  begin
//    FCalcularRateio.ValorTotalProdutos := ValorTotalItens;
//    FCalcularRateio.ValorRateio := ValorTroca;
//  end;

  with ACBrNFCe.NotasFiscais.Add.NFe do
  begin
    Ide.cNF    := FCodigoNF;
    Ide.natOp  := 'VENDA CONSUMIDOR';
    Ide.modelo := 65;
    Ide.serie  := StrToInt(FTerminal);
    Ide.nNF    := NumNFCe;
    if Contingencia then
    begin
      Ide.dEmi     := FDataEmissao + FHoraEmissao;
//    Ide.dSaiEnt  := FDataSaida;
      Ide.tpEmis   := teOffLine;
      Ide.dhCont   := IncSecond(FDataEmissao,2);
      Ide.xJust    := 'Entrada em contingencia por falha na conexao com webservice';
      Contingencia := False;
    end
    else
    begin
      DataEmissao  := Date;
      Ide.dEmi     := now;
//    Ide.dSaiEnt  := now;
//    Ide.hSaiEnt  := now;
      Ide.tpEmis   := teNormal;
    end;
    Ide.tpNF      := tnSaida;
    Ide.cUF       := StrToInt(SQLLocate('UF','UF','CODUF', SQLLocate('FILIAL', 'ID', 'UF', FEmpresa)));
    Ide.cMunFG    := StrToInt(SQLLocate('CIDADE','ID','CODMUNICIPIO', SQLLocate('FILIAL', 'ID', 'ID_CIDADE', FEmpresa)));
    Ide.finNFe    := fnNormal;
    Ide.tpImp     := tiNFCe;
    Ide.indFinal  := cfConsumidorFinal;
    if ValorFrete > 0 then
      Ide.indPres := pcEntregaDomicilio
    else
    begin
      Ide.indPres := pcPresencial;
//      Ide.indIntermed := iiOperacaoSemIntermediador;
      Ide.indIntermed := iiSemOperacao;
    end;
    Ide.verProc   := 'SSNFCe ' + GetVersion;

    Emit.CNPJCPF           := Monta_Texto(SQLLocate('FILIAL', 'ID', 'CNPJ_CPF', FEmpresa),14);
    Emit.IE                := Monta_Numero(SQLLocate('FILIAL', 'ID', 'INSCR_EST', FEmpresa),0);
    Emit.xNome             := TirarAcento(SQLLocate('FILIAL', 'ID', 'NOME', FEmpresa));
    Emit.xFant             := TirarAcento(SQLLocate('FILIAL', 'ID', 'NOME_INTERNO', FEmpresa));
    Emit.EnderEmit.fone    := Monta_Texto(SQLLocate('FILIAL', 'ID', 'FONE', FEmpresa),0);
    Emit.EnderEmit.CEP     := StrToInt(Monta_Texto(SQLLocate('FILIAL', 'ID', 'CEP', FEmpresa),8));
    Emit.EnderEmit.xLgr    := TirarAcento(SQLLocate('FILIAL', 'ID', 'ENDERECO', FEmpresa));
    Emit.EnderEmit.nro     := SQLLocate('FILIAL', 'ID', 'NUM_END', FEmpresa);
    Emit.EnderEmit.xCpl    := TirarAcento(SQLLocate('FILIAL', 'ID', 'COMPLEMENTO_END', FEmpresa));
    Emit.EnderEmit.xBairro := TirarAcento(SQLLocate('FILIAL', 'ID', 'BAIRRO', FEmpresa));
    Emit.EnderEmit.cMun    := Ide.cMunFG;
    Emit.EnderEmit.xMun    := TirarAcento(SQLLocate('FILIAL', 'ID', 'CIDADE', FEmpresa));
    Emit.EnderEmit.UF      := SQLLocate('FILIAL', 'ID', 'UF', FEmpresa);
    Emit.enderEmit.cPais   := 1058;
    Emit.enderEmit.xPais   := 'BRASIL';
    Emit.IEST              := '';

    Emit.CRT := StrToCRT(RetornoOK, SQLLocate('FILIAL', 'ID', 'ID_REGIME_TRIB', FEmpresa));

    if CPFCNPJ <> '' then
      Dest.CNPJCPF           := TiraCaracterCNPJ(CPFCNPJ);

    GetCliente;
    Dest.xNome               := FCupomControle.Cliente_Nome;
    Dest.indIEDest           := inNaoContribuinte; {Pq NFCe nao informa Destinatario}
    if Ide.indPres = pcEntregaDomicilio then
    begin
      Dest.EnderDest.CEP     := StrToInt(Monta_Texto(SQLCliente.FieldByName('CEP').AsString,8));
      Dest.EnderDest.xLgr    := TiraAcentos(SQLCliente.FieldByName('ENDERECO').AsString);
      Dest.EnderDest.nro     := SQLCliente.FieldByName('NUM_END').AsString;
      Dest.EnderDest.xCpl    := TiraAcentos(SQLCliente.FieldByName('COMPLEMENTO_END').AsString);
      Dest.EnderDest.xBairro := TiraAcentos(SQLCliente.FieldByName('BAIRRO').AsString);
      Dest.EnderDest.cMun    := StrToInt(SQLLocate('CIDADE','ID','CODMUNICIPIO', SQLCliente.FieldByName('ID_CIDADE').AsString));
      Dest.EnderDest.xMun    := TiraAcentos(SQLCliente.FieldByName('CIDADE').AsString);
      Dest.EnderDest.UF      := SQLCliente.FieldByName('UF').AsString;
      Dest.EnderDest.cPais   := SQLCliente.FieldByName('ID_PAIS').AsInteger;
      Dest.EnderDest.xPais   := 'BRASIL';
    end;
    Total.ICMSTot.vBC        := 0;
    Total.ICMSTot.vICMS      := 0;
    ItemAtual                := 0;

    //Itens
    GetCupomItem;
    sqlcupomItem.First;
    while not sqlCupomItem.Eof do
    begin
      FCodigoProduto := sqlCupomItem.fieldbyname('ID_PRODUTO').AsInteger;
      GetProduto;
      ItemAtual := ItemAtual + 1;
      with Det.Add do
      begin
        Prod.nItem := sqlCupomItem.fieldbyname('ITEM').AsInteger;
        Prod.cProd := sqlCupomItem.fieldbyname('ID_PRODUTO').AsString;

        if SQLLocate('PARAMETROS_NFE', 'ID', 'ENVAR_CODBARRA', '1') = 'S' then
          Prod.cEAN := sqlProduto.FieldByName('COD_BARRA').asString;
        if Trim(Prod.cEAN) = EmptyStr then
          Prod.cEAN := 'SEM GTIN';

        Prod.cEANTrib := Prod.cEAN;
        if sqlProduto.FieldByName('COD_BARRA2').asString <> EmptyStr then
          Prod.cEANTrib := trim(sqlProduto.FieldByName('COD_BARRA2').asString);

        Prod.xProd := sqlProduto.fieldbyname('NOME').AsString;
//ver
//        if sqlProduto.FieldByName('NCM_PRODUTO').AsString <> sqlCupomItem.FieldByName('NCM_PRODUTO').AsString then

        Prod.NCM := SQLLocate('TAB_NCM', 'ID', 'NCM', SQLLocate('PRODUTO', 'ID', 'ID_NCM', IntToStr(FCodigoProduto)));

        if Prod.NCM = EmptyStr  then
        begin
          ShowMessage('Encontrado produto com código de NCM invalido. Verificar!!'+ #13#10 + 'Código do Produto : '+ IntToStr(FCodigoProduto));
          Abort;
        end;

        if Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
        begin
          Prod.cBenef := SQLLocate('PRODUTO', 'ID', 'COD_BENEF', IntToStr(FCodigoProduto));
          if Prod.cBenef = EmptyStr then
            Prod.cBenef := SQLLocate('TAB_NCM', 'NCM', 'COD_BENEF', Prod.NCM);

          aCodCSTICMS := SQLLocate('TAB_CSTICMS', 'ID', 'COD_CST', SQLCupomItem.FieldByName('ID_CSTICMS').AsString);

          if (Prod.cBenef = EmptyStr) and ((aCodCSTICMS = '90')
            or (aCodCSTICMS = '10')) then
            Prod.cBenef := 'SEM CBENEF';
        end;

        Prod.EXTIPI := '';

        Prod.CFOP    := SQLLocate('TAB_CFOP', 'ID', 'CODCFOP', sqlCupomItem.FieldByName('ID_CFOP').AsString);

        Prod.uCom    := SQLCupomItem.FieldByName('UNIDADE').AsString;
        Prod.qCom    := sqlCupomItem.fieldbyname('QTD').AsFloat;
        Prod.vUnCom  := sqlCupomItem.fieldbyname('VLR_UNITARIO').AsFloat;
        Prod.vProd   := sqlCupomItem.fieldbyname('VLR_UNITARIO').AsCurrency * sqlCupomItem.fieldbyname('QTD').AsCurrency;
        FTotalItem   := RoundABNT((sqlCupomItem.fieldbyname('VLR_UNITARIO').AsCurrency * sqlCupomItem.fieldbyname('QTD').AsCurrency),2);
        Prod.vProd   := FtotalItem;

        Prod.uTrib   := SQLCupomItem.FieldByName('UNIDADE').AsString;
        Prod.qTrib   := sqlCupomItem.fieldbyname('QTD').AsFloat;
        Prod.vUnTrib := sqlCupomItem.fieldbyname('VLR_UNITARIO').AsFloat;

        Prod.vOutro  := 0;
        Prod.vFrete  := 0;
        Prod.vSeg    := 0;

        Prod.vDesc   := sqlCupomItem.fieldbyname('VLR_DESCONTO').AsFloat + sqlCupomItem.fieldbyname('VLR_DESCONTORATEIO').AsFloat;

        if (ValorTroca > 0) then
        begin
          FCalcularRateio.ValorProduto := Prod.vProd - Prod.vDesc;
          ValorTrocaRateio := FCalcularRateio.CalcularRateio;
          Prod.vDesc := ValorTrocaRateio + Prod.vDesc;
        end;
        Prod.vDesc := RoundTo(Prod.vDesc, -2);

        if (FNumeroItens = FItemAtual) and (FCalcularRateio.ValorDiferenca <> ValorTroca) then
        begin
          Prod.vDesc := Prod.vDesc + (ValorTroca - FCalcularRateio.ValorDiferenca);
          Prod.vDesc := RoundTo(Prod.vDesc, -2);
        end;
               {CEST CODIGO}
        Prod.CEST := SQLLocate('TAB_NCM', 'ID', 'COD_CEST', SQLLocate('PRODUTO', 'ID', 'ID_NCM', IntToStr(FCodigoProduto)));

        with Imposto do
        begin
          ICMS.orig := strToOrig(RetornoOK,  sqlCupomItem.FieldByName('ORIGEM_PROD').AsString) ;
          case Emit.CRT of
            crtSimplesNacional:
            begin // Linhas para o simples nacional
              FTab_CSTICMSControle.PesquisaTAB_CST(sqlCupomItem.FieldByName('ID_CSTICMS').AsInteger);
              ICMS.CSOSN := StrToCSOSNIcms(RetornoOK, FTab_CSTICMSControle.CST_ICMS);
              case ICMS.CSOSN of
                csosn101:
                begin
                  ICMS.pCredSN := 0.0; // Colocar o percentual do Crédito
                  ICMS.vCredICMSSN := 0.0; // Colocar o valor do Crédito
                end;
                csosn102: begin
                  end;
                csosn103: begin
                  end;
                csosn300: begin
                  end;
                csosn400: begin
                  end;
                csosn201:
                begin
                  ICMS.modBCST     := dbisMargemValorAgregado;
                  ICMS.pMVAST      := 0;
                  ICMS.pRedBCST    := 0;
                  ICMS.vBCST       := 0;
                  ICMS.pICMSST     := 0;
                  ICMS.vICMSST     := 0;
                  ICMS.pCredSN     := 0;
                  ICMS.vCredICMSSN := 0;
                end;
                csosn202:
                begin
                  ICMS.modBCST  := dbisMargemValorAgregado;
                  ICMS.pMVAST   := 0;
                  ICMS.pRedBCST := 0;
                  ICMS.vBCST    := 0;
                  ICMS.pICMSST  := 0;
                  ICMS.vICMSST  := 0;
                end;
                csosn500:
                begin
                  if sqlCupomitem.FieldByName('BASE_ICMSSUBST_RET').AsFloat > 0 then
                  begin
                    ICMS.vBCSTRet := sqlCupomitem.FieldByName('BASE_ICMSSUBST_RET').AsFloat;
                    ICMS.vICMSSTRet := sqlCupomitem.FieldByName('VLR_ICMSSUBST_RET').AsFloat;

                  end;

                  if sqlCupomitem.FieldByName('VLR_ICMS_EFE').AsFloat > 0 then
                  begin
                    ICMS.vICMSEfet := sqlCupomitem.FieldByName('VLR_ICMS_EFE').AsFloat;
                    ICMS.pICMSEfet := sqlCupomitem.FieldByName('PERC_ICMS_EFET').AsFloat;
                    ICMS.vBCEfet := sqlCupomitem.FieldByName('VLR_BASE_EFET').AsFloat;;
                  end;
                end;
              end;
            end;

            crtSimplesExcessoReceita:
            begin
                          //        (...)
            end;

            crtRegimeNormal:
            begin
              FTab_CSTICMSControle.PesquisaTAB_CST(sqlCupomItem.FieldByName('ID_CSTICMS').AsInteger);
              ICMS.CST := StrToCSTICMS(RetornoOK, FTab_CSTICMSControle.CST_ICMS);

              ICMS.vBCST    := 0;
              ICMS.pICMSST  := 0;
              ICMS.vICMSST  := 0;

              if ICMS.CST = cst60 then
              begin
                if sqlCupomItem.FieldByName('VLR_ICMSSUBST_RET').AsFloat > 0 then
                begin
                  ICMS.vBCSTRet := sqlCupomItem.FieldByName('BASE_ICMSSUBST_RET').AsFloat;
                  ICMS.vICMSSTRet := sqlCupomItem.FieldByName('VLR_ICMSSUBST_RET').AsFloat;
                  ICMS.pST := sqlCupomItem.FieldByName('PERC_ST').AsFloat;
                  ICMS.vICMSSubstituto := sqlCupomItem.FieldByName('VLR_ICMS_SUBSTITUTO').AsFloat;
                end;
                if sqlCupomItem.FieldByName('VLR_ICMS_EFE').AsFloat > 0 then
                begin
                  ICMS.vICMSEfet := StrToFloat(formatFloat('0.00', sqlCupomItem.FieldByName('VLR_ICMS_EFE').AsFloat));
                  ICMS.pRedBCEfet := StrToFloat(formatFloat('0.00', sqlCupomItem.FieldByName('PERC_BASE_RED_EFET').AsFloat));
                  ICMS.vBCEfet := StrToFloat(formatFloat('0.00', sqlCupomItem.FieldByName('VLR_BASE_EFET').AsFloat));
                  ICMS.pICMSEfet := StrToFloat(FormatFloat('0.00', sqlCupomItem.FieldByName('PERC_ICMS_EFET').AsFloat));
                end;
              end;
                          // Base Calculo
              ICMS.modBC    := dbiMargemValorAgregado;

              ICMS.vBC      := sqlCupomItem.FieldByName('BASE_ICMS').AsFloat;
              ICMS.pICMS    := sqlCupomItem.FieldByName('PERC_ICMS').AsFloat;
              ICMS.vICMS    := sqlCupomItem.FieldByName('VLR_ICMS').AsFloat;

              if (ICMS.CST in [cst20, cst70]) and (sqlCupomItem.FieldByName('PERC_TRIBICMS').AsFloat > 0) then
                ICMS.pRedBC := 100 - sqlCupomItem.FieldByName('PERC_TRIBICMS').AsFloat;

//              if ICMS.CST in [cst00, cst20, cst90] then
//              begin
//                ICMS.vFCP   := sqlCupomItem.FieldByName('VALOR_FCP').AsFloat;
//                ICMS.pFCP   := sqlCupomItem.FieldByName('PERC_FCP').AsFloat;
//                ICMS.vBCFCP := sqlCupomItem.FieldByName('BASE_FCP').AsFloat;
//              end;

              //Pis e cofins
              CST_Cofins := SQLLocate('TAB_COFINS','ID','CODIGO', sqlCupomItem.FieldByName('ID_COFINS').AsString);
              COFINS.CST := StrToCSTCOFINS(RetornoOK, CST_Cofins);
              if COFINS.CST in [cof01, cof02, cof03] then
              begin
                COFINS.vBC := FValor_Total;
                COFINS.pCOFINS := sqlCupomItem.FieldByName('PERC_COFINS').AsFloat;
                COFINS.vCOFINS := sqlCupomItem.FieldByName('VLR_COFINS').AsFloat;
              end
              else
              begin
                COFINS.vBC := 0;
                COFINS.pCOFINS := 0;
                COFINS.vCOFINS := 0;
              end;

              CST_Pis := SQLLocate('TAB_PIS','ID','CODIGO', sqlCupomItem.FieldByName('ID_PIS').AsString);
              PIS.CST := StrToCSTPIS(RetornoOK, CST_Pis);
              if PIS.CST in [pis01, pis02, pis03] then
              begin
                PIS.vBC := FValor_Total;
                PIS.pPIS := sqlCupomItem.FieldByName('PERC_PIS').AsFloat;
                PIS.vPIS := sqlCupomItem.FieldByName('VLR_PIS').AsFloat;
              end
              else
              begin
                PIS.vBC := 0;
                PIS.pPIS := 0;
                PIS.vPIS := 0;
              end;

              Total.ICMSTot.vBC     := Total.ICMSTot.vBC + ICMS.vBC;
              Total.ICMSTot.vICMS   := Total.ICMSTot.vICMS + ICMS.vICMS;
              Total.ICMSTot.vCOFINS := Total.ICMSTot.vCOFINS + cofins.vCOFINS;
              Total.ICMSTot.vPIS    := Total.ICMSTot.vPIS + pis.vPIS;
              Total.ICMSTot.vFCP    := Total.ICMSTot.vFCP + ICMS.vFCP;
            end;
          end;
          CalcularImpostos;
        end;
        Total.ICMSTot.vProd := Total.ICMSTot.vProd + Prod.vProd;
        Total.ICMSTot.vDesc := Total.ICMSTot.vDesc + Prod.vDesc;
      end;
      sqlCupomItem.Next;
    end;

    Total.ICMSTot.vBCST    := 0;
    Total.ICMSTot.vST      := 0;
    Total.ICMSTot.vFrete   := ValorFrete;
    Total.ICMSTot.vSeg     := 0;
    Total.ICMSTot.vII      := 0;
    Total.ICMSTot.vIPI     := 0;
    Total.ICMSTot.vOutro   := 0;
    Total.ICMSTot.vNF      := Total.ICMSTot.vProd - Total.ICMSTot.vDesc + Total.ICMSTot.vFrete ;
    Total.ISSQNtot.vServ   := 0;
    Total.ISSQNTot.vBC     := 0;
    Total.ISSQNTot.vISS    := 0;
    Total.ISSQNTot.vPIS    := 0;
    Total.ISSQNTot.vCOFINS := 0;

    if Ide.indPres = pcEntregaDomicilio then
    begin
      Transp.modFrete           := mfContaDestinatario;
      Transp.Transporta.CNPJCPF := SQLLocate('PESSOA', 'CODIGO', 'CNPJ_CPF', IntToStr(FCodigoTransportadora));
      Transp.Transporta.xNome   := SQLLocate('PESSOA', 'CODIGO', 'NOME', IntToStr(FCodigoTransportadora));
      Transp.Transporta.IE      := SQLLocate('PESSOA', 'CODIGO', 'INSCR_EST', IntToStr(FCodigoTransportadora));
      Transp.Transporta.xEnder  := SQLLocate('PESSOA', 'CODIGO', 'ENDERECO', IntToStr(FCodigoTransportadora));
      Transp.Transporta.xMun    := SQLLocate('PESSOA', 'CODIGO', 'CIDADE', IntToStr(FCodigoTransportadora));
      Transp.Transporta.UF      := SQLLocate('PESSOA', 'CODIGO', 'UF', IntToStr(FCodigoTransportadora));
    end
    else
      Transp.modFrete           := mfSemFrete;

    GetNumerario;
    while not sqlNumerario.eof do
    begin
      with pag.Add do
      begin
        if sqlNumerario.FieldByName('TIPO_PGTO').AsString = 'V' then
          Ide.indPag := ipVista
        else
          Ide.indPag := ipPrazo;
        tpag := StrToFormaPagamento(RetornoOK, SQLLocate('TIPOCOBRANCA','ID','COD_IMP_FISCAL',sqlNumerario.FieldByName('ID_TIPOCOBRANCA').AsString));
        vPag := sqlNumerario.FieldByName('VALOR').AsFloat;
        if (tpag = fpDinheiro) and (FCupomControle.Vlr_Troco > 0) then
          vPag := vPag + FCupomControle.Vlr_Troco;
      end;
      sqlNumerario.Next;
    end;
    pag.vTroco := FCupomControle.Vlr_Troco;
    InfAdic.infCpl := 'Cod.Cupom: ' + IntToStr(FNumNFCe) + ' ' + MontarDadosCliente;
    InfAdic.infAdFisco := '';
      {Dados do Cliente}

    if FCupomControle.ID_Vendedor > 0 then
      InfAdic.infCpl := InfAdic.infCpl + #13 + 'Vendedor: ' + SQLLocate('PESSOA', 'CODIGO', 'NOME', IntToStr(FCupomControle.ID_Vendedor));

    if FObs_Venda <> '' then
      InfAdic.infCpl := InfAdic.infCpl + #13 + FObs_Venda;

    // Gerar XML
    try
      ACBrNFCe.NotasFiscais.GerarNFe;
    except

    end;
    Chave := Copy(ACBrNFCe.NotasFiscais.Items[0].NFe.infNFe.ID, (length(ACBrNFCe.NotasFiscais.Items[0].NFe.infNFe.ID) - 44) + 1, 44);
    if DirectoryExists('c:\temp') then
      if ACBrNFCe.NotasFiscais.Count > 0 then
        ACBrNFCe.NotasFiscais[0].GravarXML('NFCe.xml', 'c:\temp');
  end;
end;

procedure TEnvioNFCe.SetCodigoMunicipioCliente(const Value: Integer);
begin
  FCodigoMunicipioCliente := Value;
end;

procedure TEnvioNFCe.SetcodigoProduto(const Value: Integer);
begin
  FcodigoProduto := Value;
end;

procedure TEnvioNFCe.SetContingencia(const Value: Boolean);
begin
  FContingencia := Value;
end;

procedure TEnvioNFCe.SetDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
end;

procedure TEnvioNFCe.SetDataSaida(const Value: TDateTime);
begin
  FDataSaida := Value;
end;

procedure TEnvioNFCe.SetEmpresa(const Value: string);
begin
  FEmpresa := Value;
end;

procedure TEnvioNFCe.SetIDCliente(const Value: String);
begin
  FIDCliente := Value;
end;

procedure TEnvioNFCe.SetIDCupom(const Value: Integer);
begin
  FIDCupom := Value;
end;

procedure TEnvioNFCe.SetMsg(const Value: String);
begin
  if Assigned(FevMsg) then
    FevMsg(Value);
end;

procedure TEnvioNFCe.SetNumeroItens(const Value: Integer);
begin
  FNumeroItens := Value;
end;

procedure TEnvioNFCe.SetNumNFCe(const Value: Integer);
begin
  FNumNFCe := Value;
end;

procedure TEnvioNFCe.SetPercFCP(const Value: Real);
begin
  FPercFCP := Value;
end;

procedure TEnvioNFCe.SetPercSTEfetivo(const Value: Real);
begin
  FPercSTEfetivo := Value;
end;

procedure TEnvioNFCe.SetPortaPrinter(const Value: String);
begin
  FPortaPrinter := Value;
end;

procedure TEnvioNFCe.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TEnvioNFCe.SetTerminal(const Value: String);
begin
  FTerminal := Value;
end;

procedure TEnvioNFCe.SetItemAtual(const Value: Integer);
begin
  FItemAtual := Value;
end;

procedure TEnvioNFCe.SetValorFrete(const Value: Real);
begin
  FValorFrete := Value;
end;

procedure TEnvioNFCe.SetValorTotalItens(const Value: Real);
begin
  FValorTotalItens := Value;
end;

procedure TEnvioNFCe.SetValorTroca(const Value: Real);
begin
  FValorTroca := Value;
end;

procedure TEnvioNFCe.SetValorTrocaRateio(const Value: Real);
begin
  FValorTrocaRateio := Value;
end;

procedure TEnvioNFCe.SetValorTroco(const Value: Real);
begin
  FValorTroco := Value;
end;

procedure TEnvioNFCe.SetVelocidadePrinter(const Value: String);
begin
  FVelocidadePrinter := Value;
end;

procedure TEnvioNFCe.CalcularImpostos;
begin
  if sqlCupomItem.FieldByName('VLR_TRIBUTO_FEDERAL').AsFloat > 0 then
    ACBrNFCe.DANFE.vTribFed := ACBrNFCe.DANFE.vTribFed + sqlCupomItem.FieldByName('VLR_TRIBUTO_FEDERAL').AsFloat;

  if sqlCupomItem.FieldByName('VLR_TRIBUTO_ESTADUAL').AsFloat > 0 then
    ACBrNFCe.DANFE.vTribEst := ACBrNFCe.DANFE.vTribEst + sqlCupomItem.FieldByName('VLR_TRIBUTO_ESTADUAL').AsFloat;

  if sqlCupomItem.FieldByName('VLR_TRIBUTO_MUNICIPAL').AsFloat > 0 then
    ACBrNFCe.DANFE.vTribMun := ACBrNFCe.DANFE.vTribMun + sqlCupomItem.FieldByName('VLR_TRIBUTO_MUNICIPAL').AsFloat;
end;

procedure TEnvioNFCe.SetCodigoTransportadora(const Value: Integer);
begin
  FCodigoTransportadora := Value;
end;

procedure TEnvioNFCe.SetTipoPagamento(const Value: String);
begin
  FTipoPagamento := Value;
end;

procedure TEnvioNFCe.SetValorDesconto(const Value: Real);
begin
  FValorDesconto := Value;
end;

procedure TEnvioNFCe.SetCodigoCupom(const Value: Integer);
begin
  FCodigoCupom := Value;
end;

function TEnvioNFCe.MontarDadosCliente: String;
var
  aDados : String;
begin
  if FCupomControle.Cliente_Nome <> '' then
    aDados := aDados + FCupomControle.Cliente_Nome + ', ';
  if FCupomControle.CPF <> '' then
    aDados := aDados +  FCupomControle.CPF + ', ';
  if FCupomControle.Cliente_Fone <> '' then
    aDados := aDados + FCupomControle.Cliente_Fone + ', ';
  if FCupomControle.Cliente_Endereco <> '' then
    aDados := aDados + FCupomControle.Cliente_Endereco + ', ';
  Result := aDados;
end;

procedure TEnvioNFCe.SetObs_Venda(const Value: String);
begin
  FObs_Venda := Value;
end;

procedure TEnvioNFCe.SetChave(const Value: String);
begin
  FChave := Value;
  FCodigoNF := StrToIntDef(Copy(Value,36,8),-1);
end;

procedure TEnvioNFCe.GetCupom;
begin
  if FIDCupom = 0 then
    exit;

  if Assigned(FCupomControle) then
    FCupomControle.PesquisaCupom(FIDCupom);


  sqlCupom.Close;
  sqlCupom.SQL.Clear;
  sqlCupom.SQL.Add('Select C.NUMCUPOM, C.VLR_TOTAL, C.VLR_DESCONTO, C.DTEMISSAO, C.CPF, ');
  sqlCupom.SQL.Add('C.ID_CLIENTE, C.VLR_TROCO, C.CLIENTE_NOME, C.CLIENTE_FONE, C.HREMISSAO, ');
  sqlCupom.SQL.Add('C.CLIENTE_ENDERECO, C.ID_VENDEDOR, C.SERIE, C.FILIAL, C.NFECHAVEACESSO, C.TIPO_EMISSAO, ');
  sqlCupom.SQL.Add('C.CLIENTE_ENDERECO, C.CPF ');

  sqlCupom.SQL.Add('from CUPOMFISCAL C where C.ID = ' + IntToStr(FIDCupom));

  sqlCupom.Open;
  IDCliente       := sqlCupom.FieldByName('ID_CLIENTE').AsString;
  Terminal        := sqlCupom.FieldByName('SERIE').AsString;
  DataEmissao     := sqlCupom.FieldByName('DTEMISSAO').AsDateTime;
  DataSaida       := sqlCupom.FieldByName('DTEMISSAO').AsDateTime;
  HoraEmissao     := sqlCupom.FieldByName('HREMISSAO').AsDateTime;
  NumNFCe         := sqlCupom.fieldbyname('NUMCUPOM').AsInteger;
  ValorTroco      := sqlCupom.fieldbyname('VLR_TROCO').AsFloat;
  Empresa         := sqlCupom.FieldByName('FILIAL').AsString;
  Chave           := sqlCupom.FieldByName('NFECHAVEACESSO').AsString;
  CPFCNPJ         := sqlCupom.FieldByName('CPF').AsString;

  if sqlCupom.FieldByName('TIPO_EMISSAO').AsString <> EmptyStr then
    TP_Emissao      := sqlCupom.FieldByName('TIPO_EMISSAO').AsString;
  if (FCodigoTransportadora = 0) and (ValorFrete > 0) then
  begin
    //implementar
  end;
  ValorTotalItens := RoundTo(sqlCupom.FieldByName('VLR_TOTAL').AsCurrency, -2);
  ValorDesconto   := sqlCupom.FieldByName('VLR_DESCONTO').AsFloat;
end;

procedure TEnvioNFCe.GetCupomItem;
begin
  if FIDCupom = 0 then
    exit;

  SQLCupomItem.Close;
  SQLCupomItem.SQL.Clear;
  SQLCupomItem.SQL.Add('select * from CUPOMFISCAL_ITENS where id = ' + IntToStr(FIDCupom) + ' order by ITEM ');

  SQLCupomItem.Open;
  SQLCupomItem.First;
  NumeroItens := SQLCupomItem.RecordCount;
end;

procedure TEnvioNFCe.GetCliente;
begin
  if FIDCliente = EmptyStr then
    Exit;
  SQLCliente.close;
  SQLCliente.sql.clear;
  SQLCliente.sql.Add('select ENDERECO, BAIRRO, CIDADE, UF, CEP, ID_PAIS, NUM_END, COMPLEMENTO_END, ID_CIDADE ');
  SQLCliente.sql.Add('from PESSOA where CODIGO = ''' + FIDCliente + '''');
  SQLCliente.open;
end;

procedure TEnvioNFCe.GetProduto;
begin
  if FCodigoProduto = 0 then
    Exit;
  sqlProduto.close;
  sqlProduto.sql.Clear;
  sqlProduto.sql.Add('select P.NOME, P.COD_BARRA, P.COD_BARRA2, TN.NCM NCM_PRODUTO ');
  sqlProduto.sql.Add('FROM PRODUTO P ');
  sqlProduto.sql.Add('left join TAB_NCM TN on P.ID_NCM = TN.ID ');
  sqlProduto.sql.Add('where P.ID = ' + IntToStr(FCodigoProduto));
  sqlProduto.open;
end;

procedure TEnvioNFCe.GetNumerario;
begin
  if FIDCupom = 0 then
    exit;
  sqlNumerario.Close;
  sqlNumerario.SQL.Clear;
  sqlNumerario.SQL.Add('select ID, ITEM, ID_TIPOCOBRANCA, VALOR, TIPO_PGTO ');
  sqlNumerario.SQL.Add('from CUPOMFISCAL_FORMAPGTO ');
  sqlNumerario.SQL.Add('where ID = ' + IntToStr(FIDCupom));
  sqlNumerario.Open;
end;

procedure TEnvioNFCe.ImprimirNFCe;
begin
  try
    if Assigned(ACBrNFCe) then
    begin
      Msg := 'Imprimindo NFCe Nº: ' + IntToStr(FNumNFCe);
      ACBrNFCe.NotasFiscais.Imprimir;
    end;
  except

  end;
end;

procedure TEnvioNFCe.ValidarNFCe;
begin
  if Assigned(ACBrNFCe) then
  begin
    Msg := 'Validando NFCe Nº: ' + IntToStr(FNumNFCe);
    ACBrNFCe.NotasFiscais.Validar;
  end;
end;

procedure TEnvioNFCe.AssinarNFCe;
begin
  if Assigned(ACBrNFCe) then
  begin
    Msg := 'Assinando NFCe Nº: ' + IntToStr(FNumNFCe);
    ACBrNFCe.NotasFiscais.Assinar;
  end;
end;

function TEnvioNFCe.EnviarNFCe : tpErro;
var
  Mensagem : String;
begin
  if Assigned(ACBrNFCe) then
  begin
    Mensagem := '';
    Msg := 'Enviando NFCe Nº: ' + IntToStr(FNumNFCe);
    try
      ACBrNFCe.Enviar('1', False, False);
    except
      on e: Exception do
      begin
        if (pos('12007', UpperCase(E.Message)) > 0) or // erro de conexão
           (pos('12002', UpperCase(E.Message)) > 0) or // timeout
           (pos('12029', UpperCase(E.Message)) > 0) or // limite de tempo de conexão
           (pos('12175', UpperCase(E.Message)) > 0) or // erro criptografia ssl
           (pos('ERRO NAO CATALOGADO', UpperCase(E.Message)) > 0) then // erros de tratamento do webservice
        begin
          Mensagem := e.Message;
          Mensagem := StringReplace(Mensagem, #$D#$A, ' ', [rfReplaceAll]);
          RetornoMsg := Mensagem;
          Result   := tpConexao;
        end
        else
        if (Pos('DUPLICIDADE DE NF-E',UpperCase(E.message)) > 0) then
        begin
          Chave      := Copy(E.Message, pos('chNFe:', E.Message), 50);
          Chave      := StringReplace(Chave, 'chNFe:', '', [rfReplaceAll, rfIgnoreCase]);
          Chave      := StringReplace(Chave, ']', '', [rfReplaceAll]);
          ConsultarNFCe;
          GravarLogErro(E.Message);
          TP_Emissao := Copy(Chave,35,1);
          Result     := tpDuplicidade;
          CStat      := '100';
        end
        else
        begin
          Mensagem := E.Message;
          Mensagem := StringReplace(Mensagem, #$D#$A, ' ', [rfReplaceAll]);
          GravarLogErro(Mensagem);
          RetornoMsg := Mensagem;
          Result := tpDados;
        end;
      end;
    end;
  end;
end;

procedure TEnvioNFCe.GravarNFCe;
var
  aSql : TSQLQuery;
begin
  aSql := TSQLQuery.Create(dmDatabase);
  try
    aSql.SQLConnection := dmDatabase.scoDados;
    aSql.Close;
    aSql.SQL.Clear;
    aSql.SQL.Add('UPDATE CUPOMFISCAL SET ');
    aSql.SQL.Add('NFECHAVEACESSO = :NFECHAVEACESSO, ');
    aSql.SQL.Add('NFEPROTOCOLO = :NFEPROTOCOLO, ');
    aSql.SQL.Add('TIPO_EMISSAO = :TIPO_EMISSAO, ');
    aSql.SQL.Add('DADOS_ADICIONAIS = :DADOS_ADICIONAIS, ');
    aSql.SQL.Add('DTEMISSAO = :DTEMISSAO, ');
    aSql.SQL.Add('NFERECIBO = :NFERECIBO ');
    aSql.SQL.Add('where ID = ' + IntToStr(FIDCupom));
    aSql.ParamByName('NFECHAVEACESSO').asString     := FChave;
    aSql.ParamByName('NFEPROTOCOLO').asString       := FProtocolo;
    aSql.ParamByName('TIPO_EMISSAO').asString       := FTP_Emissao;
    aSql.ParamByName('NFERECIBO').asString          := FRecibo;
    aSql.ParamByName('DTEMISSAO').AsDate            := FDataEmissao;
    aSql.ParamByName('DADOS_ADICIONAIS').asString   := FDadosAdicionais;
    aSql.ExecSQL;
  finally
    FreeAndNil(aSql);
  end;
end;

procedure TEnvioNFCe.SetCStat(const Value: String);
begin
  FCStat := Value;
end;

procedure TEnvioNFCe.SetProtocolo(const Value: String);
begin
  FProtocolo := Value;
end;

procedure TEnvioNFCe.SetTP_Emissao(const Value: String);
begin
  FTP_Emissao := Value;
end;

procedure TEnvioNFCe.GravarNumeroNFCe;
var
  aSql : TSQLQuery;
begin
  aSql := TSQLQuery.Create(dmDatabase);
  try
    aSql.SQLConnection := dmDatabase.scoDados;
    aSql.Close;
    aSql.SQL.Clear;
    aSql.SQL.Add('SELECT CUPOA13ID, CUPOINRO FROM CUPOM WHERE CUPOA13ID = ' + IntToStr(FIDCupom));
    aSql.Open;
    if aSql.IsEmpty then
      Exit;
    aSql.Edit;
    aSql.FieldByName('CUPOINRO').AsInteger := FNumNFCe;
    aSql.Post;
  finally
    FreeAndNil(aSql);
  end;
end;

function TEnvioNFCe.ConsultarNFCe: Boolean;
var
  Tentativa : Integer;
begin
  Result := False;
  Tentativa := 1;
  if Assigned(ACBrNFCe) then
  begin
    while Tentativa < 6 do
    begin
      Inc(Tentativa);
      if not Cancelamento then
        Msg := 'Consultando Retorno Sefaz - NFCe Nº: ' + IntToStr(FNumNFCe);
      ACBrNFCe.Consultar(FChave);
      CStat := IntToStr(ACBrNFCe.WebServices.consulta.cStat);
      if CStat = '100' then
      begin
        Protocolo       := ACBrNFCe.WebServices.consulta.Protocolo;
        DhRecbto        := ACBrNFCe.WebServices.consulta.DhRecbto;
        DadosAdicionais := ACBrNFCe.WebServices.consulta.XMotivo;
//        Recibo          := ACBrNFCe.WebServices.Consulta. Retorno.Recibo
        Tentativa       := 6;
        Result          := True;
      end;
    end;
  end;
end;

procedure TEnvioNFCe.SetCSC(const Value: String);
begin
  if Value = EmptyStr then
    Raise Exception.Create('Token não configurado, contate o suporte!');
  FCSC := Value;
end;

procedure TEnvioNFCe.SetNumeroSerie(const Value: String);
begin
  if Value = EmptyStr then
    Raise Exception.Create('Certificado não configurado, contate o suporte!');
  FNumeroSerie := Value;
end;

procedure TEnvioNFCe.SetidCSC(const Value: String);
begin
  if Value = EmptyStr then
    Raise Exception.Create('ID do Token não configurado, contate o suporte!');
  FidCSC := Value;
end;

function TEnvioNFCe.Enviar: Boolean;
var
  FErro : tpErro;
begin
  FErro := EnviarNFCe;
  case FErro of
    tpConexao :
      begin
        TP_Emissao := '9';
        ACBrNFCe.NotasFiscais.Clear;
        Contingencia := True;
        Gerar_NFCe;
        AssinarNFCe;
        ValidarNFCe;
        if imprimir then
          ImprimirNFCe;
        GravarNFCe;
        Result := False;
      end;
    tpDados   :
      begin
        if imprimir then
          ImprimirNFCe;
        TP_Emissao := '1';
        GravarNFCe;
        Result := False;
      end;
    tpDuplicidade   :
      begin
        if imprimir then
          ImprimirNFCe;
        GravarNFCe;
//        GravarXMLNFCe;
        Result := True;
      end;
  else
    begin
      if Imprimir then
        ImprimirNFCe;
      if TP_Emissao = Emptystr then
        TP_Emissao := '1';
      if ConsultarNFCe then
      begin
        GravarNFCe;
//        GravarXMLNFCe;
      end;
      Result := True;
    end;
  end;
end;

procedure TEnvioNFCe.SetImprimir(const Value: Boolean);
begin
  FImprimir := Value;
end;

procedure TEnvioNFCe.SetRetornoMsg(const Value: String);
begin
  if Assigned(FevRetornoMsg) then
    FevRetornoMsg(Value);
end;

procedure TEnvioNFCe.SetDhRecbto(const Value: TDateTime);
begin
  FDhRecbto := Value;
end;

//procedure TEnvioNFCe.GravarXMLNFCe;
//var
//  aGravarXml : TGravarXml;
//  PathPastaMensal : string;
//begin
//  aGravarXml := TGravarXml.Create;
//  try
//    PathPastaMensal := FormatDateTime('yyyymm', DataEmissao);
//    aGravarXml.IDDocumento     := FIDCupom;
//    aGravarXml.NumeroNota      := FNumNFCe;
//    aGravarXml.Serie           := FTerminal;
//    aGravarXml.Chave           := FChave;
//    aGravarXml.Protocolo       := FProtocolo;
//    aGravarXml.DataRecebimento := FDhRecbto;
//    aGravarXml.Status          := StrToInt(FCStat);
//    aGravarXml.IDEmpresa       := StrToInt(Empresa);
//    aGravarXml.Tipo            := '2';
//    if Cancelamento then
//      aGravarXml.PathArquivoXML  := 'c:\easy2solutions\nfce\' + PathPastaMensal + '\' + '110111'+ chave + '01-procEventoNFe.xml'
//    else
//      aGravarXml.PathArquivoXML  := 'c:\easy2solutions\nfce\' + PathPastaMensal + '\' + chave + '-NFe.xml';
//    aGravarXml.Gravar_XML;
//  finally
//    aGravarXml.Free;
//  end;
//end;

function TEnvioNFCe.CancelamentoNFCe: Boolean;
begin
  ACBrNFCe.NotasFiscais.Clear;
  ACBrNFCe.EventoNFe.Evento.Clear;
  with ACBrNFCe.EventoNFe.Evento.Add do
  begin
    InfEvento.chNFe      := FChave;
    InfEvento.CNPJ       := SQLLocate('EMPRESA', 'EMPRICOD', 'EMPRA14CGC', FEmpresa);
    InfEvento.dhEvento   := Now;
    InfEvento.tpEvento   := teCancelamento;
    InfEvento.detEvento.xJust := 'Cancelamento por erro no preenchimento dos dados da nfe.';
    InfEvento.detEvento.nProt := FProtocolo;
  end;
  ACBrNFCe.EnviarEvento(1);
  if ACBrNFCe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135 then
  begin
    CStat := '101';
    Protocolo := ACBrNFCe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
    DhRecbto  := ACBrNFCe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
    GravarNFCe;
//    GravarXMLNFCe;
    Result := True;
  end
  else
  begin
    Msg := 'Cancelamento Fora do Prazo Legal';
    Result := False;
  end;
  ACBrNFCe.EventoNFe.Evento.Clear;
  ACBrNFCe.NotasFiscais.Clear;
end;

procedure TEnvioNFCe.SetCancelamento(const Value: Boolean);
begin
  FCancelamento := Value;
end;

function TEnvioNFCe.TestaStatusServidor: Boolean;
begin
  if Assigned(ACBrNFCe) then
  begin
    try
      Result := ACBrNFCe.WebServices.StatusServico.Executar;
    except
      Result := False;
    end;
  end;
end;

procedure TEnvioNFCe.SetCST_Cofins(const Value: string);
begin
  FCST_Cofins := Value;
end;

procedure TEnvioNFCe.SetCST_Pis(const Value: string);
begin
  FCST_Pis := Value;
end;

procedure TEnvioNFCe.SetValor_Total(const Value: Real);
begin
  FValor_Total := sqlCupomItem.FieldByName('VLR_TOTAL').AsFloat +
                  sqlCupomItem.FieldByName('VLR_DESCONTO').AsFloat +
                  sqlCupomItem.FieldByName('VLR_DESCONTORATEIO').AsFloat;
end;

procedure TEnvioNFCe.SetDadosAdicionais(const Value: String);
begin
  FDadosAdicionais := Value;
end;

procedure TEnvioNFCe.SetRecibo(const Value: String);
begin
  FRecibo := Value;
end;

procedure TEnvioNFCe.SetHoraEmissao(const Value: TDateTime);
begin
  FHoraEmissao := Value;
end;

procedure TEnvioNFCe.SetCPFCNPJ(const Value: String);
begin
  FCPFCNPJ := Value;
end;

procedure TEnvioNFCe.GravarLogErro(aValue : String);
var
  Caminho : String;
  Mes : String;
  Ano : String;
  Log : TextFile;
begin
  Mes := FormatFloat('00', MonthOf(FDataEmissao));
  Ano := FormatFloat('0000', YearOf(FDataEmissao));
  Caminho := ExtractFilePath(Application.ExeName) + 'LogErro';
  if not DirectoryExists(Caminho) then
  begin
    try
      CreateDir(Caminho);
    except
      Exit;
    end;
  end;
  Caminho := Caminho + '\' + Mes + '_' + Ano + '.txt';
  AssignFile(Log,Caminho);
  if not FileExists(Caminho) then
    Rewrite(Log)
  else
    Append(Log);
  Writeln(Log, 'Data: ' + FormatDateTime('dd/mm/yyyy hh:nn', now));
  Writeln(Log, 'Num Cupom: ' + FormatFloat('00000', FNumNFCe));
  Writeln(Log, 'Chave: ' + FChave);
  Writeln(Log, 'Mensage: ' + aValue);
  Writeln(Log, '--------------------------------------------------------------');
  CloseFile(Log);
end;

function TEnvioNFCe.ValidarRegraNegocio: Boolean;
var
  Erros : String;
begin
  if Assigned(ACBrNFCe) then
  begin
    Result := True;
    Msg := 'Validando Regras de Negocio NFCe Nº: ' + IntToStr(FNumNFCe);
    if ACBrNFCe.NotasFiscais.ValidarRegrasdeNegocios(Erros) then
    Erros := copy(Erros, pos('Rejeição', Erros) + 10, Length(Erros));
    begin
      if Erros <> EmptyStr then
        Msg := Erros;
      Result := False;
    end
  end;
end;

end.

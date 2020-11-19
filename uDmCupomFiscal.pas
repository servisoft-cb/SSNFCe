unit uDmCupomFiscal;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, UDMCadExtComissao, UDMGravarFinanceiro, StdConvs, StrUtils,
  Printers, logTypes, uUtilPadrao, Graphics, ACBrBarCode, frxClass, frxDBSet, frxBarcode, Windows, Messages, ACBrBase, ACBrBAL,
  ACBrDevice, Dialogs, ExtCtrls, IniFiles, ACBrValidador, Math, Controls, Variants,
  AdvPanel, Classe.CalcularRateio;

type
  TdmCupomFiscal = class(TDataModule)
    sdsCupomFiscal: TSQLDataSet;
    sdsCupomFiscalID: TIntegerField;
    sdsCupomFiscalNUMCUPOM: TIntegerField;
    sdsCupomFiscalDTEMISSAO: TDateField;
    sdsCupomFiscalHREMISSAO: TTimeField;
    sdsCupomFiscalID_CLIENTE: TIntegerField;
    sdsCupomFiscalTIPO_PGTO: TStringField;
    sdsCupomFiscalID_CONDPGTO: TIntegerField;
    sdsCupomFiscalID_VENDEDOR: TIntegerField;
    sdsCupomFiscalPERC_VENDEDOR: TFloatField;
    sdsCupomFiscalBASE_ICMS: TFloatField;
    sdsCupomFiscalVLR_ICMS: TFloatField;
    sdsCupomFiscalVLR_PRODUTOS: TFloatField;
    sdsCupomFiscalVLR_DESCONTO: TFloatField;
    sdsCupomFiscalVLR_TOTAL: TFloatField;                   
    sdsCupomFiscalCANCELADO: TStringField;
    sdsCupomFiscalVLR_RECEBIDO: TFloatField;
    sdsCupomFiscalVLR_TROCO: TFloatField;
    sdsCupomFiscalID_CONTA: TIntegerField;
    sdsCupomFiscalFILIAL: TIntegerField;
    sdsCupomFiscalID_TIPOCOBRANCA: TIntegerField;
    dspCupomFiscal: TDataSetProvider;
    cdsCupomFiscal: TClientDataSet;
    cdsCupomFiscalID: TIntegerField;
    cdsCupomFiscalNUMCUPOM: TIntegerField;
    cdsCupomFiscalDTEMISSAO: TDateField;
    cdsCupomFiscalHREMISSAO: TTimeField;
    cdsCupomFiscalID_CLIENTE: TIntegerField;
    cdsCupomFiscalTIPO_PGTO: TStringField;
    cdsCupomFiscalID_CONDPGTO: TIntegerField;
    cdsCupomFiscalID_VENDEDOR: TIntegerField;
    cdsCupomFiscalPERC_VENDEDOR: TFloatField;
    cdsCupomFiscalBASE_ICMS: TFloatField;
    cdsCupomFiscalVLR_ICMS: TFloatField;
    cdsCupomFiscalVLR_PRODUTOS: TFloatField;
    cdsCupomFiscalVLR_DESCONTO: TFloatField;
    cdsCupomFiscalVLR_TOTAL: TFloatField;
    cdsCupomFiscalCANCELADO: TStringField;
    cdsCupomFiscalVLR_RECEBIDO: TFloatField;
    cdsCupomFiscalVLR_TROCO: TFloatField;
    cdsCupomFiscalID_CONTA: TIntegerField;
    cdsCupomFiscalFILIAL: TIntegerField;
    cdsCupomFiscalID_TIPOCOBRANCA: TIntegerField;
    cdsCupomFiscalsdsCupom_Parc: TDataSetField;
    cdsCupomFiscalsdsCupom_Itens: TDataSetField;
    dsCupomFiscal: TDataSource;
    dsmCupomFiscal: TDataSource;
    sdsCupom_Itens: TSQLDataSet;
    sdsCupom_ItensID: TIntegerField;
    sdsCupom_ItensITEM: TIntegerField;
    sdsCupom_ItensID_PRODUTO: TIntegerField;
    sdsCupom_ItensQTD: TFloatField;
    sdsCupom_ItensPERC_ICMS: TFloatField;
    sdsCupom_ItensVLR_UNITARIO: TFloatField;
    sdsCupom_ItensPERC_DESCONTO: TFloatField;
    sdsCupom_ItensVLR_DESCONTO: TFloatField;
    sdsCupom_ItensBASE_ICMS: TFloatField;
    sdsCupom_ItensVLR_ICMS: TFloatField;
    sdsCupom_ItensVLR_TOTAL: TFloatField;
    sdsCupom_ItensID_CFOP: TIntegerField;
    sdsCupom_ItensID_MOVESTOQUE: TIntegerField;
    sdsCupom_ItensUNIDADE: TStringField;
    sdsCupom_ItensCANCELADO: TStringField;
    sdsCupom_ItensSITTRIB: TStringField;
    sdsCupom_ItensNOMEPRODUTO: TStringField;
    sdsCupom_ItensTAMANHO: TStringField;
    sdsCupom_ItensID_MOVIMENTO: TIntegerField;
    sdsCupom_ItensREFERENCIA: TStringField;
    cdsCupom_Itens: TClientDataSet;
    cdsCupom_ItensID: TIntegerField;
    cdsCupom_ItensITEM: TIntegerField;
    cdsCupom_ItensID_PRODUTO: TIntegerField;
    cdsCupom_ItensQTD: TFloatField;
    cdsCupom_ItensPERC_ICMS: TFloatField;
    cdsCupom_ItensVLR_UNITARIO: TFloatField;
    cdsCupom_ItensPERC_DESCONTO: TFloatField;
    cdsCupom_ItensVLR_DESCONTO: TFloatField;
    cdsCupom_ItensBASE_ICMS: TFloatField;
    cdsCupom_ItensVLR_ICMS: TFloatField;
    cdsCupom_ItensVLR_TOTAL: TFloatField;
    cdsCupom_ItensID_CFOP: TIntegerField;
    cdsCupom_ItensID_MOVESTOQUE: TIntegerField;
    cdsCupom_ItensUNIDADE: TStringField;
    cdsCupom_ItensCANCELADO: TStringField;
    cdsCupom_ItensSITTRIB: TStringField;
    cdsCupom_ItensNOMEPRODUTO: TStringField;
    cdsCupom_ItensTAMANHO: TStringField;
    cdsCupom_ItensID_MOVIMENTO: TIntegerField;
    cdsCupom_ItensREFERENCIA: TStringField;
    dsCupom_Itens: TDataSource;
    sdsCupom_Parc: TSQLDataSet;
    sdsCupom_ParcID: TIntegerField;
    sdsCupom_ParcPARCELA: TIntegerField;
    sdsCupom_ParcDTVENCIMENTO: TDateField;
    sdsCupom_ParcVLR_VENCIMENTO: TFloatField;
    cdsCupom_Parc: TClientDataSet;
    cdsCupom_ParcID: TIntegerField;
    cdsCupom_ParcPARCELA: TIntegerField;
    cdsCupom_ParcDTVENCIMENTO: TDateField;
    cdsCupom_ParcVLR_VENCIMENTO: TFloatField;
    dsCupom_Parc: TDataSource;
    sdsCupom_Cons: TSQLDataSet;
    dspCupom_Cons: TDataSetProvider;
    cdsCupom_Cons: TClientDataSet;
    dsCupom_Cons: TDataSource;
    cdsCupom_ConsID: TIntegerField;
    cdsCupom_ConsNUMCUPOM: TIntegerField;
    cdsCupom_ConsDTEMISSAO: TDateField;
    cdsCupom_ConsVLR_TOTAL: TFloatField;
    cdsCupom_ConsCANCELADO: TStringField;
    cdsCupom_ConsFILIAL: TIntegerField;
    sdsPessoa: TSQLDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    dsPessoa: TDataSource;
    cdsPessoaCODIGO: TIntegerField;
    cdsPessoaNOME: TStringField;
    sdsParametros: TSQLDataSet;
    dspParametros: TDataSetProvider;
    cdsParametros: TClientDataSet;
    cdsParametrosID: TIntegerField;
    cdsParametrosID_CLIENTE_CONSUMIDOR: TIntegerField;
    cdsParametrosIMPRESSORA_FISCAL: TStringField;
    sdsProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    cdsProdutoID: TIntegerField;
    cdsProdutoREFERENCIA: TStringField;
    cdsProdutoNOME: TStringField;
    cdsProdutoINATIVO: TStringField;
    cdsProdutoID_CSTIPI: TIntegerField;
    cdsProdutoPERC_IPI: TFloatField;
    cdsProdutoPRECO_CUSTO: TFloatField;
    cdsProdutoPRECO_VENDA: TFloatField;
    cdsProdutoTIPO_REG: TStringField;
    cdsProdutoESTOQUE: TStringField;
    cdsProdutoMATERIAL_OUTROS: TStringField;
    cdsProdutoCOMPLEMENTO: TStringField;
    cdsProdutoID_NCM: TIntegerField;
    cdsProdutoOBS: TMemoField;
    cdsProdutoCODSITCF: TStringField;
    cdsProdutoTIPO_VENDA: TStringField;
    cdsProdutoUNIDADE: TStringField;
    cdsProdutoID_GRUPO: TIntegerField;
    cdsProdutoID_SUBGRUPO: TIntegerField;
    cdsProdutoID_MARCA: TIntegerField;
    cdsProdutoCOD_BARRA: TStringField;
    cdsProdutoCOD_ANT: TStringField;
    dsProduto: TDataSource;
    cdsPessoaENDERECO: TStringField;
    cdsPessoaNUM_END: TStringField;
    cdsPessoaCNPJ_CPF: TStringField;
    sdsCondPgto: TSQLDataSet;
    dspCondPgto: TDataSetProvider;
    cdsCondPgto: TClientDataSet;
    cdsCondPgtoID: TIntegerField;
    cdsCondPgtoNOME: TStringField;
    cdsCondPgtoTIPO: TStringField;
    cdsCondPgtosdsCondPgto_Dia: TDataSetField;
    dsCondPgto: TDataSource;
    sdsCondPgto_Dia: TSQLDataSet;
    sdsCondPgto_DiaID: TIntegerField;
    sdsCondPgto_DiaITEM: TIntegerField;
    sdsCondPgto_DiaQTDDIAS: TIntegerField;
    cdsCondPgto_Dia: TClientDataSet;
    cdsCondPgto_DiaID: TIntegerField;
    cdsCondPgto_DiaITEM: TIntegerField;
    cdsCondPgto_DiaQTDDIAS: TIntegerField;
    dsCondPgto_Dia: TDataSource;
    dsmCondPgto: TDataSource;
    sdsContas: TSQLDataSet;
    dspContas: TDataSetProvider;
    cdsContas: TClientDataSet;
    cdsContasID: TIntegerField;
    cdsContasNOME: TStringField;
    dsContas: TDataSource;
    sdsEstoqueMov: TSQLDataSet;
    dspEstoqueMov: TDataSetProvider;
    cdsEstoqueMov: TClientDataSet;
    cdsEstoqueMovID: TIntegerField;
    cdsEstoqueMovFILIAL: TIntegerField;
    cdsEstoqueMovID_PRODUTO: TIntegerField;
    cdsEstoqueMovID_COR: TIntegerField;
    cdsEstoqueMovDTMOVIMENTO: TDateField;
    cdsEstoqueMovTIPO_ES: TStringField;
    cdsEstoqueMovTIPO_MOV: TStringField;
    cdsEstoqueMovNUMNOTA: TIntegerField;
    cdsEstoqueMovID_PESSOA: TIntegerField;
    cdsEstoqueMovVLR_UNITARIO: TFloatField;
    cdsEstoqueMovQTD: TFloatField;
    cdsEstoqueMovPERC_ICMS: TFloatField;
    cdsEstoqueMovPERC_IPI: TFloatField;
    cdsEstoqueMovVLR_DESCONTO: TFloatField;
    cdsEstoqueMovUNIDADE: TStringField;
    cdsEstoqueMovQTD2: TFloatField;
    cdsEstoqueMovTAMANHO: TStringField;
    cdsEstoqueMovPERC_TRIBUTACAO: TFloatField;
    cdsEstoqueMovVLR_FRETE: TFloatField;
    cdsEstoqueMovID_CFOP: TIntegerField;
    cdsEstoqueMovID_NOTA: TIntegerField;
    cdsEstoqueMovSERIE: TStringField;
    cdsEstoqueMovUNIDADE_ORIG: TStringField;
    cdsEstoqueMovVLR_UNITARIOORIG: TFloatField;
    cdsEstoqueMovQTD_ORIG: TFloatField;
    cdsEstoqueMovVLR_DESCONTOORIG: TFloatField;
    cdsEstoqueMovMERCADO: TStringField;
    dsEstoqueMov: TDataSource;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    cdsFilialENDERECO: TStringField;
    cdsFilialCOMPLEMENTO_END: TStringField;
    cdsFilialNUM_END: TStringField;
    cdsFilialBAIRRO: TStringField;
    cdsFilialCEP: TStringField;
    cdsFilialID_CIDADE: TIntegerField;
    cdsFilialCIDADE: TStringField;
    cdsFilialUF: TStringField;
    cdsFilialDDD1: TIntegerField;
    cdsFilialFONE1: TStringField;
    cdsFilialDDD2: TIntegerField;
    cdsFilialFONE: TStringField;
    cdsFilialDDDFAX: TIntegerField;
    cdsFilialFAX: TStringField;
    cdsFilialPESSOA: TStringField;
    cdsFilialCNPJ_CPF: TStringField;
    cdsFilialINSCR_EST: TStringField;
    cdsFilialSIMPLES: TStringField;
    cdsFilialENDLOGO: TStringField;
    cdsFilialCALCULAR_IPI: TStringField;
    cdsFilialINATIVO: TStringField;
    cdsFilialINSCMUNICIPAL: TStringField;
    cdsFilialCNAE: TStringField;
    cdsFilialHOMEPAGE: TStringField;
    cdsFilialID_REGIME_TRIB: TIntegerField;
    cdsFilialID_PIS: TIntegerField;
    cdsFilialID_COFINS: TIntegerField;
    cdsFilialTIPO_PIS: TStringField;
    cdsFilialTIPO_COFINS: TStringField;
    cdsFilialPERC_PIS: TFloatField;
    cdsFilialPERC_COFINS: TFloatField;
    cdsFilialID_CSTICMS: TIntegerField;
    cdsFilialID_CSTIPI: TIntegerField;
    cdsFilialEMAIL_NFE: TStringField;
    cdsFilialDTESTOQUE: TDateField;
    qUltimo: TSQLQuery;
    qUltimoULT: TIntegerField;
    sdsTipoCobranca: TSQLDataSet;
    dspTipoCobranca: TDataSetProvider;
    cdsTipoCobranca: TClientDataSet;
    dsTipoCobranca: TDataSource;
    cdsTipoCobrancaID: TIntegerField;
    cdsTipoCobrancaNOME: TStringField;
    cdsTipoCobrancaMOSTRARNOCUPOM: TStringField;
    sdsCupomParametros: TSQLDataSet;
    dspCupomParametros: TDataSetProvider;
    cdsCupomParametros: TClientDataSet;
    cdsCupomParametrosID: TIntegerField;
    cdsCupomParametrosUSA_IPI: TStringField;
    sdsSitTribCF: TSQLDataSet;
    dspSitTribCF: TDataSetProvider;
    cdsSitTribCF: TClientDataSet;
    dsSitTribCF: TDataSource;
    sdsSitTribCFID: TIntegerField;
    sdsSitTribCFCODIGO: TStringField;
    sdsSitTribCFPERCENTUAL: TFloatField;
    cdsSitTribCFID: TIntegerField;
    cdsSitTribCFCODIGO: TStringField;
    cdsSitTribCFPERCENTUAL: TFloatField;
    cdsCupomParametrosSIT_TRIB_ID: TIntegerField;
    cdsCupomParametrosUSA_DESCONTO: TStringField;
    sdsDuplicata: TSQLDataSet;
    sdsDuplicataID: TIntegerField;
    sdsDuplicataTIPO_ES: TStringField;
    sdsDuplicataFILIAL: TIntegerField;
    sdsDuplicataID_NOTA: TIntegerField;
    sdsDuplicataPARCELA: TIntegerField;
    sdsDuplicataNUMDUPLICATA: TStringField;
    sdsDuplicataNUMNOTA: TIntegerField;
    sdsDuplicataSERIE: TStringField;
    sdsDuplicataDTVENCIMENTO: TDateField;
    sdsDuplicataVLR_PARCELA: TFloatField;
    sdsDuplicataVLR_RESTANTE: TFloatField;
    sdsDuplicataVLR_PAGO: TFloatField;
    sdsDuplicataVLR_DEVOLUCAO: TFloatField;
    sdsDuplicataVLR_DESPESAS: TFloatField;
    sdsDuplicataVLR_DESCONTO: TFloatField;
    sdsDuplicataVLR_JUROSPAGOS: TFloatField;
    sdsDuplicataVLR_COMISSAO: TFloatField;
    sdsDuplicataPERC_COMISSAO: TFloatField;
    sdsDuplicataDTULTPAGAMENTO: TDateField;
    sdsDuplicataID_PESSOA: TIntegerField;
    sdsDuplicataID_CONTA: TIntegerField;
    sdsDuplicataID_TIPOCOBRANCA: TIntegerField;
    sdsDuplicataID_VENDEDOR: TIntegerField;
    sdsDuplicataID_CONTA_BOLETO: TIntegerField;
    sdsDuplicataID_COMISSAO: TIntegerField;
    sdsDuplicataDTRECEBIMENTO_TITULO: TDateField;
    sdsDuplicataDTEMISSAO: TDateField;
    sdsDuplicataTIPO_LANCAMENTO: TStringField;
    sdsDuplicataDTFINANCEIRO: TDateField;
    sdsDuplicataID_CARTEIRA: TIntegerField;
    sdsDuplicataID_BANCO: TIntegerField;
    sdsDuplicataID_CONTA_ORCAMENTO: TIntegerField;
    dspDuplicata: TDataSetProvider;
    cdsDuplicata: TClientDataSet;
    cdsDuplicataID: TIntegerField;
    cdsDuplicataTIPO_ES: TStringField;
    cdsDuplicataFILIAL: TIntegerField;
    cdsDuplicataID_NOTA: TIntegerField;
    cdsDuplicataPARCELA: TIntegerField;
    cdsDuplicataNUMDUPLICATA: TStringField;
    cdsDuplicataNUMNOTA: TIntegerField;
    cdsDuplicataSERIE: TStringField;
    cdsDuplicataDTVENCIMENTO: TDateField;
    cdsDuplicataVLR_PARCELA: TFloatField;
    cdsDuplicataVLR_RESTANTE: TFloatField;
    cdsDuplicataVLR_PAGO: TFloatField;
    cdsDuplicataVLR_DEVOLUCAO: TFloatField;
    cdsDuplicataVLR_DESPESAS: TFloatField;
    cdsDuplicataVLR_DESCONTO: TFloatField;
    cdsDuplicataVLR_JUROSPAGOS: TFloatField;
    cdsDuplicataVLR_COMISSAO: TFloatField;
    cdsDuplicataPERC_COMISSAO: TFloatField;
    cdsDuplicataDTULTPAGAMENTO: TDateField;
    cdsDuplicataID_PESSOA: TIntegerField;
    cdsDuplicataID_CONTA: TIntegerField;
    cdsDuplicataID_TIPOCOBRANCA: TIntegerField;
    cdsDuplicataID_VENDEDOR: TIntegerField;
    cdsDuplicataID_CONTA_BOLETO: TIntegerField;
    cdsDuplicataID_COMISSAO: TIntegerField;
    cdsDuplicataDTRECEBIMENTO_TITULO: TDateField;
    cdsDuplicataDTEMISSAO: TDateField;
    cdsDuplicataTIPO_LANCAMENTO: TStringField;
    cdsDuplicataDTFINANCEIRO: TDateField;
    cdsDuplicatasdsDuplicata_Hist: TDataSetField;
    cdsDuplicataID_CARTEIRA: TIntegerField;
    cdsDuplicataID_BANCO: TIntegerField;
    cdsDuplicataID_CONTA_ORCAMENTO: TIntegerField;
    dsDuplicata_Mestre: TDataSource;
    sdsDuplicata_Hist: TSQLDataSet;
    sdsDuplicata_HistID: TIntegerField;
    sdsDuplicata_HistITEM: TIntegerField;
    sdsDuplicata_HistID_HISTORICO: TIntegerField;
    sdsDuplicata_HistCOMPLEMENTO: TStringField;
    sdsDuplicata_HistVLR_PAGAMENTO: TFloatField;
    sdsDuplicata_HistVLR_JUROSPAGOS: TFloatField;
    sdsDuplicata_HistVLR_DESCONTOS: TFloatField;
    sdsDuplicata_HistVLR_DESPESAS: TFloatField;
    sdsDuplicata_HistVLR_DEVOLUCAO: TFloatField;
    sdsDuplicata_HistVLR_JUROSCALCULADO: TFloatField;
    sdsDuplicata_HistNUMCHEQUE: TIntegerField;
    sdsDuplicata_HistDTPREVISAO_CHEQUE: TDateField;
    sdsDuplicata_HistID_CONTA: TIntegerField;
    sdsDuplicata_HistID_COMISSAO: TIntegerField;
    sdsDuplicata_HistTIPO_ES: TStringField;
    sdsDuplicata_HistTIPO_HISTORICO: TStringField;
    sdsDuplicata_HistDTHISTORICO: TDateField;
    sdsDuplicata_HistDTLANCAMENTO: TDateField;
    sdsDuplicata_HistVLR_LANCAMENTO: TFloatField;
    sdsDuplicata_HistID_FORMA_PAGAMENTO: TIntegerField;
    cdsDuplicata_Hist: TClientDataSet;
    cdsDuplicata_HistID: TIntegerField;
    cdsDuplicata_HistITEM: TIntegerField;
    cdsDuplicata_HistID_HISTORICO: TIntegerField;
    cdsDuplicata_HistCOMPLEMENTO: TStringField;
    cdsDuplicata_HistVLR_PAGAMENTO: TFloatField;
    cdsDuplicata_HistVLR_JUROSPAGOS: TFloatField;
    cdsDuplicata_HistVLR_DESCONTOS: TFloatField;
    cdsDuplicata_HistVLR_DESPESAS: TFloatField;
    cdsDuplicata_HistVLR_DEVOLUCAO: TFloatField;
    cdsDuplicata_HistVLR_JUROSCALCULADO: TFloatField;
    cdsDuplicata_HistNUMCHEQUE: TIntegerField;
    cdsDuplicata_HistDTPREVISAO_CHEQUE: TDateField;
    cdsDuplicata_HistID_CONTA: TIntegerField;
    cdsDuplicata_HistID_COMISSAO: TIntegerField;
    cdsDuplicata_HistTIPO_ES: TStringField;
    cdsDuplicata_HistTIPO_HISTORICO: TStringField;
    cdsDuplicata_HistDTHISTORICO: TDateField;
    cdsDuplicata_HistDTLANCAMENTO: TDateField;
    cdsDuplicata_HistVLR_LANCAMENTO: TFloatField;
    cdsDuplicata_HistID_FORMA_PAGAMENTO: TIntegerField;
    sdsDuplicataID_CUPOM: TIntegerField;
    cdsDuplicataID_CUPOM: TIntegerField;
    dsCupomParametros: TDataSource;
    cdsParametrosQUITAR_AVISTA_AUT: TStringField;
    sdsVendedor: TSQLDataSet;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    cdsVendedorCODIGO: TIntegerField;
    cdsVendedorNOME: TStringField;
    cdsVendedorPERC_COMISSAO: TFloatField;
    cdsVendedorTIPO_COMISSAO: TStringField;
    cdsVendedorPERC_COMISSAO_VEND: TFloatField;
    dsVendedor: TDataSource;
    cdsPessoaCLIENTE_CONTA_ID: TIntegerField;
    dsParametros: TDataSource;
    cdsPessoaPESSOA: TStringField;
    cdsCupomParametrosQTD_MULTIPLICADOR: TSmallintField;
    cdsCupomParametrosACBR_MODELO: TStringField;
    sdsCupomFiscalTIPO: TStringField;
    cdsCupomFiscalTIPO: TStringField;
    cdsCupomParametrosEXIGE_CAIXA_ABERTO: TStringField;
    sdsCupomFiscalTERMINAL_ID: TSmallintField;
    cdsCupomFiscalTERMINAL_ID: TSmallintField;
    sdsCupomFiscalCONDPGTO: TStringField;
    sdsCupomFiscalFORMAPGTO: TStringField;
    cdsCupomFiscalCONDPGTO: TStringField;
    cdsCupomFiscalFORMAPGTO: TStringField;
    sdsDuplicataID_TERMINAL: TIntegerField;
    sdsDuplicataID_FECHAMENTO: TIntegerField;
    cdsDuplicataID_TERMINAL: TIntegerField;
    cdsDuplicataID_FECHAMENTO: TIntegerField;
    sdsDuplicataQTD_DIASATRASO: TIntegerField;
    sdsDuplicataPAGO_CARTORIO: TStringField;
    sdsDuplicataPROTESTADO: TStringField;
    sdsDuplicataARQUIVO_GERADO: TStringField;
    sdsDuplicataTRANSFERENCIA_ICMS: TStringField;
    sdsDuplicataNOSSONUMERO: TStringField;
    sdsDuplicataNUMCHEQUE: TIntegerField;
    sdsDuplicataACEITE: TStringField;
    cdsDuplicataQTD_DIASATRASO: TIntegerField;
    cdsDuplicataPAGO_CARTORIO: TStringField;
    cdsDuplicataPROTESTADO: TStringField;
    cdsDuplicataARQUIVO_GERADO: TStringField;
    cdsDuplicataTRANSFERENCIA_ICMS: TStringField;
    cdsDuplicataNOSSONUMERO: TStringField;
    cdsDuplicataNUMCHEQUE: TIntegerField;
    cdsDuplicataACEITE: TStringField;
    sdsCupom_ParcID_TIPOCOBRANCA: TIntegerField;
    cdsCupom_ParcID_TIPOCOBRANCA: TIntegerField;
    sdsCupom_ParcTIPO_COBRANCA: TStringField;
    cdsCupom_ParcTIPO_COBRANCA: TStringField;
    cdsProdutoNCM_EX: TStringField;
    cdsProdutoID_SITTRIB_CF: TIntegerField;
    sdsCupom_ItensPERC_TRIBUTO: TFloatField;
    sdsCupom_ItensVLR_TRIBUTO: TFloatField;
    cdsCupom_ItensPERC_TRIBUTO: TFloatField;
    cdsCupom_ItensVLR_TRIBUTO: TFloatField;
    qIBPT: TSQLQuery;
    qIBPTPERC_NACIONAL: TFloatField;
    qIBPTPERC_IMPORTACAO: TFloatField;
    qIBPTNCM: TStringField;
    qIBPTID: TIntegerField;
    sdsCupom_ItensID_NCM: TIntegerField;
    cdsCupom_ItensID_NCM: TIntegerField;
    sdsCupom_ItensORIGEM_PROD: TStringField;
    cdsCupom_ItensORIGEM_PROD: TStringField;
    cdsProdutoORIGEM_PROD: TStringField;
    sdsCupomFiscalVLR_TRIBUTO: TFloatField;
    cdsCupomFiscalVLR_TRIBUTO: TFloatField;
    cdsParametrosARREDONDAR_5: TStringField;
    cdsTipoCobrancaCOD_IMP_FISCAL: TStringField;
    sdsCupomTerminal: TSQLDataSet;
    sdsCupomTerminalID: TSmallintField;
    sdsCupomTerminalNOME: TStringField;
    dspCupomTerminal: TDataSetProvider;
    cdsCupomTerminal: TClientDataSet;
    cdsCupomTerminalID: TSmallintField;
    cdsCupomTerminalNOME: TStringField;
    dsCupomTerminal: TDataSource;
    cdsCupomParametrosTERMINAL_ID: TSmallintField;
    cdsParametrosID_CONTA_FECHAMENTO: TIntegerField;
    cdsCupom_ConsCPF: TStringField;
    sdsCupomParametrosID: TIntegerField;
    sdsCupomParametrosTERMINAL_ID: TSmallintField;
    sdsCupomParametrosUSA_IPI: TStringField;
    sdsCupomParametrosSIT_TRIB_ID: TIntegerField;
    sdsCupomParametrosUSA_DESCONTO: TStringField;
    sdsCupomParametrosQTD_MULTIPLICADOR: TSmallintField;
    sdsCupomParametrosACBR_MODELO: TStringField;
    sdsCupomParametrosEXIGE_CAIXA_ABERTO: TStringField;
    sdsCupomParametrosCASAS_DECIMAIS: TSmallintField;
    sdsCupomParametrosPRIMEIRO_CAMPO: TSmallintField;
    sdsCupomParametrosPRODUTO_PADRAO: TIntegerField;
    cdsCupomParametrosCASAS_DECIMAIS: TSmallintField;
    cdsCupomParametrosPRIMEIRO_CAMPO: TSmallintField;
    cdsCupomParametrosPRODUTO_PADRAO: TIntegerField;
    sdsCupomParametrosQTD_PADRAO: TFMTBCDField;
    cdsCupomParametrosQTD_PADRAO: TFMTBCDField;
    cdsCupom_ConsID_TIPOCOBRANCA: TIntegerField;
    sdsComandaRel: TSQLDataSet;
    dspComandaRel: TDataSetProvider;
    cdsComandaRel: TClientDataSet;
    dsComandaRel: TDataSource;
    cdsComandaRelID: TIntegerField;
    cdsComandaRelNUMCUPOM: TIntegerField;
    cdsComandaRelDTEMISSAO: TDateField;
    cdsComandaRelFILIAL_NOME: TStringField;
    cdsComandaRelFILIAL_END: TStringField;
    cdsComandaRelFILIAL_FONE: TStringField;
    cdsComandaRelHOMEPAGE: TStringField;
    cdsComandaRelEMAIL: TStringField;
    sdsComandaItem_Rel: TSQLDataSet;
    cdsComandaItem_Rel: TClientDataSet;
    dsComandaItem_Rel: TDataSource;
    cdsComandaItem_RelQTD: TFloatField;
    cdsComandaItem_RelPRODUTO_NOME: TStringField;
    cdsComandaItem_RelVLR_TOTAL: TFloatField;
    cdsComandaRelFILIAL_CIDADE_BAIRRO: TStringField;
    sdsCupomParametrosUSA_BALANCA: TStringField;
    cdsCupomParametrosUSA_BALANCA: TStringField;
    qIBPTPERC_ESTADUAL: TFloatField;
    qIBPTPERC_MUNICIPAL: TFloatField;
    qIBPTFONTE: TStringField;
    qIBPTVERSAO: TStringField;
    cdsParametrosTIPO_LEI_TRANSPARENCIA: TStringField;
    sdsCupom_ItensPERC_TRIBUTO_ESTADUAL: TFloatField;
    sdsCupom_ItensPERC_TRIBUTO_MUNICIPAL: TFloatField;
    sdsCupom_ItensPERC_TRIBUTO_FEDERAL: TFloatField;
    sdsCupom_ItensFONTE_TRIBUTO: TStringField;
    sdsCupom_ItensVERSAO_TRIBUTO: TStringField;
    sdsCupom_ItensVLR_TRIBUTO_FEDERAL: TFloatField;
    sdsCupom_ItensVLR_TRIBUTO_ESTADUAL: TFloatField;
    sdsCupom_ItensVLR_TRIBUTO_MUNICIPAL: TFloatField;
    cdsCupom_ItensPERC_TRIBUTO_ESTADUAL: TFloatField;
    cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL: TFloatField;
    cdsCupom_ItensPERC_TRIBUTO_FEDERAL: TFloatField;
    cdsCupom_ItensFONTE_TRIBUTO: TStringField;
    cdsCupom_ItensVERSAO_TRIBUTO: TStringField;
    cdsCupom_ItensVLR_TRIBUTO_FEDERAL: TFloatField;
    cdsCupom_ItensVLR_TRIBUTO_ESTADUAL: TFloatField;
    cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL: TFloatField;
    sdsCupomFiscalVLR_TRIBUTO_FEDERAL: TFloatField;
    sdsCupomFiscalVLR_TRIBUTO_ESTADUAL: TFloatField;
    sdsCupomFiscalVLR_TRIBUTO_MUNICIPAL: TFloatField;
    cdsCupomFiscalVLR_TRIBUTO_FEDERAL: TFloatField;
    cdsCupomFiscalVLR_TRIBUTO_ESTADUAL: TFloatField;
    cdsCupomFiscalVLR_TRIBUTO_MUNICIPAL: TFloatField;
    sdsCupomFiscalNUM_CARTAO: TSmallintField;
    cdsCupomFiscalNUM_CARTAO: TSmallintField;
    sdsCupomFiscalNOME_CLIENTE_1: TStringField;
    cdsCupomFiscalNOME_CLIENTE_1: TStringField;
    cdsCupom_ConsNUM_CARTAO: TSmallintField;
    mCupomItens: TClientDataSet;
    dsmCupomItens: TDataSource;
    mCupomItensNOME_PRODUTO: TStringField;
    mCupomItensQTD: TFloatField;
    mCupomItensVLR_UNIT: TFloatField;
    mCupomItensVLR_TOTAL: TFloatField;
    mCupom: TClientDataSet;
    dsmCupom: TDataSource;
    mCupomCARTAO: TIntegerField;
    mCupomID_CUPOM: TIntegerField;
    mCupomVLR_TOTAL: TFloatField;
    sdsCupomFiscalNFEAMBIENTE: TStringField;
    sdsCupomFiscalNFECHAVEACESSO: TStringField;
    sdsCupomFiscalNFEPROTOCOLO: TStringField;
    sdsCupomFiscalNFERECIBO: TStringField;
    sdsCupomFiscalNFEVERSAO: TStringField;
    sdsCupomFiscalTIPO_ATENDIMENTO: TSmallintField;
    sdsCupomFiscalTIPO_IMPRESSAO_NFCE: TSmallintField;
    cdsCupomFiscalNFEAMBIENTE: TStringField;
    cdsCupomFiscalNFECHAVEACESSO: TStringField;
    cdsCupomFiscalNFEPROTOCOLO: TStringField;
    cdsCupomFiscalNFERECIBO: TStringField;
    cdsCupomFiscalNFEVERSAO: TStringField;
    cdsCupomFiscalTIPO_ATENDIMENTO: TSmallintField;
    cdsCupomFiscalTIPO_IMPRESSAO_NFCE: TSmallintField;
    sdsCupomFiscalNFEPROTOCOLO_CANCELADA: TStringField;
    cdsCupomFiscalNFEPROTOCOLO_CANCELADA: TStringField;
    sdsCupomFiscalID_CFOP: TIntegerField;
    cdsCupomFiscalID_CFOP: TIntegerField;
    sdsCFOP: TSQLDataSet;
    dspCFOP: TDataSetProvider;
    cdsCFOP: TClientDataSet;
    cdsCFOPID: TIntegerField;
    cdsCFOPCODCFOP: TStringField;
    cdsCFOPNOME: TStringField;
    cdsCFOPNOME_INTERNO: TStringField;
    cdsCFOPGERAR_IPI: TStringField;
    cdsCFOPGERAR_ICMS: TStringField;
    cdsCFOPGERAR_DUPLICATA: TStringField;
    cdsCFOPGERAR_ICMS_SIMPLES: TStringField;
    cdsCFOPGERAR_TRIBUTO: TStringField;
    cdsCFOPGERAR_ESTOQUE_MP: TStringField;
    cdsCFOPSOMAR_VLRTOTALPRODUTO: TStringField;
    cdsCFOPID_CSTICMS: TIntegerField;
    cdsCFOPID_CSTIPI: TIntegerField;
    cdsCFOPID_PIS: TIntegerField;
    cdsCFOPID_COFINS: TIntegerField;
    cdsCFOPID_OBS_LEI: TIntegerField;
    cdsCFOPCOPIARNOTATRIANGULAR: TStringField;
    cdsCFOPTIPO_PIS: TStringField;
    cdsCFOPTIPO_COFINS: TStringField;
    cdsCFOPTIPO_EMPRESA: TStringField;
    cdsCFOPTIPO_IND_VEN: TStringField;
    cdsCFOPSUBSTITUICAO_TRIB: TStringField;
    cdsCFOPMVA: TStringField;
    cdsCFOPBENEFICIAMENTO: TStringField;
    cdsCFOPMAOOBRA: TStringField;
    cdsCFOPPERC_TRIBUTO: TFloatField;
    cdsCFOPPERC_COFINS: TFloatField;
    cdsCFOPPERC_PIS: TFloatField;
    cdsCFOPENTRADASAIDA: TStringField;
    cdsCFOPGERAR_DESONERACAO_ICMS: TStringField;
    cdsCFOPGERAR_ESTOQUE: TStringField;
    cdsCFOPBAIXAR_FUT: TStringField;
    dsCFOP: TDataSource;
    cdsFilialID_CFOP_NFCE_PADRAO: TIntegerField;
    cdsFilialUSA_NFCE: TStringField;
    cdsProdutoID_CFOP_NFCE: TIntegerField;
    sdsCupom_ItensID_CSTICMS: TIntegerField;
    sdsCupom_ItensID_CSTIPI: TIntegerField;
    sdsCupom_ItensID_COFINS: TIntegerField;
    sdsCupom_ItensID_PIS: TIntegerField;
    sdsCupom_ItensPERC_TRIBICMS: TFloatField;
    cdsCupom_ItensID_CSTICMS: TIntegerField;
    cdsCupom_ItensID_CSTIPI: TIntegerField;
    cdsCupom_ItensID_COFINS: TIntegerField;
    cdsCupom_ItensID_PIS: TIntegerField;
    cdsCupom_ItensPERC_TRIBICMS: TFloatField;
    qRegra_CFOP: TSQLQuery;
    qRegra_CFOPID: TIntegerField;
    qRegra_CFOPITEM: TIntegerField;
    qRegra_CFOPID_CSTICMS: TIntegerField;
    qRegra_CFOPID_CSTIPI: TIntegerField;
    qRegra_CFOPID_PIS: TIntegerField;
    qRegra_CFOPID_COFINS: TIntegerField;
    qRegra_CFOPID_OPERACAO_NOTA: TIntegerField;
    qRegra_CFOPTIPO_EMPRESA: TStringField;
    qRegra_CFOPTIPO_CLIENTE: TStringField;
    qRegra_CFOPUF_CLIENTE: TStringField;
    qRegra_CFOPFINALIDADE: TStringField;
    qRegra_CFOPCONTROLAR_ICMS: TStringField;
    qRegra_CFOPCONTROLAR_REDUCAO: TStringField;
    qRegra_CFOPCONTROLAR_IPI: TStringField;
    qRegra_CFOPCONTROLAR_SUBSTICMS: TStringField;
    qRegra_CFOPCONTROLAR_DIFERIMENTO: TStringField;
    qRegra_CFOPNOME: TStringField;
    qRegra_CFOPPESSOA_CLIENTE: TStringField;
    qRegra_CFOPLEI: TMemoField;
    qRegra_CFOPPERC_TRIBUTO: TFloatField;
    qRegra_CFOPPERC_PIS: TFloatField;
    qRegra_CFOPPERC_COFINS: TFloatField;
    qRegra_CFOPTIPO_PIS: TStringField;
    qRegra_CFOPTIPO_COFINS: TStringField;
    qRegra_CFOPID_OBS_LEI: TIntegerField;
    sdsCupom_ItensID_VARIACAO: TIntegerField;
    cdsCupom_ItensID_VARIACAO: TIntegerField;
    mCupomItensID_PRODUTO: TIntegerField;
    qVariacao: TSQLQuery;
    qVariacaoID: TIntegerField;
    qVariacaoITEM: TIntegerField;
    qVariacaoID_CSTICMS: TIntegerField;
    qVariacaoID_CSTIPI: TIntegerField;
    qVariacaoID_PIS: TIntegerField;
    qVariacaoID_COFINS: TIntegerField;
    qVariacaoID_OPERACAO_NOTA: TIntegerField;
    qVariacaoTIPO_EMPRESA: TStringField;
    qVariacaoTIPO_CLIENTE: TStringField;
    qVariacaoUF_CLIENTE: TStringField;
    qVariacaoFINALIDADE: TStringField;
    qVariacaoCONTROLAR_ICMS: TStringField;
    qVariacaoCONTROLAR_REDUCAO: TStringField;
    qVariacaoCONTROLAR_IPI: TStringField;
    qVariacaoCONTROLAR_SUBSTICMS: TStringField;
    qVariacaoCONTROLAR_DIFERIMENTO: TStringField;
    qVariacaoNOME: TStringField;
    qVariacaoPESSOA_CLIENTE: TStringField;
    qVariacaoLEI: TMemoField;
    qVariacaoPERC_TRIBUTO: TFloatField;
    qVariacaoPERC_PIS: TFloatField;
    qVariacaoPERC_COFINS: TFloatField;
    qVariacaoTIPO_PIS: TStringField;
    qVariacaoTIPO_COFINS: TStringField;
    qVariacaoID_OBS_LEI: TIntegerField;
    mCupomItensCARTAO: TIntegerField;
    qUF: TSQLQuery;
    qUFUF: TStringField;
    qUFPERC_ICMS: TFloatField;
    qUFIDPAIS: TIntegerField;
    qUFCODUF: TStringField;
    qUFPERC_ICMS_INTERNO: TFloatField;
    sdsTab_CSTICMS: TSQLDataSet;
    dspTab_CSTICMS: TDataSetProvider;
    cdsTab_CSTICMS: TClientDataSet;
    cdsTab_CSTICMSID: TIntegerField;
    cdsTab_CSTICMSPERCENTUAL: TFloatField;
    cdsTab_CSTICMSHISTORICO: TMemoField;
    cdsTab_CSTICMSTIPO: TStringField;
    cdsTab_CSTICMSNOME: TStringField;
    cdsTab_CSTICMSCOD_CST: TStringField;
    cdsTab_CSTICMSCOD_DESONERACAO: TSmallintField;
    dsTab_CSTICMS: TDataSource;
    dsTab_CSTIPI: TDataSource;
    cdsTab_CSTIPI: TClientDataSet;
    cdsTab_CSTIPIID: TIntegerField;
    cdsTab_CSTIPICOD_IPI: TStringField;
    cdsTab_CSTIPINOME: TStringField;
    cdsTab_CSTIPIGERAR_IPI: TStringField;
    dspTab_CSTIPI: TDataSetProvider;
    sdsTab_CSTIPI: TSQLDataSet;
    sdsTab_Pis: TSQLDataSet;
    dspTab_Pis: TDataSetProvider;
    dspTab_Cofins: TDataSetProvider;
    sdsTab_Cofins: TSQLDataSet;
    cdsTab_Cofins: TClientDataSet;
    cdsTab_CofinsID: TIntegerField;
    cdsTab_CofinsCODIGO: TStringField;
    cdsTab_CofinsNOME: TStringField;
    cdsTab_CofinsGERAR: TStringField;
    dsTab_Cofins: TDataSource;
    dsTab_Pis: TDataSource;
    cdsTab_Pis: TClientDataSet;
    cdsTab_PisID: TIntegerField;
    cdsTab_PisCODIGO: TStringField;
    cdsTab_PisNOME: TStringField;
    cdsTab_PisGERAR: TStringField;
    cdsParametrosUSA_NFCE: TStringField;
    sdsCupom_ItensPERC_PIS: TFloatField;
    sdsCupom_ItensPERC_COFINS: TFloatField;
    sdsCupom_ItensPERC_IPI: TFloatField;
    cdsCupom_ItensPERC_PIS: TFloatField;
    cdsCupom_ItensPERC_COFINS: TFloatField;
    cdsCupom_ItensPERC_IPI: TFloatField;
    sdsCupom_ItensTIPO_PIS: TStringField;
    sdsCupom_ItensTIPO_COFINS: TStringField;
    cdsCupom_ItensTIPO_PIS: TStringField;
    cdsCupom_ItensTIPO_COFINS: TStringField;
    sdsCupom_ItensVLR_PIS: TFloatField;
    sdsCupom_ItensVLR_COFINS: TFloatField;
    cdsCupom_ItensVLR_PIS: TFloatField;
    cdsCupom_ItensVLR_COFINS: TFloatField;
    sdsOrigem_Prod: TSQLDataSet;
    dspOrigem_Prod: TDataSetProvider;
    cdsOrigem_Prod: TClientDataSet;
    cdsOrigem_ProdORIGEM: TStringField;
    cdsOrigem_ProdNOME: TStringField;
    dsOrigem_Prod: TDataSource;
    dsCFOP_Mestre: TDataSource;
    sdsCFOP_Variacao: TSQLDataSet;
    sdsCFOP_VariacaoID: TIntegerField;
    sdsCFOP_VariacaoITEM: TIntegerField;
    sdsCFOP_VariacaoID_CSTICMS: TIntegerField;
    sdsCFOP_VariacaoID_CSTIPI: TIntegerField;
    sdsCFOP_VariacaoID_PIS: TIntegerField;
    sdsCFOP_VariacaoID_COFINS: TIntegerField;
    sdsCFOP_VariacaoID_OPERACAO_NOTA: TIntegerField;
    sdsCFOP_VariacaoTIPO_EMPRESA: TStringField;
    sdsCFOP_VariacaoTIPO_CLIENTE: TStringField;
    sdsCFOP_VariacaoUF_CLIENTE: TStringField;
    sdsCFOP_VariacaoFINALIDADE: TStringField;
    sdsCFOP_VariacaoCONTROLAR_ICMS: TStringField;
    sdsCFOP_VariacaoCONTROLAR_REDUCAO: TStringField;
    sdsCFOP_VariacaoCONTROLAR_IPI: TStringField;
    sdsCFOP_VariacaoCONTROLAR_SUBSTICMS: TStringField;
    sdsCFOP_VariacaoCONTROLAR_DIFERIMENTO: TStringField;
    sdsCFOP_VariacaoNOME: TStringField;
    sdsCFOP_VariacaoPESSOA_CLIENTE: TStringField;
    sdsCFOP_VariacaoLEI: TMemoField;
    sdsCFOP_VariacaoPERC_TRIBUTO: TFloatField;
    sdsCFOP_VariacaoPERC_PIS: TFloatField;
    sdsCFOP_VariacaoPERC_COFINS: TFloatField;
    sdsCFOP_VariacaoTIPO_PIS: TStringField;
    sdsCFOP_VariacaoTIPO_COFINS: TStringField;
    cdsCFOP_Variacao: TClientDataSet;
    cdsCFOP_VariacaoID: TIntegerField;
    cdsCFOP_VariacaoITEM: TIntegerField;
    cdsCFOP_VariacaoID_CSTICMS: TIntegerField;
    cdsCFOP_VariacaoID_CSTIPI: TIntegerField;
    cdsCFOP_VariacaoID_PIS: TIntegerField;
    cdsCFOP_VariacaoID_COFINS: TIntegerField;
    cdsCFOP_VariacaoID_OPERACAO_NOTA: TIntegerField;
    cdsCFOP_VariacaoTIPO_EMPRESA: TStringField;
    cdsCFOP_VariacaoTIPO_CLIENTE: TStringField;
    cdsCFOP_VariacaoUF_CLIENTE: TStringField;
    cdsCFOP_VariacaoFINALIDADE: TStringField;
    cdsCFOP_VariacaoCONTROLAR_ICMS: TStringField;
    cdsCFOP_VariacaoCONTROLAR_REDUCAO: TStringField;
    cdsCFOP_VariacaoCONTROLAR_IPI: TStringField;
    cdsCFOP_VariacaoCONTROLAR_SUBSTICMS: TStringField;
    cdsCFOP_VariacaoCONTROLAR_DIFERIMENTO: TStringField;
    cdsCFOP_VariacaoNOME: TStringField;
    cdsCFOP_VariacaoPESSOA_CLIENTE: TStringField;
    cdsCFOP_VariacaoLEI: TMemoField;
    cdsCFOP_VariacaoPERC_TRIBUTO: TFloatField;
    cdsCFOP_VariacaoPERC_PIS: TFloatField;
    cdsCFOP_VariacaoPERC_COFINS: TFloatField;
    cdsCFOP_VariacaoTIPO_PIS: TStringField;
    cdsCFOP_VariacaoTIPO_COFINS: TStringField;
    dsCFOP_Variacao: TDataSource;
    cdsCFOPsdsCFOP_Variacao: TDataSetField;
    cdsPessoaUF: TStringField;
    sdsCupomFiscalTIPO_DESCONTO: TStringField;
    cdsCupomFiscalTIPO_DESCONTO: TStringField;
    sdsCupom_ItensVLR_IPI: TFloatField;
    cdsCupom_ItensVLR_IPI: TFloatField;
    cdsParametrosAPLICARDESCONTONOICMS: TStringField;
    sdsCupomFiscalVLR_IPI: TFloatField;
    cdsCupomFiscalVLR_IPI: TFloatField;
    sdsCupomFiscalVLR_PIS: TFloatField;
    sdsCupomFiscalVLR_COFINS: TFloatField;
    cdsCupomFiscalVLR_PIS: TFloatField;
    cdsCupomFiscalVLR_COFINS: TFloatField;
    cdsParametrosAPLICARDESCONTONOIPI: TStringField;
    qProximoCupom: TSQLQuery;
    qProximoCupomNUMCUPOM: TIntegerField;
    cdsParametrosENDXMLNFCE: TStringField;
    cdsParametrosENDPDFNFCE: TStringField;
    sdsCupomFiscalDADOS_ADICIONAIS: TMemoField;
    cdsCupomFiscalDADOS_ADICIONAIS: TMemoField;
    cdsParametrosIMP_PERC_TRIB_DADOS_ADIC: TStringField;
    sdsCupomFiscalFONTE_TRIBUTOS: TStringField;
    cdsCupomFiscalFONTE_TRIBUTOS: TStringField;
    cdsParametrosIMP_NFE_REF_PROD: TStringField;
    cdsParametrosLEI_TRANSPARENCIA_TEXTO_ITEM: TStringField;
    cdsParametrosIMP_TIPO_TRIBUTOS_ITENS: TStringField;
    sdsCupomFiscalNFEDENEGADA: TStringField;
    cdsCupomFiscalNFEDENEGADA: TStringField;
    sdsCupomFiscalTIPO_DESTINO_OPERACAO: TSmallintField;
    cdsCupomFiscalTIPO_DESTINO_OPERACAO: TSmallintField;
    cdsPessoaTIPO_CONSUMIDOR: TSmallintField;
    cdsPessoaID_CIDADE: TIntegerField;
    cdsPessoaID_PAIS: TIntegerField;
    cdsPessoaCOMPLEMENTO_END: TStringField;
    cdsPessoaBAIRRO: TStringField;
    cdsPessoaCEP: TStringField;
    cdsPessoaTELEFONE1: TStringField;
    cdsPessoaDDDFONE1: TIntegerField;
    cdsPessoaTIPO_CONTRIBUINTE: TSmallintField;
    cdsPessoaINSCR_EST: TStringField;
    cdsPessoaINSC_SUFRAMA: TStringField;
    cdsPessoaINSC_MUNICIPAL: TStringField;
    cdsPessoaEMAIL_NFE: TStringField;
    sdsCupomFiscalMOTIVO_CANCELADA: TStringField;
    cdsCupomFiscalMOTIVO_CANCELADA: TStringField;
    cdsParametrosIMP_TIPO_TRIBUTOS: TStringField;
    sdsTab_NCM: TSQLDataSet;
    dspTab_NCM: TDataSetProvider;
    cdsTab_NCM: TClientDataSet;
    cdsTab_NCMID: TIntegerField;
    cdsTab_NCMNCM: TStringField;
    cdsTab_NCMNOME: TStringField;
    cdsTab_NCMPERC_RED_STRIB: TFloatField;
    cdsTab_NCMGERAR_ST: TStringField;
    cdsTab_NCMUSAR_MVA_UF_DESTINO: TStringField;
    dsTab_NCM: TDataSource;
    cdsParametrosLEI_TRANSPARENCIA_IMP_ITEM: TStringField;
    cdsParametrosIMP_PERC_TRIB_ITENS: TStringField;
    sdsCupom_ItensVLR_DESCONTORATEIO: TFloatField;
    cdsCupom_ItensVLR_DESCONTORATEIO: TFloatField;
    sdsCupomFiscalNFEFINALIDADE: TStringField;
    cdsCupomFiscalNFEFINALIDADE: TStringField;
    cdsCupom_ConsTIPO: TStringField;
    qUltimo_NFCe: TSQLQuery;
    qUltimo_NFCeULT: TIntegerField;
    sdsCupomFiscalTIPO_ENVIONFE: TStringField;
    cdsCupomFiscalTIPO_ENVIONFE: TStringField;
    sdsCupomFiscalFORMAPGTO_CODIGO: TStringField;
    cdsCupomFiscalFORMAPGTO_CODIGO: TStringField;
    cdsCupom_ConsNFEAMBIENTE: TStringField;
    cdsCupom_ConsNFECHAVEACESSO: TStringField;
    cdsCupom_ConsNFEPROTOCOLO: TStringField;
    cdsCupom_ConsNFERECIBO: TStringField;
    cdsCupom_ConsNFEVERSAO: TStringField;
    cdsCupom_ConsTIPO_ATENDIMENTO: TSmallintField;
    cdsCupom_ConsTIPO_IMPRESSAO_NFCE: TSmallintField;
    cdsCupom_ConsTIPO_ENVIONFE: TStringField;
    cdsCupom_ConsNFEPROTOCOLO_CANCELADA: TStringField;
    cdsCupom_ConsNFEDENEGADA: TStringField;
    cdsCupom_ConsNFEFINALIDADE: TStringField;
    sdsCupomFiscalSERIE: TStringField;
    cdsCupomFiscalSERIE: TStringField;
    cdsFilialSERIE_NFCE: TStringField;
    cdsParametrosCONTROLAR_ESTOQUE_SAIDA: TStringField;
    cdsParametrosSENHA_LIBERA_ESTOQUE: TStringField;
    cdsProdutoUSA_GRADE: TStringField;
    cdsParametrosALERTA_VLR_ATRASO: TStringField;
    cdsPessoaVLR_LIMITE_CREDITO: TFloatField;
    cdsParametrosUSA_LIMITE_CREDITO: TStringField;
    cdsParametrosSENHA_CREDITO: TStringField;
    sdsCupomParametrosABRIR_CUPOM: TStringField;
    cdsCupomParametrosABRIR_CUPOM: TStringField;
    sdsCupomParametrosUSA_COD_REF: TStringField;
    cdsCupomParametrosUSA_COD_REF: TStringField;
    cdsCupom_ConsSERIE: TStringField;
    sdsCupomParametrosMOSTRA_NOME_PRODUTO: TStringField;
    cdsCupomParametrosMOSTRA_NOME_PRODUTO: TStringField;
    sdsProduto_Tam: TSQLDataSet;
    dspProduto_Tam: TDataSetProvider;
    cdsProduto_Tam: TClientDataSet;
    dsProduto_Tam: TDataSource;
    cdsProduto_TamID: TIntegerField;
    cdsProduto_TamTAMANHO: TStringField;
    sdsCupom_ItensNOME_PRODUTO: TStringField;
    cdsCupom_ItensNOME_PRODUTO: TStringField;
    sdsDuplicataUSUARIO: TStringField;
    cdsDuplicataUSUARIO: TStringField;
    cdsParametrosUSA_VENDEDOR: TStringField;
    sdsCupomFiscalMOTIVO_DENEGADO: TStringField;
    cdsCupomFiscalMOTIVO_DENEGADO: TStringField;
    sdsCupomFiscal_ProdPrincipal: TSQLDataSet;
    dspCupomFiscal_ProdPrincipal: TDataSetProvider;
    cdsCupomFiscal_ProdPrincipal: TClientDataSet;
    dsCupomFiscal_ProdPrincipal: TDataSource;
    sdsCupomFiscal_ProdPrincipalID: TIntegerField;
    sdsCupomFiscal_ProdPrincipalITEM_ORIGINAL: TIntegerField;
    sdsCupomFiscal_ProdPrincipalID_PRODUTO: TIntegerField;
    sdsCupomFiscal_ProdPrincipalVLR_PRODUTO: TFloatField;
    sdsCupomFiscal_ProdPrincipalQTD: TIntegerField;
    sdsCupomFiscal_ProdPrincipalVLR_TOTAL: TFloatField;
    cdsCupomFiscal_ProdPrincipalID: TIntegerField;
    cdsCupomFiscal_ProdPrincipalITEM_ORIGINAL: TIntegerField;
    cdsCupomFiscal_ProdPrincipalID_PRODUTO: TIntegerField;
    cdsCupomFiscal_ProdPrincipalVLR_PRODUTO: TFloatField;
    cdsCupomFiscal_ProdPrincipalQTD: TIntegerField;
    cdsCupomFiscal_ProdPrincipalVLR_TOTAL: TFloatField;
    cdsParametrosGRAVAR_CONSUMO_NOTA: TStringField;
    sdsCupom_ItensITEM_ORIGINAL: TIntegerField;
    cdsCupom_ItensITEM_ORIGINAL: TIntegerField;
    sdsCupomParametrosUSA_COPIA_PEDIDO_CF: TStringField;
    cdsCupomParametrosUSA_COPIA_PEDIDO_CF: TStringField;
    sdsPedido: TSQLDataSet;
    dspPedido: TDataSetProvider;
    cdsPedido: TClientDataSet;
    cdsPedidoID: TIntegerField;
    cdsPedidoPEDIDO_CLIENTE: TStringField;
    cdsPedidoITEM: TIntegerField;
    cdsPedidoNOMECLIENTE: TStringField;
    cdsPedidoDTEMISSAO: TDateField;
    cdsPedidoNOMEPRODUTO: TStringField;
    cdsPedidoQTD_FATURADO: TFloatField;
    cdsPedidoQTD_RESTANTE: TFloatField;
    cdsPedidoQTD_AFATURAR: TFloatField;
    cdsPedidoVLR_UNITARIO: TFloatField;
    cdsPedidoQTD: TFloatField;
    cdsPedidoID_PRODUTO: TIntegerField;
    cdsPedidoVLR_DESCONTO: TFloatField;
    cdsPedidoID_CLIENTE: TIntegerField;
    cdsPedidoCNPJ_CPF: TStringField;
    cdsPedidoDTENTREGA: TDateField;
    cdsPedidoID_CFOP: TIntegerField;
    cdsPedidoID_NCM: TIntegerField;
    cdsPedidoUNIDADE: TStringField;
    cdsPedidoPERC_IPI: TFloatField;
    cdsPedidoOBS_COMPLEMENTAR: TStringField;
    cdsPedidoNUMOS: TStringField;
    cdsPedidoTIPO_FRETE: TStringField;
    cdsPedidoID_CONDPGTO: TIntegerField;
    cdsPedidoIMP_OC_NOTA: TStringField;
    cdsPedidoNUM_PEDIDO: TIntegerField;
    cdsPedidoID_VARIACAO: TIntegerField;
    cdsPedidoQTD_LIBERADA: TFloatField;
    cdsPedidoQTD_PRODUZIDA: TFloatField;
    cdsPedidoclQtd_Restante: TFloatField;
    cdsPedidoclQtd_NaoLiberada: TFloatField;
    cdsPedidoTIPO_REG: TStringField;
    cdsPedidoTAMANHO: TStringField;
    cdsPedidoID_TRANSPORTADORA: TIntegerField;
    cdsPedidoID_NCM_PED: TIntegerField;
    cdsPedidoREFERENCIA: TStringField;
    cdsPedidoREFERENCIA_PRO: TStringField;
    cdsPedidoNUM_DOC: TIntegerField;
    cdsPedidoNUM_TALAO: TStringField;
    cdsPedidoVLR_DESCONTORATEIO: TFloatField;
    cdsPedidoITEM_CLIENTE: TIntegerField;
    cdsPedidoQTD_PECA: TIntegerField;
    cdsPedidoQTD_FUT: TFloatField;
    cdsPedidoID_COR: TFMTBCDField;
    cdsPedidoNOME_COR: TStringField;
    cdsPedidoID_MOVESTOQUE: TIntegerField;
    cdsPedidoTIPO_ACESSORIO: TStringField;
    cdsPedidoNOME_GRUPO: TStringField;
    cdsPedidoNOME_CONSUMIDOR: TStringField;
    cdsPedidoQTD_LANCAR_ESTOQUE: TFloatField;
    dsPedido: TDataSource;
    sdsPedido_Tipo: TSQLDataSet;
    dspPedido_Tipo: TDataSetProvider;
    cdsPedido_Tipo: TClientDataSet;
    cdsPedido_TipoID: TIntegerField;
    cdsPedido_TipoITEM: TIntegerField;
    cdsPedido_TipoCOMPRIMENTO: TFloatField;
    cdsPedido_TipoLARGURA: TFloatField;
    cdsPedido_TipoALTURA: TFloatField;
    cdsPedido_TipoVLR_KG: TFloatField;
    cdsPedido_TipoQTD: TFloatField;
    cdsPedido_TipoVLR_UNITARIO: TFloatField;
    cdsPedido_TipoVLR_TOTAL: TFloatField;
    cdsPedido_TipoDIAMETRO: TFloatField;
    cdsPedido_TipoDIAMETRO_EXT: TFloatField;
    cdsPedido_TipoDIAMETRO_INT: TFloatField;
    cdsPedido_TipoPAREDE: TFloatField;
    cdsPedido_TipoPESO: TFloatField;
    cdsPedido_TipoCOMPLEMENTO_NOME: TStringField;
    cdsPedido_TipoTIPO_ORCAMENTO: TStringField;
    cdsPedido_TipoDESCRICAO_TIPO: TStringField;
    cdsPedido_TipoID_ACABAMENTO: TIntegerField;
    cdsPedido_TipoID_REDONDO_MOD: TIntegerField;
    cdsPedido_TipoID_CMOEDA: TIntegerField;
    cdsPedido_TipoID_FUROS: TIntegerField;
    cdsPedido_TipoID_FURACAO: TIntegerField;
    cdsPedido_TipoID_PERFIL: TIntegerField;
    cdsPedido_TipoID_VIDRO: TIntegerField;
    cdsPedido_TipoQTD_FUROS: TIntegerField;
    dsPedido_Tipo: TDataSource;
    cdsParametrosEMPRESA_SUCATA: TStringField;
    cdsParametrosEMPRESA_AMBIENTES: TStringField;
    cdsParametrosEMPRESA_NAVALHA: TStringField;
    cdsParametrosCONTROLAR_PEDIDO_LIBERACAO: TStringField;
    cdsParametrosUSA_PEDIDO_FUT: TStringField;
    sdsCupom_ItensID_PEDIDO: TIntegerField;
    sdsCupom_ItensITEM_PEDIDO: TIntegerField;
    sdsCupom_ItensNUM_PEDIDO: TIntegerField;
    sdsCupom_ItensITEM_CLIENTE: TIntegerField;
    sdsCupom_ItensNUMERO_OC: TStringField;
    sdsCupom_ItensNUMERO_OS: TStringField;
    cdsCupom_ItensID_PEDIDO: TIntegerField;
    cdsCupom_ItensITEM_PEDIDO: TIntegerField;
    cdsCupom_ItensNUM_PEDIDO: TIntegerField;
    cdsCupom_ItensITEM_CLIENTE: TIntegerField;
    cdsCupom_ItensNUMERO_OC: TStringField;
    cdsCupom_ItensNUMERO_OS: TStringField;
    sdsPrc_Atualiza_Status_Ped: TSQLDataSet;
    mPedidoAux: TClientDataSet;
    mPedidoAuxID_Pedido: TIntegerField;
    cdsParametrosUNIDADE_PECA: TStringField;
    cdsParametrosPERMITE_QTDMAIOR_PEDIDO: TStringField;
    sdsCupom_ItensID_ENQIPI: TIntegerField;
    cdsCupom_ItensID_ENQIPI: TIntegerField;
    cdsTab_NCMCOD_CEST: TStringField;
    sdsEnqIPI: TSQLDataSet;
    dspEnqIPI: TDataSetProvider;
    cdsEnqIPI: TClientDataSet;
    cdsEnqIPIID: TIntegerField;
    cdsEnqIPICODIGO: TStringField;
    cdsEnqIPITIPO: TStringField;
    cdsEnqIPIDESCRICAO: TStringField;
    dsEnqIPI: TDataSource;
    sdsCupomParametrosTAMANHO_LINHA: TSmallintField;
    cdsCupomParametrosTAMANHO_LINHA: TSmallintField;
    cdsProdutoCOD_CEST: TStringField;
    cdsEstoqueMovGERAR_CUSTO: TStringField;
    qFilial: TSQLQuery;
    qFilialCONTADOR: TIntegerField;
    cdsTipoCobrancaGERAR_NFCE: TStringField;
    qUltimo_CNF: TSQLQuery;
    qUltimo_CNFULT: TIntegerField;
    cdsCupom_ConsDINHEIRO: TStringField;
    cdsCupom_ConsNOME_TIPOCOBRANCA: TStringField;
    sdsCupomParametrosMOSTRAR_BARRA_TOTAL: TStringField;
    sdsCupomParametrosMOSTRAR_CONDPGTO: TStringField;
    sdsCupomParametrosID_CONDPGTO_PADRAO: TIntegerField;
    cdsCupomParametrosMOSTRAR_BARRA_TOTAL: TStringField;
    cdsCupomParametrosMOSTRAR_CONDPGTO: TStringField;
    cdsCupomParametrosID_CONDPGTO_PADRAO: TIntegerField;
    sdsCupomParametrosUSA_QTD_PESSOA: TStringField;
    cdsCupomParametrosUSA_QTD_PESSOA: TStringField;
    sdsCupomFiscalQTD_PESSOA: TIntegerField;
    cdsCupomFiscalQTD_PESSOA: TIntegerField;
    cdsCupom_ConsQTD_PESSOA: TIntegerField;
    sdsCupomParametrosVENDA_TIPO_PRODUTO: TStringField;
    cdsCupomParametrosVENDA_TIPO_PRODUTO: TStringField;
    sdsCupomParametrosCAIXA_NUMERA_COMANDA: TStringField;
    cdsCupomParametrosCAIXA_NUMERA_COMANDA: TStringField;
    sdsCupomParametrosIMPRIME_NUM_NFISCAL: TStringField;
    cdsCupomParametrosIMPRIME_NUM_NFISCAL: TStringField;
    sdsCupomFiscalID_FECHAMENTO: TIntegerField;
    cdsCupomFiscalID_FECHAMENTO: TIntegerField;
    cdsCupom_ConsID_FECHAMENTO: TIntegerField;
    SQLQuery1: TSQLQuery;
    cdsCupom_ConsDTFECHAMENTO: TDateField;
    sdsCupomParametrosBAIXAR_CONSUMO: TStringField;
    cdsCupomParametrosBAIXAR_CONSUMO: TStringField;
    sdsProduto_Consumo_Tam: TSQLDataSet;
    dspProduto_Consumo_Tam: TDataSetProvider;
    cdsProduto_Consumo_Tam: TClientDataSet;
    cdsProduto_Consumo_TamQTD_CONSUMO: TFloatField;
    cdsProduto_Consumo_TamTAMANHO: TStringField;
    cdsProduto_Consumo: TClientDataSet;
    cdsProduto_ConsumoID: TIntegerField;
    cdsProduto_ConsumoITEM: TIntegerField;
    cdsProduto_ConsumoID_MATERIAL: TIntegerField;
    cdsProduto_ConsumoQTD_CONSUMO: TFloatField;
    cdsProduto_ConsumoQTD_UNIDADE: TFloatField;
    cdsProduto_ConsumoUNIDADE: TStringField;
    cdsProduto_ConsumoID_POSICAO: TIntegerField;
    cdsProduto_ConsumoTIPO_CONSUMO: TStringField;
    dspProduto_Consumo: TDataSetProvider;
    sdsProduto_Consumo: TSQLDataSet;
    sdsCupomParametrosID_CONTAPERDAS: TIntegerField;
    cdsCupomParametrosID_CONTAPERDAS: TIntegerField;
    sdsCupomParametrosORDEM_CAMPOS: TSmallintField;
    cdsCupomParametrosORDEM_CAMPOS: TSmallintField;
    cdsCondPgtoTIPO_CONDICAO: TStringField;
    cdsCondPgtoQTD_PARCELA: TIntegerField;
    cdsCondPgtoENTRADA: TStringField;
    cdsCondPgtoMOSTRAR_NFCE: TStringField;
    cdsTipoCobrancaABRE_GAVETA: TStringField;
    cdsTipoCobrancaEXIGE_CLIENTE: TStringField;
    cdsPessoaID_CONDPGTO: TIntegerField;
    sdsCupomParametrosIMPRIME_FISCAL_NFISCAL: TStringField;
    cdsCupomParametrosIMPRIME_FISCAL_NFISCAL: TStringField;
    sdsCupomParametrosETIQUETA_INFO: TStringField;
    cdsCupomParametrosETIQUETA_INFO: TStringField;
    sdsCupomParametrosUSA_COMANDA: TStringField;
    sdsCupomParametrosUSA_CARNE: TStringField;
    cdsCupomParametrosUSA_COMANDA: TStringField;
    cdsCupomParametrosUSA_CARNE: TStringField;
    sdsCupom_ParcID_DUPLICATA: TIntegerField;
    cdsCupom_ParcID_DUPLICATA: TIntegerField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset4: TfrxDBDataset;
    frxBarCodeObject1: TfrxBarCodeObject;
    sdsCupomParametrosALTURA_SALTO_LINHA: TSmallintField;
    cdsCupomParametrosALTURA_SALTO_LINHA: TSmallintField;
    cdsTipoCobrancaIMPRIME_CARNE: TStringField;
    sdsCupomParametrosUSA_CARTAO_COMANDA: TStringField;
    sdsCupomParametrosUSA_ORCAMENTO: TStringField;
    sdsCupomParametrosUSA_PEDIDO: TStringField;
    cdsCupomParametrosUSA_CARTAO_COMANDA: TStringField;
    cdsCupomParametrosUSA_ORCAMENTO: TStringField;
    cdsCupomParametrosUSA_PEDIDO: TStringField;
    sdsCupomFiscalCLIENTE_NOME: TStringField;
    sdsCupomFiscalCLIENTE_FONE: TStringField;
    cdsCupomFiscalCLIENTE_NOME: TStringField;
    cdsCupom_ConsCLIENTE_NOME: TStringField;
    cdsCupom_ConsCLIENTE_FONE: TStringField;
    cdsCupom_ConsCLIENTE_ENDERECO: TStringField;
    cdsCupom_ConsCLIENTE_OBS: TStringField;
    sdsCupomFiscalCLIENTE_ENDERECO: TStringField;
    sdsCupomFiscalCLIENTE_OBS: TStringField;
    cdsCupomFiscalCLIENTE_ENDERECO: TStringField;
    cdsCupomFiscalCLIENTE_OBS: TStringField;
    sdsCupomParametrosEXIGE_CAMPO_DESCONTO: TStringField;
    cdsCupomParametrosEXIGE_CAMPO_DESCONTO: TStringField;
    cdsTipoCobrancaCREDITO_LOJA: TStringField;
    sdsCupom_ParcEDITADA: TStringField;
    cdsCupom_ParcEDITADA: TStringField;
    sdsCupomParametrosVIAS_CUPOM: TSmallintField;
    cdsCupomParametrosVIAS_CUPOM: TSmallintField;
    sdsCupomParametrosIMP_VENDAS_FECHAMENTO: TStringField;
    cdsCupomParametrosIMP_VENDAS_FECHAMENTO: TStringField;
    qCupomPed: TSQLQuery;
    qCupomPedID_PEDIDO: TIntegerField;
    sdsCupomParametrosIMPRIME_NFISCAL_CONFERENCIA: TStringField;
    cdsCupomParametrosIMPRIME_NFISCAL_CONFERENCIA: TStringField;
    sdsCupomParametrosID_PRODUTO_GENERICO: TIntegerField;
    cdsCupomParametrosID_PRODUTO_GENERICO: TIntegerField;
    sdsCupomFiscalCPF: TStringField;
    cdsCupomFiscalCPF: TStringField;
    sdsCupomParametrosEXIGE_VENDEDOR: TStringField;
    sdsCupomParametrosREPETE_VENDEDOR: TStringField;
    cdsCupomParametrosEXIGE_VENDEDOR: TStringField;
    cdsCupomParametrosREPETE_VENDEDOR: TStringField;
    cdsCupom_ConsHREMISSAO: TTimeField;
    qComissao: TSQLQuery;
    cdsPedidoPERC_DESCONTO: TFloatField;
    cdsPedidoID_TIPO_COBRANCA: TIntegerField;
    cdsPedidoID_VENDEDOR: TIntegerField;
    cdsPedidoPERC_COMISSAO_PED: TFloatField;
    cdsPedidoPERC_COMISSAO_ITEM: TFloatField;
    sdsTransp: TSQLDataSet;
    dspTransp: TDataSetProvider;
    cdsTransp: TClientDataSet;
    dsTransp: TDataSource;
    cdsTranspCODIGO: TIntegerField;
    cdsTranspNOME: TStringField;
    cdsTranspENDERECO: TStringField;
    cdsTranspNUM_END: TStringField;
    cdsTranspCNPJ_CPF: TStringField;
    cdsTranspPESSOA: TStringField;
    cdsTranspUF: TStringField;
    cdsTranspID_CIDADE: TIntegerField;
    cdsTranspCOMPLEMENTO_END: TStringField;
    cdsTranspBAIRRO: TStringField;
    cdsTranspCEP: TStringField;
    cdsTranspTELEFONE1: TStringField;
    cdsTranspDDDFONE1: TIntegerField;
    cdsTranspINSCR_EST: TStringField;
    cdsTranspEMAIL_NFE: TStringField;
    cdsTranspCIDADE: TStringField;
    sdsCupomFiscalID_TRANSPORTADORA: TIntegerField;
    cdsCupomFiscalID_TRANSPORTADORA: TIntegerField;
    cdsPessoaENDERECO_ENT: TStringField;
    cdsPessoaNUM_END_ENT: TStringField;
    cdsPessoaCIDADE_ENT: TStringField;
    cdsPessoaUF_ENT: TStringField;
    cdsPessoaCEP_ENT: TStringField;
    cdsPessoaBAIRRO_ENT: TStringField;
    cdsPessoaCOMPLEMENTO_END_ENT: TStringField;
    cdsPessoaID_CIDADE_ENT: TIntegerField;
    cdsPessoaCIDADE: TStringField;
    sdsCupomFiscal_Cli: TSQLDataSet;
    cdsCupomFiscal_Cli: TClientDataSet;
    dsCupomFiscal_Cli: TDataSource;
    sdsCupomFiscal_CliID: TIntegerField;
    sdsCupomFiscal_CliENDERECO: TStringField;
    sdsCupomFiscal_CliNUM_END: TStringField;
    sdsCupomFiscal_CliCOMPLEMENTO: TStringField;
    sdsCupomFiscal_CliBAIRRO: TStringField;
    sdsCupomFiscal_CliID_CIDADE: TIntegerField;
    sdsCupomFiscal_CliDDD: TStringField;
    sdsCupomFiscal_CliFONE: TStringField;
    cdsCupomFiscalsdsCupomFiscal_Cli: TDataSetField;
    cdsCupomFiscal_CliID: TIntegerField;
    cdsCupomFiscal_CliENDERECO: TStringField;
    cdsCupomFiscal_CliNUM_END: TStringField;
    cdsCupomFiscal_CliCOMPLEMENTO: TStringField;
    cdsCupomFiscal_CliBAIRRO: TStringField;
    cdsCupomFiscal_CliID_CIDADE: TIntegerField;
    cdsCupomFiscal_CliDDD: TStringField;
    cdsCupomFiscal_CliFONE: TStringField;
    sdsCupomFiscal_CliID_TRANSPORTADORA: TIntegerField;
    sdsCupomFiscal_CliCEP: TStringField;
    cdsCupomFiscal_CliID_TRANSPORTADORA: TIntegerField;
    cdsCupomFiscal_CliCEP: TStringField;
    dspCidade: TDataSetProvider;
    sdsCidade: TSQLDataSet;
    cdsCidade: TClientDataSet;
    dsCidade: TDataSource;
    qCidade: TSQLQuery;
    qCidadeID: TIntegerField;
    qCidadeNOME: TStringField;
    qCidadeUF: TStringField;
    qCidadeCODMUNICIPIO: TStringField;
    qCidadeID_PROVEDOR: TIntegerField;
    qCidadeLINKNFSE: TStringField;
    qCidadeFONE_PREFEITURA: TStringField;
    qCidadeSITE_PREFEITURA: TStringField;
    qCidadeEND_LOGO_PREFEITURA: TStringField;
    cdsCidadeID: TIntegerField;
    cdsCidadeNOME: TStringField;
    cdsCidadeUF: TStringField;
    cdsCidadeCODMUNICIPIO: TStringField;
    cdsCidadeID_PROVEDOR: TIntegerField;
    cdsCidadeLINKNFSE: TStringField;
    cdsCidadeFONE_PREFEITURA: TStringField;
    cdsCidadeSITE_PREFEITURA: TStringField;
    cdsCidadeEND_LOGO_PREFEITURA: TStringField;
    sdsCupomFiscal_CliEMAIL: TStringField;
    cdsCupomFiscal_CliEMAIL: TStringField;
    sdsCupomFiscal_CliTIPO_CONTRIBUINTE: TSmallintField;
    cdsCupomFiscal_CliTIPO_CONTRIBUINTE: TSmallintField;
    sdsCupomFiscal_CliPLACA: TStringField;
    sdsCupomFiscal_CliUF_TRANSP: TStringField;
    cdsCupomFiscal_CliPLACA: TStringField;
    cdsCupomFiscal_CliUF_TRANSP: TStringField;
    sdsCupomFiscal_CliTIPO_FRETE: TStringField;
    cdsCupomFiscal_CliTIPO_FRETE: TStringField;
    mPedObs: TClientDataSet;
    IntegerField1: TIntegerField;
    mPedidoAuxOBS_Nota: TStringField;
    qPedido_Cupom: TSQLQuery;
    qPedido_CupomID: TIntegerField;
    qPedido_CupomENDERECO: TStringField;
    qPedido_CupomNUM_END: TStringField;
    qPedido_CupomBAIRRO: TStringField;
    qPedido_CupomID_CIDADE: TIntegerField;
    qPedido_CupomDDD: TStringField;
    qPedido_CupomFONE: TStringField;
    qPedido_CupomCEP: TStringField;
    qPedido_CupomEMAIL: TStringField;
    qPedido_CupomPLACA: TStringField;
    qPedido_CupomUFPLACA: TStringField;
    qPedido_CupomTIPO_FRETE: TStringField;
    qPedido_CupomCOMPLEMENTO: TStringField;
    cdsPedidoTIPO_ATENDIMENTO: TSmallintField;
    qParametros_Fin: TSQLQuery;
    qParametros_FinID: TIntegerField;
    qParametros_FinCONTROLE_DIG_PRECO: TStringField;
    qParametros_Usuario: TSQLQuery;
    qParametros_UsuarioID: TIntegerField;
    qParametros_UsuarioUSUARIO: TStringField;
    qParametros_UsuarioALT_PRECO_PED: TStringField;
    sdsCupom_Cons_Parc: TSQLDataSet;
    dspCupom_Cons_Parc: TDataSetProvider;
    cdsCupom_Cons_Parc: TClientDataSet;
    cdsCupom_Cons_ParcVALOR: TFloatField;
    cdsCupom_Cons_ParcID_TIPOCOBRANCA: TIntegerField;
    cdsCupom_Cons_ParcDINHEIRO: TStringField;
    cdsComandaItem_RelID_PRODUTO: TIntegerField;
    cdsComandaItem_RelVLR_UNITARIO: TFloatField;
    sdsCupomFiscalNOME_VENDEDOR: TStringField;
    cdsCupomFiscalNOME_VENDEDOR: TStringField;
    sdsCupomParametrosID_CONDPGTO_PRAZO: TIntegerField;
    cdsCupomParametrosID_CONDPGTO_PRAZO: TIntegerField;
    sdsCupomParametrosUSA_TABELA_PRECO: TStringField;
    cdsCupomParametrosUSA_TABELA_PRECO: TStringField;
    sdsCupomParametrosTAMANHO_COD_ETIQUETA: TSmallintField;
    cdsCupomParametrosTAMANHO_COD_ETIQUETA: TSmallintField;
    sdsCupomParametrosQTD_AUTO: TStringField;
    cdsCupomParametrosQTD_AUTO: TStringField;
    cdsCupom_ConsVENDEDOR: TStringField;
    sdsCupomParametrosUSA_PREVIEW_CARNE: TStringField;
    sdsCupomParametrosCARNE_RELATORIO: TStringField;
    cdsCupomParametrosUSA_PREVIEW_CARNE: TStringField;
    cdsCupomParametrosCARNE_RELATORIO: TStringField;
    sdsCupomParametrosFECHAMENTO: TStringField;
    cdsCupomParametrosFECHAMENTO: TStringField;
    sdsLocalEstoque: TSQLDataSet;
    dspLocalEstoque: TDataSetProvider;
    cdsLocalEstoque: TClientDataSet;
    dsLocalEstoque: TDataSource;
    cdsLocalEstoqueID: TIntegerField;
    cdsLocalEstoqueNOME: TStringField;
    sdsTerminal: TSQLDataSet;
    dspTerminal: TDataSetProvider;
    cdsTerminal: TClientDataSet;
    cdsTerminalID: TSmallintField;
    cdsTerminalNOME: TStringField;
    dsTerminal: TDataSource;
    qUnidade: TSQLQuery;
    qUnidadeFRACIONAVEL: TStringField;
    sdsCupomParametrosRACHAR_CONTA: TStringField;
    cdsCupomParametrosRACHAR_CONTA: TStringField;
    sdsCupomParametrosUSA_PRECO_AVISTA: TStringField;
    cdsCupomParametrosUSA_PRECO_AVISTA: TStringField;
    cdsProdutoPRECO_REVENDA: TFMTBCDField;
    cdsTipoCobrancaPRECO_AVISTA: TStringField;
    sdsCupomFiscalID_LOCALESTOQUE: TIntegerField;
    cdsCupomFiscalID_LOCALESTOQUE: TIntegerField;
    cdsTab_NCMID_PIS: TIntegerField;
    cdsTab_NCMID_COFINS: TIntegerField;
    cdsTab_NCMID_CST_ICMS: TIntegerField;
    cdsTab_NCMPERC_PIS: TFloatField;
    cdsTab_NCMPERC_COFINS: TFloatField;
    cdsTab_NCMPERC_BASE_ICMS: TFloatField;
    cdsTab_NCMID_OBS_LEI: TIntegerField;
    cdsTab_NCMID_CFOP: TIntegerField;
    cdsTab_NCMPERC_ICMS: TFloatField;
    sdsCupomParametrosEXIBIR_DIALOGO_IMPRESSORA: TStringField;
    cdsCupomParametrosEXIBIR_DIALOGO_IMPRESSORA: TStringField;
    cdsCupomFiscalCLIENTE_FONE: TStringField;
    qVer: TSQLQuery;
    qVerID: TIntegerField;
    qVerNFECHAVEACESSO: TStringField;
    sdsCupomFiscalESTOQUE_OK: TStringField;
    sdsCupomFiscalFINANCEIRO_OK: TStringField;
    cdsCupomFiscalESTOQUE_OK: TStringField;
    cdsCupomFiscalFINANCEIRO_OK: TStringField;
    cdsCupom_ConsESTOQUE_OK: TStringField;
    cdsCupom_ConsFINANCEIRO_OK: TStringField;
    sdsCupomParametrosUSA_COR_TAMANHO: TStringField;
    cdsCupomParametrosUSA_COR_TAMANHO: TStringField;
    sdsCombinacao: TSQLDataSet;
    dspCombinacao: TDataSetProvider;
    cdsCombinacao: TClientDataSet;
    cdsCombinacaoID: TIntegerField;
    cdsCombinacaoITEM: TIntegerField;
    cdsCombinacaoNOME: TStringField;
    dsCombinacao: TDataSource;
    dsTamanho: TDataSource;
    cdsTamanho: TClientDataSet;
    cdsTamanhoID: TIntegerField;
    cdsTamanhoTAMANHO: TStringField;
    dspTamanho: TDataSetProvider;
    sdsTamanho: TSQLDataSet;
    sdsCupom_ItensID_COR_COMBINACO: TIntegerField;
    cdsCupom_ItensID_COR_COMBINACO: TIntegerField;
    sdsParametrosGeral: TSQLDataSet;
    IntegerField2: TIntegerField;
    dspParametrosGeral: TDataSetProvider;
    cdsParametrosGeral: TClientDataSet;
    dsParametrosGeral: TDataSource;
    cdsParametrosGeralID: TIntegerField;
    qParametros_Geral: TSQLQuery;
    qParametros_GeralENDGRIDS: TStringField;
    sdsCupomFiscalDTORIGINAL: TDateField;
    cdsCupomFiscalDTORIGINAL: TDateField;
    cdsCupom_ConsDTORIGINAL: TDateField;
    sdsCupomParametrosJUROS_MES: TFloatField;
    cdsCupomParametrosJUROS_MES: TFloatField;
    cdsProdutoCOD_BARRA2: TStringField;
    cdsProdutoQTD_EMBALAGEM: TFloatField;
    cdsProdutoUNIDADE2: TStringField;
    sdsCupomParametrosAUTENTICA_VENDEDOR: TStringField;
    cdsCupomParametrosAUTENTICA_VENDEDOR: TStringField;
    cdsVendedorSENHA: TStringField;
    cdsTipoCobrancaFATURAMENTO_LIQUIDO: TStringField;
    cdsTipoCobrancaFATURAMENTO_BRUTO: TStringField;
    cdsTipoCobrancaDINHEIRO: TStringField;
    cdsCFOPID_PIS_SIMP: TIntegerField;
    cdsCFOPID_COFINS_SIMP: TIntegerField;
    sdsCupomParametrosUSA_MODO_SINCRONO: TStringField;
    cdsCupomParametrosUSA_MODO_SINCRONO: TStringField;
    qTipoDinheiro: TSQLQuery;
    qTipoDinheiroID: TIntegerField;
    qTipoDinheiroNOME: TStringField;
    qCliente: TSQLQuery;
    qClienteCODIGO: TIntegerField;
    cdsTipoCobrancaPERC_JUROS: TFloatField;
    cdsProdutoID_CSTICMS: TIntegerField;
    sdsCupom_ItensVLR_ACRESCIMO: TFloatField;
    cdsCupom_ItensVLR_ACRESCIMO: TFloatField;
    sdsCupom_ItensVLR_UNIT_ORIGINAL: TFloatField;
    cdsCupom_ItensVLR_UNIT_ORIGINAL: TFloatField;
    sdsCupomParametrosSENHA_CANCELAR_CUPOM: TStringField;
    cdsCupomParametrosSENHA_CANCELAR_CUPOM: TStringField;
    cdsCFOPENVIAR_BASE_ST: TStringField;
    qProdST: TSQLQuery;
    qProdSTDTEMISSAO: TDateField;
    qProdSTID_PRODUTO: TIntegerField;
    qProdSTBASE_ST: TFloatField;
    qProdSTBASE_ST_RET: TFloatField;
    qProdSTVLR_ST: TFloatField;
    qProdSTVLR_ST_RET: TFloatField;
    sdsCupomFiscalBASE_ICMSSUBST_RET: TFloatField;
    sdsCupomFiscalVLR_ICMSSUBST_RET: TFloatField;
    sdsCupomFiscalVLR_BASE_EFET: TFloatField;
    sdsCupomFiscalVLR_ICMS_EFET: TFloatField;
    cdsCupomFiscalBASE_ICMSSUBST_RET: TFloatField;
    cdsCupomFiscalVLR_ICMSSUBST_RET: TFloatField;
    cdsCupomFiscalVLR_BASE_EFET: TFloatField;
    cdsCupomFiscalVLR_ICMS_EFET: TFloatField;
    sdsCupom_ItensBASE_ICMSSUBST_RET: TFloatField;
    sdsCupom_ItensVLR_ICMSSUBST_RET: TFloatField;
    sdsCupom_ItensVLR_BASE_EFET: TFloatField;
    sdsCupom_ItensVLR_ICMS_EFE: TFloatField;
    sdsCupom_ItensPERC_ST: TFloatField;
    cdsCupom_ItensBASE_ICMSSUBST_RET: TFloatField;
    cdsCupom_ItensVLR_ICMSSUBST_RET: TFloatField;
    cdsCupom_ItensVLR_BASE_EFET: TFloatField;
    cdsCupom_ItensVLR_ICMS_EFE: TFloatField;
    cdsCupom_ItensPERC_ST: TFloatField;
    cdsFilialUSA_ENVIO_ST_RET: TStringField;
    qProdSTPERC_ST: TFloatField;
    cdsFilialCALCULAR_ICMS_EFET: TStringField;
    qProduto_UF: TSQLQuery;
    qProduto_UFID: TIntegerField;
    qProduto_UFUF: TStringField;
    qProduto_UFPERC_ICMS: TFloatField;
    qProduto_UFPERC_ICMS_INTERNO: TFloatField;
    qProduto_UFPERC_REDUCAO_ST: TFloatField;
    qProduto_UFPERC_REDUCAO_ICMS: TFloatField;
    qProduto_UFID_CST_ICMS: TIntegerField;
    qNCM_UF: TSQLQuery;
    qNCM_UFID: TIntegerField;
    qNCM_UFITEM: TIntegerField;
    qNCM_UFUF: TStringField;
    qNCM_UFMVAINTERNO: TFloatField;
    qNCM_UFNCM: TStringField;
    qNCM_UFPERC_RED_STRIB: TFloatField;
    qNCM_UFPERC_RED_MVA: TFloatField;
    qNCM_UFPERC_RED_MVA_GERAL: TFloatField;
    qNCM_UFTIPO_EMPRESA: TStringField;
    qNCM_UFTIPO_PRODUTO: TStringField;
    qNCM_UFAJUSTAR_MVA: TStringField;
    qNCM_UFPERC_ICMS_INTERNO: TFloatField;
    qNCM_UFID_OBS_LEI: TIntegerField;
    qNCM_UFPERC_RED_BASE_ST: TFloatField;
    qNCM_UFPERC_RED_BASE_ST_SIMPLES: TFloatField;
    qNCM_UFPERC_RED_MVA_CLI_GERAL: TFloatField;
    qNCM_UFPERC_RED_MVA_CLI_SIMPLES: TFloatField;
    sdsCupom_ItensPERC_ICMS_EFET: TFloatField;
    cdsCupom_ItensPERC_ICMS_EFET: TFloatField;
    cdsProdutoPERC_REDUCAOICMS: TFloatField;
    sdsCupom_ItensPERC_BASE_RED_EFET: TFloatField;
    cdsCupom_ItensPERC_BASE_RED_EFET: TFloatField;
    sdsTotais: TSQLDataSet;
    dspTotais: TDataSetProvider;
    cdsTotais: TClientDataSet;
    dsTotais: TDataSource;
    cdsTotaisNOME: TStringField;
    cdsTotaisTOTAL: TFloatField;
    cdsProdutoID_CSTICMS_BRED: TIntegerField;
    cdsProdutoPERC_ICMS_NFCE: TFloatField;
    sdsCupomParametrosANIVERSARIO_PERIODO: TStringField;
    cdsCupomParametrosANIVERSARIO_PERIODO: TStringField;
    cdsTipoCobrancaTAXA: TFloatField;
    cdsTipoCobrancaTAXA_TIPO: TStringField;
    sdsCupom_ItensVLR_JUROS: TFloatField;
    cdsCupom_ItensVLR_JUROS: TFloatField;
    sdsCupomFiscalVLR_OUTROS: TFloatField;
    cdsCupomFiscalVLR_OUTROS: TFloatField;
    cdsTipoCobrancaJUROS_TIPO: TStringField;
    qParametros_UsuarioCUPOM_TOTAIS: TStringField;
    cdsCombinacaoID_COR_COMBINACAO: TIntegerField;
    sdsCupomFiscalID_CANAL_VENDA: TIntegerField;
    cdsCupomFiscalID_CANAL_VENDA: TIntegerField;
    sdsCupomParametrosUSA_CANAL_VENDA: TStringField;
    cdsCupomParametrosUSA_CANAL_VENDA: TStringField;
    sdsCupomParametrosUTILIZA_IMP_ACBR2: TStringField;
    cdsCupomParametrosUTILIZA_IMP_ACBR2: TStringField;
    sds_prc_Exluir_Cupom: TSQLDataSet;
    cdsFilialNFCEPRODUCAO: TStringField;
    sds_prc_Grava_Estoque: TSQLDataSet;
    qCBarra_Int: TSQLQuery;
    qCBarra_IntID: TIntegerField;
    qCBarra_IntCOD_BARRA: TStringField;
    qCBarra_IntID_PRODUTO: TIntegerField;
    qCBarra_IntID_COR: TIntegerField;
    qCBarra_IntTAMANHO: TStringField;
    qCBarra_IntSEQUENCIA: TIntegerField;
    sdsCupomParametrosUSA_CBARRA_INT: TStringField;
    cdsCupomParametrosUSA_CBARRA_INT: TStringField;
    qCBarra_IntNOME_COMBINACAO: TStringField;
    cdsParametrosINFORMAR_COR_MATERIAL: TStringField;
    cdsParametrosINFORMAR_COR_PROD: TStringField;
    cdsParametrosUSA_GRADE: TStringField;
    sdsCupomParametrosUSA_PRECO_REVENDA: TStringField;
    cdsCupomParametrosUSA_PRECO_REVENDA: TStringField;
    SQLQuery2: TSQLQuery;
    sdsCupomParametrosGERAR_CRECEBER: TStringField;
    cdsCupomParametrosGERAR_CRECEBER: TStringField;
    sdsGrupo: TSQLDataSet;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    dsGrupo: TDataSource;
    sdsGrupoID: TIntegerField;
    sdsGrupoNOME: TStringField;
    sdsGrupoCODIGO: TStringField;
    cdsGrupoID: TIntegerField;
    cdsGrupoNOME: TStringField;
    cdsGrupoCODIGO: TStringField;
    sdsConsProduto: TSQLDataSet;
    dspConsProduto: TDataSetProvider;
    cdsConsProduto: TClientDataSet;
    dsConsProduto: TDataSource;
    cdsConsProdutoID: TIntegerField;
    cdsConsProdutoREFERENCIA: TStringField;
    cdsConsProdutoNOME: TStringField;
    cdsConsProdutoCOD_BARRA: TStringField;
    cdsConsProdutoPRECO_VENDA: TFloatField;
    cdsConsProdutoPESOLIQUIDO: TFloatField;
    cdsConsProdutoPESOBRUTO: TFloatField;
    cdsConsProdutoINATIVO: TStringField;
    cdsConsProdutoID_CSTIPI: TIntegerField;
    cdsConsProdutoPERC_IPI: TFloatField;
    cdsConsProdutoPRECO_CUSTO: TFloatField;
    cdsConsProdutoTIPO_REG: TStringField;
    cdsConsProdutoPOSSE_MATERIAL: TStringField;
    cdsConsProdutoESTOQUE: TStringField;
    cdsConsProdutoMATERIAL_OUTROS: TStringField;
    cdsConsProdutoUSUARIO: TStringField;
    cdsConsProdutoDTCAD: TDateField;
    cdsConsProdutoHRCAD: TTimeField;
    cdsConsProdutoCA: TStringField;
    cdsConsProdutoCOMPLEMENTO: TStringField;
    cdsConsProdutoID_NCM: TIntegerField;
    cdsConsProdutoORIGEM_PROD: TStringField;
    cdsConsProdutoOBS: TMemoField;
    cdsConsProdutoCODSITCF: TStringField;
    cdsConsProdutoPERC_REDUCAOICMS: TFloatField;
    cdsConsProdutoTIPO_VENDA: TStringField;
    cdsConsProdutoPERC_MARGEMLUCRO: TFloatField;
    cdsConsProdutoUNIDADE: TStringField;
    cdsConsProdutoDT_ALTPRECO: TDateField;
    cdsConsProdutoLOCALIZACAO: TStringField;
    cdsConsProdutoID_GRUPO: TIntegerField;
    cdsConsProdutoID_SUBGRUPO: TIntegerField;
    cdsConsProdutoID_MARCA: TIntegerField;
    cdsConsProdutoID_FORNECEDOR: TIntegerField;
    cdsConsProdutoPERC_IMPORTACAO: TFloatField;
    cdsConsProdutoCOD_ANT: TStringField;
    cdsConsProdutoPERC_REDUCAOICMSSUBST: TFloatField;
    cdsConsProdutoUSA_GRADE: TStringField;
    cdsConsProdutoID_GRADE: TIntegerField;
    cdsConsProdutoUSA_PERC_IMP_INTERESTADUAL: TStringField;
    cdsConsProdutoIMPRIMIR_ETIQUETA_NAV: TStringField;
    cdsConsProdutoCARIMBO: TStringField;
    cdsConsProdutoPERC_QUEBRAMAT: TFloatField;
    cdsConsProdutoSPED_TIPO_ITEM: TStringField;
    cdsConsProdutoQTD_ESTOQUE_MIN: TFloatField;
    cdsConsProdutoPERC_PIS: TFloatField;
    cdsConsProdutoPERC_COFINS: TFloatField;
    cdsConsProdutoPERC_ICMS_IMP: TFloatField;
    cdsConsProdutoPERC_IPI_IMP: TFloatField;
    cdsConsProdutoREFERENCIA_PADRAO: TStringField;
    cdsConsProdutoNUM_FCI: TStringField;
    cdsConsProdutoPERC_USADO_FCI: TFloatField;
    cdsConsProdutoNCM_EX: TStringField;
    cdsConsProdutoID_SITTRIB_CF: TIntegerField;
    cdsConsProdutoID_CLIENTE: TIntegerField;
    cdsConsProdutoPRECO_REVENDA: TFMTBCDField;
    cdsConsProdutoPRECO_INDUSTRIALIZACAO: TFMTBCDField;
    cdsConsProdutoPRECO_CONSUMO: TFMTBCDField;
    cdsConsProdutoFOTO: TStringField;
    cdsConsProdutoREFERENCIA_SEQ: TIntegerField;
    cdsConsProdutoID_COR: TIntegerField;
    cdsConsProdutoCALCULAR_2_LADOS: TStringField;
    cdsConsProdutoPERC_VIDRO: TFloatField;
    cdsConsProdutoID_LINHA: TIntegerField;
    cdsConsProdutoID_CFOP_NFCE: TIntegerField;
    cdsConsProdutoUSA_PRECO_COR: TStringField;
    cdsConsProdutoUSA_COR: TStringField;
    cdsConsProdutoTRANSFER: TStringField;
    cdsConsProdutoPRECO_CUSTO_TOTAL: TFloatField;
    cdsConsProdutoID_CONTA_ORCAMENTO: TIntegerField;
    cdsConsProdutoID_LOCAL_ESTOQUE_PROD: TIntegerField;
    cdsConsProdutoPERC_COMISSAO: TFloatField;
    cdsConsProdutoID_ENQIPI: TIntegerField;
    cdsConsProdutoLANCA_LOTE_CONTROLE: TStringField;
    cdsConsProdutoCOD_CEST: TStringField;
    cdsConsProdutoPICTOGRAMA: TStringField;
    cdsConsProdutoPICTO_CABEDAL: TStringField;
    cdsConsProdutoPICTO_INTERIOR: TStringField;
    cdsConsProdutoPICTO_SOLA: TStringField;
    cdsConsProdutoCOD_PRODUTO_CLI: TStringField;
    cdsConsProdutoFILIAL: TIntegerField;
    cdsConsProdutoBAIXA_ESTOQUE_MAT: TStringField;
    cdsConsProdutoCOD_JUSTNEW: TIntegerField;
    cdsConsProdutoNOME_ORIGINAL: TStringField;
    cdsConsProdutoIMP_ROTULO: TStringField;
    cdsConsProdutoNUM_MS: TStringField;
    cdsConsProdutoIMP_CONSUMO_NFE: TStringField;
    cdsConsProdutoGERAR_FCI: TStringField;
    cdsConsProdutoMEDIDA: TStringField;
    cdsConsProdutoQTD_EMBALAGEM: TFloatField;
    cdsConsProdutoDT_ALT_PRECOCUSTO: TDateField;
    cdsConsProdutoUSA_CARIMBO_OC: TStringField;
    cdsConsProdutoUSA_NA_BALANCA: TStringField;
    cdsConsProdutoMENSAGEM: TStringField;
    cdsConsProdutoPERC_DESC_MAX: TFloatField;
    cdsConsProdutoID_CSTICMS_BRED: TIntegerField;
    cdsConsProdutoTIPO_MAT: TStringField;
    cdsConsProdutoID_PROCESSO_GRUPO: TIntegerField;
    cdsConsProdutoTIPO_PRODUCAO: TStringField;
    cdsConsProdutoCRIADO_OS: TStringField;
    cdsConsProdutoID_MATERIAL_CRU: TIntegerField;
    cdsConsProdutoID_FORMA: TIntegerField;
    cdsConsProdutoTAMANHO: TStringField;
    cdsConsProdutoTESTE: TStringField;
    cdsConsProdutoPRECO_LIQ: TFloatField;
    cdsConsProdutoUSA_CLIQ: TStringField;
    cdsConsProdutoQTD_PECA_EMB: TIntegerField;
    cdsConsProdutoLARGURA: TFloatField;
    cdsConsProdutoALTURA: TFloatField;
    cdsConsProdutoESPESSURA: TFloatField;
    cdsConsProdutoMULTIPLICADOR: TFloatField;
    cdsConsProdutoREF2: TStringField;
    cdsConsProdutoFATOR_CALCULO: TFloatField;
    cdsConsProdutoREF_ORD: TStringField;
    cdsConsProdutoGERAR_WEB: TStringField;
    cdsConsProdutoTAM_CALC: TFloatField;
    cdsConsProdutoCOD_BARRA2: TStringField;
    cdsConsProdutoPOSSUE_LADO: TStringField;
    cdsConsProdutoUNIDADE2: TStringField;
    cdsConsProdutoCAIXINHA: TStringField;
    cdsConsProdutoSEPARA_COR: TStringField;
    cdsConsProdutoVALIDADE: TSmallintField;
    cdsConsProdutoID_CSTICMS: TIntegerField;
    cdsConsProdutoNOME_MODELO: TStringField;
    cdsConsProdutoDESC_MAXIMO: TFloatField;
    cdsConsProdutoQTD_POR_ROTULO: TFloatField;
    cdsConsProdutoPERC_ICMS_NFCE: TFloatField;
    cdsConsProdutoTIPO_ALGODAO: TStringField;
    cdsConsProdutoCALCULAR_ST: TStringField;
    cdsConsProdutoPRECO_CUSTO_ANT: TFloatField;
    cdsConsProdutoTIPO: TStringField;
    cdsConsProdutoCODIGO: TStringField;
    cdsConsProdutoNIVEL: TIntegerField;
    cdsConsProdutoSUPERIOR: TStringField;
    cdsConsProdutoCOD_PRINCIPAL: TIntegerField;
    cdsConsProdutoTIPO_PROD: TStringField;
    sdsCupomParametrosSOLICITA_CPF: TStringField;
    cdsCupomParametrosSOLICITA_CPF: TStringField;
    ACBrValidador: TACBrValidador;
    sdsCupom_ItensQTD_DEVOLVIDA: TFloatField;
    sdsCupom_ItensVLR_ICMS_SUBSTITUTO: TFloatField;
    cdsCupom_ItensQTD_DEVOLVIDA: TFloatField;
    cdsCupom_ItensVLR_ICMS_SUBSTITUTO: TFloatField;
    sdsCupomParametrosTIPO_TOTAL_ROD: TStringField;
    sdsCupomParametrosESTOQUE_CUPOM: TStringField;
    cdsCupomParametrosTIPO_TOTAL_ROD: TStringField;
    cdsCupomParametrosESTOQUE_CUPOM: TStringField;
    sdsCupomParametrosID_TIPOCOBRANCA_PADRAO: TIntegerField;
    cdsCupomParametrosID_TIPOCOBRANCA_PADRAO: TIntegerField;
    sdsCupomFiscal_FormaPgto: TSQLDataSet;
    cdsCupomFiscal_FormaPgto: TClientDataSet;
    dsCupomFiscal_FormaPgto: TDataSource;
    sdsCupomFiscal_FormaPgtoID: TIntegerField;
    sdsCupomFiscal_FormaPgtoITEM: TIntegerField;
    sdsCupomFiscal_FormaPgtoID_TIPOCOBRANCA: TIntegerField;
    sdsCupomFiscal_FormaPgtoVALOR: TFloatField;
    cdsCupomFiscalsdsCupomFiscal_FormaPgto: TDataSetField;
    cdsCupomFiscal_FormaPgtoID: TIntegerField;
    cdsCupomFiscal_FormaPgtoITEM: TIntegerField;
    cdsCupomFiscal_FormaPgtoID_TIPOCOBRANCA: TIntegerField;
    cdsCupomFiscal_FormaPgtoVALOR: TFloatField;
    sdsCupomFiscal_FormaPgtoTIPO_PGTO: TStringField;
    cdsCupomFiscal_FormaPgtoTIPO_PGTO: TStringField;
    cdsTipoCobrancaFORMA_PGTO: TStringField;
    sdsCupom_ItensCOD_CBENEF: TStringField;
    cdsCupom_ItensCOD_CBENEF: TStringField;
    AdvPanelStyler1: TAdvPanelStyler;
    sdsTroca: TSQLDataSet;
    dspTroca: TDataSetProvider;
    cdsTroca: TClientDataSet;
    dsTroca: TDataSource;
    sdsTrocaID: TIntegerField;
    sdsTrocaDTEMISSAO: TDateField;
    sdsTrocaCLIENTE_NOME: TStringField;
    sdsTrocaITEM: TIntegerField;
    sdsTrocaID_PRODUTO: TIntegerField;
    sdsTrocaREFERENCIA: TStringField;
    sdsTrocaNOME_PRODUTO: TStringField;
    sdsTrocaQTD: TFloatField;
    sdsTrocaVLR_UNITARIO: TFloatField;
    sdsTrocaVLR_TOTAL: TFloatField;
    sdsTrocaVLR_DESCONTO: TFloatField;
    sdsTrocaNUMCUPOM: TIntegerField;
    sdsTrocaSERIE: TStringField;
    cdsTrocaID: TIntegerField;
    cdsTrocaDTEMISSAO: TDateField;
    cdsTrocaCLIENTE_NOME: TStringField;
    cdsTrocaITEM: TIntegerField;
    cdsTrocaID_PRODUTO: TIntegerField;
    cdsTrocaREFERENCIA: TStringField;
    cdsTrocaNOME_PRODUTO: TStringField;
    cdsTrocaQTD: TFloatField;
    cdsTrocaVLR_UNITARIO: TFloatField;
    cdsTrocaVLR_TOTAL: TFloatField;
    cdsTrocaVLR_DESCONTO: TFloatField;
    cdsTrocaNUMCUPOM: TIntegerField;
    cdsTrocaSERIE: TStringField;
    sdsCupomFiscalVLR_TROCA: TFloatField;
    cdsCupomFiscalVLR_TROCA: TFloatField;
    sdsCupom_Troca: TSQLDataSet;
    dspCupom_Troca: TDataSetProvider;
    cdsCupom_Troca: TClientDataSet;
    dsCupom_Troca: TDataSource;
    sdsCupom_TrocaID: TIntegerField;
    sdsCupom_TrocaITEM: TIntegerField;
    sdsCupom_TrocaID_CUPOM: TIntegerField;
    sdsCupom_TrocaID_CUPOM_TROCA: TIntegerField;
    sdsCupom_TrocaITEM_TROCA: TIntegerField;
    sdsCupom_TrocaID_PRODUTO: TIntegerField;
    sdsCupom_TrocaQTD: TFloatField;
    sdsCupom_TrocaVLR_UNITARIO: TFloatField;
    sdsCupom_TrocaVLR_TOTAL: TFloatField;
    cdsCupom_TrocaID: TIntegerField;
    cdsCupom_TrocaITEM: TIntegerField;
    cdsCupom_TrocaID_CUPOM: TIntegerField;
    cdsCupom_TrocaID_CUPOM_TROCA: TIntegerField;
    cdsCupom_TrocaITEM_TROCA: TIntegerField;
    cdsCupom_TrocaID_PRODUTO: TIntegerField;
    cdsCupom_TrocaQTD: TFloatField;
    cdsCupom_TrocaVLR_UNITARIO: TFloatField;
    cdsCupom_TrocaVLR_TOTAL: TFloatField;
    sdsCFOP_VariacaoCOD_BENEF: TStringField;
    cdsCFOP_VariacaoCOD_BENEF: TStringField;
    cdsProdutoCOD_BENEF: TStringField;
    cdsTab_NCMCOD_BENEF: TStringField;
    qPessoa_Fiscal: TSQLQuery;
    qPessoa_FiscalCODIGO: TIntegerField;
    qPessoa_FiscalIPI_SUSPENSO: TStringField;
    qPessoa_FiscalIPI_DT_INICIO: TDateField;
    qPessoa_FiscalIPI_DT_FINAL: TDateField;
    qPessoa_FiscalIPI_OBS: TStringField;
    qPessoa_FiscalIPI_ID_CSTIPI: TIntegerField;
    qPessoa_FiscalPIS_SUSPENSO: TStringField;
    qPessoa_FiscalPIS_DT_INICIO: TDateField;
    qPessoa_FiscalPIS_DT_FINAL: TDateField;
    qPessoa_FiscalPIS_OBS: TStringField;
    qPessoa_FiscalPIS_ID_PIS: TIntegerField;
    qPessoa_FiscalPIS_ID_COFINS: TIntegerField;
    qPessoa_FiscalDESC_SUFRAMA_PIS_COFINS: TStringField;
    qPessoa_FiscalDESC_SUFRAMA_ICMS: TStringField;
    qPessoa_FiscalDESC_SUFRAMA_IPI: TStringField;
    qPessoa_FiscalOBS_LEI_SUFRAMA: TStringField;
    qPessoa_FiscalOBS_LEI_DADOS_ADICIONAIS: TStringField;
    qPessoa_FiscalID_CST_ICMS_SUFRAMA: TIntegerField;
    qPessoa_FiscalID_CST_PIS_COFINS_SUFRAMA: TIntegerField;
    qPessoa_FiscalID_CST_IPI_SUFRAMA: TIntegerField;
    qPessoa_FiscalID_ENQIPI_SUFRAMA: TIntegerField;
    qPessoa_FiscalID_ENQIPI: TIntegerField;
    qPessoa_FiscalID_CST_ICMS: TIntegerField;
    qPessoa_FiscalID_CST_ICMS_SUFRAMA_ST: TIntegerField;
    qPessoa_FiscalDRAW_OBS: TStringField;
    qPessoa_FiscalDRAW_ID_PIS_COFINS: TIntegerField;
    qPessoa_FiscalDRAW_ID_IPI: TIntegerField;
    qPessoa_FiscalDRAW_ENQIPI: TIntegerField;
    qPessoa_FiscalDRAW_PERC_DESCONTO: TFloatField;
    qPessoa_FiscalDRAW_POSSUI: TStringField;
    qPessoa_FiscalCAE_1: TStringField;
    qPessoa_FiscalCAE_2: TStringField;
    qPessoa_FiscalCAE_3: TStringField;
    qPessoa_FiscalCOD_BENEF: TStringField;
    qPessoa_FiscalOPCAO_DIFERIMENTO: TStringField;
    qPessoa_FiscalCOD_IPI: TStringField;
    qPessoa_FiscalCOD_PIS: TStringField;
    qPessoa_FiscalCOD_COFINS: TStringField;
    sdsCupom_TrocaNUM_CUPOM_TROCA: TIntegerField;
    sdsCupom_TrocaSERIE_TROCA: TStringField;
    cdsCupom_TrocaNUM_CUPOM_TROCA: TIntegerField;
    cdsCupom_TrocaSERIE_TROCA: TStringField;
    cdsCupom_TrocaclNome_Produto: TStringField;
    qProd: TSQLQuery;
    qProdID: TIntegerField;
    qProdNOME: TStringField;
    qProdREFERENCIA: TStringField;
    cdsTipoCobrancaTROCA: TStringField;
    cdsCupom_ConsVLR_TROCA: TFloatField;
    sdsCupomParametrosGERAR_ESTOQUE_TROCA: TStringField;
    cdsCupomParametrosGERAR_ESTOQUE_TROCA: TStringField;
    sdsCupom_TrocaID_MOVESTOQUE: TIntegerField;
    cdsCupom_TrocaID_MOVESTOQUE: TIntegerField;
    qProdUNIDADE: TStringField;
    sdsCupom_ItensQTD_TROCA: TFloatField;
    cdsCupom_ItensQTD_TROCA: TFloatField;
    cdsComandaRelFILIAL: TIntegerField;
    cdsComandaRelVLR_TOTAL: TFloatField;
    cdsComandaRelNUM_CARTAO: TSmallintField;
    dsComandaRelMestre: TDataSource;
    cdsComandaRelsdsComandaItem_Rel: TDataSetField;
    spAtualizaComanda: TSQLStoredProc;
    sdsCupomFiscalCOPIADO: TStringField;
    cdsCupomFiscalCOPIADO: TStringField;
    mCupomItensItem: TIntegerField;
    cdsComandaItem_RelITEM: TIntegerField;
    sdsCupom_ItensID_COMANDA: TIntegerField;
    sdsCupom_ItensITEM_COMANDA: TIntegerField;
    cdsCupom_ItensID_COMANDA: TIntegerField;
    cdsCupom_ItensITEM_COMANDA: TIntegerField;
    mCupomItensID_CUPOM: TIntegerField;
    sdsCupomParametrosMOSTRAR_TELA_FECHAMENTO: TStringField;
    cdsCupomParametrosMOSTRAR_TELA_FECHAMENTO: TStringField;
    frxCupom_Cons: TfrxDBDataset;
    sdsCupomParametrosMOSTRAR_MATERIAL: TStringField;
    cdsCupomParametrosMOSTRAR_MATERIAL: TStringField;
    sdsCupomParametrosIMPRESSORA_COZINHA: TStringField;
    sdsCupomParametrosIMPRESSORA_COPA: TStringField;
    cdsCupomParametrosIMPRESSORA_COZINHA: TStringField;
    cdsCupomParametrosIMPRESSORA_COPA: TStringField;
    sdsTotal_FormaPagto: TSQLDataSet;
    dspTotal_FormaPagto: TDataSetProvider;
    cdsTotal_FormaPagto: TClientDataSet;
    dsTotal_FormaPagto: TDataSource;
    cdsTotal_FormaPagtoNOME: TStringField;
    cdsTotal_FormaPagtoVALOR: TFloatField;
    cdsCupom_ItensclValorTotalDesconto: TFloatField;
    cdsCupom_ConsVLR_PRODUTOS: TFloatField;
    cdsCupom_ConsVLR_DESCONTO: TFloatField;
    cdsCupom_ConsBASE_ICMSSUBST_RET: TFloatField;
    cdsCupom_ConsVLR_ICMSSUBST_RET: TFloatField;
    sdsConsCupom_FormaPagto: TSQLDataSet;
    dspConsCupom_FormaPagto: TDataSetProvider;
    cdsConsCupom_FormaPagto: TClientDataSet;
    dsConsCupom_FormaPagto: TDataSource;
    cdsConsCupom_FormaPagtoID: TIntegerField;
    cdsConsCupom_FormaPagtoITEM: TIntegerField;
    cdsConsCupom_FormaPagtoID_TIPOCOBRANCA: TIntegerField;
    cdsConsCupom_FormaPagtoVALOR: TFloatField;
    cdsConsCupom_FormaPagtoTIPO_PGTO: TStringField;
    cdsConsCupom_FormaPagtoNOME_TIPOCOBRANCA: TStringField;
    qParametros_GeralUSAR_PESSOA_FILIAL: TStringField;
    cdsConsProdutoCOD_BENEF: TStringField;
    cdsConsProdutoQTDGERAL: TFloatField;
    sdsCupomParametrosUSA_TROCO: TStringField;
    cdsCupomParametrosUSA_TROCO: TStringField;
    sdsCupomFiscalVLR_RECIBO_TROCA: TFloatField;
    cdsCupomFiscalVLR_RECIBO_TROCA: TFloatField;
    sds_prc_Recibo_Troca: TSQLDataSet;
    sdsCupomFiscalID_RECIBO_TROCA: TIntegerField;
    cdsCupomFiscalID_RECIBO_TROCA: TIntegerField;
    sdsCupomParametrosGERAR_MOV_TROCA: TStringField;
    cdsCupomParametrosGERAR_MOV_TROCA: TStringField;
    cdsTipoCobrancaRECIBO_TROCA: TStringField;
    sdsCupomFiscalVLR_RECIBO_USADO: TFloatField;
    cdsCupomFiscalVLR_RECIBO_USADO: TFloatField;
    cdsCupom_ConsVLR_RECIBO_TROCA: TFloatField;
    cdsCupom_ConsID_RECIBO_TROCA: TIntegerField;
    cdsCupom_ConsVLR_RECIBO_USADO: TFloatField;
    sdsCupom_ItensVALOR_RATEIO_RECIBO: TFloatField;
    cdsCupom_ItensVALOR_RATEIO_RECIBO: TFloatField;
    sdsCupom_ItensVALOR_RATEIO_TROCA: TFloatField;
    cdsCupom_ItensVALOR_RATEIO_TROCA: TFloatField;
    sdsCupom_ItensVALOR_RATEIO_RECIBO_TROCA: TFloatField;
    cdsCupom_ItensVALOR_RATEIO_RECIBO_TROCA: TFloatField;
    sdsCupomFiscalVLR_TROCA_USADA: TFloatField;
    cdsCupomFiscalVLR_TROCA_USADA: TFloatField;
    cdsCupom_ConsVLR_TROCA_USADA: TFloatField;
    sqlConsulta: TSQLQuery;
    sdsParametrosGeralEMPRESA_VAREJO: TStringField;
    cdsParametrosGeralEMPRESA_VAREJO: TStringField;
    sdsCupomParametrosAUTENTICA_USUARIO: TStringField;
    cdsCupomParametrosAUTENTICA_USUARIO: TStringField;
    cdsListaItemAnalitico: TClientDataSet;
    cdsListaItemAnaliticoID: TIntegerField;
    cdsListaItemAnaliticoNome: TStringField;
    cdsListaItemAnaliticoUN: TStringField;
    cdsListaItemAnaliticoValorUnitario: TFloatField;
    cdsListaItemAnaliticoValorDesconto: TFloatField;
    cdsListaItemAnaliticoValorTotal: TFloatField;
    cdsListaItemAnaliticoQtde: TFloatField;
    cdsListaItemAnaliticoReferencia: TStringField;
    FrxItemAnalitico: TfrxDBDataset;
    sdsPRC_GRAVA_PESSOA_LOG: TSQLDataSet;
    qParametros_GeralUSA_NFCE_LOCAL: TStringField;
    qParametros_GeralESTACAO_SERVIDOR_NFCE: TStringField;
    spPrc_Recibo_Vale: TSQLStoredProc;
    cdsTipoCobrancaVALE_PRESENTE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mCupomBeforeDelete(DataSet: TDataSet);
    procedure cdsPedidoCalcFields(DataSet: TDataSet);
    procedure cdsCupomFiscalBeforePost(DataSet: TDataSet);
    procedure cdsCupomFiscalNewRecord(DataSet: TDataSet);
    procedure cdsParametrosBeforePost(DataSet: TDataSet);
    procedure cdsCupomFiscalReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsCupom_TrocaCalcFields(DataSet: TDataSet);
    procedure cdsCupom_ItensCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    ctCupomFiscal: String;
    ctPessoa : string;
    f: TextFile;
    vQtdParcelas: Word;

    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
    procedure prc_Gravar_Financeiro(Tipo: String);//ENT=Entrada   AVI= Avista
    procedure prc_ControleParcelas(vVlrParcelado, vVlrTxJuros: Real; vQtdParc: Word);
    procedure Gravar_CupomFiscalParc(Data: TDateTime; Valor: Real; ID_TipoCobranca : Integer);

  public
    { Public declarations }
    ctCondPgto, ctProduto, ctConsProduto : String;
    ctCupomFiscal_ProdPrincipal: String;
    ctTroca : String;
    ctConsCupom : String;
    ctPedido, ctDuplicata: String;
    ctTotais: string;
    ctTotal_FormaPagto: String;
    ctComandaRel: String;
    vPgtoEditado: Boolean;
    vSacolaSelecionada: Boolean;
    vVlrEntrada, vSomaParcelas, vSomaOriginal: Currency;
    vParcela : Integer;
    vID_TipoCobranca : Integer;

    vVale_Presente : Boolean;

    //27/07/2016
    vID_Fechamento: Integer;

    vClienteID: Integer;
    vID_Cupom_Pos_DM, vLinha, vPosicao: Integer;
    vID_Troca, vItem_Troca : Integer;
    vTipoCupom: String;
    vNumCartao: Integer;//para comanda restaurante
    vEncerrado, vCancelar: Boolean;
    vNome_Consumidor: String;
    ctqIBPT: String;
    vClienteConfirmado: Boolean;
    //NFCe
    vID_CFOP, vID_Variacao: Integer;
    vID_Pis, vID_Cofins: Integer;
    vTipo_Pis, vTipo_Cofins: String;
    vPerc_Pis, vPerc_Cofins: Real;
    vVlr_Pis, vVlr_Cofins: Real;
    vID_CSTICMS, vID_CSTIPI: Integer;
    vID_NCM: Integer;
    vPerc_ICMS, vPerc_IPI, vPerc_TribICMS : Real;
    vPerc_Trib_Efet, vPerc_ICMS_Efet: Real;
    vBase_ICMS_Efet : Real;
    vMotivoCancelamento: String;
    vDescricao_Operacao: String;
    vSair_Tela: Boolean;
    vBase_ICMS : Real;
    vVlr_ICMS : Real;
    vVlr_ICMS_Ret, vBase_ICMS_Ret, vVlr_ICMS_Efet : Real;
    vQtd_Troca : Real;
    vIdCombinacao: Integer;
    vTamanho, vCombinacao: String;
    vDataEntrada: TDateTime;
    vCondicaoPgto : Integer;
    vConverter_NFCe : Boolean;
    vAceita_Converter : Boolean;
    //***

    procedure Gerar_Parcelas(vVlrParcelado, vTxJuros: Real;vQtdParc: Word);
    procedure prcInserir(vId, vClienteId: Integer ; Serie : String);
    procedure prcExcluir;
    procedure prc_Excluir_Cupom_Fiscal(ID_Cupom : Integer ; Excluir : String = 'N');
    procedure prc_Gravar_Estoque_Movimento(ID_Cupom : Integer; Tipo : string);

    procedure prc_Gravar_Recibo_Troca(ID_Cupom : Integer; Nome : String );
    procedure prc_Gravar_Rateio_Recibo(ID_Cupom : Integer);
    procedure prc_Gravar_Rateio_Troca(ID_Cupom : Integer);
    procedure prc_Gravar_Rateio_Recibo_Troca(ID_Cupom : Integer);

    procedure prcNumNaoFiscal;
    procedure prcLocalizar(vId: Integer);
    function Gravar_Duplicata(Tipo, TransfICMS: String; Parcela: Integer; Valor: Real; Data: TDateTime; Prazo: String = ''): Integer;
                                                 //Tipo  P= Contas a Pagar   R= Contas a Receber
                                                 //Prazo = ENT=Entrada  AVI=Avista
    procedure Gravar_Dupicata_Hist(Tipo: String);
    procedure Abrir_cdsDuplicata(ID: Integer);
    procedure prc_Gravar_Comissao(Prazo: String = '');
    procedure prc_Gravar_Financeiro_Cupom(vParc: Byte; vValor: Currency);
    function lerIni(Tabela, Campo: String): String;

    procedure prc_Excluir_Financeiro;
    procedure prc_Excluir_Movimento;
    procedure Excluir_Duplicata;
    procedure Excluir_ExtComissao;

    procedure ImpNaoFiscalC(vTipo: String; vCod, vProd, vQtd, vVlrUnit, vVlrTot, vVlrDesc: String);
    procedure ImpNaoFiscalW(vTipo: String; vCod, vProd, vQtd, vVlrUnit, vVlrTot, vVlrDesc: String);
    procedure ChamaNaoFiscal(vId: Integer; vModelo: String);
    procedure SetDefaultPrinter(PrinterName: String);

    procedure ImpCarne(vTipo: String);
    procedure prc_Digita_Documento;

    function fnc_Buscar_Regra_CFOP(ID_CFOP: Integer): Integer;
    procedure prc_Mover_CST;

    procedure prc_Calcular_Tributos_Transparencia;
    procedure prc_Abrir_CSTICMS(Tipo: String);

    procedure Gravar_Envio_Nota(Recibo,NroProtocolo,ChaveAcesso: String; Finalidade, Ambiente,CodigoErro: Integer; DadosAdicionais: WideString);

    procedure prc_Abrir_CondPgto;

    procedure prc_Abrir_Cupom_ProdPrincipal(ID, Item: Integer);
    procedure prc_Abrir_Produto(vTipoCod, vCodigo: String);
    procedure prc_Excluir_CupomFiscal_MP;

    function fnc_IncrementaCartao(vTerminal: Integer): Integer;
    procedure prcGravaTransacao;

    procedure prc_Busca_IBPT;
    procedure prc_Busca_CodBenef;

    procedure prc_Localizar_Pessoa(vId: Integer ; vCNPJ_CPF : String);

    procedure prc_Calcular_Valor_Juros(Perc_Juros : Currency);
    procedure prc_Calcular_CondPagto(sender : TObject; vVlr_Pagto : Currency; vPercJuros : Currency = 0);
    procedure prc_Inserir_FormaPagto;
    procedure prc_Consultar_Troca(NumCupom, ID_Produto : Integer ; Serie,Referencia,Nome : String ; Data : TDateTime );
    procedure prc_Inserir_Troca;
    procedure prc_Atualiza_Comanda(ID_Cupom : Integer);
    procedure prc_Voltar_Comanda(ID_Cupom : Integer);
    procedure prc_Abrir_cdsVendedor;

    function fnc_Existe_Cartao_Pendente(Num_Cartao : Integer) : Integer;
    function prc_Lista_Preco(ID_Produto : Integer) : Boolean;

    procedure prc_Gravar_Log(ID : Integer ; Tipo : String); //I= Inserir   A= Alterar   E= Excluir

  end;

  //Funções Balança Urano
  function _AbrePortaSerial(Canal: String): Integer; stdcall; external 'LePeso.dll';
  function _FechaPortaSerial(): Integer; stdcall; external 'LePeso.dll';
  function _AlteraModeloBalanca(Modelo: Integer): Integer; stdcall; external 'LePeso.dll';
  function _AlteraModoOperacao(Modo: Integer): Integer; stdcall; external 'LePeso.dll';
  function _LePeso(): Pchar; stdcall; external 'LePeso.dll';

var
  dmCupomFiscal: TdmCupomFiscal;
  cAvanco: Word; //25

const
  IPula   = #13;       //Pula 1 linha
  IEspac1 = #27#48;    //Define espaçamento entre linhas de 1/8"
  IEspac2 = #27#49;    //Define espaçamento entre linhas de 7/72"
  IEspac3 = #27#50;    //Define espaçamento entre linhas de 1/6"
  IEject  = #12;       //Ejeta página
  I80car  = #27#80#18; //Imprime com 80 colunas
  I96car  = #27#77#18; //Imprime com 96 colunas
  I137car = #27#80#15; //Imprime com 137 colunas
  I160car = #27#77#15; //Imprime com 160 colunas
  IDuploG = #27#14#18; //Imprime em caracter grande largura dupla
  IDuploP = #27#14#15; //Imprime em caracter pequeno largura dupla
  IDuploC = #27#20;    //Cancela largura dupla
  INegAti = #27#71;    //Imprime em negrito
  INegDes = #27#72;    //Cancela modo negrito
  IItaAti = #27#52;    //Imprime em Itálico
  IItaDes = #27#53;    //Cancela modo Itálico

implementation

uses DmdDatabase, uImpFiscal_Bematech, uImpFiscal_Daruma, uUtilDaruma, uUtilBematech, LogProvider,
  uGrava_Erro, uCupomFiscalParcela, USel_Produto_Preco;

{$R *.dfm}

{ TdmCupomFiscal }

procedure TdmCupomFiscal.prcInserir(vId, vClienteId: Integer ; Serie : String);
var
  vAux: Integer;
begin
  if not cdsCupomFiscal.Active then
    prcLocalizar(-1);
  vAux := dmDatabase.ProximaSequencia('CUPOMFISCAL',0);

  cdsCupomFiscal.Insert;
  cdsCupomFiscalID.AsInteger          := vAux;
  cdsCupomFiscalDTEMISSAO.AsDateTime  := Date;
  cdsCupomFiscalHREMISSAO.AsDateTime  := Now;
  cdsCupomFiscalCANCELADO.AsString    := 'N';
  cdsCupomFiscalBASE_ICMS.AsFloat     := 0;
  cdsCupomFiscalVLR_ICMS.AsFloat      := 0;
  cdsCupomFiscalVLR_PIS.AsFloat       := 0;
  cdsCupomFiscalVLR_COFINS.AsFloat    := 0;
  cdsCupomFiscalVLR_PRODUTOS.AsFloat  := 0;
  cdsCupomFiscalVLR_DESCONTO.AsFloat  := 0;
  cdsCupomFiscalVLR_TOTAL.AsFloat     := 0;
  cdsCupomFiscalVLR_RECEBIDO.AsFloat  := 0;
  cdsCupomFiscalVLR_TROCO.AsFloat     := 0;
  cdsCupomFiscalID_CONDPGTO.AsInteger := 0;

  cdsCupomFiscalBASE_ICMSSUBST_RET.AsFloat := 0;
  cdsCupomFiscalVLR_ICMSSUBST_RET.AsFloat  := 0;
  cdsCupomFiscalVLR_BASE_EFET.AsFloat      := 0;
  cdsCupomFiscalVLR_ICMS_EFET.AsFloat      := 0;

  cdsCupomFiscalID_CONTA.AsInteger    := cdsParametrosID_CONTA_FECHAMENTO.AsInteger;
  cdsCupomFiscalFILIAL.AsInteger      := cdsFilialID.AsInteger;
  cdsCupomFiscalTIPO_PGTO.AsString    := 'V';
  cdsCupomFiscalID_CLIENTE.AsInteger  := vClienteId;
  cdsCupomFiscalQTD_PESSOA.AsInteger  := 1;
  cdsCupomFiscalTERMINAL_ID.AsInteger := vTerminal;
  cdsCupomFiscalID_LOCALESTOQUE.AsInteger := vLocalEstoque;
  cdsCupomFiscalNUMCUPOM.AsInteger    := 0;

  if cdsCupomParametrosREPETE_VENDEDOR.AsString = 'S' then
    cdsCupomFiscalID_VENDEDOR.AsInteger := vId_Vendedor;

  if cdsParametrosGRAVAR_CONSUMO_NOTA.AsString = 'S' then
    prc_Abrir_Cupom_ProdPrincipal(cdsCupomFiscalID.AsInteger,0);

  if cdsParametrosUSA_NFCE.AsString = 'S' then
  begin
    cdsCupomFiscalTIPO.AsString := 'NFC';
    if cdsCupomParametrosCAIXA_NUMERA_COMANDA.AsString = 'S' then
      cdsCupomFiscalNUM_CARTAO.AsInteger := fnc_IncrementaCartao(vTerminal);
    cdsCupomFiscalID_CLIENTE.AsInteger := vClienteID;
    cdsCupomFiscalTIPO_DESTINO_OPERACAO.AsInteger := 1;
    cdsCupomFiscalTIPO_ATENDIMENTO.AsInteger := 1;
    cdsCupomFiscalTIPO_ENVIONFE.AsString := '1-NORMAL';
    if Serie <> EmptyStr then
      cdsCupomFiscalSERIE.AsString := Serie
    else
      cdsCupomFiscalSERIE.AsString := cdsFilialSERIE_NFCE.AsString;
  end
  else
  begin
//---------------TROCAR IMPRESSORA
    case cdsParametrosIMPRESSORA_FISCAL.AsInteger of
      5:
        begin
          prcNumNaoFiscal;
          cdsCupomFiscalTIPO.AsString  := 'CNF';
          cdsCupomFiscalSERIE.AsString := Serie;
          if cdsCupomParametrosCAIXA_NUMERA_COMANDA.AsString = 'S' then
            cdsCupomFiscalNUM_CARTAO.AsInteger := fnc_IncrementaCartao(vTerminal);
        end;
      6:
        begin
          prcNumNaoFiscal;
          cdsCupomFiscalTIPO.AsString := 'CNF';
          cdsCupomFiscalSERIE.AsString := Serie;
          if cdsCupomParametrosCAIXA_NUMERA_COMANDA.AsString = 'S' then
            cdsCupomFiscalNUM_CARTAO.AsInteger := fnc_IncrementaCartao(vTerminal);
        end;
    end;
  end;

  if cdsCupomFiscal.State in [dsInsert] then
  begin
    cdsCupomFiscal.Post;
    cdsCupomFiscal.ApplyUpdates(0);
    cdsCupomFiscal.Edit;
  end;

end;

procedure TdmCupomFiscal.prcLocalizar(vId: Integer);
begin
  cdsCupomFiscal.Close;
  sdsCupomFiscal.CommandText := ctCupomFiscal;
  if vId <> 0 then
    sdsCupomFiscal.CommandText := sdsCupomFiscal.CommandText + ' WHERE CF.ID = ' + IntToStr(vId);
  prc_Abrir_CSTICMS(cdsFilialSIMPLES.AsString);
  cdsCupomFiscal.Open;
  cdsCupom_Itens.Close;
  cdsCupom_Itens.Open;
end;

procedure TdmCupomFiscal.DataModuleCreate(Sender: TObject);
var
  i, x: Word;
  vIndices: string;
  aIndices: array of string;
begin
  ctCupomFiscal := sdsCupomFiscal.CommandText;
  ctPessoa := sdsPessoa.CommandText;
  ctCupomFiscal_ProdPrincipal := sdsCupomFiscal_ProdPrincipal.CommandText;;
  ctCondPgto    := sdsCondPgto.CommandText;
  ctPedido      := sdsPedido.CommandText;
  ctqIBPT       := qIBPT.SQL.Text;
  ctProduto     := sdsProduto.CommandText;
  ctConsProduto := sdsConsProduto.CommandText;
  ctDuplicata   := sdsDuplicata.CommandText;
  ctTotais      := sdsTotais.CommandText;
  ctTotal_FormaPagto := sdsTotal_FormaPagto.CommandText;
  ctConsCupom        := sdsCupom_Cons.CommandText;
  ctTroca            := sdsTroca.CommandText;
  ctComandaRel       := sdsComandaRel.CommandText;
  vAceita_Converter  := False;

  cdsFilial.Open;
  cdsTipoCobranca.Open;
  cdsParametros.Open;
  cdsCupomParametros.Open;
  prc_Abrir_CondPgto;
  cdsSitTribCF.Open;
  cdsEnqIPI.Open;
  cdsTransp.Open;

  qParametros_Fin.Close;
  qParametros_Fin.Open;
  qParametros_Usuario.Close;
  qParametros_Usuario.ParamByName('USUARIO').AsString := vUsuario;
  qParametros_Usuario.Open;
  qParametros_Geral.Close;
  qParametros_Geral.Open;

  cAvanco := cdsCupomParametrosALTURA_SALTO_LINHA.AsInteger;
  cdsTab_Cofins.Open;
  cdsTab_Pis.Open;
  cdsTab_CSTIPI.Open;
  cdsTab_CSTICMS.Open;

  cdsCFOP.Open;
  cdsCFOP_Variacao.Close;
  cdsCFOP_Variacao.Open;
  cdsCFOP_Variacao.First;
  cdsOrigem_Prod.Open;
  cdsTab_NCM.Open;

  if cdsCupomParametrosUSA_BALANCA.AsString = 'S' then
  begin
    if vBalanca = 'ACBR' then
    begin
    end;
  end;

//*** Logs Implantado na versão
  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
//***********************
end;

procedure TdmCupomFiscal.Gravar_Dupicata_Hist(Tipo: String);
var
  vItemAux: Integer;
begin
  cdsDuplicata_Hist.Last;
  vItemAux := cdsDuplicata_HistITEM.AsInteger;
  vItemAux := vItemAux + 1;  
                          
  cdsDuplicata_Hist.Insert;
  cdsDuplicata_HistID.AsInteger               := cdsDuplicataID.AsInteger;
  cdsDuplicata_HistITEM.AsInteger             := vItemAux;
  cdsDuplicata_HistTIPO_HISTORICO.AsString    := 'ENT';
  cdsDuplicata_HistID_HISTORICO.AsInteger     := 0;
  cdsDuplicata_HistVLR_LANCAMENTO.AsFloat     := cdsDuplicataVLR_PARCELA.AsFloat;
  cdsDuplicata_HistVLR_JUROSPAGOS.AsFloat     := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicata_HistVLR_DESCONTOS.AsFloat      := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicata_HistVLR_DESPESAS.AsFloat       := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicata_HistVLR_DEVOLUCAO.AsFloat      := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicata_HistVLR_JUROSCALCULADO.AsFloat := StrToFloat(FormatFloat('0.00',0));
  if Tipo = 'ENT' then
  begin
    cdsDuplicata_HistCOMPLEMENTO.AsString  := 'ENTRADA DO TÍTULO';
    cdsDuplicata_HistVLR_PAGAMENTO.AsFloat := StrToFloat(FormatFloat('0.00',0));
  end
  else
  if Tipo = 'PAG' then
  begin
    cdsDuplicata_HistTIPO_HISTORICO.AsString      := 'PAG';
    cdsDuplicata_HistCOMPLEMENTO.AsString         := 'PAGAMENTO DO TÍTULO';
    cdsDuplicata_HistVLR_PAGAMENTO.AsFloat        := StrToFloat(FormatFloat('0.00',cdsDuplicataVLR_PARCELA.AsFloat));
    cdsDuplicata_HistID_FORMA_PAGAMENTO.AsInteger := cdsDuplicataID_TIPOCOBRANCA.AsInteger;
  end;
  cdsDuplicata_HistDTHISTORICO.AsDateTime  := Date;
  cdsDuplicata_HistDTLANCAMENTO.AsDateTime := cdsDuplicataDTEMISSAO.AsDateTime;
  cdsDuplicata_HistNUMCHEQUE.AsInteger     := 0;
  cdsDuplicata_HistDTPREVISAO_CHEQUE.Clear;
  if cdsDuplicataID_CONTA.AsInteger > 0 then
    cdsDuplicata_HistID_CONTA.AsInteger  := cdsDuplicataID_CONTA.AsInteger;
  cdsDuplicata_HistID_COMISSAO.AsInteger := 0;
  cdsDuplicata_HistTIPO_ES.AsString      := cdsDuplicataTIPO_ES.AsString;
  cdsDuplicata_Hist.Post;

  if Tipo = 'PAG' then
  begin
    if cdsCupomFiscalTIPO_PGTO.AsString = 'V' then
    begin
      prc_Gravar_Comissao('AVI');
      prc_Gravar_Financeiro('AVI');
    end
    else
    begin
      prc_Gravar_Comissao('ENT');
      prc_Gravar_Financeiro('ENT');
    end
  end;
end;

function TdmCupomFiscal.Gravar_Duplicata(Tipo, TransfICMS: String;
  Parcela: Integer; Valor: Real; Data: TDateTime; Prazo: String): Integer;
var
  vAux: Integer;
begin
  if not cdsDuplicata.Active then
    Abrir_cdsDuplicata(0);

  vAux := dmDatabase.ProximaSequencia('DUPLICATA',0);
  if Parcela = 0 then
    Prazo := 'ENT';

  cdsDuplicata.Insert;
  cdsDuplicataID.AsInteger := vAux;
  Result := cdsDuplicataID.AsInteger;
  if Tipo = 'R' then
    cdsDuplicataTIPO_ES.AsString := 'E'
  else
    cdsDuplicataTIPO_ES.AsString := 'S';
  cdsDuplicataFILIAL.AsInteger      := cdsCupomFiscalFILIAL.AsInteger;
  cdsDuplicataID_NOTA.AsInteger     := 0;
  cdsDuplicataID_CUPOM.AsInteger    := cdsCupomFiscalID.AsInteger;
  cdsDuplicataPARCELA.AsInteger     := Parcela;
  cdsDuplicataNUMDUPLICATA.AsString := cdsCupomFiscalNUMCUPOM.AsString;
  cdsDuplicataNUMNOTA.AsInteger     := cdsCupomFiscalNUMCUPOM.AsInteger;
  if cdsCupomFiscalTIPO.AsString = 'CNF' then
    cdsDuplicataSERIE.AsString := 'CNF'
  else
    cdsDuplicataSERIE.AsString := cdsCupomFiscalSERIE.AsString;
  cdsDuplicataDTVENCIMENTO.AsDateTime := Data;
  cdsDuplicataVLR_PARCELA.AsFloat     := StrToFloat(FormatFloat('0.00',Valor));
  cdsDuplicataVLR_RESTANTE.AsFloat    := StrToFloat(FormatFloat('0.00',Valor));
  cdsDuplicataVLR_PAGO.AsFloat        := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicataVLR_DEVOLUCAO.AsFloat   := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicataVLR_DESPESAS.AsFloat    := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicataVLR_DESCONTO.AsFloat    := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicataVLR_JUROSPAGOS.AsFloat  := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicataVLR_COMISSAO.AsFloat    := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicataPERC_COMISSAO.AsFloat   := StrToFloat(FormatFloat('0.00',cdsCupomFiscalPERC_VENDEDOR.AsFloat));
  cdsDuplicataPERC_COMISSAO.AsFloat   := StrToFloat(FormatFloat('0.00',0));
  cdsDuplicataDTULTPAGAMENTO.Clear;
  cdsDuplicataID_PESSOA.AsInteger     := cdsCupomFiscalID_CLIENTE.AsInteger;
  if cdsCupomFiscalID_VENDEDOR.AsInteger > 0 then
    cdsDuplicataID_VENDEDOR.AsInteger := cdsCupomFiscalID_VENDEDOR.AsInteger;
  cdsDuplicataPerc_Comissao.AsFloat   := cdsCupomFiscalPerc_Vendedor.AsFloat; 
  //if (Prazo = 'ENT') or ((Prazo = 'AVI') and (cdsParametrosQUITAR_AVISTA_AUT.AsString = 'S'))  then
  if ((Prazo = 'AVI') and (cdsParametrosQUITAR_AVISTA_AUT.AsString = 'S'))  then
  begin
    if cdsCupomFiscalID_CONTA.AsInteger > 0 then
    begin
      cdsDuplicataID_CONTA.AsInteger        := cdsCupomFiscalID_CONTA.AsInteger;
      cdsDuplicataID_CONTA_BOLETO.AsInteger := cdsCupomFiscalID_CONTA.AsInteger;
    end;

    if cdsCupom_ParcID_TIPOCOBRANCA.AsInteger > 0 then
      cdsDuplicataID_TIPOCOBRANCA.AsInteger := cdsCupom_ParcID_TIPOCOBRANCA.AsInteger;
    cdsDuplicataDTULTPAGAMENTO.AsDateTime := Date;
    cdsDuplicataVLR_RESTANTE.AsFloat      := StrToFloat(FormatFloat('0.00',0));
    cdsDuplicataVLR_PAGO.AsFloat          := StrToFloat(FormatFloat('0.00',Valor));
  end
  else
  begin
    if cdsCupomFiscalID_CONTA.AsInteger > 0 then
    begin
      cdsDuplicataID_CONTA.AsInteger        := cdsCupomFiscalID_CONTA.AsInteger;
      cdsDuplicataID_CONTA_BOLETO.AsInteger := cdsCupomFiscalID_CONTA.AsInteger;
    end;
    if cdsCupom_ParcID_TIPOCOBRANCA.AsInteger > 0 then
      cdsDuplicataID_TIPOCOBRANCA.AsInteger := cdsCupom_ParcID_TIPOCOBRANCA.AsInteger;
    if (Prazo = 'ENT') then
    begin
      cdsDuplicataDTULTPAGAMENTO.AsDateTime := Date;
      cdsDuplicataVLR_RESTANTE.AsFloat      := StrToFloat(FormatFloat('0.00',0));
      cdsDuplicataVLR_PAGO.AsFloat          := StrToFloat(FormatFloat('0.00',Valor));
    end;
  end;
  cdsDuplicataID_COMISSAO.AsInteger       := 0;
  cdsDuplicataQTD_DIASATRASO.AsInteger    := 0;
  cdsDuplicataDTRECEBIMENTO_TITULO.Clear;
  cdsDuplicataDTEMISSAO.AsDateTime        := cdsCupomFiscalDTEMISSAO.AsDateTime;
  cdsDuplicataPAGO_CARTORIO.AsString      := 'N';
  cdsDuplicataPROTESTADO.AsString         := 'N';
  cdsDuplicataTIPO_LANCAMENTO.AsString    := 'CFI';
  cdsDuplicataARQUIVO_GERADO.AsString     := 'N';
  cdsDuplicataTRANSFERENCIA_ICMS.AsString := 'N';
  cdsDuplicataNOSSONUMERO.AsString        := '';
  cdsDuplicataDTFINANCEIRO.Clear;
  cdsDuplicataNUMCHEQUE.AsInteger         := 0;
  cdsDuplicataACEITE.AsString             := '';
  cdsDuplicataID_TERMINAL.AsInteger       := vTerminal;
  cdsDuplicataID_CONTA_ORCAMENTO.Clear;
  cdsDuplicataUSUARIO.AsString            := vUsuario;
  cdsDuplicata.Post;

  Gravar_Dupicata_Hist('ENT');
  if (Prazo = 'ENT') or ((Prazo = 'AVI') and (cdsParametrosQUITAR_AVISTA_AUT.AsString = 'S')) then
    Gravar_Dupicata_Hist('PAG');

  cdsDuplicata.ApplyUpdates(0);
end;

procedure TdmCupomFiscal.Abrir_cdsDuplicata(ID: Integer);
begin
  cdsDuplicata.Close;
  sdsDuplicata.CommandText := 'SELECT * FROM DUPLICATA WHERE ID = ' + IntToStr(ID);
  cdsDuplicata.Open;
end;

procedure TdmCupomFiscal.prc_Excluir_Financeiro;
var
  sds: TSQLDataSet;
begin
  if cdsCupomFiscalID.AsInteger <= 0 then
    exit;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'DELETE FROM FINANCEIRO WHERE ID_CUPOM = ' + IntToStr(cdsCupomFiscalID.AsInteger);
  sds.ExecSQL;

  FreeAndNil(sds);
end;

procedure TdmCupomFiscal.prc_Gravar_Comissao(Prazo: String);
var
  fDMCadExtComissao: TDMCadExtComissao;
  vAux: Integer;
  vVlrBase: Real;
  vID_Duplicata: Integer;
  vItem_Hist: Integer;
  vID_Nota: Integer;
  vParcela: Integer;
  vID_Cupom: Integer;
begin
  if (cdsCupomFiscalID_VENDEDOR.AsInteger > 0) and (cdsCupomFiscalPERC_VENDEDOR.AsCurrency = 0) then
  begin
    cdsVendedor.IndexFieldNames := 'CODIGO';
    cdsVendedor.FindKey([cdsCupomFiscalID_VENDEDOR.AsInteger]);
    cdsCupomFiscal.Edit;
    cdsCupomFiscalPERC_VENDEDOR.AsFloat := StrToFloat(FormatFloat('0.00',cdsVendedorPERC_COMISSAO_VEND.AsFloat));
    cdsCupomFiscal.Post;
    cdsCupomFiscal.ApplyUpdates(0);
  end;

  if (StrToFloat(FormatFloat('0.00',cdsCupomFiscalPERC_VENDEDOR.AsFloat)) <= 0) and
     (StrToFloat(FormatFloat('0.00',cdsCupomFiscalVLR_TOTAL.AsFloat)) > 0) then
    exit;

  if (cdsCupomFiscalID_VENDEDOR.AsInteger <= 0) or (cdsCupomFiscalID_VENDEDOR.IsNull) then
    exit;

  if not cdsVendedor.Locate('CODIGO',cdsCupomFiscalID_VENDEDOR.AsInteger,[loCaseInsensitive]) then
    exit;

  if Prazo <> 'AVI' then
  begin
    if ((cdsVendedorTIPO_COMISSAO.AsString <> 'N') and (Prazo = '')) then
      exit;
    if (cdsVendedorTIPO_COMISSAO.AsString <> 'N') then
      exit;
  end;

  if (cdsVendedorTIPO_COMISSAO.AsString = 'N') or (Prazo = 'AVI') then
  begin
    vID_Nota      := 0;
    vID_Cupom     := cdsCupomFiscalID.AsInteger;
    vID_Duplicata := 0;
    vParcela      := 0;
    vItem_Hist    := 0;
    vVlrBase      := cdsCupomFiscalVLR_TOTAL.AsFloat;
  end
  else
  if (cdsVendedorTIPO_COMISSAO.AsString = 'D') then
  begin
    vID_Nota      := 0;
    vID_Cupom     := 0;
    vID_Duplicata := cdsDuplicataID.AsInteger;
    vParcela      := cdsDuplicataPARCELA.AsInteger;
    vItem_Hist    := cdsDuplicata_HistITEM.AsInteger;
    vVlrBase      := cdsDuplicataVLR_PARCELA.AsFloat;
  end;

  fDMCadExtComissao := TDMCadExtComissao.Create(Self);

  try
    vAux := fDMCadExtComissao.fnc_Mover_Comissao(0,'ENT','CFI','',0,cdsCupomFiscalDTEMISSAO.AsDateTime,
                                                   cdsCupomFiscalFILIAL.AsInteger,cdsCupomFiscalID_VENDEDOR.AsInteger,
                                                   vID_Nota,vID_Duplicata,vItem_Hist,cdsCupomFiscalNUMCUPOM.AsInteger,
                                                   cdsCupomFiscalID_CLIENTE.AsInteger,vParcela,0,0,vID_Cupom,
                                                   StrToFloat(FormatFloat('0.00',vVlrBase)),0,
                                                   StrToFloat(FormatFloat('0.00',cdsCupomFiscalPerc_Vendedor.AsFloat)),0,0);
  finally
    FreeAndNil(fDMCadExtComissao);
  end;
end;

procedure TdmCupomFiscal.prc_Gravar_Financeiro(Tipo: String);
var
  fDMGravarFinanceiro: TDMGravarFinanceiro;
begin
  fDMGravarFinanceiro := TDMGravarFinanceiro.Create(Self);

  fDMGravarFinanceiro.vTipo_ES := 'E';
  if Tipo = 'ENT' then
  begin
    fDmGravarFinanceiro.vAutoQuitado     := 'S';
    fDMGravarFinanceiro.vHistorico_Compl := 'Recto.Entrada CF nº ' + cdsDuplicataNUMDUPLICATA.AsString +
                                            ' de ' +  cdsPessoaNOME.AsString;
  end
  else
  if Tipo = 'AVI' then
  begin
    fDmGravarFinanceiro.vAutoQuitado     := 'S';
    fDMGravarFinanceiro.vHistorico_Compl := 'Recto.A Vista CF nº ' + cdsDuplicataNUMDUPLICATA.AsString +
                                            ' de ' + cdsPessoaNOME.AsString;
  end;

  fDMGravarFinanceiro.vID_Conta           := cdsDuplicataID_CONTA.AsInteger;
  fDMGravarFinanceiro.vID_ModDuplicata    := cdsDuplicataID.AsInteger;
  fDMGravarFinanceiro.vItem_MovDuplicata  := cdsDuplicata_HistITEM.AsInteger;
  fDMGravarFinanceiro.vID_Historico       := 0;
  fDMGravarFinanceiro.vID_Pessoa          := cdsDuplicataID_PESSOA.AsInteger;
  fDMGravarFinanceiro.vID_Forma_Pagamento := cdsDuplicataID_TIPOCOBRANCA.AsInteger;
  fDMGravarFinanceiro.vID_ExtComissao     := 0;
  fDMGravarFinanceiro.vDtMovimento        := cdsDuplicata_HistDTLANCAMENTO.AsDateTime;
  fDMGravarFinanceiro.vVlr_Movimento      := StrToFloat(FormatFloat('0.00',cdsDuplicata_HistVLR_PAGAMENTO.AsFloat));
  fDMGravarFinanceiro.vID_Conta_Orcamento := cdsDuplicataID_CONTA_ORCAMENTO.AsInteger;

  fDMGravarFinanceiro.prc_Gravar;

  FreeAndNil(fDMGravarFinanceiro);
end;

procedure TdmCupomFiscal.prc_Gravar_Financeiro_Cupom(vParc: Byte; vValor: Currency);
var
  fDMGravarFinanceiro: TDMGravarFinanceiro;
  vNome: String;
  vID_Conta_Orcamento: Integer;
begin
  fDMGravarFinanceiro := TDMGravarFinanceiro.Create(Self);

  vNome := '';
  vID_Conta_Orcamento := 0;
  vNome := cdsPessoaNOME.AsString;
  vID_Conta_Orcamento := cdsPessoaCLIENTE_CONTA_ID.AsInteger;
  fDMGravarFinanceiro.vTipo_ES := 'E';
  fDMGravarFinanceiro.vHistorico_Compl := 'Recto. CF nº ' + cdsCupomFiscalNUMCUPOM.AsString;

  fDMGravarFinanceiro.vHistorico_Compl := fDMGravarFinanceiro.vHistorico_Compl + ' de ' + cdsPessoaNOME.AsString;

  if cdsCupomFiscalID_CONTA.AsInteger <= 0 then
    fDMGravarFinanceiro.vID_Conta := 1
  else
    fDMGravarFinanceiro.vID_Conta := cdsCupomFiscalID_CONTA.AsInteger;
  fDMGravarFinanceiro.vID_ModDuplicata    := 0;
  fDMGravarFinanceiro.vItem_MovDuplicata  := 0;
  fDMGravarFinanceiro.vID_Historico       := 0;
  fDMGravarFinanceiro.vID_Pessoa          := cdsCupomFiscalID_CLIENTE.AsInteger;

  cdsTipoCobranca.IndexFieldNames := 'ID';
  cdsTipoCobranca.FindKey([cdsCupomFiscal_FormaPgtoID_TIPOCOBRANCA.AsInteger]);
//  if cdsTipoCobrancaFATURAMENTO_BRUTO.AsString = 'N' then
//    fDMGravarFinanceiro.vID_Conta := cdsCupomParametrosID_CONTAPERDAS.AsInteger;

  fDMGravarFinanceiro.vID_Forma_Pagamento := cdsCupomFiscal_FormaPgtoID_TIPOCOBRANCA.AsInteger;
  fDMGravarFinanceiro.vID_ExtComissao     := 0;
  fDMGravarFinanceiro.vDtMovimento        := cdsCupomFiscalDTEMISSAO.AsDateTime;
  fDMGravarFinanceiro.vVlr_Movimento      := StrToFloat(FormatFloat('0.00',cdsCupomFiscal_FormaPgtoVALOR.AsFloat));
  fDMGravarFinanceiro.vID_Conta_Orcamento := vID_Conta_Orcamento;
  fDMGravarFinanceiro.vID_Cupom           := cdsCupomFiscalID.AsInteger;
  fDMGravarFinanceiro.vID_Fechamento      := cdsCupomFiscalID_FECHAMENTO.AsInteger;
  fDMGravarFinanceiro.prc_Gravar;

  FreeAndNil(fDMGravarFinanceiro);
end;

procedure TdmCupomFiscal.Excluir_Duplicata;
var
  sds: TSQLDataSet;
begin
  if cdsCupomFiscalID.AsInteger <= 0 then
    exit;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'DELETE FROM DUPLICATA WHERE ID_CUPOM = ' + IntToStr(cdsCupomFiscalID.AsInteger);
  sds.ExecSQL;

  FreeAndNil(sds);
end;

procedure TdmCupomFiscal.Excluir_ExtComissao;
var
  sds: TSQLDataSet;
begin
  if cdsCupomFiscalID.AsInteger <= 0 then
    exit;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'DELETE FROM EXTCOMISSAO WHERE ID_CUPOM = ' + IntToStr(cdsCupomFiscalID.AsInteger);
  sds.ExecSQL;

  FreeAndNil(sds);
end;

procedure TdmCupomFiscal.prc_Excluir_Movimento;
var
  sds: TSQLDataSet;
begin
  if cdsCupomFiscalID.AsInteger <= 0 then
    exit;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'DELETE FROM MOVIMENTO WHERE ID_CUPOMFISCAL = ' + IntToStr(cdsCupomFiscalID.AsInteger);
  sds.ExecSQL;

  FreeAndNil(sds);
end;

procedure TdmCupomFiscal.ImpNaoFiscalC(vTipo: String; vCod, vProd, vQtd, vVlrUnit, vVlrTot, vVlrDesc: String);
var
  vTexto, vTexto2: String;
  i: Word;
//  vLogo: TImage;
begin
  case AnsiIndexStr(vTipo,['Cabecalho','VendeItem','CancelaItem','Pagamento','Fechamento','Cancelamento','Cliente']) of
    0: begin
//         SetDefaultPrinter(vPorta);

         Printer.BeginDoc;
         Printer.Canvas.Font.Name  := 'Lucida Console';

//         if cdsFilialENDLOGO.AsString <> '' then
//         begin
//           vLogo := TImage.Create(Self);
//           vLogo.Picture.LoadFromFile(cdsFilialENDLOGO.AsString);
//         Printer.Canvas.StretchDraw(Rect(0,100,852,354),vLogo.Picture.Graphic);
//         Printer.Canvas.Rectangle(1,1,2000,3000);
//         end;

         vLinha   := 0;
         vPosicao := 0;
         Printer.Canvas.Font.Style := [fsBold]; //Declarar Graphics
         vTexto := cdsFilialNOME_INTERNO.AsString + #13;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         Printer.Canvas.Font.Style := [];
         vLinha := vLinha + cAvanco;
         vTexto := cdsFilialENDERECO.AsString + ', ' + cdsFilialNUM_END.AsString + ' - ' + cdsFilialCOMPLEMENTO_END.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := 'FONE: ' + cdsFilialFONE.AsString;
         for i := 1 to 20 - Length(vTexto) do
           vTexto := vTexto + ' ';
         vTexto := vTexto + cdsFilialCIDADE.AsString + ' ' + cdsFilialUF.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := cdsFilialCNPJ_CPF.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := '==========================================';
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;

         vTexto := FormatDateTime('dd/mm/yyyy',cdsCupomFiscalDTEMISSAO.AsDateTime) + ' ' +
                   FormatDateTime('hh:mm',cdsCupomFiscalHREMISSAO.AsDateTime);
         vTexto2 := 'NC: ' + vCod;
         for i := 1 to 40 - Length(vTexto2 + vTexto) do
           vTexto2 := ' ' + vTexto2;
         Printer.Canvas.TextOut(0,vLinha,vTexto + vTexto2);
         vLinha := vLinha + cAvanco;

         Printer.Canvas.Font.Size  := 9;
         Printer.Canvas.Font.Style := [fsBold];

         if cdsCupomFiscalTIPO.AsString = 'ORC' then
           vTexto := 'ORÇAMENTO'
         else
         if cdsCupomFiscalTIPO.AsString = 'PED' then
           vTexto := 'PEDIDO'
         else
           vTexto := 'CUPOM DE VENDA';

         for i := 1 to ((34 - Length(vTexto)) Div 2) do
           vTexto := ' ' + vTexto;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;

         Printer.Canvas.Font.Size  := 8;
         printer.Canvas.Font.Style := [];

         vTexto := 'CÓD  DESCRIÇÃO               QTD  VL.ITEM';
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;

         vTexto := '------------------------------------------';
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
       end;

    1: begin //'VendeItem
         vPosicao := 1;
         vCod := Copy(vCod,Length(vCod)-4,4);
         for i := 1 to 4 - Length(vCod) do
           vCod := vCod + ' ';

         vProd := Copy(vProd,1,21);
         for i := 1 to 22 - Length(vProd) do
           vProd := vProd + ' ';

         for i := 1 to 5 - Length(vQtd) do
           vQtd := ' ' + vQtd;

         for i := 1 to 7 - Length(vVlrTot) do
           vVlrTot := ' ' + vVlrTot;

         vTexto := vCod + ' ' + vProd + ' ' + vQtd + ' ' + vVlrTot;//'VendeItem
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
       end;

    2: ;//'CancelaItem

    3: begin//Pagamento
         vPosicao := 3;
         vTexto := '------------------------------------------';
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;

//         Printer.Canvas.Font.Style := [fsBold]; //Declarar Graphics
         vTexto := 'TOTAL: ' + vVlrTot;
         for i := 1 to 41 - Length(vTexto) do
           vTexto := ' ' + vTexto;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         Printer.Canvas.Font.Style := []; //Declarar Graphics

         if vVlrDesc <> 'R$ 0,00' then
         begin
           vTexto := 'DESCONTO: ' + vVlrDesc;
           for i := 1 to 41 - Length(vTexto) do
             vTexto := ' ' + vTexto;
           Printer.Canvas.TextOut(0,vLinha,vTexto);
           vLinha := vLinha + cAvanco;
         end;

         if vQtd <> 'R$ 0,00' then
         begin
           vTexto := 'VLR. PAGO: ' + vQtd;
           for i := 1 to 41 - Length(vTexto) do
             vTexto := ' ' + vTexto;
           Printer.Canvas.TextOut(0,vLinha,vTexto);
           vLinha := vLinha + cAvanco;
         end;

         vTexto := '';
         if vVlrUnit <> '' then
         begin
           vTexto := 'TROCO: ' + vVlrUnit;
           for i := 1 to 41 - Length(vTexto) do
             vTexto := ' ' + vTexto;
         end;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;

         if vProd <> '' then
         begin
           if not cdsTipoCobranca.Active then
             cdsTipoCobranca.Open;
           cdsTipoCobranca.IndexFieldNames := 'ID';
           cdsTipoCobranca.FindKey([StrToInt(vProd)]);

           if not cdsCondPgto.Active then
             cdsCondPgto.Open;
           cdsCondPgto.IndexFieldNames := 'ID';
           cdsCondPgto.FindKey([cdsCupomFiscalID_CONDPGTO.AsInteger]);
           vTexto := 'FORMA: ' + cdsTipoCobrancaNOME.AsString + ' ' + cdsCondPgtoNOME.AsString;
           Printer.Canvas.TextOut(0,vLinha,vTexto);
           vLinha := vLinha + cAvanco;
//------------------------------
           if not cdsCupom_Parc.IsEmpty then
           begin
             vTexto := '------------------------------------------';
             Printer.Canvas.TextOut(0,vLinha,vTexto);
             vLinha := vLinha + cAvanco;
             cdsCupom_Parc.First;
             while not cdsCupom_Parc.Eof do
             begin
               vTexto := 'Parc. ' + cdsCupom_ParcPARCELA.AsString + '  ' +
                         FormatDateTime('DD/MM/YYYY',cdsCupom_ParcDTVENCIMENTO.AsDateTime) + '  R$ ' +
                         FormatFloat('0.00',cdsCupom_ParcVLR_VENCIMENTO.AsCurrency);
               if cdsCupom_ParcPARCELA.AsInteger = 0 then
                 vTexto := vTexto + ' (ENTR.)';
               Printer.Canvas.TextOut(0,vLinha,vTexto);
               vLinha := vLinha + cAvanco;
               cdsCupom_Parc.Next;
             end;
             vTexto := '------------------------------------------';
             Printer.Canvas.TextOut(0,vLinha,vTexto);
             vLinha := vLinha + cAvanco;
           end;
//------------------------------
           vTexto := 'TERMINAL: ' + cdsCupomFiscalTERMINAL_ID.AsString;
           Printer.Canvas.TextOut(0,vLinha,vTexto);
           vLinha := vLinha + cAvanco;
         end;
       end;

    4: begin //Fechamento
         vPosicao := 4;
         vTexto := '------------------------------------------';
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;

         vTexto := vCod;
         while Trim(vTexto) <> '' do
         begin
           Printer.Canvas.TextOut(0,vLinha,Copy(vTexto,1,40));
           Delete(vTexto,1,40);
           vLinha := vLinha + cAvanco;
         end;
         for i := 1 to 3 do
         begin
           Printer.Canvas.TextOut(0,vLinha,vTexto);
           vLinha := vLinha + cAvanco;
         end;

         Printer.EndDoc;
//          CloseFile(F);
       end;
    5: begin  //Cancelamento
         try
           Printer.EndDoc;
         except
         end;
         Printer.BeginDoc;
         vTexto := '==============CANCELAMENTO================';
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := 'NUMERO DO CUPOM CANCELADO: ' + vCod;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;

         Printer.EndDoc;
       end;
    6: begin  //Dados do cliente //vCod, vProd, vQtd
         vPosicao := 6;
         vTexto := '==========================================';
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;

         Printer.Canvas.TextOut(0,vLinha,'');
         vLinha := vLinha + cAvanco;

         vTexto := ' CLIENTE: ' + vCod;
         while Trim(vTexto) <> '' do
         begin
           Printer.Canvas.TextOut(0,vLinha,Copy(vTexto,1,40));
           vLinha := vLinha + cAvanco;
           Delete(vTexto,1,40);
         end;
         vTexto := '    FONE: ' + vQtd;
         while Trim(vTexto) <> '' do
         begin
           Printer.Canvas.TextOut(0,vLinha,Copy(vTexto,1,40));
           vLinha := vLinha + cAvanco;
           Delete(vTexto,1,40);
         end;
         vTexto := 'ENDERECO: ' + vProd;
         while Trim(vTexto) <> '' do
         begin
           Printer.Canvas.TextOut(0,vLinha,Copy(vTexto,1,40));
           vLinha := vLinha + cAvanco;
           Delete(vTexto,1,40);
         end;
         vTexto := '    OBS.: ' + vVlrUnit;
         while Trim(vTexto) <> '' do
         begin
           Printer.Canvas.TextOut(0,vLinha,Copy(vTexto,1,40));
           vLinha := vLinha + cAvanco;
           Delete(vTexto,1,40);
         end;

         Printer.Canvas.TextOut(0,vLinha,'');
         vLinha := vLinha + cAvanco;
       end;
    else
    begin
      Printer.EndDoc;
    end;
  end;
end;

procedure TdmCupomFiscal.prcNumNaoFiscal;
begin
  cdsCupomFiscalNUMCUPOM.AsInteger := dmDatabase.ProximaSequencia('CUPOMNAOFISCAL',0) + 1;
end;

procedure TdmCupomFiscal.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TdmCupomFiscal.ImpCarne(vTipo: String);
var
  vTexto: String;
  i: Word;
begin
  case AnsiIndexStr(vTipo,['Cabecalho','Venda','Parcela','Fechamento']) of
    0: begin
         Printer.BeginDoc;
         Printer.Canvas.Font.Name  := 'Lucida Console';

         vLinha   := 0;
         vPosicao := 0;
         Printer.Canvas.Font.Style := [fsBold]; //Declarar Graphics
         vTexto := cdsFilialNOME_INTERNO.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;

         vTexto := cdsFilialNOME.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         Printer.Canvas.Font.Style := [];
         vLinha := vLinha + cAvanco;

         vTexto := cdsFilialENDERECO.AsString + ', ' + cdsFilialNUM_END.AsString + ' - ' + cdsFilialCOMPLEMENTO_END.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := 'FONE: ' + cdsFilialFONE.AsString;
         for i := 1 to 20 - Length(vTexto) do
           vTexto := vTexto + ' ';
         vTexto := vTexto + cdsFilialCIDADE.AsString + ' ' + cdsFilialUF.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := cdsFilialCNPJ_CPF.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := '==========================================';
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
       end;
    1: begin
         for i := 1 to 2 do
         begin
           vTexto := '';
           Printer.Canvas.TextOut(0,vLinha,vTexto);
           vLinha := vLinha + cAvanco;
         end;
         vTexto := '  Número Cupom: ' + cdsCupomFiscalNUMCUPOM.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := ' Data da Venda: ' + cdsCupomFiscalDTEMISSAO.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := '       Cliente: ' + cdsCupomFiscalCLIENTE_NOME.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := 'Total da Venda: ' + FormatFloat('R$ 0.00',cdsCupomFiscalVLR_TOTAL.AsCurrency);
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := 'Condição: ' + cdsCupomFiscalFORMAPGTO.AsString + ' - ' + cdsCupomFiscalCONDPGTO.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         for i := 1 to 2 do
         begin
           vTexto := '';
           Printer.Canvas.TextOut(0,vLinha,vTexto);
           vLinha := vLinha + cAvanco;
         end;
         vTexto := '==========================================';
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
       end;
    2: begin
         for i := 1 to 2 do
         begin
           vTexto := '';
           Printer.Canvas.TextOut(0,vLinha,vTexto);
           vLinha := vLinha + cAvanco;
         end;
         vTexto := ' Núm. financeiro: ' + cdsCupom_ParcPARCELA.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := '         Parcela: ' + cdsCupom_ParcPARCELA.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := '    Data Vencto.: ' + cdsCupom_ParcDTVENCIMENTO.AsString;
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
         vTexto := '           Valor: ' + FormatFloat('R$ 0.00',cdsCupom_ParcVLR_VENCIMENTO.AsCurrency);
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;

         for i := 1 to 2 do
         begin
           vTexto := '';
           Printer.Canvas.TextOut(0,vLinha,vTexto);
           vLinha := vLinha + cAvanco;
         end;
         vTexto := '==========================================';
         Printer.Canvas.TextOut(0,vLinha,vTexto);
         vLinha := vLinha + cAvanco;
       end;
    3: begin
         Printer.EndDoc;
       end;
  end;
end;

procedure TdmCupomFiscal.prc_Calcular_Tributos_Transparencia;
var
  vAux: Real;
begin
  cdsCupom_ItensVLR_TRIBUTO.AsFloat           := 0;
  cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat   := 0;
  cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat  := 0;
  cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat := 0;

  if (StrToFloat(FormatFloat('0.00',cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat)) > 0) then
  begin
    if cdsParametrosARREDONDAR_5.AsString = 'B' then
      vAux := StrToCurr(FormatCurr('0.00',(cdsCupom_ItensVLR_TOTAL.AsFloat * cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat) / 100))
    else
      vAux := StrToFloat(FormatFloat('0.00',(cdsCupom_ItensVLR_TOTAL.AsFloat * cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat) / 100));
    cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
  end;
  if (StrToFloat(FormatFloat('0.00',cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat)) > 0) then
  begin
    if cdsParametrosARREDONDAR_5.AsString = 'B' then
      vAux := StrToCurr(FormatCurr('0.00',(cdsCupom_ItensVLR_TOTAL.AsFloat * cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat) / 100))
    else
      vAux := StrToFloat(FormatFloat('0.00',(cdsCupom_ItensVLR_TOTAL.AsFloat * cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat) / 100));
    cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
  end;
  if (StrToFloat(FormatFloat('0.00',cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat)) > 0) then
  begin
    if cdsParametrosARREDONDAR_5.AsString = 'B' then
      vAux := StrToCurr(FormatCurr('0.00',(cdsCupom_ItensVLR_TOTAL.AsFloat * cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat) / 100))
    else
      vAux := StrToFloat(FormatFloat('0.00',(cdsCupom_ItensVLR_TOTAL.AsFloat * cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat) / 100));
    cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
  end;
  cdsCupom_ItensVLR_TRIBUTO.AsFloat := cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat +
                                       cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat +
                                       cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat;
end;

procedure TdmCupomFiscal.mCupomBeforeDelete(DataSet: TDataSet);
begin
  mCupomItens.First;
  while not mCupomItens.Eof do
  begin
    if mCupomItensCARTAO.AsInteger = mCupomCARTAO.AsInteger then
      mCupomItens.Delete
    else
      mCupomItens.Next;
  end;
end;

function TdmCupomFiscal.fnc_Buscar_Regra_CFOP(ID_CFOP: Integer): Integer;
var
  vTipo_Empresa: String;
  vTipo_Cliente: String;
  vUF_ClienteAux: String;
begin
  vTipo_Cliente := 'S';
  if cdsFilialID.AsInteger <> cdsCupomFiscalFILIAL.AsInteger then
    cdsFilial.Locate('ID',cdsCupomFiscalFILIAL.AsInteger,[loCaseInsensitive]);

  //Tirei na NFCe 23/04/2015, deixar fico o tipo Simples para o cliente por enquanto  
  {if fDMCadNotaFiscal.cdsClienteID_REGIME_TRIB.AsInteger > 0 then
  begin
    fDMCadNotaFiscal.qRegime_Trib.Close;
    fDMCadNotaFiscal.qRegime_Trib.ParamByName('ID').AsInteger := fDMCadNotaFiscal.cdsClienteID_REGIME_TRIB.AsInteger;
    fDMCadNotaFiscal.qRegime_Trib.Open;
    if fDMCadNotaFiscal.qRegime_TribCODIGO.AsInteger < 3 then
      vTipo_Cliente := 'S';
  end;}
  {if fDMCadNotaFiscal.cdsClienteUF.AsString = fDMCadNotaFiscal.cdsFilialUF.AsString then
    vUF_ClienteAux := 'D'
  else
  if fDMCadNotaFiscal.cdsClienteUF.AsString = 'EX' then
    vUF_ClienteAux := 'E'
  else
    vUF_ClienteAux := 'F';}
  vUF_ClienteAux := 'D';
  if cdsFilialSIMPLES.AsString = 'S' then
    vTipo_Empresa := 'S'
  else
    vTipo_Empresa := 'G';
  qRegra_CFOP.Close;
  qRegra_CFOP.ParamByName('ID').AsInteger            := ID_CFOP;
  qRegra_CFOP.ParamByName('TIPO_EMPRESA').AsString   := vTipo_Empresa;
  qRegra_CFOP.ParamByName('TIPO_CLIENTE').AsString   := vTipo_Cliente;
  qRegra_CFOP.ParamByName('UF_CLIENTE').AsString     := vUF_ClienteAux;
  qRegra_CFOP.ParamByName('PESSOA_CLIENTE').AsString := 'F';
  qRegra_CFOP.Open;
  if not qRegra_CFOP.IsEmpty then
    Result := qRegra_CFOPITEM.AsInteger
  else
    Result := 0;
end;

procedure TdmCupomFiscal.prc_Mover_CST;
var
  vIDCFOPAnt : Integer;
begin
  vIDCFOPAnt := vID_CFOP;
  if (vID_CFOP > 0) and (vID_CFOP <> cdsCFOPID.AsInteger) then
    cdsCFOP.Locate('ID',vID_CFOP,[loCaseInsensitive]);

  qVariacao.Close;
  qVariacao.ParamByName('ID').AsInteger   := vID_CFOP;
  qVariacao.ParamByName('ITEM').AsInteger := vID_Variacao;
  qVariacao.Open;
  //if qVariacao.IsEmpty then
  //  exit;

  if qVariacaoID_COFINS.AsInteger > 0 then
    vID_Cofins := qVariacaoID_COFINS.AsInteger;
  if qVariacaoID_PIS.AsInteger > 0 then
    vID_Pis := qVariacaoID_PIS.AsInteger;
  if qVariacaoID_CSTICMS.AsInteger > 0 then
    vID_CSTICMS := qVariacaoID_CSTICMS.AsInteger;
  //08/07/2016
  //if qVariacaoID_CSTIPI.AsInteger > 0 then
  //  vID_CSTIPI := qVariacaoID_CSTIPI.AsInteger;
  vPerc_Trib_Efet := 0;
  vPerc_ICMS_Efet := 0;
  if cdsFilialSIMPLES.AsString = 'S' then
  begin
    vPerc_ICMS     := 0;
    vPerc_TribICMS := 0;
  end
  else
  begin
    qUF.Close;
    qUF.ParamByName('UF').AsString := cdsFilialUF.AsString;
    qUF.Open;
    vPerc_ICMS := qUFPERC_ICMS.AsFloat;
    if cdsTab_CSTICMS.Locate('ID',vID_CSTICMS,[loCaseInsensitive]) then
      vPerc_TribICMS := StrToFloat(FormatFloat('0.0000',cdsTab_CSTICMSPERCENTUAL.AsFloat));
    if (cdsFilialCALCULAR_ICMS_EFET.AsString = 'C') or (cdsFilialCALCULAR_ICMS_EFET.AsString = 'S') then
    begin
      vPerc_ICMS_Efet := qUFPERC_ICMS.AsFloat;
      vPerc_Trib_Efet := StrToFloat(FormatFloat('0.0000',cdsTab_CSTICMSPERCENTUAL.AsFloat));
    end;
  end;
  if (cdsCFOPGERAR_IPI.AsString <> 'S') then
    vPerc_IPI := 0
  else
    vPerc_IPI := StrToFloat(FormatFloat('0.0000',cdsProdutoPERC_IPI.AsFloat));

  vPerc_Cofins := StrToFloat(FormatFloat('0.0000',qVariacaoPERC_COFINS.AsFloat));
  vPerc_Pis    := StrToFloat(FormatFloat('0.0000',qVariacaoPERC_PIS.AsFloat));
  vTipo_Cofins := qVariacaoTIPO_COFINS.AsString;
  vTipo_Pis    := qVariacaoTIPO_PIS.AsString;
  if cdsTab_NCMID.AsInteger <> vID_NCM then
    cdsTab_NCM.Locate('ID',vID_NCM,[loCaseInsensitive]);
  if (cdsTab_NCMID_CFOP.AsInteger > 0) and (cdsProdutoID_CFOP_NFCE.AsInteger <= 0) then
    vID_CFOP := cdsTab_NCMID_CFOP.AsInteger;
  if (vID_CFOP > 0) and (vID_CFOP <> cdsCFOPID.AsInteger) then
    cdsCFOP.Locate('ID',vID_CFOP,[loCaseInsensitive]);

  if vID_CFOP <> vIDCFOPAnt then
  begin
    vID_Variacao := fnc_Buscar_Regra_CFOP(vID_CFOP);
    qVariacao.Close;
    qVariacao.ParamByName('ID').AsInteger   := vID_CFOP;
    qVariacao.ParamByName('ITEM').AsInteger := vID_Variacao;
    qVariacao.Open;
  end;

  if cdsTab_NCMID_PIS.AsInteger > 0 then
  begin
    vID_Pis      := cdsTab_NCMID_PIS.AsInteger;
    vID_Cofins   := cdsTab_NCMID_COFINS.AsInteger;
    vPerc_Pis    := cdsTab_NCMPERC_PIS.AsFloat;
    vPerc_Cofins := cdsTab_NCMPERC_COFINS.AsFloat;
  end
  else
  if ((cdsFilialSIMPLES.AsString = 'N') or (cdsFilialSIMPLES.AsString = '2')) and (cdsCFOPID_PIS.AsInteger > 0) then
  begin
    vID_Pis      := cdsCFOPID_PIS.AsInteger;
    vID_Cofins   := cdsCFOPID_COFINS.AsInteger;
    vPerc_Pis    := cdsCFOPPERC_PIS.AsFloat;
    vPerc_Cofins := cdsCFOPPERC_COFINS.AsFloat;
  end
  else
  if (cdsFilialSIMPLES.AsString = 'S') and (cdsCFOPID_PIS_SIMP.AsInteger > 0) then
  begin
    vID_Pis      := cdsCFOPID_PIS_SIMP.AsInteger;
    vID_Cofins   := cdsCFOPID_COFINS_SIMP.AsInteger;
    vPerc_Pis    := 0;
    vPerc_Cofins := 0;
  end;

  if cdsFilialSIMPLES.AsString <> 'S' then
  begin
    if (StrToFloat(FormatFloat('0.00',cdsTab_NCMPERC_ICMS.AsFloat)) > 0) then
      vPerc_ICMS := StrToFloat(FormatFloat('0.00',cdsTab_NCMPERC_ICMS.AsFloat));
    //07/12/2018  
    if cdsProdutoID_CSTICMS_BRED.AsInteger > 0 then
    begin
      vID_CSTICMS     := cdsProdutoID_CSTICMS_BRED.AsInteger;
      vPerc_TribICMS  := cdsProdutoPERC_REDUCAOICMS.AsFloat;
      vPerc_Trib_Efet := cdsProdutoPERC_REDUCAOICMS.AsFloat;
      if StrToFloat(FormatFloat('0.000',cdsProdutoPERC_ICMS_NFCE.AsFloat)) > 0 then
      begin
        vPerc_ICMS     := StrToFloat(FormatFloat('0.000',cdsProdutoPERC_ICMS_NFCE.AsFloat));
        //vPerc_TribICMS := StrToFloat(FormatFloat('0.000',cdsProdutoPERC_REDUCAOICMS.AsFloat));
      end
      else
      if StrToFloat(FormatFloat('0.000',cdsTab_NCMPERC_ICMS.AsFloat)) > 0 then
      begin
        vPerc_ICMS     := StrToFloat(FormatFloat('0.000',cdsTab_NCMPERC_ICMS.AsFloat));
        //vPerc_TribICMS := StrToFloat(FormatFloat('0.000',cdsTab_NCMPERC_BASE_ICMS.AsFloat));
      end;
    end
    else
    if cdsProdutoID_CSTICMS.AsInteger > 0 then
    begin
      vID_CSTICMS := cdsProdutoID_CSTICMS.AsInteger;
      cdsTab_CSTICMS.Locate('ID',vID_CSTICMS,[loCaseInsensitive]);
      if StrToFloat(FormatFloat('0.000',cdsProdutoPERC_ICMS_NFCE.AsFloat)) > 0 then
        vPerc_ICMS := StrToFloat(FormatFloat('0.000',cdsProdutoPERC_ICMS_NFCE.AsFloat));
    end
    else
    if (cdsProdutoID_CFOP_NFCE.AsInteger > 0) and (cdsProdutoID_CSTICMS.AsInteger <= 0) and
      (qVariacaoID_CSTICMS.AsInteger > 0) then
    begin
      vID_CSTICMS := qVariacaoID_CSTICMS.AsInteger;
    end
    else
    if (cdsTab_NCMID_CST_ICMS.AsInteger > 0) and (cdsProdutoID_CSTICMS.AsInteger <= 0) then
    begin
      vID_CSTICMS     := cdsTab_NCMID_CST_ICMS.AsInteger;
      vPerc_TribICMS  := cdsTab_NCMPERC_BASE_ICMS.AsFloat;
      vPerc_Trib_Efet := StrToFloat(FormatFloat('0.0000',cdsTab_NCMPERC_BASE_ICMS.AsFloat));
      if StrToFloat(FormatFloat('0.00',cdsTab_NCMPERC_ICMS.AsFloat)) > 0 then
        vPerc_ICMS := cdsTab_NCMPERC_ICMS.AsFloat;
    end;

    if cdsTab_CSTICMSID.AsInteger <> vID_CSTICMS then
      cdsTab_CSTICMS.Locate('ID',vID_CSTICMS,[loCaseInsensitive]);
    if (StrToFloat(FormatFloat('0.0000',cdsTab_CSTICMSPERCENTUAL.AsFloat)) > 0) and (trim(cdsCFOPGERAR_ICMS.AsString) = 'S')
      and (StrToFloat(FormatFloat('0.0000',vPerc_TribICMS)) <= 0 ) then
    begin
      vPerc_TribICMS  := StrToFloat(FormatFloat('0.0000',cdsTab_CSTICMSPERCENTUAL.AsFloat));
      vPerc_Trib_Efet := StrToFloat(FormatFloat('0.0000',cdsTab_CSTICMSPERCENTUAL.AsFloat));
    end
    else
    if (StrToFloat(FormatFloat('0.0000',cdsTab_CSTICMSPERCENTUAL.AsFloat)) <= 0) or (trim(cdsCFOPGERAR_ICMS.AsString) <> 'S') then
    begin
      vPerc_ICMS     := 0;
      vPerc_TribICMS := 0;
    end;
    if StrToFloat(FormatFloat('0.0000',vPerc_TribICMS)) <= 0 then
      vPerc_ICMS := 0;
  end;
end;

procedure TdmCupomFiscal.prc_Abrir_CSTICMS(Tipo: String);
begin
  cdsTab_CSTICMS.Close;
  sdsTab_CSTICMS.CommandText := 'SELECT * FROM TAB_CSTICMS ';
  if (trim(Tipo) <> '') and (Tipo <> '2') then
    sdsTab_CSTICMS.CommandText := sdsTab_CSTICMS.CommandText + ' WHERE TIPO = ' + QuotedStr(Tipo);
  cdsTab_CSTICMS.Open;
end;

procedure TdmCupomFiscal.Gravar_Envio_Nota(Recibo, NroProtocolo,
  ChaveAcesso: String; Finalidade, Ambiente, CodigoErro: Integer;
  DadosAdicionais: WideString);
begin
  cdsCupomFiscal.Edit;
  cdsCupomFiscalNFERECIBO.AsString      := Recibo;
  cdsCupomFiscalNFEPROTOCOLO.AsString   := NroProtocolo;
  cdsCupomFiscalNFECHAVEACESSO.AsString := ChaveAcesso;
  cdsCupomFiscalNFEFINALIDADE.AsString  := IntToStr(Finalidade);
  cdsCupomFiscalNFEAMBIENTE.AsString    := IntToStr(Ambiente);
  if (CodigoErro = 301) or (CodigoErro = 302) then
    cdsCupomFiscalNFEDENEGADA.AsString := 'S'
  else
    cdsCupomFiscalNFEDENEGADA.AsString := 'N';
  if CodigoErro = 301 then
    cdsCupomFiscalMOTIVO_DENEGADO.AsString := 'Irregularidade do Emitente'
  else
  if CodigoErro = 302 then
    cdsCupomFiscalMOTIVO_DENEGADO.AsString := 'Irregularidade do Destinatário';
  cdsCupomFiscalDADOS_ADICIONAIS.Value := DadosAdicionais;
  cdsCupomFiscalHREMISSAO.AsDateTime   := Now;
  cdsCupomFiscal.Post;
  cdsCupomFiscal.ApplyUpdates(0);
end;

procedure TdmCupomFiscal.prcExcluir;
var
  sds: TSQLDataSet;
begin
  cdsCupom_Itens.First;
  while not cdsCupom_Itens.Eof do
  begin
    if (cdsCupomParametrosUSA_COPIA_PEDIDO_CF.AsString = 'S') and (cdsCupom_ItensID_PEDIDO.AsInteger > 0) then
    begin
      if not mPedidoAux.Locate('ID_Pedido',cdsCupom_ItensID_PEDIDO.AsInteger,[loCaseInsensitive]) then
      begin
        mPedidoAux.Insert;
        mPedidoAuxID_Pedido.AsInteger := cdsCupom_ItensID_PEDIDO.AsInteger;
        mPedidoAux.Post;
      end;
    end;
    cdsCupom_Itens.Delete;
  end;
  cdsCupom_Parc.First;
  while not cdsCupom_Parc.Eof do
    cdsCupom_Parc.Delete;

  if not cdsCupomFiscal_Cli.IsEmpty then
    cdsCupomFiscal_Cli.Delete;

  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'DELETE FROM CUPOMFISCAL_PRODPRINCIPAL WHERE ID = ' + IntToStr(cdsCupomFiscalID.AsInteger);
    sds.ExecSQL;

    sds.CommandText   := 'DELETE FROM CUPOMFISCAL_MP WHERE ID = ' + IntToStr(cdsCupomFiscalID.AsInteger);
    sds.ExecSQL;

    FreeAndNil(sds);
  finally
    FreeAndNil(sds);
  end;

  cdsCupomFiscal.Delete;
  cdsCupomFiscal.ApplyUpdates(0);

  if cdsCupomParametrosUSA_COPIA_PEDIDO_CF.AsString = 'S' then
  begin
    mPedidoAux.First;
    while not mPedidoAux.Eof do
    begin
      sdsPrc_Atualiza_Status_Ped.Close;
      sdsPrc_Atualiza_Status_Ped.ParamByName('P_ID').AsInteger := mPedidoAuxID_Pedido.AsInteger;
      sdsPrc_Atualiza_Status_Ped.ExecSQL;
      mPedidoAux.Delete;
    end;
  end;
end;

procedure TdmCupomFiscal.prc_Abrir_CondPgto;
begin
  cdsCondPgto.Close;
  sdsCondPgto.CommandText := ctCondPgto;
  sdsCondPgto.CommandText := sdsCondPgto.CommandText + ' WHERE MOSTRAR_NFCE = ' + QuotedStr('S');
  cdsCondPgto.Open;
end;

procedure TdmCupomFiscal.prc_Abrir_Cupom_ProdPrincipal(ID, Item: Integer);
begin
  cdsCupomFiscal_ProdPrincipal.Close;
  sdsCupomFiscal_ProdPrincipal.CommandText := ctCupomFiscal_ProdPrincipal;
  if Item > 0 then
  begin
    sdsCupomFiscal_ProdPrincipal.CommandText := sdsCupomFiscal_ProdPrincipal.CommandText + ' AND ITEM_ORIGINAL = :ITEM_ORIGINAL';
    sdsCupomFiscal_ProdPrincipal.ParamByName('ITEM_ORIGINAL').AsInteger := Item;
  end;
  sdsCupomFiscal_ProdPrincipal.ParamByName('ID').AsInteger := ID;
  cdsCupomFiscal_ProdPrincipal.Open;
end;

procedure TdmCupomFiscal.cdsPedidoCalcFields(DataSet: TDataSet);
begin
  if cdsPedidoTIPO_REG.AsString = 'P' then
  begin
    if cdsParametrosCONTROLAR_PEDIDO_LIBERACAO.AsString = 'S' then
      cdsPedidoclQtd_Restante.AsFloat := StrToFloat(FormatFloat('0.000000',cdsPedidoQTD_LIBERADA.AsFloat))
    else
      cdsPedidoclQtd_Restante.AsFloat := StrToFloat(FormatFloat('0.000000',cdsPedidoQTD_RESTANTE.AsFloat));
    if cdsParametrosCONTROLAR_PEDIDO_LIBERACAO.AsString = 'S' then
      cdsPedidoclQtd_NaoLiberada.AsFloat := StrToFloat(FormatFloat('0.000000',cdsPedidoQTD_RESTANTE.AsFloat - cdsPedidoQTD_LIBERADA.AsFloat))
    else
      cdsPedidoclQtd_NaoLiberada.AsFloat := StrToFloat(FormatFloat('0.000000',0));
  end
  else
    cdsPedidoclQtd_Restante.AsFloat := StrToFloat(FormatFloat('0.000000',cdsPedidoQTD_RESTANTE.AsFloat));
end;

procedure TdmCupomFiscal.prc_Abrir_Produto(vTipoCod, vCodigo: String);
begin
  cdsProduto.Close;
  sdsProduto.CommandText := ctProduto;
  case AnsiIndexStr(vTipoCod,['ID','REF','CB']) of
    0: sdsProduto.CommandText := sdsProduto.CommandText + ' AND ID = ' + IntToStr(StrToInt(vCodigo));
    1: sdsProduto.CommandText := sdsProduto.CommandText + ' AND REFERENCIA = ' + QuotedStr(vCodigo);
    2: sdsProduto.CommandText := sdsProduto.CommandText + ' AND COD_BARRA = ' + QuotedStr(vCodigo);
  end;
  case AnsiIndexStr(cdsCupomParametrosVENDA_TIPO_PRODUTO.AsString,['P','M','A']) of
    0: sdsProduto.CommandText := sdsProduto.CommandText + ' AND TIPO_REG = ''P''';
    1: sdsProduto.CommandText := sdsProduto.CommandText + ' AND TIPO_REG = ''M''';
    2: ;
  end;
  sdsProduto.CommandText := sdsProduto.CommandText + ' ORDER BY NOME';
  cdsProduto.Open;

  if (cdsProduto.IsEmpty) and (vTipoCod = 'REF') then
  begin
    cdsProduto.Close;
    sdsProduto.CommandText := ctProduto;
    sdsProduto.CommandText := sdsProduto.CommandText + ' AND REFERENCIA LIKE ''' + Trim(vCodigo) + '%''';
    case AnsiIndexStr(cdsCupomParametrosVENDA_TIPO_PRODUTO.AsString,['P','M','A']) of
      0: sdsProduto.CommandText := sdsProduto.CommandText + ' AND TIPO_REG = ''P''';
      1: sdsProduto.CommandText := sdsProduto.CommandText + ' AND TIPO_REG = ''M''';
    end;
    sdsProduto.CommandText := sdsProduto.CommandText + ' ORDER BY NOME';
    cdsProduto.Open;
  end;
end;

procedure TdmCupomFiscal.ImpNaoFiscalW(vTipo, vCod, vProd, vQtd, vVlrUnit, vVlrTot, vVlrDesc: String);
var
  vTexto, vTexto2: String;
  i: Word;
begin
  case AnsiIndexStr(vTipo,['Cabecalho','VendeItem','CancelaItem','Pagamento','Fechamento','Cancelamento']) of
    0: begin
       AssignFile(f,vPorta);
         ReWrite(f);
         vTexto := cdsFilialNOME_INTERNO.AsString;
         WriteLn(f,INegAti + vTexto + iNegDes);
         vTexto := cdsFilialENDERECO.AsString + ', ' + cdsFilialNUM_END.AsString + ' - ' + cdsFilialCOMPLEMENTO_END.AsString;
         WriteLn(f,vTexto);
         vTexto := 'FONE: ' + cdsFilialFONE.AsString;
         for i := 1 to 20 - Length(vTexto) do
           vTexto := vTexto + ' ';
         vTexto := vTexto + cdsFilialCIDADE.AsString + ' ' + cdsFilialUF.AsString;
         WriteLn(f,vTexto);
         vTexto := cdsFilialCNPJ_CPF.AsString;
         WriteLn(f,vTexto);
         vTexto := '==========================================';
         WriteLn(f,vTexto);

         vTexto := FormatDateTime('dd/mm/yyyy',cdsCupomFiscalDTEMISSAO.AsDateTime) + ' ' +
                   FormatDateTime('hh:mm',cdsCupomFiscalHREMISSAO.AsDateTime);
         vTexto2 := INegAti + 'NC: ' + vCod + INegDes;
         for i := 1 to 40 - Length(vTexto2 + vTexto) do
           vTexto2 := ' ' + vTexto2;
         WriteLn(f,vTexto + vTexto2);

         vTexto := INegAti;
         if cdsCupomFiscalTIPO.AsString = 'ORC' then
           vTexto := vTexto + 'ORÇAMENTO'
         else
         if cdsCupomFiscalTIPO.AsString = 'PED' then
           vTexto := vTexto + 'PEDIDO'
         else
           vTexto := vTexto + 'CUPOM DE VENDA';
         vTexto := vTexto + iNegDes;

         for i := 1 to ((40 - Length(vTexto)) Div 2) do
           vTexto := ' ' + vTexto;
         WriteLn(f,vTexto);

         vTexto := 'COD  DESCRICAO                QTD  VL.ITEM';
         WriteLn(f,vTexto);

         vTexto := '------------------------------------------';
         WriteLn(f,vTexto);
       end;

    1: begin //'VendeItem
         vPosicao := 1;
         vCod := Copy(vCod,1,4);
         for i := 1 to 4 - Length(Copy(vCod,Length(vCod)-4,4)) do
           vCod := vCod + ' ';

         //Passado para 21   25/01/2016
         //vProd := Copy(vProd,1,23);
//         vProd := Copy(vProd,1,22);
         vProd := Copy(vProd,1,22);
         for i := 1 to 23 - Length(vProd) do
           vProd := vProd + ' ';

         for i := 1 to 5 - Length(vQtd) do
           vQtd := ' ' + vQtd;

         for i := 1 to 7 - Length(vVlrTot) do
           vVlrTot := ' ' + vVlrTot;

         vTexto := vCod + ' ' + vProd + ' ' + vQtd + ' ' + vVlrTot;//'VendeItem
         WriteLn(f,vTexto);
       end;

    2: ;//'CancelaItem

    3: begin//Pagamento
         vPosicao := 3;
         vTexto := '==========================================';
         WriteLn(f,vTexto);
         vTexto := 'TOTAL: ' + vVlrTot;
         for i := 1 to 42 - Length(vTexto) do
           vTexto := ' ' + vTexto;
         WriteLn(f,vTexto);

         if vVlrDesc <> 'R$ 0,00' then
         begin
           vTexto := 'DESCONTO: ' + vVlrDesc;
           for i := 1 to 42 - Length(vTexto) do
             vTexto := ' ' + vTexto;
           WriteLn(f,vTexto);
         end;

         if vQtd <> 'R$ 0,00' then
         begin
           vTexto := 'VLR. PAGO: ' + vQtd;
           for i := 1 to 42 - Length(vTexto) do
             vTexto := ' ' + vTexto;
           WriteLn(f,vTexto);
         end;

         vTexto := '';
         if vVlrUnit <> '' then
         begin
           vTexto := 'TROCO: ' + vVlrUnit;
           for i := 1 to 42 - Length(vTexto) do
             vTexto := ' ' + vTexto;
         end;
         WriteLn(f,vTexto);
       end;

    4: begin //Fechamento
         vPosicao := 4;
         vTexto := '------------------------------------------';
         WriteLn(f,vTexto);

         vTexto := vCod;
         while Trim(vTexto) <> '' do
         begin
           WriteLn(f,Copy('CLIENTE: ' + vTexto,1,40));
           Delete(vTexto,1,40);
         end;
         for i := 1 to 5 do
           WriteLn(f);
         CloseFile(f);
       end;
    5: begin  //Cancelamento
         try
           CloseFile(f);
         except
         end;
           AssignFile(f,'c:\$Servisoft\Cupom.txt');
       //  AssignPrn(f);
           ReWrite(f);

         //Passado para 41   16/09/2015
         //vTexto := '=============CANCELAMENTO=================';
         vTexto := '==============CANCELAMENTO================';
         WriteLn(f,vTexto);
         vTexto := 'NUMERO DO CUPOM CANCELADO: ' + vCod;
         WriteLn(f,vTexto);
         WriteLn(f);
         WriteLn(f);

         CloseFile(f);
       end;
    else
    begin
      CloseFile(f);
    end;
  end;
end;

procedure TdmCupomFiscal.ChamaNaoFiscal(vId: Integer; vModelo: String);
var
  vCodRef: String;
begin
  prcLocalizar(vId);
  if vModelo = 'modCanvas' then
  begin
    case cdsCupomParametrosIMPRIME_NUM_NFISCAL.AsInteger of
      1: ImpNaoFiscalC('Cabecalho',cdsCupomFiscalNUMCUPOM.AsString,'','','','','');
      2: ImpNaoFiscalC('Cabecalho',cdsCupomFiscalNUM_CARTAO.AsString,'','','','','');
    end;
  end;

  if vModelo = 'modWrite' then
  begin
    case cdsCupomParametrosIMPRIME_NUM_NFISCAL.AsInteger of
      1: ImpNaoFiscalW('Cabecalho',cdsCupomFiscalNUMCUPOM.AsString,'','','','','');
      2: ImpNaoFiscalW('Cabecalho',cdsCupomFiscalNUM_CARTAO.AsString,'','','','','');
    end;
  end;

  cdsCupom_Itens.First;
  while not cdsCupom_Itens.Eof do
  begin
    if cdsCupom_ItensCANCELADO.AsString = 'S' then
    begin
      cdsCupom_Itens.Next;
      Continue;
    end;
    if cdsCupomParametrosUSA_COD_REF.AsString = 'C' then
      vCodRef := cdsCupom_ItensID_PRODUTO.AsString
    else
      vCodRef := cdsCupom_ItensREFERENCIA.AsString;
    if vModelo = 'modCanvas' then
      ImpNaoFiscalC('VendeItem',vCodRef,
                   cdsCupom_ItensNOME_PRODUTO.AsString,
                   cdsCupom_ItensQTD.AsString,
                   FormatFloat('0.00',cdsCupom_ItensVLR_UNITARIO.AsCurrency),
                   FormatFloat('0.00',cdsCupom_ItensVLR_TOTAL.AsCurrency),'')
    else
      ImpNaoFiscalW('VendeItem',vCodRef,
                     cdsCupom_ItensNOME_PRODUTO.AsString,
                     cdsCupom_ItensQTD.AsString,
                     FormatFloat('0.00',cdsCupom_ItensVLR_UNITARIO.AsCurrency),
                     FormatFloat('0.00',cdsCupom_ItensVLR_TOTAL.AsCurrency),'');
    cdsCupom_Itens.Next;
  end;
  if vModelo = 'modCanvas' then
    ImpNaoFiscalC('Pagamento','',cdsCupomFiscalID_TIPOCOBRANCA.AsString,
                 FormatFloat('R$ 0.00',cdsCupomFiscalVLR_RECEBIDO.AsCurrency),
                 FormatFloat('R$ 0.00',cdsCupomFiscalVLR_TROCO.AsCurrency),
                 FormatFloat('R$ 0.00',cdsCupomFiscalVLR_TOTAL.AsCurrency),
                 FormatFloat('R$ 0.00',cdsCupomFiscalVLR_DESCONTO.AsCurrency))
  else
    ImpNaoFiscalW('Pagamento','',cdsCupomFiscalID_TIPOCOBRANCA.AsString,
                  FormatFloat('R$ 0.00',cdsCupomFiscalVLR_RECEBIDO.AsCurrency),
                  FormatFloat('R$ 0.00',cdsCupomFiscalVLR_TROCO.AsCurrency),
                  FormatFloat('R$ 0.00',cdsCupomFiscalVLR_TOTAL.AsCurrency),
                  FormatFloat('R$ 0.00',cdsCupomFiscalVLR_DESCONTO.AsCurrency));

  if vModelo = 'modCanvas' then
  begin
    if (cdsCupomFiscalCLIENTE_NOME.AsString <> '') and (cdsCupomFiscalCLIENTE_NOME.AsString <> 'CONSUMIDOR') then
      ImpNaoFiscalC('Cliente','(' + cdsCupomFiscalID_CLIENTE.AsString + ') ' + cdsCupomFiscalCLIENTE_NOME.AsString,
                                    cdsCupomFiscalCLIENTE_ENDERECO.AsString,cdsCupomFiscalCLIENTE_FONE.AsString,
                                    cdsCupomFiscalCLIENTE_OBS.AsString,'','');
    ImpNaoFiscalC('Fechamento','Obrigado, volte sempre!','','','','','');
  end
  else
    ImpNaoFiscalW('Fechamento','Obrigado, volte sempre!','','','','','');
end;

function TdmCupomFiscal.fnc_IncrementaCartao(vTerminal: Integer): Integer;
var
  sds: TSQLDataSet;
  iSeq: Integer;
begin
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'SELECT NUM_COMANDA FROM FECHAMENTO ' +
                       'WHERE ID = (SELECT MAX(ID) ' +
                       'FROM FECHAMENTO WHERE TERMINAL_ID = ' +
                       IntToStr(vTerminal) + ')';
  sds.Open;
  iSeq := sds.fieldByName('NUM_COMANDA').AsInteger + 1;
  Result := iSeq;
  sds.Close;

  sds.CommandText := 'UPDATE FECHAMENTO SET NUM_COMANDA = ' + intToStr(iSeq) +
                     'WHERE ID = (SELECT MAX(ID) ' +
                     'FROM FECHAMENTO WHERE TERMINAL_ID = ' +
                     IntToStr(vTerminal) + ')';

  sds.ExecSQL();
end;

procedure TdmCupomFiscal.cdsCupomFiscalBeforePost(DataSet: TDataSet);
begin
  if cdsCupomFiscalID_FECHAMENTO.AsInteger = 0 then
    cdsCupomFiscalID_FECHAMENTO.Clear;
end;

procedure TdmCupomFiscal.prc_Excluir_CupomFiscal_MP;
var
  sds: TSQLDataSet;
begin
  if cdsCupomFiscalID.AsInteger <= 0 then
    Exit;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'DELETE FROM CUPOMFISCAL_MP WHERE ID = ' + IntToStr(cdsCupomFiscalID.AsInteger);
  sds.ExecSQL;

  FreeAndNil(sds);
end;

procedure TdmCupomFiscal.SetDefaultPrinter(PrinterName: String);
//636 - Mudar Impressora padrão pelo nome
//Declarar Windows e Messages
var
  I: Integer;
  Device: PChar;
  Driver: Pchar;
  Port: Pchar;
  HdeviceMode: Thandle;
  aPrinter: TPrinter;
begin
  Printer.PrinterIndex := -1;
  getmem(Device, 255);
  getmem(Driver, 255);
  getmem(Port, 255);
  aPrinter := TPrinter.create;
  for I := 0 to Printer.printers.Count-1 do
  begin
    if Printer.printers[i] = PrinterName then
    begin
      aPrinter.PrinterIndex := i;
      aPrinter.GetPrinter(Device,Driver,Port,HDeviceMode);
      StrCat(Device,',');
      StrCat(Device,Driver);
      StrCat(Device,Port);
      WriteProfileString('Windows','Device',Device);
      StrCopy(Device,'Windows');
      SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Longint(@Device));
    end;
  end;
  Freemem(Device, 255);
  Freemem(Driver, 255);
  Freemem(Port, 255);
  aPrinter.Free;
end;

procedure TdmCupomFiscal.prcGravaTransacao;
begin

end;

procedure TdmCupomFiscal.prc_Busca_IBPT;
var
  vComandoAux: String;
begin
  if not cdsProduto.Active then
    cdsProduto.Open;

  if cdsCupom_ItensID_PRODUTO.AsInteger <> cdsProdutoID.AsInteger then
    cdsProduto.Locate('ID',cdsCupom_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);

  cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat   := StrToFloat(FormatFloat('0.00',0));
  cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat  := StrToFloat(FormatFloat('0.00',0));
  cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',0));
  cdsCupom_ItensFONTE_TRIBUTO.Clear;
  cdsCupom_ItensVERSAO_TRIBUTO.Clear;

  vComandoAux := '';
  qIBPT.Close;
  qIBPT.SQL.Text := ctqIBPT;
  if (cdsParametrosTIPO_LEI_TRANSPARENCIA.AsString = 'P') then
    vComandoAux := 'WHERE I.CODIGO = ' + QuotedStr('COMERCIO')
  else
    vComandoAux := 'WHERE  N.ID = ' + IntToStr(cdsCupom_ItensID_NCM.AsInteger)
                 + ' AND I.EX = ' + QuotedStr(cdsProdutoNCM_EX.AsString);
  if trim(vComandoAux) = '' then
    exit;
  qIBPT.SQL.Text := qIBPT.SQL.Text + ' ' + vComandoAux;
  qIBPT.Open;
  if not qIBPT.IsEmpty then
  begin
    if (cdsCupom_ItensORIGEM_PROD.AsString = '0') or (cdsCupom_ItensORIGEM_PROD.AsString = '3')
      or (cdsCupom_ItensORIGEM_PROD.AsString = '4') or (cdsCupom_ItensORIGEM_PROD.AsString = '5') then
      cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00',qIBPTPERC_NACIONAL.AsFloat))
    else
      cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00',qIBPTPERC_IMPORTACAO.AsFloat));
    cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat  := StrToFloat(FormatFloat('0.00',qIBPTPERC_ESTADUAL.AsFloat));
    cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',qIBPTPERC_MUNICIPAL.AsFloat));
    cdsCupom_ItensFONTE_TRIBUTO.AsString         := qIBPTFONTE.AsString;
    cdsCupom_ItensVERSAO_TRIBUTO.AsString        := qIBPTVERSAO.AsString;
  end;

  if cdsCupom_ItensID_PRODUTO.AsInteger <> cdsProdutoID.AsInteger then
    cdsProduto.Locate('ID',cdsCupom_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);
  cdsCupom_ItensPERC_TRIBUTO.AsFloat := StrToFloat(FormatFloat('0.00',0));
end;

procedure TdmCupomFiscal.cdsCupomFiscalNewRecord(DataSet: TDataSet);
begin
  cdsCupomFiscalESTOQUE_OK.AsString    := 'N';
  cdsCupomFiscalFINANCEIRO_OK.AsString := 'N';
  cdsCupomFiscalDTORIGINAL.AsDateTime  := Date;
  cdsCupomFiscalNFEDENEGADA.AsString   := 'N';
  vSomaOriginal := 0;
end;

procedure TdmCupomFiscal.cdsParametrosBeforePost(DataSet: TDataSet);
begin
  cdsParametrosGeral.Close;
  sdsParametrosGeral.ParamByName('ID').AsInteger := 1;
  cdsParametrosGeral.Open;

  if cdsParametrosGeral.IsEmpty then
  begin
    cdsParametrosGeral.Insert;
    cdsParametrosGeralID.AsInteger := 1;
    cdsParametrosGeral.Post;
    cdsParametrosGeral.ApplyUpdates(0);
  end;
end;

procedure TdmCupomFiscal.prc_Localizar_Pessoa(vId: Integer ; vCNPJ_CPF : String);
begin
  cdsPessoa.Close;
  sdsPessoa.CommandText := ctPessoa;
  if vId <> 0 then
    sdsPessoa.CommandText := sdsPessoa.CommandText + ' WHERE CODIGO = ' + IntToStr(vId)
  else
  if trim(vCNPJ_CPF) <> '' then
    sdsPessoa.CommandText := sdsPessoa.CommandText + ' WHERE CNPJ_CPF = ' + QuotedStr(vCNPJ_CPF);
  cdsPessoa.Open;
end;

procedure TdmCupomFiscal.prc_Excluir_Cupom_Fiscal(ID_Cupom : Integer ; Excluir : String = 'N');
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select count(1) CONTADOR from cupomfiscal c where c.numcupom > 0 and c.ID = :ID ';
    sds.ParamByName('ID').AsInteger := ID_Cupom;
    sds.Open;
    if (sds.FieldByName('CONTADOR').AsInteger <= 0) or (Excluir = 'S') then
    begin
      sds_prc_Exluir_Cupom.Close;
      sds_prc_Exluir_Cupom.ParamByName('ID_CUPOM').AsInteger := ID_Cupom;
      sds_prc_Exluir_Cupom.ExecSQL;
      prc_Voltar_Comanda(ID_Cupom);
    end
    else
    if cdsCupomFiscal.Active then
    //if sds.FieldByName('CONTADOR').AsInteger > 0 then
      cdsCupomFiscal.CancelUpdates
  finally
    FreeAndNil(sds);
  end;
end;

function TdmCupomFiscal.lerIni(Tabela, Campo: String): String;
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create('c:\$Servisoft\Impressora.ini');
  result    := ServerIni.ReadString(Tabela,Campo,'');
  ServerIni.Free;
end;

procedure TdmCupomFiscal.prc_Gravar_Estoque_Movimento(ID_Cupom: Integer;
  Tipo: string);
begin
  sds_prc_Grava_Estoque.Close;
  sds_prc_Grava_Estoque.ParamByName('ID_DOCUMENTO').AsInteger := ID_Cupom;
  sds_prc_Grava_Estoque.ParamByName('TIPO').AsString := Tipo;
  sds_prc_Grava_Estoque.ExecSQL;
end;

procedure TdmCupomFiscal.prc_Digita_Documento;
begin
//  if vDocumentoClienteVenda = '' then
  begin
    repeat
      vCpfOK := False;
      if vDocumentoClienteVenda <> EmptyStr then
        vDocumentoClienteVenda := TiraCaracterCNPJ(vDocumentoClienteVenda);
      if (not vCpfOK) then
        if InputQuery('Documento Cliente!', 'Informar CPF/CNPJ no Cupom?', vDocumentoClienteVenda) then
        else
          vDocumentoClienteVenda := '';


//        vDocumentoClienteVenda := InputBox('Documento Cliente!', 'Informar CPF/CNPJ no Cupom?', vDocumentoClienteVenda);

      if vDocumentoClienteVenda <> '' then
      begin
        if length(vDocumentoClienteVenda) = 11 then
        begin
          ACBrValidador.TipoDocto := TACBrValTipoDocto(docCPF);
          ACBrValidador.Documento := vDocumentoClienteVenda;
          if ACBrValidador.Validar then
          begin
            vCpfOK := True;
            vDocumentoClienteVenda := ACBrValidador.Formatar;
            cdsCupomFiscalCPF.AsString := vDocumentoClienteVenda;
          end
          else
            ShowMessage('ERRO: O CPF DIGITADO É INVÁLIDO!');
        end
        else
        if length(vDocumentoClienteVenda) = 14 then
        begin
          vDocumentoClienteVenda := Monta_Texto(vDocumentoClienteVenda,11);

          ACBrValidador.TipoDocto := TACBrValTipoDocto(docCNPJ);
          ACBrValidador.Documento := vDocumentoClienteVenda;
          if ACBrValidador.Validar then
          begin
            vCpfOK := True;
            vDocumentoClienteVenda := ACBrValidador.Formatar;
            cdsCupomFiscalCPF.AsString := vDocumentoClienteVenda;
          end
          else
            ShowMessage('ERRO: O CNPJ DIGITADO É INVÁLIDO!');
        end;
      end;
      if vDocumentoClienteVenda = '' then
        vCpfOK := True;
    until
      vCpfOK;
  end
//  else
//    vCpfOK := True;
end;

procedure TdmCupomFiscal.cdsCupomFiscalReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  MessageDlg('Erro Gravando Cupom: ' + e.Message,mtError,[mbOK],0);
  prc_Gravar('CUPOMFISCAL',
             'uCupomFiscalPgto',
             'cupom nº ' + IntToStr(cdsCupomFiscalID.AsInteger) + ' ' + e.Message,
             FormatDateTime('dd/mm/yyyy',Date),
             FormatDateTime('hh:mm',Time));
end;

procedure TdmCupomFiscal.prc_Calcular_Valor_Juros(Perc_Juros : Currency);
var
  vOutros : Currency;
begin
  cdsCupomFiscalVLR_OUTROS.AsCurrency   := 0;
  cdsCupomFiscalVLR_TOTAL.AsCurrency    := 0;
  cdsCupomFiscalVLR_RECEBIDO.AsCurrency := 0;

  if Perc_Juros > 0 then
  begin
    vOutros := 0;
    cdsCupom_Itens.First;
    while not cdsCupom_Itens.Eof do
    begin
      cdsCupom_Itens.Edit;

      case cdsTipoCobrancaJUROS_TIPO.AsInteger of
        1: begin
             cdsCupom_ItensVLR_JUROS.AsString := FormatFloat('0.00',cdsCupom_ItensVLR_TOTAL.AsCurrency *
                                                                Perc_Juros / 100);
           end;
        2: begin

           end;
        3: begin
             if cdsCondPgtoTIPO.AsString <> 'V' then
               cdsCupom_ItensVLR_JUROS.AsString := FormatFloat('0.00',((cdsCupom_ItensVLR_TOTAL.AsCurrency *
                                                                             ((Perc_Juros / 100)/(1 - (Power(1 + (Perc_Juros / 100),vQtdParcelas * -1))))) *
                                                                             vQtdParcelas) - cdsCupom_ItensVLR_TOTAL.AsCurrency);
           end;
      end;
      cdsCupom_Itens.Post;
      vOutros := vOutros + cdsCupom_ItensVLR_JUROS.AsCurrency;
      cdsCupomFiscalVLR_TOTAL.AsCurrency := cdsCupomFiscalVLR_TOTAL.AsCurrency +
                                                           cdsCupom_ItensVLR_TOTAL.AsCurrency;
      cdsCupom_Itens.Next;
    end;

    cdsCupomFiscalVLR_OUTROS.AsCurrency   := vOutros;
    cdsCupomFiscalVLR_TOTAL.AsCurrency    := cdsCupomFiscalVLR_TOTAL.AsCurrency + vOutros;
    cdsCupomFiscalVLR_RECEBIDO.AsCurrency := cdsCupomFiscalVLR_TOTAL.AsCurrency;
  end;

end;

procedure TdmCupomFiscal.prc_Calcular_CondPagto(sender: TObject; vVlr_Pagto : Currency; vPercJuros : Currency = 0);
var
  vVlrParcelado, vVlrTotal, vVlrProdutos: Real;
begin
  while not cdsCupom_Parc.IsEmpty do
    cdsCupom_Parc.Delete;

  if vPercJuros > 0 then
    prc_Calcular_Valor_Juros(vPercJuros);

  vVlrEntrada  := 0;
  vDataEntrada := cdsCupomFiscalDTEMISSAO.AsDateTime;
  if (cdsCondPgtoTIPO.AsString = 'P') and
     (cdsCondPgtoTIPO_CONDICAO.AsString = 'V') then
    vQtdParcelas := cdsCondPgto_Dia.RecordCount
  else
    vQtdParcelas := cdsCondPgtoQTD_PARCELA.AsInteger;

  if cdsCondPgtoENTRADA.AsString = 'S' then
  begin
    cdsCupom_Parc.Insert;
    cdsCupom_ParcID.AsInteger            := cdsCupomFiscalID.AsInteger;
    cdsCupom_ParcDTVENCIMENTO.AsDateTime := Date;
    cdsCupom_ParcPARCELA.AsInteger       := 0;

    qTipoDinheiro.Open;
    cdsCupom_ParcID_TIPOCOBRANCA.AsInteger := qTipoDinheiro.FieldByName('ID').AsInteger;
    qTipoDinheiro.Close;

    vParcela := cdsCupom_ParcPARCELA.AsInteger;
    fCupomFiscalParcela := TfCupomFiscalParcela.Create(Self);
    fCupomFiscalParcela.Label5.Visible := cdsCupom_ParcPARCELA.AsInteger = 0;
    if cdsCupomParametrosRACHAR_CONTA.AsString <> 'S' then
    begin
      fCupomFiscalParcela.edtValor.ReadOnly := (fCupomFiscalParcela.Tag = 1) or (cdsCupom_ParcPARCELA.AsInteger > 1); //Somente pode atualizar a primeira parcela
      fCupomFiscalParcela.edtValor.TabStop := not fCupomFiscalParcela.edtValor.ReadOnly;
    end;
    cdsTipoCobranca.IndexFieldNames := 'NOME';
//    fCupomFiscalParcela.fDmCupomFiscal := fDmCupomFiscal;
    fCupomFiscalParcela.ShowModal;
    if fCupomFiscalParcela.ModalResult = mrOK then
    begin
      cdsCupom_ParcTIPO_COBRANCA.AsString := fCupomFiscalParcela.ComboFormaPgto.Text;
      cdsCupom_ParcVLR_VENCIMENTO.AsCurrency := fCupomFiscalParcela.edtValor.Value;
      cdsCupom_Parc.Post;

      if cdsCupom_ParcPARCELA.AsInteger = 0 then
        vVlrEntrada := cdsCupom_ParcVLR_VENCIMENTO.AsCurrency;

      if (cdsCupom_ParcPARCELA.AsInteger = 0) then
        vDataEntrada := fCupomFiscalParcela.dateDataEntrada.Date;
    end
    else
      cdsCupom_Parc.Cancel;

  end;

//////////////////////////////////////////////
  cdsCupomFiscalVLR_COFINS.AsFloat   := 0;
  cdsCupomFiscalVLR_ICMS.AsFloat     := 0;
  cdsCupomFiscalBASE_ICMS.AsFloat    := 0;
  cdsCupomFiscalVLR_IPI.AsFloat      := 0;

  cdsCupomFiscalBASE_ICMSSUBST_RET.AsFloat := 0;
  cdsCupomFiscalVLR_ICMSSUBST_RET.AsFloat  := 0;
  cdsCupomFiscalVLR_BASE_EFET.AsFloat      := 0;
  cdsCupomFiscalVLR_ICMS_EFET.AsFloat      := 0;

  cdsCupomFiscalVLR_PIS.AsFloat      := 0;
  cdsCupomFiscalVLR_TRIBUTO.AsFloat  := 0;
  cdsCupomFiscalVLR_TRIBUTO_ESTADUAL.AsFloat  := 0;
  cdsCupomFiscalVLR_TRIBUTO_FEDERAL.AsFloat   := 0;
  cdsCupomFiscalVLR_TRIBUTO_MUNICIPAL.AsFloat := 0;
//////////////////////////////////////////////

  //18/04/2020  Foi tirado pq o valor da parcela já vem calculado
  //vVlrParcelado := cdsCupomFiscalVLR_PRODUTOS.AsCurrency - cdsCupomFiscalVLR_DESCONTO.AsCurrency -
  //                 vVlrEntrada + cdsCupomFiscalVLR_OUTROS.AsCurrency;
  vVlrParcelado := vVlr_Pagto + cdsCupomFiscalVLR_OUTROS.AsFloat;

//  Desabilitei porque estava calculando as parcela com o desconto duplicado.
//  vVlrParcelado := vVlr_Pagto - cdsCupomFiscalVLR_DESCONTO.AsCurrency -
//                   vVlrEntrada + cdsCupomFiscalVLR_OUTROS.AsCurrency;


  prc_ControleParcelas(vVlrParcelado,0,vQtdParcelas);

  vVlrTotal    := StrToFloat(FormatFloat('0.00',vVlrEntrada + vSomaParcelas));
  vVlrProdutos := vSomaOriginal;

//  prc_Calcular_Geral(self);

end;

procedure TdmCupomFiscal.prc_ControleParcelas(vVlrParcelado,
  vVlrTxJuros: Real; vQtdParc: Word);
begin
  cdsCupom_Parc.First;
  while not cdsCupom_Parc.Eof do
  begin
  if cdsCupom_ParcPARCELA.AsInteger = 0 then
    cdsCupom_Parc.Next
  else
    cdsCupom_Parc.Delete;
  end;
  Gerar_Parcelas(vVlrParcelado,vVlrTxJuros,vQtdParc);
  vPgtoEditado := False;

end;

procedure TdmCupomFiscal.Gerar_Parcelas(vVlrParcelado, vTxJuros: Real; vQtdParc: Word);
var
  vVlrParcelas: Real;
  vVlrRestante: Real;
  vDataAux: TDateTime;
  i: Word;
begin
  vSomaParcelas := 0;

  if (cdsCupomFiscalTIPO_PGTO.AsString = 'V') or (vCondicaoPgto = 0) then
  begin
//    Gravar_CupomFiscalParc(cdsCupomFiscalDTEMISSAO.AsDateTime,cdsCupomFiscalVLR_TOTAL.AsFloat,vID_TipoCobranca);
    Gravar_CupomFiscalParc(cdsCupomFiscalDTEMISSAO.AsDateTime,vVlrParcelado,vID_TipoCobranca);
    vVlrParcelas := StrToFloat(FormatFloat('0.00',vVlrParcelado));
    vVlrRestante := StrToFloat(FormatFloat('0.00',vVlrParcelado));
  end
  else
  begin
    if vTxJuros > 0 then
    begin
      if cdsCupomFiscalVLR_OUTROS.AsCurrency > 0 then
      begin
        vVlrParcelas := StrToFloat(FormatFloat('0.00',vVlrParcelado / vQtdParc));
        vVlrRestante := StrToFloat(FormatFloat('0.00',vVlrParcelas * vQtdParc));
      end
      else
      begin
        vVlrParcelas := StrToFloat(FormatFloat('0.00',vVlrParcelado * ((vTxJuros / 100)/ (1 - (Power(1 + (vTxJuros / 100),vQtdParc * -1))))));
        vVlrRestante := StrToFloat(FormatFloat('0.00',vVlrParcelas * vQtdParc));
      end;
    end
    else
    begin
      if vQtdParc > 1 then
      begin
        vVlrParcelas := StrToFloat(FormatFloat('0.00',vVlrParcelado / vQtdParc));
        vVlrRestante := StrToFloat(FormatFloat('0.00',vVlrParcelado));
      end
      else
      begin
        vVlrParcelas := StrToFloat(FormatFloat('0.00',vVlrParcelado));
        vVlrRestante := StrToFloat(FormatFloat('0.00',vVlrParcelado));
      end;
    end;
  end;
  vSomaParcelas := StrToFloat(FormatFloat('0.00',vVlrRestante));

  if (cdsCondPgto.Locate('ID',vCondicaoPgto,[loCaseInsensitive])) then
  begin
    if cdsCondPgtoTIPO_CONDICAO.AsString = 'V' then
    begin
      //07/11/2019
      //vVlrRestante := StrToFloat(FormatFloat('0.00',vVlrParcelas * vQtdParc));

      vDataAux := cdsCupomFiscalDTEMISSAO.AsDateTime;
      cdsCondPgto_Dia.First;
      while not cdsCondPgto_Dia.Eof do
      begin
        if (cdsCondPgto_Dia.RecordCount = cdsCondPgto_Dia.RecNo) and
           (StrToFloat(FormatFloat('0.00',vVlrParcelas)) <> StrToFloat(FormatFloat('0.00',vVlrRestante))) then
          vVlrParcelas := StrToFloat(FormatFloat('0.00',vVlrRestante));

        vDataAux := cdsCupomFiscalDTEMISSAO.AsDateTime + cdsCondPgto_DiaQtdDias.AsInteger;
        Gravar_CupomFiscalParc(vDataAux,vVlrParcelas, vID_TipoCobranca);
        vVlrRestante := StrToFloat(FormatFloat('0.00',vVlrRestante - vVlrParcelas));

        if StrToFloat(FormatFloat('0.00',vVlrRestante)) <= 0 then
          cdsCondPgto_Dia.Last;
        cdsCondPgto_Dia.Next;
      end
    end
    else
    begin
      vDataAux := cdsCupomFiscalDTEMISSAO.AsDateTime;
      if vDataEntrada > 1 then
        vDataAux := vDataEntrada;
      for i := 1 to cdsCondPgtoQTD_PARCELA.AsInteger do
      begin
        if StrToFloat(FormatFloat('0.00',vVlrParcelas)) > StrToFloat(FormatFloat('0.00',vVlrRestante)) then
          vVlrParcelas := StrToFloat(FormatFloat('0.00',vVlrRestante));
        if (i = cdsCondPgtoQTD_PARCELA.AsInteger) and
           (StrToFloat(FormatFloat('0.00',vVlrParcelas)) < StrToFloat(FormatFloat('0.00',vVlrRestante))) then
          vVlrParcelas := StrToFloat(FormatFloat('0.00',vVlrParcelas + (vVlrRestante - vVlrParcelas)));
        vDataAux := IncMonth(vDataAux,1);
        Gravar_CupomFiscalParc(vDataAux,vVlrParcelas, vID_TipoCobranca);
        vVlrRestante := StrToFloat(FormatFloat('0.00',vVlrRestante - vVlrParcelas));
      end
    end;
  end;
end;

procedure TdmCupomFiscal.Gravar_CupomFiscalParc(Data: TDateTime; Valor: Real; ID_TipoCobranca : Integer);
var
  vParcelaAux: Integer;
begin
  cdsCupom_Parc.Last;
  if (Data = Date) and (cdsCondPgtoENTRADA.AsString = 'S') then
    vParcelaAux := -1
  else
    vParcelaAux := cdsCupom_ParcPARCELA.AsInteger;

  cdsCupom_Parc.Insert;
  cdsCupom_ParcID.AsInteger            := cdsCupomFiscalID.AsInteger;
  cdsCupom_ParcPARCELA.AsInteger       := vParcelaAux + 1;
  cdsCupom_ParcDTVENCIMENTO.AsDateTime := Data;
  cdsCupom_ParcVLR_VENCIMENTO.AsFloat  := StrToFloat(FormatFloat('0.00',Valor));
  if cdsCupom_ParcPARCELA.AsInteger = 0 then
  begin
    qTipoDinheiro.Open;
    cdsCupom_ParcID_TIPOCOBRANCA.AsInteger := qTipoDinheiro.FieldByName('ID').AsInteger;
    cdsCupom_ParcTIPO_COBRANCA.AsString    := qTipoDinheiro.FieldByName('NOME').AsString;
    qTipoDinheiro.Close;
  end
  else
  begin
    cdsTipoCobranca.Locate('ID',ID_TipoCobranca,[loCaseInsensitive]);
    cdsCupom_ParcID_TIPOCOBRANCA.AsInteger := cdsTipoCobrancaID.AsInteger;
    cdsCupom_ParcTIPO_COBRANCA.AsString    := cdsTipoCobrancaNOME.AsString;
//    cdsCupom_ParcTIPO_COBRANCA.AsString    := ComboFormaPagto.Text;
  end;
  cdsCupom_ParcEDITADA.AsString := 'N';
  cdsCupom_Parc.Post;
end;

procedure TdmCupomFiscal.prc_Inserir_FormaPagto;
var
  vItem : Integer;
begin
  cdsCupomFiscal_FormaPgto.Last;
  vItem := cdsCupomFiscal_FormaPgtoITEM.AsInteger + 1;
  cdsCupomFiscal_FormaPgto.Insert;
  cdsCupomFiscal_FormaPgtoID.AsInteger := cdsCupomFiscalID.AsInteger;
  cdsCupomFiscal_FormaPgtoITEM.AsInteger := vItem;
end;


procedure TdmCupomFiscal.prc_Consultar_Troca(NumCupom, ID_Produto: Integer;
  Serie, Referencia, Nome: String; Data: TDateTime);
begin
  cdsTroca.Close;
  sdsTroca.CommandText := ctTroca;
  if NumCupom > 0 then
  begin
    sdsTroca.CommandText := sdsTroca.CommandText + ' AND C.NUMCUPOM = ' + IntToStr(NumCupom);
    if trim(Serie) <> '' then
      sdsTroca.CommandText := sdsTroca.CommandText + ' AND C.SERIE = ' + QuotedStr(Serie);
  end
  else
  begin
    if trim(Serie) <> '' then
      sdsTroca.CommandText := sdsTroca.CommandText + ' AND C.SERIE = ' + QuotedStr(Serie);
    if ID_Produto > 0 then
      sdsTroca.CommandText := sdsTroca.CommandText + ' AND I.ID_PRODUTO = ' + IntToStr(ID_Produto);
    if trim(Referencia) <> '' then
      sdsTroca.CommandText := sdsTroca.CommandText + ' AND I.REFERENCIA LIKE ' + QuotedStr('%'+Referencia+'%');
    if trim(Nome) <> '' then
      sdsTroca.CommandText := sdsTroca.CommandText + ' AND I.NOME_PRODUTO LIKE ' + QuotedStr('%'+Nome+'%');
    if Data > 10 then
      sdsTroca.CommandText := sdsTroca.CommandText + ' AND C.DTEMISSAO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Data));
  end;
  cdsTroca.Open;
  cdsTroca.IndexName := cdsTroca.IndexDefs[0].Name;
  cdstroca.First;
end;

procedure TdmCupomFiscal.prc_Inserir_Troca;
var
  vAux, vItem : Integer;
begin
  if not(cdsCupom_Troca.Active) or (cdsCupom_TrocaID_CUPOM.AsInteger <> cdsCupomFiscalID.AsInteger) then
  begin
    cdsCupom_Troca.Close;
    sdsCupom_Troca.ParamByName('ID_CUPOM').AsInteger := cdsCupomFiscalID.AsInteger;
    cdsCupom_Troca.Open;
    vAux := dmDatabase.ProximaSequencia('CUPOMFISCAL_TROCA',0);
    vAux := vAux + 1;
  end
  else
    vAux := cdsCupom_TrocaID.AsInteger;
  cdsCupom_Troca.Last;
  vItem := cdsCupom_TrocaITEM.AsInteger;

  cdsCupom_Troca.Insert;
  cdsCupom_TrocaID.AsInteger       := vAux;
  cdsCupom_TrocaITEM.AsInteger     := vItem + 1;
  cdsCupom_TrocaID_CUPOM.AsInteger := cdsCupomFiscalID.AsInteger;
end;

procedure TdmCupomFiscal.prc_Busca_CodBenef;
var
  vCod_CBenef_Loc : String;
  vID_ICMS : Integer;
  vUsouICM : Boolean;
begin
  if cdsCupom_ItensID_VARIACAO.AsInteger > 0 then
  begin
    if not cdsCFOP_Variacao.Locate('ID;ITEM',VarArrayOf([cdsCFOPID.AsInteger,cdsCupom_ItensID_VARIACAO.AsInteger]),[locaseinsensitive]) then
      cdsCupom_ItensID_VARIACAO.AsInteger := 0
    else
    begin
      if trim(cdsCFOP_VariacaoCOD_BENEF.AsString) <> '' then
        vCod_CBenef_Loc := cdsCFOP_VariacaoCOD_BENEF.AsString;
    end
  end;

  if (cdsCFOPGERAR_ICMS.AsString = 'S') and (cdsFilialSIMPLES.AsString <> 'S') then
  begin
    if cdsProdutoID_CSTICMS.AsInteger > 0 then
    begin
      vID_ICMS := cdsProdutoID_CSTICMS.AsInteger;
      if cdsTab_CSTICMS.Locate('ID',vID_ICMS,[loCaseInsensitive]) then
      begin
        if cdsTab_CSTICMSCOD_CST.AsString = '00' then
          vCod_CBenef_Loc := ''
        else
        if trim(cdsProdutoCOD_BENEF.AsString) <> '' then
          vCod_CBenef_Loc := cdsProdutoCOD_BENEF.AsString;
      end;
    end
    else
    begin
      if cdsTab_NCMID_CST_ICMS.AsInteger > 0 then
      begin
        vID_ICMS := cdsTab_NCMID_CST_ICMS.AsInteger;
        if cdsTab_CSTICMS.Locate('ID',vID_ICMS,[loCaseInsensitive]) then
        begin
          if cdsTab_CSTICMSCOD_CST.AsString = '00' then
            vCod_CBenef_Loc := ''
          else
          if trim(cdsTab_NCMCOD_BENEF.AsString) <> '' then
            vCod_CBenef_Loc := cdsTab_NCMCOD_BENEF.AsString;
        end;
      end;
    end;
  end;

  qPessoa_Fiscal.Close;
  qPessoa_Fiscal.ParamByName('CODIGO').AsInteger := cdsCupomFiscalID_CLIENTE.AsInteger;
  qPessoa_Fiscal.Open;
  vUsouICM := False;
  if (cdsCFOPGERAR_ICMS.AsString = 'S') and (cdsFilialSIMPLES.AsString <> 'S') then
  begin
    if qPessoa_FiscalID_CST_ICMS.AsInteger > 0 then
    begin
      vID_ICMS := qPessoa_FiscalID_CST_ICMS.AsInteger;
      if cdsTab_CSTICMS.Locate('ID',vID_ICMS,[loCaseInsensitive]) then
      begin
        if cdsTab_CSTICMSCOD_CST.AsString = '00' then
          vCod_CBenef_Loc := ''
        else
        if trim(qPessoa_FiscalCOD_BENEF.AsString) <> '' then
          vCod_CBenef_Loc := qPessoa_FiscalCOD_BENEF.AsString;
        vUsouICM := True;
      end;
    end;
  end;
  //  10/02/2020
  cdsCupom_ItensCOD_CBENEF.AsString := vCod_CBenef_Loc;
end;

procedure TdmCupomFiscal.cdsCupom_TrocaCalcFields(DataSet: TDataSet);
begin
  qProd.Close;
  qProd.ParamByName('ID').AsInteger := cdsCupom_TrocaID_PRODUTO.AsInteger;
  qProd.Open;
  cdsCupom_TrocaclNome_Produto.AsString := qProdNOME.AsString;
end;

function TdmCupomFiscal.fnc_Existe_Cartao_Pendente(
  Num_Cartao: Integer): Integer;
var
  sds: TSQLDataSet;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select C.ID from cupomfiscal C WHERE NUM_CARTAO = :NUM_CARTAO AND COALESCE(COPIADO,' + QuotedStr('N') + ') = ' + QuotedStr('N')
                       + ' AND C.TIPO = ' + QuotedStr('COM');
    SDS.ParamByName('NUM_CARTAO').AsInteger := Num_Cartao;
    sds.Open;
    Result := sds.FieldByName('ID').AsInteger;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TdmCupomFiscal.prc_Atualiza_Comanda(ID_Cupom: Integer);
begin
  spAtualizaComanda.Params[0].Value := ID_Cupom;
  spAtualizaComanda.ExecProc;
end;

procedure TdmCupomFiscal.prc_Voltar_Comanda(ID_Cupom: Integer);
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'update cupomfiscal c set c.copiado = ' + QuotedStr('N') + ' , c.id_cupom_copiado = 0 '
                       + 'where id_cupom_copiado = ' + IntToStr(ID_Cupom);
    sds.ExecSQL();
  finally
      FreeAndNil(sds);
  end;
end;

procedure TdmCupomFiscal.cdsCupom_ItensCalcFields(DataSet: TDataSet);
begin
  cdsCupom_ItensclValorTotalDesconto.AsFloat := cdsCupom_ItensVLR_DESCONTO.AsFloat + cdsCupom_ItensVLR_DESCONTORATEIO.AsFloat;
end;

procedure TdmCupomFiscal.prc_Abrir_cdsVendedor;
begin
  cdsVendedor.Close;
  if (qParametros_GeralUSAR_PESSOA_FILIAL.AsString = 'S') and (cdsFilial.RecordCount = 1) then
    sdsVendedor.ParamByName('FILIAL').AsInteger := cdsFilialID.AsInteger
  else
    sdsVendedor.ParamByName('FILIAL').AsInteger := 0;
  cdsVendedor.Open;
end;

procedure TdmCupomFiscal.prc_Gravar_Recibo_Troca(ID_Cupom: Integer;
  Nome: String);
begin
  sds_prc_Recibo_Troca.Close;
  sds_prc_Recibo_Troca.ParamByName('P_ID').AsInteger          := ID_Cupom;
  sds_prc_Recibo_Troca.ParamByName('P_NOME_CLIENTE').AsString := Nome;
  sds_prc_Recibo_Troca.ExecSQL;
end;

procedure TdmCupomFiscal.prc_Gravar_Rateio_Recibo(ID_Cupom: Integer);
var
  aCalculoRateio : TCalculaRateio;
begin
  prcLocalizar(ID_Cupom);
  aCalculoRateio := TCalculaRateio.Create;
  try
    aCalculoRateio.ValorRateio := cdsCupomFiscalVLR_RECIBO_USADO.AsFloat;
    aCalculoRateio.ValorTotalProdutos := cdsCupomFiscalVLR_PRODUTOS.AsFloat;
    cdsCupom_Itens.First;
    while not cdscupom_itens.Eof do
    begin
      cdsCupom_Itens.Edit;
      aCalculoRateio.ValorProduto := cdsCupom_ItensVLR_TOTAL.AsFloat;
      cdsCupom_ItensVALOR_RATEIO_RECIBO.AsFloat := aCalculoRateio.CalcularRateio;
      cdsCupom_Itens.Post;
      cdsCupom_Itens.ApplyUpdates(0);
      cdsCupom_Itens.Next;
    end;
    if aCalculoRateio.ValorDiferenca <> cdsCupomFiscalVLR_RECIBO_USADO.AsFloat then
    begin
      cdsCupom_Itens.Last;
      cdsCupom_Itens.Edit;
      cdsCupom_ItensVALOR_RATEIO_RECIBO.AsFloat := cdsCupom_ItensVALOR_RATEIO_RECIBO.AsFloat + (cdsCupomFiscalVLR_RECIBO_USADO.AsFloat - aCalculoRateio.ValorDiferenca);
      cdsCupom_Itens.Post;
      cdsCupom_Itens.ApplyUpdates(0);
    end;
  finally
    FreeAndNil(aCalculoRateio);
  end;
end;

procedure TdmCupomFiscal.prc_Gravar_Rateio_Troca(ID_Cupom: Integer);
var
  aCalculoRateio : TCalculaRateio;
begin
  prcLocalizar(ID_Cupom);
  aCalculoRateio := TCalculaRateio.Create;
  try
    aCalculoRateio.ValorRateio := cdsCupomFiscalVLR_TROCA_USADA.AsFloat;
    aCalculoRateio.ValorTotalProdutos := cdsCupomFiscalVLR_PRODUTOS.AsFloat;
    cdsCupom_Itens.First;
    while not cdscupom_itens.Eof do
    begin
      cdsCupom_Itens.Edit;
      aCalculoRateio.ValorProduto := cdsCupom_ItensVLR_TOTAL.AsFloat;
      cdsCupom_ItensVALOR_RATEIO_TROCA.AsFloat := aCalculoRateio.CalcularRateio;
      cdsCupom_Itens.Post;
      cdsCupom_Itens.ApplyUpdates(0);
      cdsCupom_Itens.Next;
    end;
    if aCalculoRateio.ValorDiferenca <> cdsCupomFiscalVLR_TROCA_USADA.AsFloat then
    begin
      cdsCupom_Itens.Last;
      cdsCupom_Itens.Edit;
      cdsCupom_ItensVALOR_RATEIO_TROCA.AsFloat := cdsCupom_ItensVALOR_RATEIO_TROCA.AsFloat + (cdsCupomFiscalVLR_TROCA_USADA.AsFloat - aCalculoRateio.ValorDiferenca);
      cdsCupom_Itens.Post;
      cdsCupom_Itens.ApplyUpdates(0);
    end;
  finally
    FreeAndNil(aCalculoRateio);
  end;
end;

procedure TdmCupomFiscal.prc_Gravar_Rateio_Recibo_Troca(ID_Cupom: Integer);
var
  aCalculoRateio : TCalculaRateio;
begin
  prcLocalizar(ID_Cupom);
  aCalculoRateio := TCalculaRateio.Create;
  try
    aCalculoRateio.ValorRateio := cdsCupomFiscalVLR_RECIBO_TROCA.AsFloat;
    aCalculoRateio.ValorTotalProdutos := cdsCupomFiscalVLR_PRODUTOS.AsFloat;
    cdsCupom_Itens.First;
    while not cdscupom_itens.Eof do
    begin
      cdsCupom_Itens.Edit;
      aCalculoRateio.ValorProduto := cdsCupom_ItensVLR_TOTAL.AsFloat;
      cdsCupom_ItensVALOR_RATEIO_RECIBO_TROCA.AsFloat := aCalculoRateio.CalcularRateio;
      cdsCupom_Itens.Post;
      cdsCupom_Itens.ApplyUpdates(0);
      cdsCupom_Itens.Next;
    end;
    if aCalculoRateio.ValorDiferenca <> cdsCupomFiscalVLR_RECIBO_TROCA.AsFloat then
    begin
      cdsCupom_Itens.Last;
      cdsCupom_Itens.Edit;
      cdsCupom_ItensVALOR_RATEIO_RECIBO_TROCA.AsFloat := cdsCupom_ItensVALOR_RATEIO_RECIBO_TROCA.AsFloat + (cdsCupomFiscalVLR_RECIBO_TROCA.AsFloat - aCalculoRateio.ValorDiferenca);
      cdsCupom_Itens.Post;
      cdsCupom_Itens.ApplyUpdates(0);
    end;
  finally
    FreeAndNil(aCalculoRateio);
  end;
end;

function TdmCupomFiscal.prc_Lista_Preco(ID_Produto: Integer): Boolean;
var
  frmSel_Produto_Preco: TfrmSel_Produto_Preco;
  vItem: Integer;
begin
  Result := False;
  if (cdsCupomParametrosUSA_TABELA_PRECO.AsString <> 'S') then
    Exit;

//  if (cdsParametrosGeralEMPRESA_VAREJO.AsString <> 'S') then
//    Exit;

  sqlConsulta.SQL.Clear;
  sqlConsulta.SQL.Add('select PRO.ID, PRO.NOME, PRO.REFERENCIA, PRO.PRECO_VENDA, PRO.UNIDADE, PRO.PRECO_CUSTO, PV.PLACA, PRO.COD_BARRA, ');
  sqlConsulta.SQL.Add('VT.VLR_VENDA1, VT.VLR_VENDA2, VT.VLR_VENDA3, PRO.USA_COR, PRO.OBS, PRO.USA_PRECO_COR, ');
  sqlConsulta.SQL.Add('(select cast(sum(EST.QTD) as float) QTD from ESTOQUE_ATUAL EST where EST.FILIAL = :FILIAL and EST.ID_PRODUTO = PRO.ID) QTD, ');
  sqlConsulta.SQL.Add('(select cast(sum(E2.QTD) as float) QTDGERAL from ESTOQUE_ATUAL E2 where E2.ID_PRODUTO = PRO.ID) QTDGERAL, ');
  sqlConsulta.SQL.Add('cast(0 as float) as PRECO_PROMOCAO, PRO.OBS, M.NOME NOME_MARCA, PRO.MEDIDA ');
  sqlConsulta.SQL.Add('from PRODUTO PRO left join PRODUTO_VEICULO PV on (PRO.ID = PV.ID) ');
  sqlConsulta.SQL.Add('left join VTAB_PRECO VT on PRO.ID = VT.ID_PRODUTO left join MARCA M on PRO.ID_MARCA = M.ID ');
  sqlConsulta.SQL.Add('where PRO.ID = :ID_PRODUTO');
  sqlConsulta.ParamByName('FILIAL').AsInteger := vFilial;
  sqlConsulta.ParamByName('ID_PRODUTO').AsInteger := ID_Produto;
  sqlConsulta.Open;
  if sqlConsulta.IsEmpty then
  begin
    Result := False;
    Exit;
  end;

  if (sqlConsulta.FieldByName('VLR_VENDA1').AsFloat <= 0) and
     (sqlConsulta.FieldByName('VLR_VENDA2').AsFloat <= 0) and
     (sqlConsulta.FieldByName('VLR_VENDA3').AsFloat <= 0) then
  begin
    Result := False;
    Exit;
  end;

  frmSel_Produto_Preco := TfrmSel_Produto_Preco.Create(Self);
  try

    vItem := 1;
    frmSel_Produto_Preco.mPreco.Insert;
    frmSel_Produto_Preco.mPrecoItem.AsInteger := vItem;
    frmSel_Produto_Preco.mPrecoNome.AsString  := 'Cadastro';
    frmSel_Produto_Preco.mPrecoPreco.AsFloat  := StrToFloat(FormatFloat('0.00###',sqlConsulta.FieldByName('PRECO_VENDA').AsFloat));
    frmSel_Produto_Preco.mPreco.Post;
    vItem := vItem + 1;

    if StrToFloat(FormatFloat('0.00###',sqlConsulta.FieldByName('PRECO_PROMOCAO').AsFloat)) > 0 then
    begin
      frmSel_Produto_Preco.mPreco.Insert;
      frmSel_Produto_Preco.mPrecoItem.AsInteger := vItem;
      frmSel_Produto_Preco.mPrecoNome.AsString  := 'Preço Promocional';
      frmSel_Produto_Preco.mPrecoPreco.AsFloat := StrToFloat(FormatFloat('0.00###',sqlConsulta.FieldByName('PRECO_PROMOCAO').AsFloat));
      frmSel_Produto_Preco.mPreco.Post;
      vItem := vItem + 1;
    end;

    if StrToFloat(FormatFloat('0.00###',sqlConsulta.FieldByName('VLR_VENDA1').AsFloat)) > 0 then
    begin
      frmSel_Produto_Preco.mPreco.Insert;
      frmSel_Produto_Preco.mPrecoItem.AsInteger := vItem;
      frmSel_Produto_Preco.mPrecoNome.AsString  := 'Vlr. Venda 1';
      frmSel_Produto_Preco.mPrecoPreco.AsFloat := StrToFloat(FormatFloat('0.00###',sqlConsulta.FieldByName('VLR_VENDA1').AsFloat));
      frmSel_Produto_Preco.mPreco.Post;
      vItem := vItem + 1;
    end;

    if StrToFloat(FormatFloat('0.00###',sqlConsulta.FieldByName('VLR_VENDA2').AsFloat)) > 0 then
    begin
      frmSel_Produto_Preco.mPreco.Insert;
      frmSel_Produto_Preco.mPrecoItem.AsInteger := vItem;
      frmSel_Produto_Preco.mPrecoNome.AsString  := 'Vlr. Venda 2';
      frmSel_Produto_Preco.mPrecoPreco.AsFloat := StrToFloat(FormatFloat('0.00###',sqlConsulta.FieldByName('VLR_VENDA2').AsFloat));
      frmSel_Produto_Preco.mPreco.Post;
      vItem := vItem + 1;
    end;

    if StrToFloat(FormatFloat('0.00###',sqlConsulta.FieldByName('VLR_VENDA3').AsFloat)) > 0 then
    begin
      frmSel_Produto_Preco.mPreco.Insert;
      frmSel_Produto_Preco.mPrecoItem.AsInteger := vItem;
      frmSel_Produto_Preco.mPrecoNome.AsString  := 'Vlr. Venda 3';
      frmSel_Produto_Preco.mPrecoPreco.AsFloat := StrToFloat(FormatFloat('0.00###',sqlConsulta.FieldByName('VLR_VENDA3').AsFloat));
      frmSel_Produto_Preco.mPreco.Post;
      vItem := vItem + 1;
    end;

    frmSel_Produto_Preco.ShowModal;

  finally
    FreeAndNil(frmSel_Produto_Preco);
  end;

end;

procedure TdmCupomFiscal.prc_Gravar_Log(ID: Integer; Tipo: String);
var
  sds: TSQLDataSet;
  vGravar : Boolean;
begin
  if trim(qParametros_GeralUSA_NFCE_LOCAL.AsString) <> 'S' then
    exit;
  if trim(qParametros_GeralESTACAO_SERVIDOR_NFCE.AsString) <> 'E' then
    exit;
  vGravar := False;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata := True;
    sds.GetMetadata := False;
    sds.CommandText := 'SELECT COUNT(1) CONTADOR FROM PESSOA WHERE CODIGO = ' + IntToStr(ID);
    sds.Open;
    if (Tipo = 'E') and (sds.FieldByName('CONTADOR').AsInteger <= 0) then
      vGravar := True;
    if (Tipo = 'I') and (sds.FieldByName('CONTADOR').AsInteger > 0) then
      vGravar := True;
    if (Tipo = 'A') and (sds.FieldByName('CONTADOR').AsInteger > 0) then
      vGravar := True;
  finally
    FreeAndNil(sds);
  end;

  if not vGravar then
    exit;

  sdsPRC_GRAVA_PESSOA_LOG.Close;
  sdsPRC_GRAVA_PESSOA_LOG.ParamByName('P_ID_PESSOA').AsInteger := ID;
  if Tipo = 'I' then
    sdsPRC_GRAVA_PESSOA_LOG.ParamByName('P_TIPO').AsInteger := 0
  else
  if Tipo = 'A' then
    sdsPRC_GRAVA_PESSOA_LOG.ParamByName('P_TIPO').AsInteger := 1
  else
  if Tipo = 'E' then
    sdsPRC_GRAVA_PESSOA_LOG.ParamByName('P_TIPO').AsInteger := 2;
  sdsPRC_GRAVA_PESSOA_LOG.ExecSQL;
end;

end.

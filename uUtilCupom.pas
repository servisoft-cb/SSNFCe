unit uUtilCupom;

interface

uses
  Classes, SysUtils, Dialogs, SqlExpr, DmdDatabase, USenha, Messages,
  Controls, Graphics, UDMCupomFiscal, UDMParametros;

  function fnc_Inicio_Cupom(fDMCupomFiscal: TDMCupomFiscal ; fDMParametros: TDMParametros) : Boolean;

  procedure prc_Imp_Pedido_Mesa(Local : String);

  function fnc_Verifica_NFCe_Nao_Enviada : Boolean;

  function fnc_Verifica_Caixa_Aberto(Terminal: Integer) : Integer;

implementation

function fnc_Inicio_Cupom(fDMCupomFiscal: TDMCupomFiscal ; fDMParametros: TDMParametros) : Boolean;
begin
  {Result := True;
  if fDmCupomFiscal.cdsCupomParametrosEXIGE_CAIXA_ABERTO.AsString = 'S' then
  begin
    fDmParametros.qCaixaAberto.Close;
    fDmParametros.qCaixaAberto.ParamByName('T1').AsInteger := vTerminal;
    fDmParametros.qCaixaAberto.ParamByName('D1').AsDate    := Date;
    fDmParametros.qCaixaAberto.Open;
    if fDmParametros.qCaixaAberto.IsEmpty then
    begin
      ShowMessage('Não existe caixa aberto para efeturar venda!');
      fDmParametros.qCaixaAberto.Close;
      Result := False;
    end;
  end;

  if Result then
  begin
    fDmCupomFiscal.cdsPessoa.IndexFieldNames := 'CODIGO';
    if not fDmCupomFiscal.cdsPessoa.FindKey([fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger]) then
    begin
      ShowMessage('Não existe Cliente Consumidor código ' + fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsString + '!');
      Result := False;
    end;
  end;

  if (fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString = 'S') and (trim(fDmCupomFiscal.cdsFilialSERIE_NFCE.AsString) = '') then
  begin
    ShowMessage('Série da NFCe não informada na Filial!');
    Result := False;
  end;}
end;

procedure prc_Imp_Pedido_Mesa(Local : String);
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT C.ID, C.numcupom, C.num_cartao, C.num_mesa, I.item, I.data_hora_pedido, I.id_produto, '
                       + 'P.NOME NOME_PRODUTO, P.REFERENCIA, G.id ID_GRUPO, G.local_impressao, i.qtd, i.observacao '
                       + 'FROM CUPOMFISCAL C '
                       + 'INNER JOIN CUPOMFISCAL_ITENS I ON C.ID = I.ID '
                       + 'INNER JOIN PRODUTO P ON I.ID_PRODUTO = P.ID '
                       + 'LEFT JOIN GRUPO G ON P.id_grupo = G.ID '
                       + 'WHERE I.status = ' + QuotedStr('A')
                       + '     AND I.cancelado = ' + QuotedStr('N')
                       + '     AND G.LOCAL_IMPRESSAO = ' + QuotedStr(Local)
                       + ' ORDER BY I.data_hora_pedido ';

    sds.Open;
    while not sds.Eof do
    begin
      //Russimar
      //aqui imprimir no posprinter;
      //Depois de imprimir gravar STATUS = 'I' de impresso    esse campo esta na tabela CUPOMFISCAL_ITENS.
      // Se tu olhar ali encima o where é pego pelo status = 'A' que significa Aguardando

      sds.next;
    end;

  finally
    FreeAndNil(sds);
  end;

end;

function fnc_Verifica_NFCe_Nao_Enviada : Boolean;
var
  sds: TSQLDataSet;
  vDiasAux: Integer;
begin
  Result := False;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;

    sds.CommandText := 'SELECT COUNT(1) FROM CUPOMFISCAL '
                     + 'WHERE ((NFECHAVEACESSO = ' + QuotedStr('') +')'
                     + ' OR (NFECHAVEACESSO IS NULL)) '
                     + ' AND (TIPO = ' + QuotedStr('NFC') +')'
                     + ' AND (NUMCUPOM > 0)'
                     + ' AND (CANCELADO = ' + QuotedStr('N') + ')';
    sds.Open;
    Result := (sds.FieldByName('COUNT').AsInteger > 0);
    sds.Close;
  finally
    FreeAndNil(sds);
  end;

end;

function fnc_Verifica_Caixa_Aberto(Terminal: Integer) : Integer;
var
  sds: TSQLDataSet;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select first 1 ID from FECHAMENTO '
                       + 'where TERMINAL_ID = :T1 and TIPO_FECHAMENTO = ' + QuotedStr('N')
                       + ' order by ID desc ';
    sds.ParamByName('T1').AsInteger := Terminal;
    sds.Open;
    Result := sds.FieldByName('ID').AsInteger;
  finally
    FreeAndNil(sds);
  end;
end;

end.

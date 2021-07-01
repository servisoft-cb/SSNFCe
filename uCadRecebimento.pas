unit uCadRecebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXCtrls, StdCtrls, AdvGlowButton, ExtCtrls,
  ComCtrls, Mask, ToolEdit, CurrEdit, DBCtrls, dbcgrids, AdvPanel, uDmPagamento;

const
  InformandoDocumento      = 'InformandoDocumento';
  InformandoCliente        = 'InformandoCliente';
  InformandoPagamento      = 'InformandoPagamento';
  InformandoValorRecebido  = 'InformandoValorRecebido';
  InformandoDesconto       = 'InformandoDesconto';
  InformandoJuros          = 'InformandoJuros';
  FinalizandoRecebimento   = 'FinalizandoRecebimento';

type
  TfrmCadRecebimento = class(TForm)
    pnlTop: TPanel;
    pnlPrincipal: TPanel;
    pnlBotton: TPanel;
    btnF11: TAdvGlowButton;
    EntradaDados: TEdit;
    LblInstrucoes: TRxLabel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    TotalPagar: TCurrencyEdit;
    GridParcelas: TDBCtrlGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText3: TDBText;
    LblNomeSistema: TRxLabel;
    DBText11: TDBText;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    DBText6: TDBText;
    Label8: TLabel;
    DBText7: TDBText;
    Label9: TLabel;
    DBText8: TDBText;
    Label10: TLabel;
    DBText9: TDBText;
    Label11: TLabel;
    DBText10: TDBText;
    pnlValores: TPanel;
    LblEntrada: TRxLabel;
    edtSaldo: TCurrencyEdit;
    LblRecebido: TRxLabel;
    ValorRecebido: TCurrencyEdit;
    RxLabel2: TRxLabel;
    ValorTroco: TCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure EntradaDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnF11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fDMPagamento : TdmPagamento;
  public
    { Public declarations }
    EstadoRecCred : String;
    DataCalculo, DataBaixa : TDateTime ;
    procedure PreparaEstadoRec(Estado : string) ;
    procedure prc_InformandoCliente;
    procedure prc_InformandoPagamento;
    procedure prc_informandoValorRecebido;
    procedure prc_finalizandoRecebimento;
    procedure prc_Grava_MPagamento(ID_TipoPagamento : Integer; Valor : Real);
    procedure prc_Atualiza_Saldo;
  end;

var
  frmCadRecebimento: TfrmCadRecebimento;

implementation

uses
  uConsultaRapidaCliente, DB, uConsultaRapidaDuplicata, uConsultaRapidaTipoPgto,
  Math, uUtilPadrao;

{$R *.dfm}

{ TForm1 }

procedure TfrmCadRecebimento.PreparaEstadoRec(Estado: string);
begin
  if EstadoRecCred = InformandoCliente then
  begin
    LblInstrucoes.Caption := 'INFORME O NOME DO CLIENTE PARA PESQUISA' ;
    LblInstrucoes.Refresh ;
    pnlValores.Visible := False;
    exit ;
  end ;

  if EstadoRecCred = InformandoDocumento then
  begin
    LblInstrucoes.Caption := 'INFORME O NRO DO CONTRATO QUE DESEJA RECEBER OU NOME DO CLIENTE' ;
    LblInstrucoes.Refresh ;
    exit ;
  end ;

  if EstadoRecCred = InformandoPagamento then
  begin
    LblInstrucoes.Caption := 'SELECIONE UM TIPO PAGAMENTO';
    LblInstrucoes.Refresh ;
    pnlValores.Visible := True;
    exit ;
  end ;

  if EstadoRecCred = InformandoValorRecebido then
  begin
    LblInstrucoes.Caption := 'INFORME O VALOR RECEBIDO' ;
    LblInstrucoes.Refresh ;
    pnlValores.Visible := True;
    exit ;
  end ;

  if EstadoRecCred = FinalizandoRecebimento then
  begin
    LblInstrucoes.Caption := 'TECLE [ENTER] PARA EFETUAR A(S) BAIXA(S) DA(S) PARCELA(S)' ;
    LblInstrucoes.Refresh ;
    exit ;
  end ;

end;

procedure TfrmCadRecebimento.FormShow(Sender: TObject);
begin
  fDMPagamento := TdmPagamento.Create(Self);
  EstadoRecCred := 'InformandoCliente';
  PreparaEstadoRec(EstadoRecCred);
  fDMPagamento.qParametros.Open;
end;

procedure TfrmCadRecebimento.EntradaDadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN :
    begin
      if EstadoRecCred = InformandoCliente then
      begin
        prc_InformandoCliente;
        Exit;
      end;
      if EstadoRecCred = InformandoPagamento then
      begin
        prc_InformandoPagamento;
        Exit;
      end;
      if EstadoRecCred = InformandoValorRecebido then
      begin
        prc_informandoValorRecebido;
        Exit;
      end;
      if EstadoRecCred = FinalizandoRecebimento then
      begin
        prc_finalizandoRecebimento;
        Exit;
      end;

    end;
  end;
end;

procedure TfrmCadRecebimento.btnF11Click(Sender: TObject);
begin
//  EntradaDadosKeyDown(Sender, VK_F11, [ssAlt]);
end;

procedure TfrmCadRecebimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMPagamento);
  Action := caFree;
end;

procedure TfrmCadRecebimento.prc_InformandoCliente;
var
  ffrmConsultaRapidaCliente : TfrmConsultaRapidaCliente;
  ffrmConsultaRapidaDuplicata : TfrmConsultaRapidaDuplicata;
begin
  ffrmConsultaRapidaCliente := TfrmConsultaRapidaCliente.Create(Self);
  try
    ffrmConsultaRapidaCliente.VALOR.Text := EntradaDados.Text;
    ffrmConsultaRapidaCliente.ShowModal;
    if ffrmConsultaRapidaCliente.ModalResult = mrOk then
    begin
      fDmPagamento.cdsDuplicataCli.Close;
      fDmPagamento.sdsDuplicataCli.ParamByName('P1').AsInteger := ffrmConsultaRapidaCliente.cdsClienteCodigo.AsInteger;
      fDmPagamento.cdsDuplicataCli.Open;
      if not (fDMPagamento.cdsDuplicataCli.IsEmpty) then
      begin
        ffrmConsultaRapidaDuplicata := TfrmConsultaRapidaDuplicata.Create(Self);
        try
          ffrmConsultaRapidaDuplicata.fDmPagamento := fDmPagamento;
          ffrmConsultaRapidaDuplicata.ShowModal;
          if ffrmConsultaRapidaDuplicata.ModalResult = mrOk then
          begin
            EntradaDados.Clear;
            TotalPagar.Value := fDMPagamento.mSelecionadasagTotalPagar.value;
            TotalPagar.Update;
            EstadoRecCred := InformandoPagamento;
            PreparaEstadoRec(EstadoRecCred);
            prc_Atualiza_Saldo;
          end;
        finally
          FreeAndNil(ffrmConsultaRapidaDuplicata);
        end;
      end;
    end;

  finally
    FreeAndNil(ffrmConsultaRapidaCliente);
  end;

end;

procedure TfrmCadRecebimento.prc_InformandoPagamento;
var
  ffrmConsultaRapidaTipoPgto : TfrmConsultaRapidaTipoPagto;
begin
  if EntradaDados.Text = EmptyStr then
  begin
    ffrmConsultaRapidaTipoPgto := TfrmConsultaRapidaTipoPagto.Create(Self);
    try
      ffrmConsultaRapidaTipoPgto.fDmPagamento := fDMPagamento;
      ffrmConsultaRapidaTipoPgto.ShowModal;
      if ffrmConsultaRapidaTipoPgto.ModalResult = MrOk then
      begin
//        EntradaDados.Text := FloatToStr(edtSaldo.Value);
        EstadoRecCred := InformandoValorRecebido;
        PreparaEstadoRec(EstadoRecCred);
      end;
    finally
      FreeAndNil(ffrmConsultaRapidaTipoPgto);
    end;
  end;
end;

procedure TfrmCadRecebimento.prc_Atualiza_Saldo;
begin
  edtSaldo.Value := TotalPagar.Value - ValorRecebido.Value;
end;

procedure TfrmCadRecebimento.prc_informandoValorRecebido;
var
  vValorRecebido : Currency;
begin
  if EntradaDados.Text = EmptyStr then
  begin
    ShowMessage('O valor recebido deve ser informado') ;
    exit;
  end;

  try
    EntradaDados.Text := FloatToStr(StrToFloat(EntradaDados.Text)) ;
  except
    ShowMessage('O valor digitado não é válido') ;
    exit;
  end;
  vValorRecebido := StrToCurrDef(EntradaDados.Text,0);
  prc_Grava_MPagamento(vID_TipoCobranca,vValorRecebido);
end;

procedure TfrmCadRecebimento.prc_Grava_MPagamento(ID_TipoPagamento: Integer; Valor: Real);
begin
  if Valor = 0 then
    Exit;
  if fDMPagamento.mPagamentos.Locate('ID_TIPOCOBRANCA',ID_TipoPagamento,[loCaseInsensitive]) then
    fDmPagamento.mPagamentos.Edit
  else
    fDmPagamento.mPagamentos.Insert;
  fDmPagamento.mPagamentosID_TIPOCOBRANCA.AsCurrency := ID_TipoPagamento;
  fDmPagamento.mPagamentosVLR_PAGO.AsCurrency        := Valor;
  fDmPagamento.mPagamentosVLR_SALDO.AsCurrency       := fDmPagamento.mPagamentosVLR_PAGO.AsCurrency;
  fDmPagamento.mPagamentos.Post;

  ValorRecebido.Value := fDmPagamento.mPagamentosagValor_Recebido.Value;
  prc_Atualiza_Saldo;
  if FormatFloat('0.00', fDMPagamento.mPagamentosagValor_Recebido.Value) = FormatFloat('0.00', TotalPagar.Value) then
    EstadoRecCred := FinalizandoRecebimento
  else
    EstadoRecCred := InformandoPagamento;
  PreparaEstadoRec(EstadoRecCred);
  EntradaDados.Clear;
end;

procedure TfrmCadRecebimento.prc_finalizandoRecebimento;
begin
  if fDmPagamento.mPagamentos.IsEmpty then
  begin
    ShowMessage('Nenhuma forma de pagamento informada!');
    EstadoRecCred := InformandoPagamento;
    PreparaEstadoRec(EstadoRecCred);
    EntradaDados.SetFocus;
    Exit;
  end;


//  prcVerificarSaldo;
//
//  fDmPagamento.cdsDuplicata.IndexFieldNames    := 'ID';
//  fDmCadDuplicata.cdsDuplicata.IndexFieldNames := 'ID';
//
//  if CurrencyEdit4.Value > 0 then
//  begin
//    prcVerificarSaldo;
//    if MessageDlg('O valor pago não é suficiente para liquidar as parcelas!' + #13 +
//                  'Deseja gerar uma parcela com o saldo?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
//    begin
//      vGeraSaldo := True;
//      vSaldo     := CurrencyEdit4.Value;
//    end;
//  end;
//
//  fDmPagamento.mPagamentos.First;
//  while not fDmPagamento.mPagamentos.Eof do
//  begin
//    fDmPagamento.mSelecionadas.First;
//    while not fDmPagamento.mSelecionadas.Eof do
//    begin
//      fDMCadDuplicata.prc_Localizar(fDmPagamento.mSelecionadasID.AsInteger);
//      if fDmPagamento.mSelecionadasVLR_ABATIMENTO.AsCurrency = fDmPagamento.mSelecionadasVLR_TOTAL.AsCurrency then
//      begin
//        if fDmPagamento.mPagamentosVLR_SALDO.AsCurrency >= fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency then
//        begin
//          if fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency > 0 then
//          begin
//            if fDmPagamento.mSelecionadasVLR_DESC.AsCurrency > 0 then
//            begin
//              fDmPagamento.mSelecionadas.Edit;
//              fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency := fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency - fDmPagamento.mSelecionadasVLR_DESC.AsCurrency;
//              fDmPagamento.mSelecionadas.Post;
//              vVlrPgto := fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency;
//              prcGravarSelecionados(1,fDmPagamento.mPagamentosID_TIPOCOBRANCA.AsInteger,vVlrPgto,0,fDmPagamento.mSelecionadasVLR_DESC.AsCurrency);
//              vVlrPago := vVlrPago + vVlrPgto;
//            end
//            else
//            begin
//              vVlrPgto := fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency;
//              prcGravarSelecionados(1,fDmPagamento.mPagamentosID_TIPOCOBRANCA.AsInteger,vVlrPgto,0,0);
//              vVlrPago := vVlrPago + vVlrPgto;
//            end;
//            fDmPagamento.mSelecionadas.Edit;
//            fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency := fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency - vVlrPgto;
//            fDmPagamento.mSelecionadas.Post;
//
//            fDmPagamento.mPagamentos.Edit;
//            fDmPagamento.mPagamentosVLR_SALDO.AsCurrency := fDmPagamento.mPagamentosVLR_SALDO.AsCurrency - vVlrPgto;
//            fDmPagamento.mPagamentos.Post;
//          end;
//          if fDmPagamento.mPagamentosVLR_SALDO.AsCurrency >= fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency then
//          begin
//            if fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency > 0 then
//            begin
//              vVlrPgto := fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency;
//              prcGravarSelecionados(1,fDmPagamento.mPagamentosID_TIPOCOBRANCA.AsInteger,0,vVlrPgto,0);
//              vVlrPago := vVlrPago + vVlrPgto;
//
//              fDmPagamento.mSelecionadas.Edit;
//              fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency := fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency - vVlrPgto;
//              fDmPagamento.mSelecionadas.Post;
//
//              fDmPagamento.mPagamentos.Edit;
//              fDmPagamento.mPagamentosVLR_SALDO.AsCurrency := fDmPagamento.mPagamentosVLR_SALDO.AsCurrency - vVlrPgto;
//              fDmPagamento.mPagamentos.Post;
//            end
//            else
//              fDmPagamento.mSelecionadas.Next;
//            if (FormatFloat('0.00',vVlrPago) = FormatFloat('0.00',CurrencyEdit3.Value)) or
//               (FormatFloat('0.00',vVlrPago) = FormatFloat('0.00',CurrencyEdit2.Value)) then
//              fDmPagamento.mPagamentos.Next;
//            Continue;
//          end
//          else
//          begin
//            if (fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency > 0) and (fDmPagamento.mPagamentosVLR_SALDO.AsCurrency > 0)then
//            begin
//              vVlrPgto := fDmPagamento.mPagamentosVLR_SALDO.AsCurrency;
//              prcGravarSelecionados(1,fDmPagamento.mPagamentosID_TIPOCOBRANCA.AsInteger,0,vVlrPgto,0);
//              vVlrPago := vVlrPago + vVlrPgto;
//
//              fDmPagamento.mSelecionadas.Edit;
//              fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency := fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency - vVlrPgto;
//              fDmPagamento.mSelecionadas.Post;
//
//              fDmPagamento.mPagamentos.Edit;
//              fDmPagamento.mPagamentosVLR_SALDO.AsCurrency := fDmPagamento.mPagamentosVLR_SALDO.AsCurrency - vVlrPgto;
//              fDmPagamento.mPagamentos.Post;
//            end;
//          end;
//        end
//        else
//        begin
//          if fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency > 0 then
//          begin
//            if StrToFloat(FormatFloat('0.00',(fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency - fDmPagamento.mSelecionadasVLR_DESC.AsCurrency))) = 0 then
//            begin
//              fDmPagamento.mSelecionadas.Edit;
//              fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency := fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency -
//                                                                      fDmPagamento.mSelecionadasVLR_DESC.AsCurrency;
//              fDmPagamento.mSelecionadas.Post;
//              fDmPagamento.mPagamentos.Next;
//              Continue;
//            end;
//            vVlrPgto := fDmPagamento.mPagamentosVLR_SALDO.AsCurrency;
//            prcGravarSelecionados(1,fDmPagamento.mPagamentosID_TIPOCOBRANCA.AsInteger,vVlrPgto,0,fDmPagamento.mSelecionadasVLR_DESC.AsCurrency);
//            vVlrPago := vVlrPago + vVlrPgto;
//
//            fDmPagamento.mSelecionadas.Edit;
//            fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency := fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency - vVlrPgto;
//            fDmPagamento.mSelecionadas.Post;
//
//            fDmPagamento.mPagamentos.Edit;
//            fDmPagamento.mPagamentosVLR_SALDO.AsCurrency := fDmPagamento.mPagamentosVLR_SALDO.AsCurrency - vVlrPgto;
//            fDmPagamento.mPagamentos.Post;
//          end
//          else
//          begin
//            if fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency > 0 then
//            begin
//              if fDmPagamento.mPagamentosVLR_SALDO.AsCurrency > fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency then
//                vVlrPgto := fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency
//              else
//                vVlrPgto := fDmPagamento.mPagamentosVLR_SALDO.AsCurrency;
//            end;
//            prcGravarSelecionados(1,fDmPagamento.mPagamentosID_TIPOCOBRANCA.AsInteger,0,vVlrPgto,0);
//            vVlrPago := vVlrPago + vVlrPgto;
//
//            fDmPagamento.mSelecionadas.Edit;
//            fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency := fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency - vVlrPgto;
//            fDmPagamento.mSelecionadas.Post;
//
//            fDmPagamento.mPagamentos.Edit;
//            fDmPagamento.mPagamentosVLR_SALDO.AsCurrency := fDmPagamento.mPagamentosVLR_SALDO.AsCurrency - vVlrPgto;
//            fDmPagamento.mPagamentos.Post;
//
//            if fDmPagamento.mPagamentosVLR_SALDO.AsCurrency = 0 then
//              fDmPagamento.mPagamentos.Next;
//          end;
//        end;
//      end
//      else
//      begin
//        vVlrPgto := fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency;
//        prcGravarSelecionados(1,fDmPagamento.mPagamentosID_TIPOCOBRANCA.AsInteger,vVlrPgto,0,0);
//        vVlrPago := vVlrPago + vVlrPgto;
//        if fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency > 0 then
//        begin
//          vVlrPgto := fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency;
//          prcGravarSelecionados(1,fDmPagamento.mPagamentosID_TIPOCOBRANCA.AsInteger,0,vVlrPgto,0);
//          vVlrPago := vVlrPago + vVlrPgto;
//        end;
//        prcInsereParcela(vSaldo);
//        fDmPagamento.mSelecionadas.Next;
//      end;
//      fDmPagamento.mPagamentos.Next;
//    end;
//  end;
//
//  prcGravaPagamento;
//
//  if vImprimir = 'N' then
//    prcLimparCampos;

end;

end.

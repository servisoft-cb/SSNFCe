unit UComparar_Cupom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, Provider, DBClient, NxCollection, Grids,
  DBGrids, SMDBGrid, StdCtrls, RxLookup, NxEdit, ExtCtrls;

type
  TfrmComparar_Cupom = class(TForm)
    sdsCupom: TSQLDataSet;
    dspCupom: TDataSetProvider;
    cdsCupom: TClientDataSet;
    dsCupom: TDataSource;
    cdsCupomID: TIntegerField;
    cdsCupomNUMCUPOM: TIntegerField;
    cdsCupomSERIE: TStringField;
    cdsCupomTIPO: TStringField;
    cdsCupomDTEMISSAO: TDateField;
    cdsCupomVLR_PRODUTOS: TFloatField;
    cdsCupomVLR_TOTAL: TFloatField;
    cdsCupomVLR_DESCONTO: TFloatField;
    cdsCupomVLR_TROCA: TFloatField;
    cdsCupomVLR_RECIBO_TROCA: TFloatField;
    cdsCupomVLR_RECIBO_USADO: TFloatField;
    cdsCupomVLR_TROCA_USADA: TFloatField;
    cdsCupomVLR_VALE_USADO: TFloatField;
    cdsCupomVLR_CASHBACK: TFloatField;
    cdsCupomVLR_CASHBACK_USADO: TFloatField;
    cdsCupomNFECHAVEACESSO: TStringField;
    cdsCupomNFEPROTOCOLO: TStringField;
    sdsCupom_Servidor: TSQLDataSet;
    dspCupom_Servidor: TDataSetProvider;
    cdsCupom_Servidor: TClientDataSet;
    dsCupom_Servidor: TDataSource;
    cdsCupom_ServidorID: TIntegerField;
    cdsCupom_ServidorNUMCUPOM: TIntegerField;
    cdsCupom_ServidorSERIE: TStringField;
    cdsCupom_ServidorTIPO: TStringField;
    cdsCupom_ServidorDTEMISSAO: TDateField;
    cdsCupom_ServidorVLR_PRODUTOS: TFloatField;
    cdsCupom_ServidorVLR_TOTAL: TFloatField;
    cdsCupom_ServidorVLR_DESCONTO: TFloatField;
    cdsCupom_ServidorVLR_TROCA: TFloatField;
    cdsCupom_ServidorVLR_RECIBO_TROCA: TFloatField;
    cdsCupom_ServidorVLR_RECIBO_USADO: TFloatField;
    cdsCupom_ServidorVLR_TROCA_USADA: TFloatField;
    cdsCupom_ServidorVLR_VALE_USADO: TFloatField;
    cdsCupom_ServidorVLR_CASHBACK: TFloatField;
    cdsCupom_ServidorVLR_CASHBACK_USADO: TFloatField;
    cdsCupom_ServidorNFECHAVEACESSO: TStringField;
    cdsCupom_ServidorNFEPROTOCOLO: TStringField;
    NxPanel1: TNxPanel;
    btnConsultar: TNxButton;
    mAuxiliar: TClientDataSet;
    dsAuxiliar: TDataSource;
    mAuxiliarID_Local: TIntegerField;
    mAuxiliarNUMCUPOM_Local: TIntegerField;
    mAuxiliarSERIE_Local: TStringField;
    mAuxiliarTIPO_Local: TStringField;
    mAuxiliarDTEMISSAO_Local: TDateField;
    mAuxiliarVLR_PRODUTOS_Local: TFloatField;
    mAuxiliarVLR_TOTAL_Local: TFloatField;
    mAuxiliarVLR_DESCONTO_Local: TFloatField;
    mAuxiliarVLR_TROCA_Local: TFloatField;
    mAuxiliarVLR_RECIBO_TROCA_Local: TFloatField;
    mAuxiliarVLR_RECIBO_USADO_Local: TFloatField;
    mAuxiliarVLR_TROCA_USADA_Local: TFloatField;
    mAuxiliarVLR_VALE_USADO_Local: TFloatField;
    mAuxiliarVLR_CASHBACK_Local: TFloatField;
    mAuxiliarVLR_CASHBACK_USADO_Local: TFloatField;
    mAuxiliarNFECHAVEACESSO_Local: TStringField;
    mAuxiliarNFEPROTOCOLO_Local: TStringField;
    mAuxiliarID_Servidor: TIntegerField;
    mAuxiliarNUMCUPOM_Servidor: TIntegerField;
    mAuxiliarSERIE_Servidor: TStringField;
    mAuxiliarTIPO_Servidor: TStringField;
    mAuxiliarDTEMISSAO_Servidor: TDateField;
    mAuxiliarVLR_PRODUTOS_Servidor: TFloatField;
    mAuxiliarVLR_TOTAL_Servidor: TFloatField;
    mAuxiliarVLR_DESCONTO_Servidor: TFloatField;
    mAuxiliarVLR_TROCA_Servidor: TFloatField;
    mAuxiliarVLR_RECIBO_TROCA_Servidor: TFloatField;
    mAuxiliarVLR_RECIBO_USADO_Servidor: TFloatField;
    mAuxiliarVLR_TROCA_USADA_Servidor: TFloatField;
    mAuxiliarVLR_VALE_USADO_Servidor: TFloatField;
    mAuxiliarVLR_CASHBACK_Servidor: TFloatField;
    mAuxiliarVLR_CASHBACK_USADO_Servidor: TFloatField;
    mAuxiliarNFECHAVEACESSO_Servidor: TStringField;
    mAuxiliarNFEPROTOCOLO_Servidor: TStringField;
    SMDBGrid1: TSMDBGrid;
    mAuxiliarDiferenca: TStringField;
    mAuxiliarCampo_Diferenca: TStringField;
    Label1: TLabel;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DtInicial: TNxDatePicker;
    Label3: TLabel;
    DtFinal: TNxDatePicker;
    cdsCupomID_CLIENTE: TIntegerField;
    cdsCupom_ServidorID_CLIENTE: TIntegerField;
    mAuxiliarCliente_OK: TStringField;
    mAuxiliarVendedor_OK: TStringField;
    qCliente_Servidor: TSQLQuery;
    qCliente_ServidorEXISTE: TIntegerField;
    cdsCupomID_VENDEDOR: TIntegerField;
    cdsCupom_ServidorID_VENDEDOR: TIntegerField;
    mAuxiliarID_CLIENTE_Servidor: TIntegerField;
    mAuxiliarID_VENDEDOR_Servidor: TIntegerField;
    mAuxiliarID_CLIENTE_Local: TIntegerField;
    mAuxiliarID_VENDEDOR_Local: TIntegerField;
    NxPanel2: TNxPanel;
    NxButton2: TNxButton;
    Shape1: TShape;
    Label4: TLabel;
    Shape2: TShape;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure mAuxiliarNewRecord(DataSet: TDataSet);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure NxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComparar_Cupom: TfrmComparar_Cupom;

implementation

uses DmdDatabase, uUtilPadrao;

{$R *.dfm}

procedure TfrmComparar_Cupom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmComparar_Cupom.FormShow(Sender: TObject);
begin
  cdsFilial.Open;
  RxDBLookupCombo1.KeyValue := cdsFilialID.AsInteger;
  DtInicial.Clear;
  DtFinal.Clear;
end;

procedure TfrmComparar_Cupom.btnConsultarClick(Sender: TObject);
var
  x : Integer;
  Form : TForm;
begin
  SMDBGrid1.DisableScroll;
  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form,'... Cupons (Local)');
  try
    cdsCupom.Close;
    sdsCupom.ParamByName('Data1').AsDate := DtInicial.Date;
    sdsCupom.ParamByName('Data2').AsDate := DtFinal.Date;
    sdsCupom.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    cdsCupom.Open;

    cdsCupom_Servidor.Close;
    sdsCupom_Servidor.ParamByName('Data1').AsDate     := DtInicial.Date;
    sdsCupom_Servidor.ParamByName('Data2').AsDate     := DtFinal.Date;
    sdsCupom_Servidor.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    cdsCupom_Servidor.Open;

    mAuxiliar.EmptyDataSet;
    cdsCupom.First;
    while not cdsCupom.Eof do
    begin
      mAuxiliar.Insert;
      for x := 0 to (cdsCupom.FieldCount - 1) do
      begin
        mAuxiliar.FieldByName(cdsCupom.Fields[x].FieldName + '_Local').AsVariant := cdsCupom.Fields[x].Value;
      end;
      mAuxiliarDiferenca.AsString := 'S';
      mAuxiliar.Post;

      cdsCupom.Next;
    end;

    uUtilPadrao.prc_Form_Aguarde(Form,'... Cupons (Servidor)');

    cdsCupom_Servidor.First;
    while not cdsCupom_Servidor.Eof do
    begin
      if mAuxiliar.Locate('NUMCUPOM_Local;SERIE_Local;TIPO_Local',VarArrayOf([cdsCupom_ServidorNUMCUPOM.AsInteger,cdsCupom_ServidorSERIE.AsString,cdsCupom_ServidorTIPO.AsString]),[locaseinsensitive]) then
        mAuxiliar.Edit
      else
        mAuxiliar.Insert;
      mAuxiliarDiferenca.AsString := 'N';
      for x := 0 to (cdsCupom_Servidor.FieldCount - 1) do
      begin
        mAuxiliar.FieldByName(cdsCupom_Servidor.Fields[x].FieldName + '_Servidor').AsVariant := cdsCupom_Servidor.Fields[x].Value;
        if mAuxiliar.FieldByName(cdsCupom_Servidor.Fields[x].FieldName + '_Servidor').Value <> mAuxiliar.FieldByName(cdsCupom_Servidor.Fields[x].FieldName + '_Local').Value then
        begin
          if (cdsCupom_Servidor.Fields[x].FieldName <> 'ID') and (trim(mAuxiliarCampo_Diferenca.AsString) = '')
            and ((copy(cdsCupom_Servidor.Fields[x].FieldName,1,4) = 'VLR_') or (copy(cdsCupom_Servidor.Fields[x].FieldName,1,14) = 'NFECHAVEACESSO')
             or (copy(cdsCupom_Servidor.Fields[x].FieldName,1,14) = 'NFEPROTOCOLO'))  then
          begin
            mAuxiliarDiferenca.AsString := 'S';
            mAuxiliarCampo_Diferenca.AsString := cdsCupom_Servidor.Fields[x].FieldName + '_Servidor';
          end;
        end;
      end;

      if mAuxiliarDiferenca.AsString = 'S' then
      begin
        if mAuxiliarID_CLIENTE_Local.AsInteger > 0 then
        begin
          qCliente_Servidor.Close;
          qCliente_Servidor.ParamByName('CODIGO').AsInteger := mAuxiliarID_CLIENTE_Local.AsInteger;
          qCliente_Servidor.Open;
          if qCliente_ServidorEXISTE.AsInteger <> 1 then
            mAuxiliarCliente_OK.AsString := 'Não';
          qCliente_Servidor.Close;
          qCliente_Servidor.ParamByName('CODIGO').AsInteger := mAuxiliarID_VENDEDOR_Local.AsInteger;
          qCliente_Servidor.Open;
          if qCliente_ServidorEXISTE.AsInteger <> 1 then
            mAuxiliarVendedor_OK.AsString := 'Não';
        end;
      end;

      mAuxiliar.Post;

      cdsCupom_Servidor.Next;
    end;

    mAuxiliar.IndexFieldNames := 'TIPO_Local;NUMCUPOM_Local;SERIE_Local';
  finally
    FreeAndNil(Form);
    SMDBGrid1.EnableScroll;
  end;
end;

procedure TfrmComparar_Cupom.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
const
  aField = 'Campo_Diferenca';

begin
  if mAuxiliarDiferenca.AsString = 'S' then
  begin
    AFont.Color := clRed;
    AFont.Style := [fsBold];
    if (Field.Name = 'mAuxiliar' + mAuxiliarCampo_Diferenca.AsString) then
      Background  := $0080FFFF;
  end;
end;

procedure TfrmComparar_Cupom.mAuxiliarNewRecord(DataSet: TDataSet);
begin
  mAuxiliarDiferenca.AsString       := 'N';
  mAuxiliarCampo_Diferenca.AsString := '';
end;

procedure TfrmComparar_Cupom.SMDBGrid1TitleClick(Column: TColumn);
begin
  mAuxiliar.IndexFieldNames := Column.FieldName;
end;

procedure TfrmComparar_Cupom.NxButton2Click(Sender: TObject);
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);

  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    mAuxiliar.First;
    while not mAuxiliar.Eof do
    begin
      if (SMDBGrid1.SelectedRows.CurrentRowSelected) and (mAuxiliarID_Local.AsInteger > 0) then
      begin
        sds.Close;
        sds.CommandText := 'UPDATE CUPOMFISCAL SET ID = :ID, TRANSMITIR = ' + QuotedStr('S')
                         + ' WHERE ID = :ID ';
        sds.ParamByName('ID').AsInteger := mAuxiliarID_Local.AsInteger;
        sds.ExecSQL;
      end;
      mAuxiliar.Next;
    end;
  finally
    FreeAndNil(sds);
  end;

  MessageDlg('*** Cupons Reenviados!',mtConfirmation,[mbOk],0);
  btnConsultarClick(Sender);
end;

end.

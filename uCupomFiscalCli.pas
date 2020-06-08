unit uCupomFiscalCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RxLookup, StdCtrls, Buttons, ExtCtrls, DB,  
  UDMCupomFiscal, rsDBUtils, Mask, Grids, ValEdit, FMTBcd, SqlExpr, ToolEdit, CurrEdit, NxCollection,
  AdvPanel, DBXpress;

type
  TfCupomFiscalCli = class(TForm)
    pnlTop: TAdvPanel;
    edtDocumento: TMaskEdit;
    lblDocumento: TLabel;
    pnlPrincipal: TAdvPanel;
    Label1: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    lblEndereco: TLabel;
    edtEndereco: TEdit;
    Label2: TLabel;
    edtBairro: TEdit;
    Label4: TLabel;
    edtCidade: TEdit;
    Label5: TLabel;
    edtNumero: TEdit;
    Label6: TLabel;
    edtComplemento: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    AdvPanel1: TAdvPanel;
    btnGravar: TNxButton;
    brCancelar: TNxButton;
    Label9: TLabel;
    edtFone: TMaskEdit;
    edtCep: TMaskEdit;
    comboUF: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtDocumentoExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure brCancelarClick(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure edtDocumentoEnter(Sender: TObject);
  private
    { Private declarations }
    vCancelar: Boolean;
    vPessoa: String;
    vTipo : String;
    procedure formatar_Documento;
    procedure preencher_Campos;
    procedure gravar_dados;
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
  end;

var
  fCupomFiscalCli: TfCupomFiscalCli;

implementation

uses uUtilPadrao, UConsPessoa_Fin, DmdDatabase, StrUtils;

{$R *.dfm}

procedure TfCupomFiscalCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCupomFiscalCli.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := (fDmCupomFiscal.vClienteId > 0) or vCancelar;
  if (not CanClose) then
    ShowMessage('É obrigatório informar o cliente!');
end;

procedure TfCupomFiscalCli.edtDocumentoExit(Sender: TObject);
begin
  formatar_Documento;
  if vTipo = 'F' then
  begin
    if not ValidaCPF(edtDocumento.Text) then
    begin
      ShowMessage('CPF incorreto!');
      edtDocumento.SetFocus;
      Exit;
    end;
  end
  else
  begin
    if not ValidaCNPJ(edtDocumento.Text) then
    begin
      ShowMessage('CNPJ incorreto!');
      edtDocumento.SetFocus;
      Exit;
    end;
  end;

  preencher_Campos;
end;

procedure TfCupomFiscalCli.btnGravarClick(Sender: TObject);
begin
  if edtDocumento.Text = EmptyStr then
  begin
    MessageDlg('Informe CPF ou CNPJ!',mtInformation,[mbOK],0);
    edtDocumento.SetFocus;
    Exit;
  end;
  if edtNome.Text = EmptyStr then
  begin
    MessageDlg('Informe Nome!',mtInformation,[mbOK],0);
    edtNome.SetFocus;
    Exit;
  end;

  gravar_dados;
  Close;
  ModalResult := mrOk;
end;

procedure TfCupomFiscalCli.brCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfCupomFiscalCli.NxButton1Click(Sender: TObject);
begin
  frmConsPessoa_Fin := TfrmConsPessoa_Fin.Create(self);
  frmConsPessoa_Fin.vID_Pessoa_Cons := fDmCupomFiscal.cdsPessoaCODIGO.AsInteger;
  frmConsPessoa_Fin.Label2.Caption  := fDmCupomFiscal.cdsPessoaNOME.AsString;
  frmConsPessoa_Fin.ShowModal;
end;

procedure TfCupomFiscalCli.formatar_Documento;
begin
  if Length(edtDocumento.Text) < 12 then
  begin
     edtDocumento.EditMask := '000.000.000-00';
     vTipo := 'F'
  end
  else
  begin
     edtDocumento.EditMask := '00.000.000/0000-00';
     vTipo := 'J'
  end;
end;

procedure TfCupomFiscalCli.edtDocumentoEnter(Sender: TObject);
begin
   edtDocumento.EditMask := '';
//   edtDocumento.Text := '';
end;

procedure TfCupomFiscalCli.preencher_Campos;
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT CODIGO, NOME, ENDERECO, COMPLEMENTO_END, NUM_END, BAIRRO, CIDADE, UF, CEP, DDDFONE1, TELEFONE1  FROM PESSOA ';
    sds.CommandText   := sds.CommandText + 'WHERE CNPJ_CPF = ''' + edtDocumento.Text + '''';
    sds.Open;
    while not sds.Eof do
    begin
      edtBairro.Text := sds.FieldByName('BAIRRO').AsString;
      edtCep.Text := sds.FieldByName('CEP').AsString;
      edtCidade.Text := sds.FieldByName('CIDADE').AsString;
      edtEndereco.Text := sds.FieldByName('ENDERECO').AsString;
      edtFone.Text := sds.FieldByName('DDDFONE1').AsString + sds.FieldByName('TELEFONE1').AsString;
      edtNome.Text := sds.FieldByName('NOME').AsString;
      edtComplemento.Text := sds.FieldByName('COMPLEMENTO_END').AsString;
      edtNumero.Text := sds.FieldByName('NUM_END').AsString;
      sds.Next;
    end;
  finally
    FreeAndNil(sds);
  end;

end;

procedure TfCupomFiscalCli.gravar_dados;
var
  sds: TSQLDataSet;
  iSeq: Integer;
  ID: TTransactionDesc;
  Flag: Boolean;
  vCodPessoa : Integer;
begin
  iSeq   := 0;

  if (fDmCupomFiscal.vClienteID = 0) or (fDmCupomFiscal.vClienteID = 99999) then
    fDmCupomFiscal.vClienteID := dmDatabase.ProximaSequencia('PESSOA',0);

  sds := TSQLDataSet.Create(nil);
  try
    ID.TransactionID  := 999;
    ID.IsolationLevel := xilREADCOMMITTED;

    dmDatabase.scoDados.StartTransaction(ID);
    try //--
      sds.SQLConnection := dmDatabase.scoDados;

      sds.NoMetadata  := True;
      sds.GetMetadata := False;

      sds.Close;
      sds.CommandText := 'update or insert into PESSOA (CODIGO, NOME, FANTASIA, ENDERECO, COMPLEMENTO_END, ';
      sds.CommandText := sds.CommandText + 'NUM_END, BAIRRO, ID_CIDADE, CIDADE, UF, CEP, DDDFONE1, TELEFONE1,';
      sds.CommandText := sds.CommandText + 'PESSOA, CNPJ_CPF, FILIAL) values ';
      sds.CommandText := sds.CommandText + '(:CODIGO, :NOME, :FANTASIA, :ENDERECO, :COMPLEMENTO_END, :NUM_END, ';
      sds.CommandText := sds.CommandText + ':BAIRRO, :ID_CIDADE, :CIDADE, :UF, :CEP,:DDDFONE1, :TELEFONE1, :PESSOA, :CNPJ_CPF, :FILIAL)';
      edtFone.EditMask := '';

      sds.ParamByName('CODIGO').AsInteger  := fDmCupomFiscal.vClienteID;
      sds.ParamByName('NOME').AsString  := edtNome.Text;
      sds.ParamByName('FANTASIA').AsString  := edtNome.Text;
      sds.ParamByName('ENDERECO').AsString  := edtEndereco.Text;
      sds.ParamByName('COMPLEMENTO_END').AsString  := edtComplemento.Text;
      sds.ParamByName('NUM_END').AsString  := edtNumero.Text;
      sds.ParamByName('BAIRRO').AsString  := edtBairro.Text;
      sds.ParamByName('CIDADE').AsString  := edtCidade.Text;
      sds.ParamByName('CEP').AsString  := edtCep.Text;
      sds.ParamByName('UF').AsString  := comboUF.Items[comboUF.ItemIndex];
      if Length(edtFone.Text) > 8 then
      begin
        sds.ParamByName('DDDFONE1').AsString  := copy(edtFone.Text,1,2);
        sds.ParamByName('TELEFONE1').AsString  := copy(edtFone.Text,3,Length(edtFone.Text));
      end
      else
      begin
        sds.ParamByName('DDDFONE1').DataType := ftInteger;
        sds.ParamByName('DDDFONE1').Value := Null;
        sds.ParamByName('TELEFONE1').AsString  := edtFone.Text;
      end;
      sds.ParamByName('PESSOA').AsString  := vTipo;
      sds.ParamByName('FILIAL').AsString  := IntToStr(vFilial);
      sds.ParamByName('CNPJ_CPF').AsString  := edtDocumento.Text;
      if SQLLocate('CIDADE','NOME','ID', edtCidade.Text) <> EmptyStr then
        sds.ParamByName('ID_CIDADE').AsInteger := StrToInt(SQLLocate('CIDADE','NOME','ID', edtCidade.Text))
      else
      begin
        sds.ParamByName('ID_CIDADE').DataType := ftInteger;
        sds.ParamByName('ID_CIDADE').Value := Null;
      end;
      if vTipo = 'F' then
        vDocumentoClienteVenda := Monta_Texto(edtDocumento.Text,11)
      else
        vDocumentoClienteVenda := Monta_Texto(edtDocumento.Text,14);

      Flag := False;
      while not Flag do
      begin
        try
          sds.ExecSQL;
          Flag := True;
        except
          on E: Exception do
          begin
            Flag := False;
            vDocumentoClienteVenda := '';
          end;

        end;
      end;
      dmDatabase.scoDados.Commit(ID);
    except
      dmDatabase.scoDados.Rollback(ID);
      raise;
    end;
  finally
    FreeAndNil(sds);
  end;

end;

end.

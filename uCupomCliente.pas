unit uCupomCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, DBCtrls,
  uDmCupomFiscal, rsDBUtils, NxCollection, ExtCtrls, RxDBComb, RxLookup, DB, Buttons, dbTables,
  FMTBcd, DBClient, Provider, SqlExpr, Grids, DBGrids, SMDBGrid, AdvPanel, AdvEdit, uUtilPadrao;

type
  TfCupomCliente = class(TForm)
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblAtendimento: TLabel;
    lblTransportadora: TLabel;
    Label6: TLabel;
    edtCliente: TDBEdit;
    edtCpf: TDBEdit;
    mmEndereco: TDBMemo;
    mmObs: TDBMemo;
    comboAtendimento: TRxDBComboBox;
    comboTransportadora: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    sdsClientes: TSQLDataSet;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsClientesCLIENTE_NOME: TStringField;
    cdsClientesCLIENTE_FONE: TStringField;
    cdsClientesCPF: TStringField;
    cdsClientesCLIENTE_ENDERECO: TStringField;
    dsClientes: TDataSource;
    AdvPanel2: TAdvPanel;
    btConfirmar: TNxButton;
    brCancelar: TNxButton;
    edtTelefone: TAdvMaskEdit;
    cdsClientesCLIENTE_OBS: TStringField;
    pnlGrid: TAdvPanel;
    gridDados: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure brCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure comboAtendimentoExit(Sender: TObject);
    procedure edtTelefoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTelefoneExit(Sender: TObject);
    procedure gridDadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
  end;

var
  fCupomCliente: TfCupomCliente;

implementation

uses UCupomFiscalCli, DmdDatabase;

{$R *.dfm}

procedure TfCupomCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCupomCliente.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self,fDmCupomFiscal);

  lblAtendimento.Visible := ((fDmCupomFiscal.cdsCupomFiscalTIPO.AsString <> 'PED') and (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString <> 'ORC'));
  comboAtendimento.Visible := ((fDmCupomFiscal.cdsCupomFiscalTIPO.AsString <> 'PED') and (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString <> 'ORC'));

  lblTransportadora.Visible := ((fDmCupomFiscal.cdsCupomFiscalTIPO.AsString <> 'PED') and (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString <> 'ORC'));
  comboTransportadora.Visible := ((fDmCupomFiscal.cdsCupomFiscalTIPO.AsString <> 'PED') and (fDmCupomFiscal.cdsCupomFiscalTIPO.AsString <> 'ORC'));
end;

procedure TfCupomCliente.brCancelarClick(Sender: TObject);
begin
  fDmCupomFiscal.vClienteConfirmado := False;
  Close;
end;

procedure TfCupomCliente.btConfirmarClick(Sender: TObject);
begin
  if fDmCupomFiscal.cdsCupomFiscal.State in [dsEdit,dsInsert] then
    fDmCupomFiscal.cdsCupomFiscal.Post;

  fDmCupomFiscal.cdsCupomFiscal.Edit;
  fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := mmEndereco.Text;
  fDmCupomFiscal.cdsCupomFiscalCLIENTE_FONE.AsString := edtTelefone.EditText;
  fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString := edtCliente.Text;
  fDmCupomFiscal.cdsCupomFiscalCPF.AsString := edtCpf.Text;
  fDmCupomFiscal.cdsCupomFiscalCLIENTE_OBS.AsString := mmObs.Text;
  fDmCupomFiscal.vClienteConfirmado := True;
  Close;
end;

procedure TfCupomCliente.comboAtendimentoExit(Sender: TObject);
begin
  if (comboAtendimento.ItemIndex = 1) and (fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger <>  fDmCupomFiscal.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger) then
  begin
    if fDmCupomFiscal.cdsPessoa.Locate('CODIGO',fDmCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger,[loCaseInsensitive]) then
    begin
      if trim(fDmCupomFiscal.cdsPessoaENDERECO_ENT.AsString) <> '' then
      begin
        fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := 'End: ' + fDmCupomFiscal.cdsPessoaENDERECO_ENT.AsString
                                                                + ', ' + fDmCupomFiscal.cdsPessoaNUM_END_ENT.AsString;
        if trim(fDmCupomFiscal.cdsPessoaCOMPLEMENTO_END_ENT.AsString) <> '' then
          fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString
                                                                  + ' - ' + fDmCupomFiscal.cdsPessoaCOMPLEMENTO_END_ENT.AsString;
        if trim(fDmCupomFiscal.cdsPessoaBAIRRO_ENT.AsString) <> '' then
          fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString + ' -Bai: '
                                                                  + fDmCupomFiscal.cdsPessoaBAIRRO_ENT.AsString;
        fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString +
                                                                  ' -Cep: ' + fDmCupomFiscal.cdsPessoaCEP_ENT.AsString +
                                                                  ' - ' + fDmCupomFiscal.cdsPessoaCIDADE_ENT.AsString +
                                                                  '/' + fDmCupomFiscal.cdsPessoaUF_ENT.AsString;
      end
      else
      begin
        fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := 'End: ' + fDmCupomFiscal.cdsPessoaENDERECO.AsString +
                                                                  ', ' + fDmCupomFiscal.cdsPessoaNUM_END.AsString;
        if trim(fDmCupomFiscal.cdsPessoaCOMPLEMENTO_END.AsString) <> '' then
          fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString
                                                                  + ' - ' + fDmCupomFiscal.cdsPessoaCOMPLEMENTO_END.AsString;
        if trim(fDmCupomFiscal.cdsPessoaBAIRRO.AsString) <> '' then
          fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString + ' -Bai: '
                                                                  + fDmCupomFiscal.cdsPessoaBAIRRO.AsString;
        fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString
                                                                + ' -Cep: ' + fDmCupomFiscal.cdsPessoaCEP.AsString
                                                                + ' - ' + fDmCupomFiscal.cdsPessoaCIDADE.AsString + '/' + fDmCupomFiscal.cdsPessoaUF.AsString;
      end;
    end;
  end;
end;

procedure TfCupomCliente.edtTelefoneKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if copy(edtTelefone.Text,3,1) = '9' then
//    edtTelefone.EditMask := '!\(99\)00000-0000;1;_'
//  else
//    edtTelefone.EditMask := '!\(99\)0000-0000;1;_';

  if (Key = Vk_Return) then
  begin
//    edtTelefone.EditMask := '';
    cdsClientes.Close;
    sdsClientes.ParamByName('F1').AsString := Trim(edtTelefone.Text);
//    edtTelefone.EditMask := '\(99\)00000-0000';
    cdsClientes.Open;
    if cdsClientes.IsEmpty then
      exit;
    fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := cdsClientesCLIENTE_ENDERECO.AsString;
    fDmCupomFiscal.cdsCupomFiscalCLIENTE_FONE.AsString := edtTelefone.EditText;
    fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString := cdsClientesCLIENTE_NOME.AsString;
    fDmCupomFiscal.cdsCupomFiscalCPF.AsString := cdsClientesCPF.AsString;
  end;

end;

procedure TfCupomCliente.edtTelefoneExit(Sender: TObject);
begin
//  edtTelefone.EditMask := '';
  if edtTelefone.Text = EmptyStr then
    Exit;
  cdsClientes.Close;
  edtTelefone.Text := FormatarTelefone(edtTelefone.Text);
  sdsClientes.ParamByName('F1').AsString := Trim('%' + edtTelefone.Text + '%');
//  edtTelefone.EditMask := '\(99\)00000-0000';
  cdsClientes.Open;
  if not cdsClientes.IsEmpty then
  begin
    pnlGrid.Visible := cdsClientes.RecordCount > 1;
    fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := cdsClientesCLIENTE_ENDERECO.AsString;
    fDmCupomFiscal.cdsCupomFiscalCLIENTE_FONE.AsString := edtTelefone.EditText;
    fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString := cdsClientesCLIENTE_NOME.AsString;
    fDmCupomFiscal.cdsCupomFiscalCPF.AsString := cdsClientesCPF.AsString;
    fDmCupomFiscal.cdsCupomFiscalCLIENTE_OBS.AsString := cdsClientesCLIENTE_OBS.AsString;
  end;
end;

procedure TfCupomCliente.gridDadosDblClick(Sender: TObject);
begin
  fDmCupomFiscal.cdsCupomFiscalCLIENTE_ENDERECO.AsString := cdsClientesCLIENTE_ENDERECO.AsString;
  fDmCupomFiscal.cdsCupomFiscalCLIENTE_FONE.AsString := cdsClientesCLIENTE_FONE.AsString;
  edtTelefone.Text := cdsClientesCLIENTE_FONE.AsString;
  fDmCupomFiscal.cdsCupomFiscalCLIENTE_NOME.AsString := cdsClientesCLIENTE_NOME.AsString;
  fDmCupomFiscal.cdsCupomFiscalCPF.AsString := cdsClientesCPF.AsString;
  fDmCupomFiscal.cdsCupomFiscalCLIENTE_OBS.AsString := cdsClientesCLIENTE_OBS.AsString;
end;

end.



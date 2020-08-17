unit USel_Pessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, NxCollection,
  AdvPanel;

type
  TfrmSel_Pessoa = class(TForm)
    sdsPessoa: TSQLDataSet;
    cdsPessoa: TClientDataSet;
    dspPessoa: TDataSetProvider;
    dsPessoa: TDataSource;
    StaticText1: TStaticText;
    sdsPessoaCODIGO: TIntegerField;
    sdsPessoaNOME: TStringField;
    sdsPessoaCNPJ_CPF: TStringField;
    sdsPessoaENDERECO: TStringField;
    sdsPessoaCIDADE: TStringField;
    cdsPessoaCODIGO: TIntegerField;
    cdsPessoaNOME: TStringField;
    cdsPessoaCNPJ_CPF: TStringField;
    cdsPessoaENDERECO: TStringField;
    cdsPessoaCIDADE: TStringField;
    sdsPessoaUF: TStringField;
    cdsPessoaUF: TStringField;
    sdsPessoaFANTASIA: TStringField;
    cdsPessoaFANTASIA: TStringField;
    NxPanel1: TNxPanel;
    lblNome: TLabel;
    Edit1: TEdit;
    btnConsultar: TNxButton;
    pnlPrincipal: TAdvPanel;
    smdbGrid1: TSMDBGrid;
    procedure smdbGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure smdbGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure smdbGrid1TitleClick(Column: TColumn);
    procedure btnConsultarClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    ctPessoaLocal : String;
    procedure prc_Consultar;

  public
    { Public declarations }
    vTipo_Pessoa : String;
    vFilial_Vend : Integer;

  end;

var
  frmSel_Pessoa: TfrmSel_Pessoa;

implementation

uses DmdDatabase, uUtilPadrao;

{$R *.dfm}

procedure TfrmSel_Pessoa.prc_Consultar;
begin
  cdsPessoa.Close;
  sdsPessoa.CommandText := ctPessoaLocal;
  if vTipo_Pessoa = 'C' then
    sdsPessoa.CommandText := sdsPessoa.CommandText + ' AND TP_CLIENTE = ' + QuotedStr('S')
  else
  if (vTipo_Pessoa = 'F') then
    sdsPessoa.CommandText := sdsPessoa.CommandText + ' AND TP_FORNECEDOR = ' + QuotedStr('S')
  else
  if (vTipo_Pessoa = 'FT') then
    sdsPessoa.CommandText := sdsPessoa.CommandText + ' AND ((TP_FORNECEDOR = ' + QuotedStr('S') + ')'
                           + ' OR (TP_VENDEDOR = ' + QuotedStr('S') + ')'
                           + ' OR (TP_FUNCIONARIO = ' + QuotedStr('S') + ')'
                           + ' OR (TP_TRANSPORTADORA = ' + QuotedStr('S') + '))'
  else
  if vTipo_Pessoa = 'T' then
    sdsPessoa.CommandText := sdsPessoa.CommandText + ' AND TP_TRANSPORTADORA = ' + QuotedStr('S')
  else
  if vTipo_Pessoa = 'V' then
    sdsPessoa.CommandText := sdsPessoa.CommandText + ' AND TP_VENDEDOR = ' + QuotedStr('S')
  else
  if vTipo_Pessoa = 'A' then
    sdsPessoa.CommandText := sdsPessoa.CommandText + ' AND TP_ATELIER = ' + QuotedStr('S');
  if trim(Edit1.Text) <> '' then
    sdsPessoa.CommandText := sdsPessoa.CommandText + ' AND ((NOME LIKE ' + QuotedStr('%'+Edit1.Text+'%') + ')' +
                                                   ' OR (FANTASIA LIKE ' + QuotedStr('%'+Edit1.Text+'%') + '))';
  if (vTipo_Pessoa = 'V') and (vFilial_Vend > 0) then
    sdsPessoa.CommandText := sdsPessoa.CommandText + ' AND FILIAL = ' + IntToStr(vFilial_Vend);
  cdsPessoa.Open;
end;

procedure TfrmSel_Pessoa.smdbGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    vCodPessoa_Pos := cdsPessoaCODIGO.AsInteger;
    Close;
    ModalResult := mrOk;
  end;
end;

procedure TfrmSel_Pessoa.smdbGrid1DblClick(Sender: TObject);
begin
  vCodPessoa_Pos := cdsPessoaCODIGO.AsInteger;
  Close;
  ModalResult := mrOk;
end;

procedure TfrmSel_Pessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vFilial_Vend := 0;
  Action := Cafree;
end;

procedure TfrmSel_Pessoa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
  begin
    Close;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmSel_Pessoa.FormShow(Sender: TObject);
var
  i : Integer;
begin
  if vTipo_Pessoa = 'C' then
    lblNome.Caption := 'Nome Cliente:'
  else
  if vTipo_Pessoa = 'F' then
    lblNome.Caption := 'Nome Fornecedor:'
  else
  if vTipo_Pessoa = 'T' then
    lblNome.Caption := 'Nome Transportadora:'
  else
  if vTipo_Pessoa = 'V' then
    lblNome.Caption := 'Nome Vendedor:';

  ctPessoaLocal := sdsPessoa.CommandText;
end;

procedure TfrmSel_Pessoa.smdbGrid1TitleClick(Column: TColumn);
begin
  cdsPessoa.IndexFieldNames := Column.FieldName;
end;

procedure TfrmSel_Pessoa.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
  cdsPessoa.RecordCount;
end;

procedure TfrmSel_Pessoa.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    btnConsultarClick(Sender);
    if not cdsPessoa.IsEmpty then
      SMDBGrid1.SetFocus;
  end;
end;

end.

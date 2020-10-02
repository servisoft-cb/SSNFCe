unit uConsultaRapidaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, RXCtrls, DB, DBClient, SqlExpr;

type
  TfrmConsultaRapidaCliente = class(TForm)
    LblTituloTela: TRxLabel;
    VALOR: TEdit;
    DBGridLista: TDBGrid;
    dsCliente: TDataSource;
    cdsCliente: TClientDataSet;
    cdsClienteCodigo: TIntegerField;
    cdsClienteNome: TStringField;
    cdsClienteTelefone: TStringField;
    cdsClienteCidade: TStringField;
    procedure VALORKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridListaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaRapidaCliente: TfrmConsultaRapidaCliente;

implementation

{$R *.dfm}

uses
  DmdDatabase, uUtilPadrao;

procedure TfrmConsultaRapidaCliente.VALORKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sds: TSQLDataSet;
begin
  if Key = VK_RETURN then
  begin
    cdsCliente.Close;
    cdsCliente.CreateDataSet;
    if Valor.Text = '' then
    begin
      DBGridLista.Setfocus;
      exit;
    end;

    if (Key = Vk_Return) then
    begin
      sds := TSQLDataSet.Create(nil);
      try
        sds.SQLConnection := dmDatabase.scoDados;
        sds.NoMetadata    := True;
        sds.GetMetadata   := False;
        sds.CommandText   := 'SELECT CODIGO, NOME, coalesce(DDDFONE1,' + QuotedStr('S/N') + ') || '+ QuotedStr('-');
        sds.CommandText   := sds.CommandText + ' || coalesce(TELEFONE1, 0) FONE, CIDADE from PESSOA ';
        sds.CommandText   := sds.CommandText + 'WHERE NOME LIKE ''%' + VALOR.Text + '%'' ';
        sds.CommandText   := sds.CommandText + 'ORDER BY NOME';
        sds.Open;
        while not sds.Eof do
        begin
          cdsCliente.Insert;
          cdsClienteCodigo.AsInteger := sds.FieldByName('CODIGO').AsInteger;
          cdsClienteNome.AsString := sds.FieldByName('NOME').AsString;
          cdsClienteTelefone.AsString := sds.FieldByName('FONE').AsString;
          cdsClienteCidade.AsString := sds.FieldByName('CIDADE').AsString;
          cdsCliente.Post;
          sds.Next;
        end;
      finally
        DBGridLista.SetFocus;
        FreeAndNil(sds);
      end;
    end;
  end;
end;

procedure TfrmConsultaRapidaCliente.DBGridListaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN : begin
      if cdsClienteCodigo.AsInteger > 0 then
      begin
        Close;
        ModalResult := mrOk;
      end;

    end;
    VK_ESCAPE : begin
      close;
      ModalResult := mrCancel;
    end;

  end;

end;

procedure TfrmConsultaRapidaCliente.FormActivate(Sender: TObject);
begin
  if VALOR.Text <> EmptyStr then
    VALORKeyDown(Sender, Enter, [ssAlt]);
end;

end.

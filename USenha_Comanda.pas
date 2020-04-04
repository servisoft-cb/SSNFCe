unit USenha_Comanda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMUsuario, StdCtrls, ExtCtrls, NxCollection;

type
  TfrmSenha_Comanda = class(TForm)
    Label1: TLabel;
    edtUsuario: TEdit;
    Label2: TLabel;
    pnlSenha: TPanel;
    Label3: TLabel;
    edtSenha: TEdit;
    edtConfirmaSenha: TEdit;
    Label4: TLabel;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    fDmUsuario: TDMUsuario;

  public
    { Public declarations }
  end;

var
  frmSenha_Comanda: TfrmSenha_Comanda;

implementation

uses rsDBUtils, IdHashMessageDigest, IdHash;

{$R *.dfm}

procedure TfrmSenha_Comanda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmSenha_Comanda.FormShow(Sender: TObject);
begin
  fDmUsuario := TDmUsuario.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDmUsuario);
end;

procedure TfrmSenha_Comanda.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = Vk_Return then
  begin
    fDmUsuario.prc_Abrir_Usuario(edtUsuario.Text);
    if fDmUsuario.cdsUsuario.IsEmpty then
    begin
      MessageDlg('*** Usuário não encontrado!', mtInformation, [mbOk], 0);
      edtUsuario.SetFocus;
    end
    else
    begin
      edtUsuario.ReadOnly := True;
      pnlSenha.Visible := True;
      edtSenha.SetFocus;
    end;
  end;
end;

procedure TfrmSenha_Comanda.btnConfirmarClick(Sender: TObject);
var
  Hash : TIdHashMessageDigest5;
begin
  if trim(edtSenha.Text) = '' then
  begin
    MessageDlg('*** Senha não pode estar em branco!', mtError, [mbOk], 0);
    edtSenha.SetFocus;
  end;
  if edtSenha.Text <> edtConfirmaSenha.Text then
  begin
    MessageDlg('*** Senha não confere!', mtError, [mbOk], 0);
    edtSenha.SetFocus;
  end;
  hash := TIdHashMessageDigest5.Create;
  try
    fDmUsuario.cdsUsuario.Edit;
    fDmUsuario.cdsUsuarioSENHAHASH.AsString := hash.AsHex(hash.HashValue(edtSenha.Text));
    fDmUsuario.cdsUsuario.Post;
    fDmUsuario.cdsUsuario.ApplyUpdates(0);
    edtUsuario.ReadOnly := False;
    edtUsuario.Clear;
    edtUsuario.SetFocus;
    edtSenha.Clear;
    edtConfirmaSenha.Clear;
    pnlSenha.Visible := False;
  finally
    FreeAndNil(Hash);
  end;
end;

procedure TfrmSenha_Comanda.btnCancelarClick(Sender: TObject);
begin
  edtUsuario.ReadOnly := False;
  edtUsuario.Clear;
  edtUsuario.SetFocus;
  edtSenha.Clear;
  edtConfirmaSenha.Clear;
  pnlSenha.Visible := False;
end;

end.

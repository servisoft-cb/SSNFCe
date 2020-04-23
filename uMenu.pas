Unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Menus, ImgList, ComCtrls, jpeg,
  ToolWin, StdCtrls, uDmParametros, DB,  ShellAPI, StrUtils, IniFiles, Buttons, UCBase, UCDBXConn, SpeedBar, RLConsts, TypInfo,
  uDmCadFechamento, uDmEstoque, SqlExpr, JvComponent, JvThreadTimer,
  NxCollection;

type
  TfMenu = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    UserControl1: TUserControl;
    UCDBXConn1: TUCDBXConn;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    btnCupom: TSpeedItem;
    btnCaixa: TSpeedItem;
    btnConsulta: TSpeedItem;
    Administrao1: TMenuItem;
    Cadastro1: TMenuItem;
    Logoff1: TMenuItem;
    UCSettings1: TUCSettings;
    Mantueno1: TMenuItem;
    Parmetros1: TMenuItem;
    erminal1: TMenuItem;
    N1: TMenuItem;
    ConsultadeCupons1: TMenuItem;
    Caixa1: TMenuItem;
    btnSuprimento: TSpeedItem;
    btnSangria: TSpeedItem;
    Caixa2: TMenuItem;
    AberturaSuprimento1: TMenuItem;
    Sangria1: TMenuItem;
    CupomFiscal1: TMenuItem;
    ConsultaCupom1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    btnFechamento: TSpeedItem;
    Relatrios1: TMenuItem;
    Estoque1: TMenuItem;
    VendasdoPerodo1: TMenuItem;
    Estoquedemateriais1: TMenuItem;
    Financeiro1: TMenuItem;
    Pagamentos1: TMenuItem;
    ConsultaPagamentodeCarns1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Janelas1: TMenuItem;
    Ativas1: TMenuItem;
    N6: TMenuItem;
    btnRecebimento: TSpeedItem;
    ConfiguraoCertificado1: TMenuItem;
    Consultas1: TMenuItem;
    Consultatrocas1: TMenuItem;
    N7: TMenuItem;
    SenhaComanda1: TMenuItem;
    N8: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    Comisso1: TMenuItem;
    SpeedItem1: TSpeedItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure UserControl1AfterLogin(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure ConsultadeCupons1Click(Sender: TObject);
    procedure btnSangriaClick(Sender: TObject);
    procedure btnSuprimentoClick(Sender: TObject);
    procedure CupomFiscal1Click(Sender: TObject);
    procedure ConsultaCupom1Click(Sender: TObject);
    procedure AberturaSuprimento1Click(Sender: TObject);
    procedure btnFechamentoClick(Sender: TObject);
    procedure Estoque1Click(Sender: TObject);
    procedure Estoquedemateriais1Click(Sender: TObject);
    procedure VendasdoPerodo1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Pagamentos1Click(Sender: TObject);
    procedure ConsultaPagamentodeCarns1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure erminal1Click(Sender: TObject);
    procedure btnRecebimentoClick(Sender: TObject);
    procedure ConfiguraoCertificado1Click(Sender: TObject);
    procedure btnNFCeClick(Sender: TObject);
    procedure Consultatrocas1Click(Sender: TObject);
    procedure SenhaComanda1Click(Sender: TObject);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure Comisso1Click(Sender: TObject);
  private
    { Private declarations }
    fDmParametros: TDmParametros;
    fDmCadFechamento: TDmCadFechamento;
    fDmEstoque: TDmEstoque;
    procedure OpenForm(FClass: TFormClass; vEstado: TWindowState; TipoPessoa: String = '');
    function lerIni(Tabela, Campo: String): String;
    procedure HabilitaMenu;
    function PosicionaCaixa(vData: TDateTime): Boolean;
    procedure prc_Fechar_Caixa(vTipo: String);
  public
    { Public declarations }
    procedure GetBuildInfo(exeName: String; var V1, V2, V3, V4: word);
    function GetBuildInfoAsString: string;
  end;

var
  fMenu: TfMenu;

implementation

uses DmdDatabase, uCupomParametros, LogProvider, AcbrEcf, uCupomTerminal, uUtilPadrao,
     uRelCartao, UCadFechamento_Sangria, DateUtils, uPrevVendas, uCarnePgto, 
  DmdDatabase_NFeBD, uCarnePgtoC, UCupomFiscal, UCadFilial_Certificado, uConsCupom, UCadFechamento_Contagem2,
  uConsTrocas, uUtilCupom, USenha_Comanda, UCadProduto,
  uConsComissao_Metas, UCadFechamento2;

{$R *.dfm}

procedure TfMenu.OpenForm(FClass: TFormClass; vEstado: TWindowState;
  TipoPessoa: String);
var
  existe: TForm;
  j: Byte;
begin
  existe := nil;
  for j := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[j] is FClass then
      existe := Screen.Forms[j];
  end;

  if not (existe = nil) then
  begin
    existe.BringToFront;
    existe.SetFocus;
  end
  else
  begin
    Application.CreateForm(FClass,existe);
    existe.FormStyle := fsMDIChild;
    existe.Show;
  end;
  existe.WindowState := vEstado;
end;

procedure TfMenu.FormShow(Sender: TObject);
var
  vArquivo: String;
begin
  if not Assigned(fDmParametros) then
    fDmParametros := TDmParametros.Create(Self);

  fDmParametros.cdsParametros.Open;
  fDmParametros.cdsCupomParametros.Open;

  if fDmParametros.cdsParametrosUSA_NFCE.AsString <> 'S' then
  begin
    vArquivo := 'D:\$Servisoft\Impressora.ini';
    if not FileExists(vArquivo) then
    begin
      vArquivo := 'C:\$Servisoft\Impressora.ini';
      if not FileExists(vArquivo) then
      begin
        ShowMessage('Arquivo de configuração ' + vArquivo + ' não foi localizado!' + #13 +
                    'Configure os parâmetros de emissão de cupom!');
        Parmetros1Click(Sender);
      end;
    end;
    if fDmParametros.cdsParametrosIMPRESSORA_FISCAL.AsString = '4' then
    begin
      case AnsiIndexStr(fDmParametros.cdsCupomParametrosACBR_MODELO.AsString,['ecfFiscNet','ecfDaruma',
                                                                              'ecfBematech','ecfNaoFiscal']) of
        0: fDmParametros.ACBrECF1.Modelo := ecfFiscNet;
        1: fDmParametros.ACBrECF1.Modelo := ecfDaruma;
        2: fDmParametros.ACBrECF1.Modelo := ecfBematech;
        3: fDmParametros.ACBrECF1.Modelo := ecfNaoFiscal;
      end;
      fDmParametros.ACBrECF1.Porta       := vPorta;
      fDmParametros.ACBrECF1.Device.Baud := StrToInt(vVelocidade);
      if (vPorta = '') or (vVelocidade = '') then
      begin
        ShowMessage('Porta e velocidade da impressora devem ser configuradas!');
        Parmetros1Click(Sender);
        fDmParametros.ACBrECF1.Porta       := vPorta;
        fDmParametros.ACBrECF1.Device.Baud := StrToInt(vVelocidade);
      end
    end;
  end;

//  fDmParametros.SetDefaultPrinter(vPorta);
  vImpressora_Padrao := DefaultPrinter;
  HabilitaMenu;

end;

procedure TfMenu.FormCreate(Sender: TObject);
begin
  UserControl1.Execute;
end;

function TfMenu.GetBuildInfoAsString: string;
var
  V1, V2, V3, V4: word;
begin
  GetBuildInfo(GetCurrentDir + '\SSNFCe.EXE', V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' +
    IntToStr(V3) + '.' + IntToStr(V4);
end;

procedure TfMenu.GetBuildInfo(exeName: String; var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(exeName), Dummy);
  if VerInfoSize > 0 then
  begin
    GetMem(VerInfo,VerInfoSize);
    try
      if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
      begin
        VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
        with VerValue^ do
        begin
          V1 := dwFileVersionMS shr 16;
          V2 := dwFileVersionMS and $FFFF;
          V3 := dwFileVersionLS shr 16;
          V4 := dwFileVersionLS and $FFFF;
        end;
      end;
    finally
      FreeMem(VerInfo,VerInfoSize);
    end;
  end;
end;

function TfMenu.lerIni(Tabela, Campo: String): String;
var
  ServerIni: TIniFile;
  vArq: String;
begin
  vArq := 'D:\$Servisoft\Impressora.ini';
  if not FileExists(vArq) then
    vArq := 'C:\$Servisoft\Impressora.ini';
  ServerIni := TIniFile.Create(vArq);
  result    := ServerIni.ReadString(Tabela,Campo,'');
  ServerIni.Free;
end;

procedure TfMenu.Logoff1Click(Sender: TObject);
begin
  UserControl1.Logoff;
end;

procedure TfMenu.UserControl1AfterLogin(Sender: TObject);
begin
  vUsuario := UserControl1.CurrentUser.LoginName;
  HabilitaMenu;
end;

procedure TfMenu.Caixa1Click(Sender: TObject);
begin
  FreeAndNil(fDmParametros);
  OpenForm(TfrmCadFechamento2,wsMaximized);

//  OpenForm(TfrmCadFechamento,wsMaximized);
//
  if not Assigned(fDmParametros) then
    fDmParametros := TDmParametros.Create(Self);
  fDmParametros.cdsCupomParametros.Open;
end;

procedure TfMenu.Parmetros1Click(Sender: TObject);
begin
  FreeAndNil(fDmParametros);

  OpenForm(TfCupomParametros,wsMaximized);

  if not Assigned(fDmParametros) then
    fDmParametros := TDmParametros.Create(Self);
end;

procedure TfMenu.btnCaixaClick(Sender: TObject);
begin
  Caixa1Click(Sender);
end;

procedure TfMenu.ConsultadeCupons1Click(Sender: TObject);
begin
  OpenForm(TfrmConsCupom,wsMaximized);

end;

procedure TfMenu.btnSangriaClick(Sender: TObject);
begin
  fDmCadFechamento := TDmCadFechamento.Create(Self);

  if not PosicionaCaixa(Date) then
  begin
    ShowMessage('Não existe caixa aberto!');
    Exit;
  end;

  frmCadFechamento_Sangria                  := TfrmCadFechamento_Sangria.Create(self);
  frmCadFechamento_Sangria.fDMCadFechamento := fDmCadFechamento;
  frmCadFechamento_Sangria.vES := 'S';
  frmCadFechamento_Sangria.ShowModal;
  FreeAndNil(frmCadFechamento_Sangria);

  FreeAndNil(frmCadFechamento_Sangria);
  FreeAndNil(fDmCadFechamento);
  FreeAndNil(fDmParametros);
end;

procedure TfMenu.btnSuprimentoClick(Sender: TObject);
var
  vExiste: String;
  ffrmCadFechamento_Sangria: TfrmCadFechamento_Sangria;
begin
  vID_Fechamento_Pos := 0;
  vExiste := 'S';
  fDMCadFechamento := TDMCadFechamento.Create(Self);
  if not PosicionaCaixa(Date) then
  begin
    if MessageDlg('Não existe caixa aberto para esta data, deseja abrir?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      vExiste := 'N'
    else
    begin
      FreeAndNil(fDmCadFechamento);
      exit;
    end;
  end;
  if vExiste = 'N' then
  begin
    fDmCadFechamento.prc_Inserir;
    if vID_Fechamento_Pos > 0 then
    begin
      fDmCadFechamento.cdsFechamento.Post;
      fDmCadFechamento.prc_Gravar;
    end;
  end;
  if vID_Fechamento_Pos <= 0 then
  begin
    MessageDlg('*** Caixa não criado, favor tentar novamente!', mtInformation, [mbOk], 0);
    exit;
  end;
  ffrmCadFechamento_Sangria := TfrmCadFechamento_Sangria.Create(self);
  ffrmCadFechamento_Sangria.fDMCadFechamento := fDmCadFechamento;
  ffrmCadFechamento_Sangria.vES := 'E';
  ffrmCadFechamento_Sangria.ShowModal;
  FreeAndNil(ffrmCadFechamento_Sangria);
  FreeAndNil(fDmCadFechamento);
end;

procedure TfMenu.CupomFiscal1Click(Sender: TObject);
begin
  if not Assigned(fDmParametros) then
    fDmParametros := TdmParametros.Create(Self);
  fDmParametros.cdsCupomParametros.Close;
  fDmParametros.cdsCupomParametros.Open;
  fCupomFiscal := TfCupomFiscal.Create(nil);
  try
    fCupomFiscal.WindowState := wsMaximized;
    fCupomFiscal.ShowModal;
  finally
    FreeAndNil(fCupomFiscal);
  end;
end;

procedure TfMenu.ConsultaCupom1Click(Sender: TObject);
begin
  ConsultadeCupons1Click(Sender);
end;

procedure TfMenu.HabilitaMenu;
begin
  btnCupom.Visible       := CupomFiscal1.Enabled;
  btnConsulta.Visible    := ConsultaCupom1.Enabled;
  btnCaixa.Visible       := Caixa1.Enabled;
  btnFechamento.Visible  := True;
  btnSuprimento.Visible  := True;
  btnSangria.Visible     := True;
  btnRecebimento.Visible := Pagamentos1.Enabled;
end;

procedure TfMenu.AberturaSuprimento1Click(Sender: TObject);
begin
  btnSuprimentoClick(Sender);
end;

function TfMenu.PosicionaCaixa(vData: TDateTime): Boolean;
begin
  fDmCadFechamento.qCaixaAberto.Close;
  fDmCadFechamento.qCaixaAberto.ParamByName('T1').AsInteger := vTerminal;
  fDmCadFechamento.qCaixaAberto.ParamByName('D1').AsDate    := vData;
  fDmCadFechamento.qCaixaAberto.Open;
  Result := not fDmCadFechamento.qCaixaAberto.IsEmpty;
  if Result then
  begin
    fDMCadFechamento.prc_Localizar(fDmCadFechamento.qCaixaAbertoID.AsInteger);
    vID_Fechamento_Pos := fDmCadFechamento.cdsFechamentoID.AsInteger;
  end;
end;

procedure TfMenu.btnFechamentoClick(Sender: TObject);
var
  resultado: string;
begin
  vConfirma_Fechamento := False;
  frmCadFechamento_Contagem2 := TfrmCadFechamento_Contagem2.Create(self);
  frmCadFechamento_Contagem2.vTipo_Valor      := 'I';
  frmCadFechamento_Contagem2.ShowModal;
  FreeAndNil(frmCadFechamento_Contagem2);
  if (vConfirma_Fechamento) and  (SQLLocate('CUPOMFISCAL_PARAMETROS','ID','MOSTRAR_TELA_FECHAMENTO','1') = 'S') then
  begin
    frmCadFechamento2 := TfrmCadFechamento2.Create(self);
    frmCadFechamento2.vID_Fechamento_Loc := vID_Fechamento_Pos;
    frmCadFechamento2.ShowModal;
    FreeAndNil(frmCadFechamento2);
  end;
end;

procedure TfMenu.prc_Fechar_Caixa(vTipo: String);
var
  vGravarAux: Boolean;
  vIDAux: Integer;
begin
  vGravarAux := False;
  vIDAux := fDMCadFechamento.cdsFechamentoID.AsInteger;
  if fDmCadFechamento.vTipo_Valor <> 'X' then
  begin
    fDMCadFechamento.mContagem.First;
    while not fDMCadFechamento.mContagem.Eof do
    begin
      if fDMCadFechamento.cdsFechamento_Itens.Locate('ID;ID_TIPOCOBRANCA',VarArrayOf([fDMCadFechamento.cdsFechamentoID.AsInteger,
                                                     fDMCadFechamento.mContagemID_TIPOCOBRANCA.AsInteger]),[locaseinsensitive]) then
      begin
        vGravarAux := True;
        fDMCadFechamento.cdsFechamento_Itens.Edit;
        if vTipo = 'I' then
        begin
          fDmCadFechamento.cdsFechamento_ItensVLR_INFORMADO.AsCurrency     := fDMCadFechamento.mContagemVALOR.AsCurrency;
          fDmCadFechamento.cdsFechamento_ItensVLR_DIF_INFORMADO.AsCurrency := fDmCadFechamento.cdsFechamento_ItensVLR_ENTRADA.AsCurrency -
                                                                              fDMCadFechamento.mContagemVALOR.AsCurrency;
        end
        else
        begin
          fDMCadFechamento.cdsFechamento_ItensVLR_CONFERENCIA.AsCurrency   := fDMCadFechamento.mContagemVALOR.AsCurrency;
          fDmCadFechamento.cdsFechamento_ItensVLR_DIF_CONFERIDO.AsCurrency := fDMCadFechamento.mContagemVALOR.AsCurrency -
                                                                              fDmCadFechamento.cdsFechamento_ItensVLR_ENTRADA.AsCurrency;
        end;
        fDMCadFechamento.cdsFechamento_Itens.Post;
      end;
      fDMCadFechamento.mContagem.Next;
    end;
  end;

  //12/07/2016
  if (vGravarAux) then
  begin
    if (fDmCadFechamento.vTipo_Valor <> 'X') and (vTipo = 'I') then
    begin
      fDMCadFechamento.cdsFechamento.Edit;
      fDMCadFechamento.cdsFechamentoDTFECHAMENTO.AsDateTime  := Date;
      fDMCadFechamento.cdsFechamentoHRFECHAMENTO.AsDateTime  := Now;
      fDMCadFechamento.cdsFechamentoTIPO_FECHAMENTO.AsString := 'A';
      fDmCadFechamento.prc_Abrir_Financeiro;
      fDmCadFechamento.prc_Le_Financeiro(True);
      fDmCadFechamento.prc_Recalcular_Inf;
      if fDmCadFechamento.cdsFechamento.State in [dsEdit] then
        fDMCadFechamento.cdsFechamento.Post;
    end;
//    btnRecalcularClick(frmCadFechamento);
    fDMCadFechamento.cdsFechamento.ApplyUpdates(0);
  end;
  if (fDmCadFechamento.vTipo_Valor <> 'X') and (vTipo = 'I') then
    if MessageDlg('Imprimir recibo?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      fDmCadFechamento.prc_Imprime_Vlr_InformadoC(vIDAux);
end;

procedure TfMenu.Estoque1Click(Sender: TObject);
begin
  fDmEstoque := tDmEstoque.Create(Self);
  fDmEstoque.prc_Imprime_Estoque('P');
  FreeAndNil(fDmEstoque);
end;

procedure TfMenu.Estoquedemateriais1Click(Sender: TObject);
begin
  fDmEstoque := tDmEstoque.Create(Self);
  fDmEstoque.prc_Imprime_Estoque('M');
  FreeAndNil(fDmEstoque);
end;

procedure TfMenu.VendasdoPerodo1Click(Sender: TObject);
begin
  fPrevVendas := TfPrevVendas.Create(Self);
  fPrevVendas.ShowModal;
end;

procedure TfMenu.FormResize(Sender: TObject);
var
  TaskBarH: THandle;
  TaskBarR: TRect;
begin
{   // obtem o retangulo com o taskbar
  TaskBarH := FindWindow('Shell_TrayWnd', nil);
  GetWindowRect(TaskBarH, TaskBarR);
  // altura do taskbar = TaskBarR.

  Image2.Top  := TaskBarR.Top - Image2.Height - 52;
  Image2.Left := Screen.Width  - Image2.Width  - 16;
  lbImpressora.Left := Image2.Left - 269;
  lbImpressora.Top  := Image2.Top  - 15;
  lbDatabase.Left   := Image2.Left - 269;
  lbDatabase.Top    := lbImpressora.Top - 15;}
end;

procedure TfMenu.Pagamentos1Click(Sender: TObject);
begin
  if fDmParametros.cdsCupomParametrosEXIGE_CAIXA_ABERTO.AsString = 'S' then
  begin
    fDmParametros.qCaixaAberto.Close;
    fDmParametros.qCaixaAberto.ParamByName('T1').AsInteger := vTerminal;
    fDmParametros.qCaixaAberto.ParamByName('D1').AsDate    := Date;
    fDmParametros.qCaixaAberto.Open;
    if fDmParametros.qCaixaAberto.IsEmpty then
    begin
      ShowMessage('Não existe caixa aberto para efetuar venda!');
      fDmParametros.qCaixaAberto.Close;
      Exit;
    end;
  end;
  fDmParametros.qCaixaAberto.Close;
  OpenForm(TfCarnePgto,wsMaximized);
end;

procedure TfMenu.ConsultaPagamentodeCarns1Click(Sender: TObject);
begin
  OpenForm(TfCarnePgtoC,wsMaximized);
end;

procedure TfMenu.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfMenu.erminal1Click(Sender: TObject);
begin
  OpenForm(TfCupomTerminal,wsMaximized);
end;

procedure TfMenu.btnRecebimentoClick(Sender: TObject);
begin
  Pagamentos1Click(Self);
end;

//initialization
//  RLConsts.SetVersion(3,72,'B');

procedure TfMenu.ConfiguraoCertificado1Click(Sender: TObject);
begin
  OpenForm(TfrmCadFilial_Certificado,wsMaximized);
end;

procedure TfMenu.btnNFCeClick(Sender: TObject);
begin
  if not Assigned(fDmParametros) then
    fDmParametros := TdmParametros.Create(Self);
  fDmParametros.cdsCupomParametros.Close;
  fDmParametros.cdsCupomParametros.Open;
  fCupomFiscal := TfCupomFiscal.Create(nil);
  try
    fCupomFiscal.WindowState := wsMaximized;
    fCupomFiscal.ShowModal;
  finally
    FreeAndNil(fCupomFiscal);
  end;
end;

procedure TfMenu.Consultatrocas1Click(Sender: TObject);
begin
  OpenForm(TfrmConsTrocas,wsMaximized);
end;

procedure TfMenu.SenhaComanda1Click(Sender: TObject);
begin
  OpenForm(TfrmSenha_Comanda,wsMaximized);
end;

procedure TfMenu.CadastrodeProdutos1Click(Sender: TObject);
begin
  OpenForm(TfrmCadProduto,wsMaximized);
end;

procedure TfMenu.Comisso1Click(Sender: TObject);
begin
  OpenForm(TfrmConsComissao_Metas,wsMaximized);
end;

end.

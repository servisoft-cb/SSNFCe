unit uMenu1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, jpeg, ExtCtrls, StdCtrls, IniFiles, Mask,
  DB, DateUtils, SqlExpr, UCBase, FMTBcd, DBClient, Provider, Grids, DBGrids, SMDBGrid, ToolEdit, strUtils,
  JvLabel, JvBlinkingLabel, UCadFechamento_Contagem2, UCadFechamento2,
  AdvPicture, SpeedBar, ImgList;

type
  TfMenu1 = class(TForm)
    Panel2: TPanel;
    PanelBkp: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Panel6: TPanel;
    Label4: TLabel;
    UCControls1: TUCControls;
    lbDatabase: TLabel;
    sdsAniversariante: TSQLDataSet;
    dspAniversariante: TDataSetProvider;
    cdsAniversariante: TClientDataSet;
    dsAniversariante: TDataSource;
    cdsAniversarianteDT_NASCIMENTO: TDateField;
    cdsAniversarianteNOME: TStringField;
    cdsAniversarianteTELEFONE1: TStringField;
    cdsAniversarianteTELEFONE2: TStringField;
    LabelBkp: TJvBlinkingLabel;
    Image2: TImage;
    Panel7: TPanel;
    ImageList1: TImageList;
    Timer1: TTimer;
    pnlAniversarioGeral: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    pnlAniversario: TPanel;
    pnlAniversariante: TPanel;
    pnlBotao: TPanel;
    spbAniversario: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    SpeedItem1: TSpeedItem;
    Panel3: TPanel;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DateEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabelBkpClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedItem1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ffrmCadFechamento2 : TfrmCadFechamento2;
    ffrmCadFechamento_Contagem2 : TfrmCadFechamento_Contagem2;
    procedure prc_Verifica_Certificado;
    procedure prc_Verifica_Backup;
    procedure Le_Ini;
  public
    { Public declarations }
    vAnivPeriodo: string;
    procedure prc_Verifica_Nota_Dupl(Tipo: String);
    function fnc_ExibeAniversarios: String;
    procedure prc_Aniversarios(vDtIni, vDtFin: TDateTime);
  end;

var
  fMenu1: TfMenu1;

implementation

uses DmdDatabase, UMenu, uUtilPadrao;

{$R *.dfm}

procedure TfMenu1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMenu1.FormShow(Sender: TObject);
var
  vVersao: String;
begin
  lbDatabase.Caption := dmDatabase.scoDados.Params.Values['DATABASE'];

  prc_Verifica_Certificado;
  prc_Verifica_Backup;
  Le_Ini;
  prc_Verifica_Nota_Dupl('A');

  vVersao := fMenu.GetBuildInfoAsString;
  if vVersao <> '0.0.0.0' then
    lbDatabase.Caption := 'Vers�o ' + vVersao + ' - ' + lbDatabase.Caption;
end;

procedure TfMenu1.Le_Ini;
begin

end;

procedure TfMenu1.prc_Verifica_Backup;
var
  Config: TIniFile;
  vData: String;
  vHora: String;
begin
  Config := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');

  vData := Config.ReadString('BackUp', 'UltData', '');
  vHora := Config.ReadString('BackUp', 'UltHora', '');

  if trim(vData) <> '' then
  begin
    LabelBkp.Caption := 'Data �ltimo Backup: ' + vData; // + ' ' + vHora;
    if DaysBetween(Date,StrToDate(vData)) > 4 then
    begin
      LabelBkp.Blinking := False;
      LabelBkp.Caption := LabelBkp.Caption + '! Clique aqui!';
      PanelBkp.Visible := True;
      LabelBkp.Visible := True;
      if DaysBetween(Date,StrToDate(vData)) > 9 then
        LabelBkp.Blinking := True;
    end;
  end;
  FreeAndNil(Config);
end;

procedure TfMenu1.prc_Verifica_Certificado;
var
  sds: TSQLDataSet;
  sds2: TSQLDataSet;
  vDataFin: TDateTime;
  vDataIni: TDateTime;
  vQtdAux: Integer;
  fdmDatabase: TdmDatabase;
  vCont: Integer;
  vDiasVenc: Integer;
  vVencido: Boolean;
begin
  if SQLLocate('FILIAL_CERTIFICADOS','ID','NUMERO_SERIE','1') = EmptyStr then
    exit;

  Label4.Caption := '';
  fdmDatabase := TdmDatabase.Create(Self);
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := fdmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT FC.NUMERO_SERIE, FC.validade_fim FROM FILIAL_CERTIFICADOS FC';
    sds.Open;
    vCont := 0;
    vVencido := False;
    sds.First;
    while not sds.Eof do
    begin
      try
        vDataFin := sds.FieldByName('validade_fim').AsDateTime;
        vQtdAux  := DaysBetween(date,vDataFin);
        if vQtdAux <= 15 then
        begin
          if vDataFin >= Date then
          begin
            vCont := vCont + 1;
            if vCont = 1 then
              vDiasVenc := vQtdAux
            else
            if vQtdAux < vDiasVenc then
              vDiasVenc := vQtdAux;
          end
          else
            vVencido := True;
        end;
      except
      end;
      sds.Next;
    end;
    if vCont > 0 then
    begin
      Label4.Caption := 'Existe Certificado Digital vencendo em ...' + IntToStr(vDiasVenc) + ' dias...';
      Panel6.Visible := True;
      Label4.Visible := True;
    end
    else
    if vVencido then
    begin
      Label4.Caption := '... Existe Certificado Vencido ...';
      Panel6.Visible := True;
      Label4.Visible := True;
    end;
    sds.Close;
  finally
    FreeAndNil(sds);
    FreeAndNil(fdmDatabase);
  end;
end;

procedure TfMenu1.prc_Verifica_Nota_Dupl(Tipo: String);
var
  sds: TSQLDataSet;
  vDiasAux: Integer;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;

    sds.CommandText := 'SELECT NOME FROM FILIAL WHERE PRINCIPAL = ' + QuotedStr('S');
    sds.Open;
    sds.Close;

    if (Tipo = 'A') or (Tipo = 'N') then
    begin
      sds.CommandText := 'SELECT COUNT(1) FROM CUPOMFISCAL '
                       + 'WHERE ((NFECHAVEACESSO = ' + QuotedStr('') +')'
                       + ' OR (NFECHAVEACESSO IS NULL)) '
                       + ' AND (TIPO = ' + QuotedStr('NFC') +')'
                       + ' AND (NUMCUPOM > 0)'
                       + ' AND (CANCELADO = ' + QuotedStr('N') + ')';
      sds.Open;
      Label1.Visible := (sds.FieldByName('COUNT').AsInteger > 0);
      Panel5.Visible := (sds.FieldByName('COUNT').AsInteger > 0);
      sds.Close;
    end;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfMenu1.FormActivate(Sender: TObject);
begin
  fMenu1.WindowState := wsMaximized;
end;

procedure TfMenu1.prc_Aniversarios(vDtIni, vDtFin: TDateTime);
begin
  if vDtIni < 10 then
  begin
    if (DayOfTheWeek(Date) = 1) then
    begin
      DateEdit1.Date := Date;
      DateEdit2.Date := Date + 6;
    end
    else
    begin
      DateEdit1.Date := Date + 1 - (DayOfTheWeek(Date));
      DateEdit2.Date := DateEdit1.Date + 6;
    end;
  end;

  cdsAniversariante.Open;
  cdsAniversariante.Filtered := False;
  cdsAniversariante.Filter   := 'DT_NASCIMENTO >= ''' + FormatDateTime('DD/MM/YYYY',DateEdit1.Date) +
                                ''' AND DT_NASCIMENTO <= ''' + FormatDateTime('DD/MM/YYYY',DateEdit2.Date) + '''';
  cdsAniversariante.Filtered := True;
  cdsAniversariante.Open;
end;

procedure TfMenu1.DateEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    prc_Aniversarios(DateEdit1.Date,DateEdit2.Date);
end;

procedure TfMenu1.DateEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    prc_Aniversarios(DateEdit1.Date,DateEdit2.Date);
end;

function TfMenu1.fnc_ExibeAniversarios: String;
var
  sds: TSQLDataSet;
  vDiasAux: Integer;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;

    sds.CommandText := 'SELECT COALESCE(ANIVERSARIO_PERIODO,' + QuotedStr('N') +') ANIVERSARIO_PERIODO FROM CUPOMFISCAL_PARAMETROS';
    sds.Open;
    Result := sds.FieldByName('ANIVERSARIO_PERIODO').AsString;
    sds.Close;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfMenu1.LabelBkpClick(Sender: TObject);
begin
 prc_Verifica_Backup;
  prc_ShellExecute('ssBackUp_Solo.exe');
end;

procedure TfMenu1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) then
  begin
    vConfirma_Fechamento := False;
    ffrmCadFechamento_Contagem2 := TfrmCadFechamento_Contagem2.Create(self);
    ffrmCadFechamento_Contagem2.vTipo_Valor      := 'I';
    ffrmCadFechamento_Contagem2.ShowModal;
    FreeAndNil(ffrmCadFechamento_Contagem2);
    if (vConfirma_Fechamento) and  (SQLLocate('CUPOMFISCAL_PARAMETROS','ID','MOSTRAR_TELA_FECHAMENTO','1') = 'S') then
    begin
      ffrmCadFechamento2 := TfrmCadFechamento2.Create(self);
      ffrmCadFechamento2.vID_Fechamento_Loc := vID_Fechamento_Pos;
      ffrmCadFechamento2.ShowModal;
      FreeAndNil(frmCadFechamento2);
    end;
  end;
end;

procedure TfMenu1.SpeedItem1Click(Sender: TObject);
begin
  if SpeedItem1.ImageIndex = 0 then
  begin
    SpeedItem1.ImageIndex := 1;
    pnlAniversarioGeral.Height := 200;
    Timer1.Enabled := False;
  end
  else
  begin
    SpeedItem1.ImageIndex := 0;
    pnlAniversarioGeral.Height := 53;
    Timer1.Enabled := True;
  end;
end;

procedure TfMenu1.Timer1Timer(Sender: TObject);
begin
  if not cdsAniversariante.IsEmpty then
  begin
    pnlAniversariante.Caption := 'Aniversariante: ' + cdsAniversarianteNOME.AsString +  ' --> ' + DateToStr(cdsAniversarianteDT_NASCIMENTO.AsDateTime);
    cdsAniversariante.Next;
    if cdsAniversariante.Eof then
      cdsAniversariante.First;
  end;
end;

procedure TfMenu1.FormCreate(Sender: TObject);
begin
  case AnsiIndexStr(fnc_ExibeAniversarios,['N','D','S']) of
    0: pnlAniversarioGeral.Visible := False;
    1: begin
         DateEdit1.Date := Date;
         DateEdit2.Date := Date;
         prc_Aniversarios(Date,Date);
       end;
    2: prc_Aniversarios(0,0);
  end;
  if pnlAniversarioGeral.Visible then
  begin
    SpeedItem1.ImageIndex := 0;
    pnlAniversarioGeral.Height := 53;
    Timer1.Enabled := True;
  end;

end;

end.

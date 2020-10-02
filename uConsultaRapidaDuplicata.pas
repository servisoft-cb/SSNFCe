unit uConsultaRapidaDuplicata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ToolEdit, CurrEdit, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, RXCtrls, uDmPagamento, DB, Math;

type
  TfrmConsultaRapidaDuplicata = class(TForm)
    LblNomeSistema: TRxLabel;
    LabelCliente: TEdit;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    DBGridLista: TDBGrid;
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    BtnOk: TBitBtn;
    ValorPagar: TCurrencyEdit;
    BitBtn2: TBitBtn;
    ValorDevido: TCurrencyEdit;
    ValorSaldo: TCurrencyEdit;
    BtnCancelar: TBitBtn;
    EditSel: TCurrencyEdit;
    procedure DBGridListaCellClick(Column: TColumn);
    procedure DBGridListaColEnter(Sender: TObject);
    procedure DBGridListaColExit(Sender: TObject);
    procedure DBGridListaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure DBGridListaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    ValorSel, ValorApurado : Currency;
    OriginalOptions : TDBGridOptions;
    procedure SaveBoolean(Grid : TDBGrid) ;
  public
    fDmPagamento : TdmPagamento;
    IDParcela : String;
    ValorCalculado : Currency;
    { Public declarations }
  end;

var
  frmConsultaRapidaDuplicata: TfrmConsultaRapidaDuplicata;

implementation

{$R *.dfm}

{ TfrmConsultaRapidaDuplicata }

procedure TfrmConsultaRapidaDuplicata.SaveBoolean(Grid: TDBGrid);
begin
  Grid.SelectedField.Dataset.Edit;
  Grid.SelectedField.AsBoolean := not Grid.SelectedField.AsBoolean;
  Grid.SelectedField.Dataset.Post;

  // Alimentar total selecionado
  if Grid.SelectedField.DataSet.FieldByName('Baixar').AsBoolean then
    ValorSel := ValorSel + Grid.SelectedField.DataSet.FieldByName('VLR_RESTANTE').AsFloat
  else
    ValorSel := ValorSel - Grid.SelectedField.DataSet.FieldByName('VLR_RESTANTE').AsFloat;

  EditSel.Value := ValorSel;
  EditSel.Update;
  Grid.SelectedField.Dataset.Next;

end;

procedure TfrmConsultaRapidaDuplicata.DBGridListaCellClick(
  Column: TColumn);
begin
  if DBGridLista.SelectedField.DataType = ftBoolean then
    SaveBoolean(DBGridLista) ;

end;

procedure TfrmConsultaRapidaDuplicata.DBGridListaColEnter(Sender: TObject);
begin
  if DBGridLista.SelectedField.DataType = ftBoolean then
    begin
      OriginalOptions := DBGridLista.Options ;
      DBGridLista.Options := DBGridLista.Options - [dgEditing] ;
    end ;
end;

procedure TfrmConsultaRapidaDuplicata.DBGridListaColExit(Sender: TObject);
begin
  if DBGridLista.SelectedField.DataType = ftBoolean then
    DBGridLista.Options := OriginalOptions;
end;

procedure TfrmConsultaRapidaDuplicata.DBGridListaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,
                                           DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  if fDmPagamento.cdsDuplicataCliDTVENCIMENTO.AsDateTime < now then
  begin
     DBGridLista.Canvas.Font.Color := clRed;
     DBGridLista.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;

  if Column.Field.DataType = ftBoolean then
    begin
      DBGridLista.Canvas.FillRect(Rect);
      DrawFrameControl(DBGridLista.Canvas.Handle,
                       Rect,
                       DFC_BUTTON,
                       CtrlState[Column.Field.AsBoolean]);
    end;
end;

procedure TfrmConsultaRapidaDuplicata.FormShow(Sender: TObject);
begin
  if DBGridLista.DataSource = nil then
    DBGridLista.DataSource := fDmPagamento.dsDuplicataCli;
end;

procedure TfrmConsultaRapidaDuplicata.DBGridListaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) and ( DBGridLista.SelectedField.DataType = ftBoolean ) then
    SaveBoolean(DBGridLista);
end;

procedure TfrmConsultaRapidaDuplicata.FormActivate(Sender: TObject);
var
  NomeCliente : String;
begin
  if fDmPagamento.cdsDuplicataCliCLIENTE_NOME.AsString <> EmptyStr then
  begin
    try
      NomeCliente := fDmPagamento.cdsDuplicataCliCLIENTE_NOME.AsString;
      LabelCliente.Text := FormatFloat('00000', fDmPagamento.cdsDuplicataCliID_PESSOA.AsInteger) + ' - ' + NomeCliente;
    except
      LabelCliente.Text := 'Cliente Não Encontrado!';
    end;
    LabelCliente.Update;
  end;
  try
    ValorDevido.Value := fDmPagamento.cdsDuplicataCliTotal_Devido.Value;
    ValorDevido.Update;
  except
  end;
  ValorPagar.SetFocus;
end;


procedure TfrmConsultaRapidaDuplicata.BitBtn2Click(Sender: TObject);
var
  Soma : Currency;
begin
  fDmPagamento.cdsDuplicataCli.First;
  ValorApurado := 0;
  Soma := 0;
  ValorSaldo.Value := 0;
  while not fDmPagamento.cdsDuplicataCli.Eof do
    begin
      fDmPagamento.cdsDuplicataCli.Edit;
      fDmPagamento.cdsDuplicataCliBaixar.AsBoolean := False;
      fDmPagamento.cdsDuplicataCli.Post;
      fDmPagamento.cdsDuplicataCli.Next;
    end;
  ValorSel := 0;
  fDmPagamento.cdsDuplicataCli.First;
  while not fDmPagamento.cdsDuplicataCli.Eof do
    begin
      ValorCalculado := RoundTo(fDmPagamento.cdsDuplicataCliVLR_RESTANTE.AsFloat, -2);
      Soma := ValorCalculado + ValorApurado;
      if ValorApurado < ValorPagar.Value then
        if Soma <= ValorPagar.Value then
          begin
            ValorApurado := ValorApurado + ValorCalculado;
            fDmPagamento.cdsDuplicataCli.Edit;
            fDmPagamento.cdsDuplicataCliBaixar.AsBoolean := True;
            fDmPagamento.cdsDuplicataCli.Post;
          end
        else
          begin
            if (ValorApurado = 0) and (ValorPagar.Value < ValorCalculado) then
              ValorSaldo.Value      := ValorPagar.Value
            else
              begin
                if (ValorPagar.Value >= ValorApurado) then
                  ValorSaldo.Value  := ValorPagar.Value - ValorApurado;
              end;

            ValorApurado     := ValorApurado + ValorCalculado;
            IDParcela        := fDmPagamento.cdsDuplicataCliPARCELA.AsString;
            fDmPagamento.cdsDuplicataCli.Edit;
            fDmPagamento.cdsDuplicataCliBaixar.AsBoolean := True;
            fDmPagamento.cdsDuplicataCli.Post;
            Break;
          end;
      // Alimentar total selecionado
      if fDmPagamento.cdsDuplicataCli.FieldByName('Baixar').AsBoolean then
        begin
          ValorSel := ValorSel + fDmPagamento.cdsDuplicataCli.FieldByName('VLR_RESTANTE').AsFloat;
          EditSel.Value := ValorSel;
          EditSel.Update;
        end;
      fDmPagamento.cdsDuplicataCli.Next;
    end;
  BtnOk.SetFocus;

end;

procedure TfrmConsultaRapidaDuplicata.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
     VK_RETURN: begin key:= 0;
                      Perform(cm_dialogkey,VK_Tab,0);
                end;
     VK_Escape: begin
                  Close ;
                  Key := 0;
                end;
     VK_F1:begin
               // Itens do Crediário
//               Application.CreateForm(TFormTelaItensCrediario,FormTelaItensCrediario);
//               FormTelaItensCrediario.ShowModal;
           end ;
  end;
end;

procedure TfrmConsultaRapidaDuplicata.BtnOkClick(Sender: TObject);
begin
  fDmPagamento.mSelecionadas.EmptyDataSet;
  fDmPagamento.cdsDuplicataCli.First;
  while not fDmPagamento.cdsDuplicataCli.Eof do
  begin
    if fDmPagamento.cdsDuplicataCliBaixar.AsBoolean then
    begin

      fDmPagamento.mSelecionadas.Insert;
      fDmPagamento.mSelecionadasID.AsString           := fDmPagamento.cdsDuplicataCliID.AsString;
      fDmPagamento.mSelecionadasNUM_CUPOM.AsString    := fDmPagamento.cdsDuplicataCliNUMCUPOM.AsString;
      fDmPagamento.mSelecionadasPARCELA.AsString      := fDmPagamento.cdsDuplicataCliPARCELA.AsString;
      fDmPagamento.mSelecionadasCLIENTE_NOME.AsString := fDmPagamento.cdsDuplicataCliCLIENTE_NOME.AsString;
      fDmPagamento.mSelecionadasCLIENTE_OBS.AsString  := fDmPagamento.cdsDuplicataCliDESCRICAO.AsString;
      fDmPagamento.mSelecionadasDT_EMISSAO.AsString   := fDmPagamento.cdsDuplicataCliDTEMISSAO.AsString;
      fDmPagamento.mSelecionadasDT_VCTO.AsString      := fDmPagamento.cdsDuplicataCliDTVENCIMENTO.AsString;
      fDmPagamento.mSelecionadasVLR_VCTO.AsCurrency   := fDmPagamento.cdsDuplicataCliVLR_RESTANTE.AsCurrency;
      fDmPagamento.mSelecionadasDIAS_ATRASO.AsFloat   := 0;
      if fDmPagamento.cdsDuplicataDTVENCIMENTO.AsFloat < Date then
        fDmPagamento.mSelecionadasDIAS_ATRASO.AsFloat := Date - fDmPagamento.cdsDuplicataCliDTVENCIMENTO.AsFloat;
      fDmPagamento.mSelecionadasVLR_JUROS.AsString    := '0';
      if fDmPagamento.mSelecionadasDIAS_ATRASO.AsFloat > 5 then
        fDmPagamento.mSelecionadasVLR_JUROS.AsString := FormatFloat('0.00',fDmPagamento.mSelecionadasDIAS_ATRASO.AsFloat *
                                                        fDmPagamento.qParametrosPERC_JUROS_PADRAO.AsCurrency /
                                                        100 / 30 * fDmPagamento.mSelecionadasVLR_VCTO.AsCurrency);
      fDmPagamento.mSelecionadasVLR_TOTAL.AsCurrency := fDmPagamento.mSelecionadasVLR_JUROS.AsFloat +
                                                        fDmPagamento.cdsDuplicataCliVLR_RESTANTE.AsFloat;
      fDmPagamento.mSelecionadasVLR_SALDO_PRINC.AsCurrency := fDmPagamento.cdsDuplicataCliVLR_RESTANTE.AsCurrency;
      fDmPagamento.mSelecionadasVLR_SALDO_JUROS.AsCurrency := fDmPagamento.mSelecionadasVLR_JUROS.AsFloat;
      fDmPagamento.mSelecionadas.Post;
    end;
    fDmPagamento.cdsDuplicataCli.Next;
  end;
  fDmPagamento.mSelecionadas.First;
  Close;
  ModalResult := mrOk;
end;

procedure TfrmConsultaRapidaDuplicata.BtnCancelarClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

end.

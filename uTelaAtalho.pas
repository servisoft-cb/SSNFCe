unit uTelaAtalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmoothPanel, Grids, AdvObj, BaseGrid, AdvGrid, ExtCtrls,
  AdvPanel, FMTBcd, DB, SqlExpr;

type
  TfrmTeclasAtalho = class(TForm)
    Panel1: TPanel;
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    AdvPanel3: TAdvPanel;
    AdvPanel4: TAdvPanel;
    AdvPanel5: TAdvPanel;
    AdvSmoothPanel1: TAdvSmoothPanel;
    AdvStringGrid1: TAdvStringGrid;
    SQLTeclaAtalho: TSQLQuery;
    SQLTeclaAtalhoID: TIntegerField;
    SQLTeclaAtalhoTECLA: TStringField;
    SQLTeclaAtalhoDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTeclasAtalho: TfrmTeclasAtalho;

implementation

uses
  DmdDatabase;

{$R *.dfm}

procedure TfrmTeclasAtalho.FormShow(Sender: TObject);
var
  i : integer;
begin
  AdvStringGrid1.Cells[0,0] := 'Tecla(s)';
  AdvStringGrid1.Cells[1,0] := 'Descrição da Função';
  SQLTeclaAtalho.Close;
  SQLTeclaAtalho.Open;
  if SQLTeclaAtalho.IsEmpty then
    exit;
  SQLTeclaAtalho.First;
//  AdvStringGrid1.RowCount := SQLTeclaAtalho.RecordCount;
  i := 0;
  while not SQLTeclaAtalho.Eof do
  begin
    Inc(i);
    AdvStringGrid1.Cells[0, i] := SQLTeclaAtalhoTECLA.AsString;
    AdvStringGrid1.Cells[1, i] := SQLTeclaAtalhoDESCRICAO.AsString;
    SQLTeclaAtalho.Next;
  end;

end;

procedure TfrmTeclasAtalho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmTeclasAtalho.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Close;
end;

end.

unit Classe.Danfe.Fortes;

interface

uses
  ACBrBase,
  ACBrDFeReport,
  ACBrDFeDANFeReport,
  ACBrNFeDANFEClass,
  ACBrDANFCeFortesFr,
  pcnConversao,
  SysUtils,
  uUtilPadrao,
  Forms;

type
  TDanfeFortes = class
  private
    FDanfeFortes: TACBrNFeDANFCeFortes;
    procedure SetDanfeFortes(const Value: TACBrNFeDANFCeFortes);
    function CriarDiretorio(aValue: String): Boolean;

  public
    constructor create;
    destructor destroy; override;
    property DanfeFortes : TACBrNFeDANFCeFortes read FDanfeFortes write SetDanfeFortes;
  end;


implementation

{ TDanfeFortes }

constructor TDanfeFortes.create;
var
  Caminho : String;
begin
  DanfeFortes                       := TACBrNFeDANFCeFortes.Create(nil);
  DanfeFortes.ImprimeItens          := True;
  DanfeFortes.ImprimeEmUmaLinha     := True;
  DanfeFortes.ImprimeTotalLiquido   := True;
  DanfeFortes.ImprimeDescAcrescItem := True;
  DanfeFortes.UsaSeparadorPathPDF   := True;
  DanfeFortes.MargemDireita         := 5;
  DanfeFortes.MargemEsquerda        := 6;
  DanfeFortes.MargemSuperior        := 8;
  DanfeFortes.MargemInferior        := 8;
  DanfeFortes.Logo                  := SQLLocate('CUPOMFISCAL_PARAMETROS','ID','CAMINHO_LOGO','1');
  DanfeFortes.imprimeLogoLateral    := True;
  DanfeFortes.Sistema               := 'Servisoft Informática Ltda';
  Caminho                           := ExtractFilePath(Application.ExeName) + 'PDF';
  if CriarDiretorio(Caminho) then
    DanfeFortes.PathPDF             := Caminho;
end;

destructor TDanfeFortes.destroy;
begin

  inherited;
end;

procedure TDanfeFortes.SetDanfeFortes(const Value: TACBrNFeDANFCeFortes);
begin
  FDanfeFortes := Value;
end;

function TDanfeFortes.CriarDiretorio(aValue : String) : Boolean;
begin
  Result := True;
  if not DirectoryExists(aValue) then
  begin
    try
      CreateDir(aValue);
    except
      Result := False;
    end;
  end;
end;


end.

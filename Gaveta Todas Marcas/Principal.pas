unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, ACBrNFeDANFEClass, Inifiles,
  ACBrNFeDANFeESCPOS, ACBrBase, ACBrPosPrinter, RXCtrls;

type
  TFormPrincipal = class(TForm)
    ACBrPosPrinter: TACBrPosPrinter;
    lbEmpresa: TRxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.FormCreate(Sender: TObject);
var Inifile: TInifile;
var ImpMarca, ImpCaixaPorta, ImpCaixaVeloc : string;
begin
    IniFile             := TIniFile.Create('C:\$Servisoft\Impressora.ini');
    ImpMarca            := IniFile.ReadString('ACBR2','Modelo','DARUMA');
    ImpCaixaPorta       := IniFile.ReadString('ACBR2','Porta','');
    ImpCaixaVeloc       := IniFile.ReadString('ACBR2','Boud','9600');
    IniFile.Free;

    if ImpMarca = 'EPSON'    then ACBrPosPrinter.Modelo := ppEscPosEpson;
    if ImpMarca = 'BEMATECH' then ACBrPosPrinter.Modelo := ppEscBematech;
    if ImpMarca = 'ELGIN'    then ACBrPosPrinter.Modelo := ppEscVox;
    if ImpMarca = 'DR700'    then ACBrPosPrinter.Modelo := ppEscDaruma;
    if ImpMarca = 'DR800'    then ACBrPosPrinter.Modelo := ppEscDaruma;
//    if ImpMarca = 'DR800'    then ACBrPosPrinter.ControlePorta := False;

    ACBrPosPrinter.Device.Porta := ImpCaixaPorta;
    ACBrPosPrinter.Device.Baud  := StrToint(ImpCaixaVeloc);
    ACBrPosPrinter.Device.Desativar;
    ACBrPosPrinter.Device.Ativar;
    try
      ACBrPosPrinter.AbrirGaveta;
    except
      Application.ProcessMessages;
    end;

    Application.Terminate;
end;

procedure TFormPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ACBrPosPrinter.Device.Desativar;
  Action := cafree ;
end;

end.

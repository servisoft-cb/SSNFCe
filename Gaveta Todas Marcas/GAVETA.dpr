program GAVETA;

uses
  Forms,
  Principal in 'Principal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Gaveta';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.

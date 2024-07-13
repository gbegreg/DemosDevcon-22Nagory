program Animations;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.

program scrolling;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {fScrolling},
  uScrolling in 'uScrolling.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfScrolling, fScrolling);
  Application.Run;
end.

unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm11 = class(TForm)
    sol: TRectangle;
    sprite: TRectangle;
    Timer1: TTimer;
    Sauter: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure SauterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    vitesseY : single;
  end;


const
  GRAVITE = 0.2;
  PUISSANCESAUT = 7;

var
  Form11: TForm11;

implementation

{$R *.fmx}

procedure TForm11.FormCreate(Sender: TObject);
begin
  vitesseY := 0;
end;

procedure TForm11.SauterClick(Sender: TObject);
begin
  vitesseY := -PUISSANCESAUT;
end;

procedure TForm11.Timer1Timer(Sender: TObject);
begin
  vitesseY := vitesseY + GRAVITE;
  if sprite.Position.y + sprite.Height <= sol.Position.Y then sprite.Position.Y := sprite.Position.Y + vitesseY
  else begin
    sprite.Position.y := sol.Position.Y - sprite.Height;
    vitesseY := 0;
  end;
end;

end.

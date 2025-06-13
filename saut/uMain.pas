unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Math.Vectors, FMX.Types3D, FMX.MaterialSources, FMX.Controls3D,
  FMX.Ani, FMX.Objects3D, FMX.Viewport3D, FMX.Layouts;

type
  TForm11 = class(TForm)
    sol: TRectangle;
    sprite: TRectangle;
    Timer1: TTimer;
    Sauter: TButton;
    layDevQuest: TLayout;
    Viewport3D1: TViewport3D;
    Plane1: TPlane;
    FloatAnimation4: TFloatAnimation;
    Light1: TLight;
    LightMaterialSource1: TLightMaterialSource;
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
  if sprite.Position.y + sprite.Height <= sol.Position.Y then begin
    sprite.Position.Y := sprite.Position.Y + vitesseY;
    exit;
  end;
  sprite.Position.y := sol.Position.Y - sprite.Height;
  vitesseY := 0;
end;

end.

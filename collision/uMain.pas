unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Ani, System.Math.Vectors, FMX.Types3D, FMX.Controls3D,
  FMX.MaterialSources, FMX.Objects3D, FMX.Viewport3D;

type
  TForm11 = class(TForm)
    R1: TRectangle;
    R2: TRectangle;
    R3: TRectangle;
    R4: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Layout1: TLayout;
    lblCollision: TLabel;
    Timer1: TTimer;
    Label4: TLabel;
    FloatAnimation1: TFloatAnimation;
    Label5: TLabel;
    Circle1: TCircle;
    Circle2: TCircle;
    Label6: TLabel;
    Label7: TLabel;
    FloatAnimation2: TFloatAnimation;
    FloatAnimation3: TFloatAnimation;
    layDevQuest: TLayout;
    Viewport3D1: TViewport3D;
    Plane1: TPlane;
    LightMaterialSource1: TLightMaterialSource;
    Light1: TLight;
    FloatAnimation4: TFloatAnimation;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: WideChar; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
  private
    function Intersects(const R1, R2: TRect): Boolean;
    function createRect(unRectangle: TRectangle): TRect;
    function IntersectsCircles(const C1, C2: TCircle): Boolean;
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form11: TForm11;

implementation

{$R *.fmx}

procedure TForm11.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
begin
  if key = VKDOWN  then R1.Position.Y := R1.Position.Y + 2;
  if key = VKUP    then R1.Position.Y := R1.Position.Y - 2;
  if key = VKRIGHT then R1.Position.X := R1.Position.X + 2;
  if key = VKLEFT  then R1.Position.X := R1.Position.X - 2;
end;

procedure TForm11.Timer1Timer(Sender: TObject);
begin
  lblCollision.Text := '';
  if Intersects(createRect(R1), createRect(R2)) then lblCollision.Text := lblCollision.Text + ' R2';
  if Intersects(createRect(R1), createRect(R3)) then lblCollision.Text := lblCollision.Text + ' R3';
  if Intersects(createRect(R1), createRect(R4)) then lblCollision.Text := lblCollision.Text + ' R4';
  if IntersectsCircles(circle1, circle2) then Circle2.Fill.Color := TAlphaColorrec.Indianred
  else Circle2.Fill.Color := TAlphaColorRec.Lightgray;
end;

function TForm11.Intersects(const R1, R2: TRect): Boolean;
begin
  Result := (R1.Left   < R2.Right) and
            (R1.Right  > R2.Left) and
            (R1.Top    < R2.Bottom) and
            (R1.Bottom > R2.Top);
end;

function TForm11.createRect(unRectangle : TRectangle): TRect;
begin
  result := TRect.Create(TPoint.Create(Round(unRectangle.Position.x), Round(unRectangle.Position.y)), Round(unRectangle.Width), Round(unRectangle.Height))
end;

function TForm11.IntersectsCircles(const C1, C2: TCircle): Boolean;
var  rayonC1, rayonC2, centreC1x, centreC1y, centreC2x, centreC2y, C1x_C2x, C1y_C2y, rC1rC2, d2, rayons2 : single;
begin
  rayonC1 := C1.width * 0.5;
  rayonC2 := C2.width * 0.5;
  centreC1x := C1.position.X + rayonC1;
  centreC2x := C2.position.X + rayonC2;
  centreC1y := C1.position.Y + rayonC1;
  centreC2y := C2.position.Y + rayonC2;
  C1x_C2x := centreC1x - centreC2x;
  C1y_C2y := centreC1y - centreC2y;
  rC1rC2 := rayonC1 + rayonC2;

  d2 := C1x_C2x * C1x_C2x + C1y_C2y * C1y_C2y;
  rayons2 := rC1rC2 * rC1rC2;
  result := d2 <= rayons2;
end;

end.

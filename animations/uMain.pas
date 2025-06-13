unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, System.Math.Vectors, FMX.Types3D, FMX.MaterialSources,
  FMX.Controls3D, FMX.Objects3D, FMX.Viewport3D, FMX.Layouts;

type
  TForm11 = class(TForm)
    Image1: TImage;
    BitmapListAnimation1: TBitmapListAnimation;
    layDevQuest: TLayout;
    Viewport3D1: TViewport3D;
    Plane1: TPlane;
    FloatAnimation4: TFloatAnimation;
    Light1: TLight;
    LightMaterialSource1: TLightMaterialSource;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form11: TForm11;

implementation

{$R *.fmx}

end.

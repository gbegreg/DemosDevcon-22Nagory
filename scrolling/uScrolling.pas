unit uScrolling;

interface

uses System.Classes, System.UITypes, FMX.Objects, FMX.Layouts, FMX.Graphics;

type
  TScrolling = class(TLayout)
  private
    fRectangle: TRectangle;
    fVitesse: single;
  public
    constructor Create(AOwner: TComponent); override;
    property Rectangle: TRectangle read fRectangle write fRectangle;
    property Vitesse: single read fVitesse write fVitesse;
  end;

implementation


{ TScrolling }

constructor TScrolling.Create(AOwner: TComponent);
begin
  inherited;
  fRectangle := TRectangle.create(nil);
  fRectangle.Parent := self;
  fRectangle.HitTest := false;
  fRectangle.Fill.Kind := TBrushKind.Bitmap;
  fRectangle.Fill.Bitmap.WrapMode := TWrapMode.Tile;
  fRectangle.stroke.Dash := TStrokeDash.Solid;
  fRectangle.stroke.Color := TAlphaColorRec.Null;
  fRectangle.stroke.Kind := TBrushKind.Solid;
  fRectangle.stroke.Thickness := 1;
  fVitesse := 0;
end;

end.

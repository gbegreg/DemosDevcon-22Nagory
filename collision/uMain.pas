unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Ani;

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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: WideChar; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
  private
    function IntersectsWith(const R1, R2: TRect): Boolean;
    function createRect(unRectangle: TRectangle): TRect;
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
  if IntersectsWith(createRect(R1), createRect(R2)) then lblCollision.Text := lblCollision.Text + ' R2';
  if IntersectsWith(createRect(R1), createRect(R3)) then lblCollision.Text := lblCollision.Text + ' R3';
  if IntersectsWith(createRect(R1), createRect(R4)) then lblCollision.Text := lblCollision.Text + ' R4';
end;

function TForm11.IntersectsWith(const R1, R2: TRect): Boolean;
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

end.

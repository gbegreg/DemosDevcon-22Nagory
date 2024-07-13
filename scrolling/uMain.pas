unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uScrolling, System.Generics.Collections,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Edit;

type
  TfScrolling = class(TForm)
    layZoneJeu: TLayout;
    layIHM: TLayout;
    Layout1: TLayout;
    btnChargerImage: TButton;
    imgVisualiseur: TImage;
    OpenImgDialog: TOpenDialog;
    Layout2: TLayout;
    eVitesse: TEdit;
    btnCreerScrolling: TButton;
    tGameloop: TTimer;
    recFond: TRectangle;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnChargerImageClick(Sender: TObject);
    procedure btnCreerScrollingClick(Sender: TObject);
    procedure tGameloopTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
  private
    procedure deplacerScrollings(vitesseX, vitesseY : integer);
    procedure gererTouches(Key: Word; appuyer: boolean);
  public
    listeScrollings: TList<TScrolling>;
    toucheDroite, toucheGauche, toucheHaut, toucheBas : boolean;
  end;

var
  fScrolling: TfScrolling;

implementation

{$R *.fmx}

procedure TfScrolling.FormCreate(Sender: TObject);
begin
  listeScrollings := TList<TScrolling>.Create;
  toucheGauche := false;
  toucheDroite := false;
  toucheBas := false;
  toucheHaut := false;
end;

procedure TfScrolling.FormDestroy(Sender: TObject);
begin
  listeScrollings.Free;
end;

procedure TfScrolling.btnChargerImageClick(Sender: TObject);
begin
  OpenImgDialog.InitialDir := ExtractFilePath(paramstr(0));
  if OpenImgDialog.Execute then begin
    imgVisualiseur.Bitmap.LoadFromFile(OpenImgDialog.FileName);
    imgVisualiseur.Hint := OpenImgDialog.FileName;
  end;
end;

procedure TfScrolling.btnCreerScrollingClick(Sender: TObject);
begin
  var unScrolling := TScrolling.Create(nil);
  unScrolling.parent := layZoneJeu;
  unScrolling.rectangle.Fill.Bitmap.Bitmap.LoadFromFile(imgVisualiseur.Hint);
  unScrolling.rectangle.Width := unScrolling.rectangle.Fill.Bitmap.Bitmap.Width * (fScrolling.ClientWidth / unScrolling.rectangle.Fill.Bitmap.Bitmap.Width + 1);
  unScrolling.rectangle.Height := unScrolling.rectangle.Fill.Bitmap.Bitmap.Height * (fScrolling.ClientHeight / unScrolling.rectangle.Fill.Bitmap.Bitmap.Height + 1);
  unScrolling.vitesse := strToInt(eVitesse.text);
  listeScrollings.Add(unScrolling);
end;

procedure TfScrolling.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
begin
  gererTouches(key, true);
end;

procedure TfScrolling.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
begin
  gererTouches(key, false);
end;

procedure TfScrolling.gererTouches(Key: Word; appuyer: boolean);
begin
  if key = vkRight then toucheDroite := appuyer;
  if key = vkLeft then toucheGauche := appuyer;
  if key = vkUp then toucheHaut := appuyer;
  if key = vkDown then toucheBas := appuyer;
end;

procedure TfScrolling.tGameloopTimer(Sender: TObject);
begin
  var vitesseX := 0;
  var vitesseY := 0;
  if toucheDroite then vitesseX := -1;
  if toucheGauche then vitesseX := 1;
  if toucheBas then vitesseY := -1;
  if toucheHaut then vitesseY := 1;
  deplacerScrollings(vitesseX, vitesseY);
end;

procedure TfScrolling.deplacerScrollings(vitesseX, vitesseY : integer);
begin
  layZoneJeu.BeginUpdate;
  for var scrolling in listeScrollings do begin
    if scrolling.vitesse <> 0 then begin
      scrolling.Position.x := scrolling.Position.x + (vitesseX * scrolling.vitesse);
      if scrolling.Position.x <= -scrolling.rectangle.Fill.Bitmap.Bitmap.Width then scrolling.Position.x := 0
      else if scrolling.Position.x >= 0 then scrolling.Position.x := -scrolling.rectangle.Fill.Bitmap.Bitmap.Width;

      scrolling.Position.y := scrolling.Position.y + (vitesseY * scrolling.vitesse);
      if scrolling.Position.y <= -scrolling.rectangle.Fill.Bitmap.Bitmap.Height then scrolling.Position.y := 0
      else if scrolling.Position.y >= 0 then scrolling.Position.y := -scrolling.rectangle.Fill.Bitmap.Bitmap.Height;
    end;
  end;
  layZoneJeu.EndUpdate;
end;

end.

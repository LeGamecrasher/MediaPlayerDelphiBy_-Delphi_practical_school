unit frmMediaplayer_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    MediaPlayer1: TMediaPlayer;
    ScrollBar1: TScrollBar;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
if OpenDialog1.Execute then
begin
Timer1.Enabled := false;
  MediaPlayer1.FileName := OpenDialog1.FileName;
  MediaPlayer1.Open;
  MediaPlayer1.Display := Panel2;
  MediaPlayer1.DisplayRect := Panel2.ClientRect;
  ScrollBar1.Max := MediaPlayer1.TrackLength[1];
  Timer1.Enabled := true;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
label1.Parent := ScrollBar1;
label1.Left := round(ScrollBar1.Width/2);
label1.Top := 0;
end;

procedure TForm2.Panel2Resize(Sender: TObject);
begin
MediaPlayer1.DisplayRect := Panel2.ClientRect;
label1.Left := round(ScrollBar1.Width/2);
label1.Top := 0;
end;

procedure TForm2.ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
MediaPlayer1.Position := ScrollBar1.Position;
MediaPlayer1.Play;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
ScrollBar1.Position := MediaPlayer1.Position;
label1.Caption := FormatFloat('0#.##',(ScrollBar1.Position/ScrollBar1.Max)*100) + ' %';
if MediaPlayer1.Position = ScrollBar1.Max then MediaPlayer1.Stop;

end;

end.

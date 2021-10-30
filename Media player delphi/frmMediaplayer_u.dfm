object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 688
  ClientWidth = 1071
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1071
    Height = 137
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 72
      Width = 12
      Height = 16
      Caption = '%'
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 90
      Height = 58
      Caption = 'Open...'
      TabOrder = 0
      OnClick = Button1Click
    end
    object MediaPlayer1: TMediaPlayer
      Left = 560
      Top = 48
      Width = 225
      Height = 30
      VisibleButtons = [btPlay, btPause, btStop, btNext, btPrev, btStep, btBack, btEject]
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 1071
    Height = 551
    Align = alClient
    TabOrder = 1
    OnResize = Panel2Resize
    ExplicitLeft = 536
    ExplicitTop = 240
    ExplicitWidth = 185
    ExplicitHeight = 41
    object ScrollBar1: TScrollBar
      Left = 1
      Top = 529
      Width = 1069
      Height = 21
      Align = alBottom
      PageSize = 0
      TabOrder = 0
      OnScroll = ScrollBar1Scroll
      ExplicitLeft = 576
      ExplicitTop = 392
      ExplicitWidth = 121
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Media|*.mp3;*.mp4;*.vma;.avi'
    Left = 128
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30
    OnTimer = Timer1Timer
    Left = 816
    Top = 48
  end
end

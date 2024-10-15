﻿unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    StatusBar1: TStatusBar;
    BtnClose: TButton;
    ComboBox1: TComboBox;
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LongTextHint(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.LongTextHint(Sender: TObject);
begin
  StatusBar1.SimpleText := GetLongHint(Application.Hint);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnHint := LongTextHint;
  ComboBox1.Items := Screen.Fonts;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
label1.Caption := IntToStr(form1.ComponentCount);
end;


procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{ выставить KeyPreview = true}
  if ssCtrl in Shift then {если нажата клавиша Ctrl}
  case Key of
    VK_UP : Form1.Top:=Form1.Top-1;
    VK_DOWN : Form1.Top:=Form1.Top+1;
    VK_LEFT : Form1.Left:=Form1.Left-1;
    VK_RIGHT : Form1.Left:=Form1.Left+1;
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Form1.Close;
end;

end.
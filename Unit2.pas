unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

const
  WM_KILLHIMSELF_MSG = WM_USER + $101;//закрываем форму из самой себя

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    btnMinus: TButton;
    btnPlus: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FSelfID: Integer;
    procedure WMKillHimself (var Msg: TMessage); message WM_KILLHIMSELF_MSG;//процедура закрытия формы из самой себя
  public
    { Public declarations }
    property SelfID: Integer read FSelfID write FSelfID;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  PostMessage(Self.Handle,WM_KILLHIMSELF_MSG,0,0);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Self.AutoSize:= True;
  FSelfID:= -1;
  Self.BorderStyle:= bsNone;
end;

procedure TForm2.WMKillHimself(var Msg: TMessage);
begin
  Self.Close;
end;

end.

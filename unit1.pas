unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Generics.Collections, Unit2, System.Actions,
  Vcl.ActnList;

const
  WM_KILLHIMSELF_MSG = WM_USER + $101;//закрываем форму из самой себя

type
  TMyList = TObjectList<TForm2>;
  TBtnFrameSender = (bfsPlus, bfsMinus);

  TForm1 = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    ActionList1: TActionList;
    actPlus: TAction;
    actMinus: TAction;
    actResizePnlTop: TAction;
    ScrollBox1: TScrollBox;
    pnlLabel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actPlusExecute(Sender: TObject);
    procedure actMinusExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actResizePnlTopExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FMyList: TMyList;
    FBtnFrameSender: TBtnFrameSender;
    { Private declarations }
  public
    property MyList: TMyList read FMyList;
    property BtnFrameSender: TBtnFrameSender read FBtnFrameSender;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.actMinusExecute(Sender: TObject);
var
  CurrID,NextID: Integer;
begin
  if not TObject(Sender).InheritsFrom(TButton) then Exit;
  if not TButton(Sender).Owner.InheritsFrom(TForm2) then Exit;

  case MyList.Count of
    0,1: ; //Exit;
    else
      begin
        FBtnFrameSender:= bfsMinus;
        CurrID:= MyList.IndexOf(TForm2(TButton(Sender).Owner));
        if MyList[CurrID].Equals(MyList.First)
          then NextID:= Succ(CurrID)
          else NextID:= Pred(CurrID);

        MyList.Delete(CurrID);
        actResizePnlTopExecute(Sender);
        ScrollBox1.Realign;
        ScrollBox1.ScrollInView(MyList[NextID]);
      end;
  end;
end;

procedure TForm1.actPlusExecute(Sender: TObject);
var
  k: Integer;
  s: string;
begin
  s:= TObject(Sender).ClassName;
  k:= MyList.Add(TForm2.Create(Self));
  FBtnFrameSender:= bfsPlus;

  with MyList[k] do
  begin
    Parent:= ScrollBox1;
    SelfID:= k;
    Panel1.Caption:= IntToStr(k);
    btnPlus.OnClick:= actPlusExecute;
    btnMinus.OnClick:= actMinusExecute;
    Align:= alTop;
    Visible:= True;

    if (MyList.Count = 1)
      then Top:= pnlLabel.Top + pnlLabel.Height
      else Top:= MyList[k-1].Top + MyList[k-1].Height;
  end;

  actResizePnlTopExecute(Sender);
  ScrollBox1.Realign;
  ScrollBox1.ScrollInView(MyList[k]);
end;

procedure TForm1.actResizePnlTopExecute(Sender: TObject);
var
  i,k: Integer;
begin
  k:= 0;
  for i := 0 to Pred(ScrollBox1.ControlCount) do
    k:= k + ScrollBox1.Controls[i].Height;

    case BtnFrameSender of
      bfsPlus:
        if (pnlTop.ClientHeight < Self.ClientHeight * 2 div 3)
          then pnlTop.ClientHeight:= k;
      bfsMinus:
        pnlTop.ClientHeight:= k;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FMyList:= TMyList.Create(True);
  FBtnFrameSender:= bfsPlus;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FMyList.Free;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if (MyList.Count > 0) then
  begin
    Label1.Left:= MyList[0].CheckBox1.Left;
    Label2.Left:= MyList[0].btnPlus.Left;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  actPlusExecute(Sender);
//  if (MyList.Count > 0) then
//  begin
//    Label1.Left:= MyList[0].CheckBox1.Left;
//    Label2.Left:= MyList[0].btnPlus.Left;
//  end;
  FormResize(Sender);
end;

end.

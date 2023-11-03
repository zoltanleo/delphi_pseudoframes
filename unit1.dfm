object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 362
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 355
    Height = 121
    Align = alTop
    Caption = 'pnlTop'
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 0
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 353
      Height = 119
      Align = alClient
      TabOrder = 0
      object pnlLabel: TPanel
        Left = 0
        Top = 0
        Width = 349
        Height = 41
        Align = alTop
        Caption = 'pnlLabel'
        Color = clYellow
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        ExplicitWidth = 345
        object Label1: TLabel
          Left = 24
          Top = 13
          Width = 34
          Height = 15
          Caption = 'Label1'
        end
        object Label2: TLabel
          Left = 88
          Top = 13
          Width = 34
          Height = 15
          Caption = 'Label2'
        end
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 121
    Width = 355
    Height = 241
    Align = alClient
    Caption = 'pnlBottom'
    Color = clAqua
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 351
    ExplicitHeight = 240
  end
  object ActionList1: TActionList
    Left = 240
    Top = 135
    object actPlus: TAction
      Caption = 'actPlus'
      OnExecute = actPlusExecute
    end
    object actMinus: TAction
      Caption = 'actMinus'
      OnExecute = actMinusExecute
    end
    object actResizePnlTop: TAction
      Caption = 'actResizePnlTop'
      OnExecute = actResizePnlTopExecute
    end
  end
end

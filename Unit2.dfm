object Form2: TForm2
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Form2'
  ClientHeight = 50
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 362
    Height = 49
    Align = alTop
    Caption = 'Panel1'
    Color = clFuchsia
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 0
    DesignSize = (
      362
      49)
    object CheckBox1: TCheckBox
      Left = 16
      Top = 17
      Width = 97
      Height = 17
      Caption = 'CheckBox1'
      TabOrder = 0
    end
    object btnMinus: TButton
      Left = 280
      Top = 13
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'btnMinus'
      TabOrder = 1
    end
    object btnPlus: TButton
      Left = 199
      Top = 13
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'btnPlus'
      TabOrder = 2
    end
  end
end

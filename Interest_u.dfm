object SimpleIntrest: TSimpleIntrest
  Left = 366
  Top = 309
  Caption = 'Simple Intrest'
  ClientHeight = 272
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 272
    Top = 8
    Width = 213
    Height = 17
    Caption = 'Choose what you want to calculate :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 8
    Top = 85
    Width = 16
    Height = 13
    Caption = 'lbl1'
    Visible = False
  end
  object lbl2: TLabel
    Left = 304
    Top = 85
    Width = 31
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object lbl3: TLabel
    Left = 609
    Top = 85
    Width = 16
    Height = 13
    Caption = 'lbl3'
    Visible = False
  end
  object u5Dropbox: TComboBox
    Left = 304
    Top = 31
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'Default'
    OnChange = u5DropboxChange
    Items.Strings = (
      'Interest Default'
      'Required Princaple Amount'
      'Required Intrest Rate '
      'Required Time Period')
  end
  object pnl1: TPanel
    Left = 8
    Top = 201
    Width = 750
    Height = 64
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object edt1: TEdit
    Left = 8
    Top = 104
    Width = 149
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    Visible = False
  end
  object edt2: TEdit
    Left = 304
    Top = 104
    Width = 149
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 144
    Width = 213
    Height = 42
    Caption = 'Calculate'
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 4
    Visible = False
    OnClick = BitBtn1Click
  end
  object edt3: TEdit
    Left = 609
    Top = 104
    Width = 149
    Height = 21
    NumbersOnly = True
    TabOrder = 5
    Visible = False
  end
  object Button1: TButton
    Left = 683
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = Button1Click
  end
end

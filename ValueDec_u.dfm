object frmValueDec: TfrmValueDec
  Left = 390
  Top = 329
  Align = alCustom
  Caption = 'Value Depreciation'
  ClientHeight = 269
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  DesignSize = (
    701
    269)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 37
    Width = 73
    Height = 13
    Caption = 'Current Value :'
  end
  object lbl2: TLabel
    AlignWithMargins = True
    Left = 280
    Top = 37
    Width = 30
    Height = 13
    Alignment = taCenter
    Anchors = [akTop]
    Caption = 'Rate :'
  end
  object lbl3: TLabel
    Left = 553
    Top = 37
    Width = 34
    Height = 13
    Caption = 'Years :'
  end
  object Label1: TLabel
    Left = 224
    Top = 8
    Width = 250
    Height = 13
    Caption = 'Calculate the value loss of a specific  item over time '
  end
  object pnl1: TPanel
    Left = 8
    Top = 192
    Width = 685
    Height = 64
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object edt1: TEdit
    Left = 8
    Top = 56
    Width = 149
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object edt2: TEdit
    AlignWithMargins = True
    Left = 281
    Top = 56
    Width = 149
    Height = 21
    Alignment = taCenter
    Anchors = [akTop]
    NumbersOnly = True
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 245
    Top = 104
    Width = 213
    Height = 42
    Caption = 'Calculate'
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object edt3: TEdit
    Left = 544
    Top = 56
    Width = 149
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object Button1: TButton
    Left = 618
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 5
    OnClick = Button1Click
  end
end

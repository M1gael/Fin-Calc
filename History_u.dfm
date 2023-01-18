object frmHistory: TfrmHistory
  Left = 488
  Top = 274
  Caption = 'frmHistory'
  ClientHeight = 368
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 454
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 553
    Height = 320
    DataSource = DataModule1.ds2FinCalcHistory
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Var1'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Var2'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Var3'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Result'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Calculation Type'
        Width = 100
        Visible = True
      end>
  end
end

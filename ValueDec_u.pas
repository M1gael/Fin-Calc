unit ValueDec_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Math, ExtCtrls;

type
  TfrmValueDec = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    pnl1: TPanel;
    edt1: TEdit;
    edt2: TEdit;
    BitBtn1: TBitBtn;
    edt3: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValueDec: TfrmValueDec;
  rYears , rRate , rValue , rAwns : Real ;
implementation

uses dmFinCalc_u, LoginReg_u, Choose_u;

{$R *.dfm}

procedure TfrmValueDec.BitBtn1Click(Sender: TObject);
begin

if (edt1.Text = '') or (edt2.Text = '') or (edt3.Text = '') then
Begin
ShowMessage('You have to fill in all the required information');
end
else
begin
 rYears := StrToFloat(edt3.Text);
 rRate := StrToFloat(edt2.Text)/100;
 rValue := StrToFloat(edt1.Text);

  rAwns := rValue * (Power((1 - rRate) , rYears));

  pnl1.Caption := ( 'Your asset is worth R' + floatToStrf( rAwns ,ffFixed , 8, 2 )) + ' after ' + FloatToStr(rYears) + 'years' ;

      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Append;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Username'] := LoginReg_u.frmLoginReg.sActiveUser;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Calculation Type'] := 'Value Depression' ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var1'] := floatToStrf( rValue ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var2'] := floatToStrf( rRate ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var3'] := floatToStrf( rYears ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Result'] := floatToStrf( rAwns ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Post;

  end;

end;
procedure TfrmValueDec.Button1Click(Sender: TObject);
begin
frmValueDec.Hide;
Choose_u.frmChoose.Show;
end;

end.
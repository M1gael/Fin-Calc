unit Inflation_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin , Math, ComCtrls, Buttons;

type
  TfrmInflation = class(TForm)
    lbl1: TLabel;
    pnlInflationCaption: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    btnInflationCalculate: TButton;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    cbxInflation: TComboBox;
    Button1: TButton;
    procedure btnInflationCalculateClick(Sender: TObject);
   // procedure TfrmInflation.cbxInflationChange(Sender: TObject);
    procedure cbxInflationChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInflation: TfrmInflation;

implementation

uses dmFinCalc_u, LoginReg_u, History_u, Choose_u;

{$R *.dfm}

procedure TfrmInflation.BitBtn2Click(Sender: TObject);
begin
frmInflation.Hide;
frmChoose.Show;
end;

procedure TfrmInflation.btnInflationCalculateClick(Sender: TObject);
var rP , rI , rA , rN :real ;

begin
  if (edt1.Text = '') or (edt2.Text = '') or (edt3.Text = '') then
        begin
          ShowMessage('Please ensure no fields are left open and that you have entered valid numbers ');
        end
        else

  case cbxInflation.ItemIndex of
  0 : Begin
      rP := StrToFloat(edt1.Text);
      rN := StrToFloat(edt2.Text);
      rI := (StrToFloat(edt3.Text)/100);

      rA :=  rP*(Power((1 + rI),rN));
      rA := RoundTo(rA ,-2);
      pnlInflationCaption.Caption := 'The value has increased to R' + floatToStr( rA );

      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Append;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Username'] := LoginReg_u.frmLoginReg.sActiveUser;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Calculation Type'] := 'Inflation Default' ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var1'] := floatToStrf( rP ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var2'] := floatToStrf( rN ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var3'] := floatToStrf( rI ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Result'] := floatToStrf( rA ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Post;
      End;

  1 : Begin
      rA := StrToFloat(edt1.Text);
      rN := StrToFloat(edt2.Text);
      rI := (StrToFloat(edt3.Text)/100);

      rP := rA/(Power((1 + rI),rN));
      rP := RoundTo(rP ,-2);
      pnlInflationCaption.Caption := 'The Principle is R' + floatToStr( rP );

      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Append;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Username'] := LoginReg_u.frmLoginReg.sActiveUser;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Calculation Type'] := 'Inflation Principle' ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var1'] := floatToStrf( rA ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var2'] := floatToStrf( rN ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var3'] := floatToStrf( rI ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Result'] := floatToStrf( rP ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Post;
      End;

  2 : Begin
      rA := StrToFloat(edt1.Text);
      rP := StrToFloat(edt2.Text);
      rN := (StrToFloat(edt3.Text));

      rI := (((Power(rA , 1/rN)) / (Power(rP , 1/rN)))-1)*100;
      pnlInflationCaption.Caption := 'The Interest is ' + floatToStrf( rI ,ffFixed , 8, 2 ) + '%';

      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Append;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Username'] := LoginReg_u.frmLoginReg.sActiveUser;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Calculation Type'] := 'Inflation Interest' ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var1'] := floatToStrf( rA ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var2'] := floatToStrf( rP ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var3'] := floatToStrf( rN ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Result'] := floatToStrf( rI ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Post;
      End;


  3 : Begin
      rA := StrToFloat(edt1.Text);
      rP := StrToFloat(edt2.Text);
      rI := (StrToFloat(edt3.Text)/100);

      rN := (Log10(rA/rP) / (Log10(1+rI)));
      //rN := (Log10(rA)) / (Log10(rP*(1+rI)));
     //rN = (log
      pnlInflationCaption.Caption := 'Time Needed for inflation ' + floatToStrf( rN ,ffFixed , 8, 1 ) + 'Y';

      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Append;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Username'] := LoginReg_u.frmLoginReg.sActiveUser;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Calculation Type'] := 'Inflation Time' ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var1'] := floatToStrf( rA ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var2'] := floatToStrf( rP ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var3'] := floatToStrf( rI ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Result'] := floatToStrf( rN ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Post;
      End;

  end;
end;
procedure TfrmInflation.Button1Click(Sender: TObject);
begin
frmInflation.Hide;
Choose_u.frmChoose.Show;
end;

{Choose An Option 0
After Inflation    1
Principle           2
Interest For Inflation 3
Time For Inflation      4
}

 { if (edtrP.Text = '') or (edtrN.Text = '') or (edtrI.Text = '') then
        begin
          ShowMessage('Please ensure no fields are left open and that you have entered valid numbers ');
        end

        else
        begin
          rP := StrToFloat(edtrP.Text);
          rN := StrToFloat(edtrN.Text);
          rI := (StrToFloat(edtrI.Text)/100);

          rA :=  rP*(Power((1 + rI),rN));
          rA := RoundTo(rA ,-2);
          pnlInflationCaption.Caption := 'The value has increased to R' + floatToStr( rA );
        end;}
procedure TfrmInflation.cbxInflationChange(Sender: TObject);
begin
case cbxInflation.ItemIndex of                                     //APIN
  0 : Begin
      lbl1.Caption := 'Principle in R:';
      lbl2.Caption := 'Inflation rate in %: ';
      lbl3.Caption := 'Time in Y:';
      edt1.Clear;
      edt2.Clear;
      edt3.Clear;

      End;
  1 : Begin
      lbl1.Caption := 'Inflated Value in R:';
      lbl2.Caption := 'Interrest in %: ';
      lbl3.Caption := 'Time in Y:';
      edt1.Clear;
      edt2.Clear;
      edt3.Clear;
      End;
  2 : Begin
      lbl1.Caption := 'Inflated Value in R:';
      lbl2.Caption := 'Principle in R: ';
      lbl3.Caption := 'Time in Y:';
      edt1.Clear;
      edt2.Clear;
      edt3.Clear;
      End;

  3 : Begin
      lbl1.Caption := 'Inflated Value in R:';
      lbl2.Caption := 'Principle in R: ';
      lbl3.Caption := 'Interrest in %:';
      edt1.Clear;
      edt2.Clear;
      edt3.Clear;
      End;

end;
lbl1.Visible := true ;
lbl2.Visible := true ;
lbl3.Visible := true ;

edt1.Visible := true ;
edt2.Visible := true ;
edt3.Visible := true ;

edt1.Clear;
edt2.Clear;
edt3.Clear;
pnlInflationCaption.Caption:= '';

btnInflationCalculate.Visible := true;
pnlInflationCaption.Visible := true ;
end;

end.

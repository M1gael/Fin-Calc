unit Investment_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls , Math, Buttons;

type
  TfrmInvestment = class(TForm)
    Panel3: TPanel;
    lbl3: TLabel;
    Panel2: TPanel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    rdgOut: TRadioGroup;
    btnInvestment: TButton;
    lbl1: TLabel;
    redtOut: TRichEdit;
    Panel1: TPanel;
    comboInvestment: TComboBox;
    btnClear: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure comboInvestmentChange(Sender: TObject);
    procedure btnInvestmentClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInvestment: TfrmInvestment;

implementation

uses dmFinCalc_u, LoginReg_u, Choose_u;

{$R *.dfm}

procedure TfrmInvestment.btnInvestmentClick(Sender: TObject);
var rF , rX ,rI , rN :real ;
begin
  case comboInvestment.ItemIndex of                //FXN
  0 : Begin
      rX := StrToFloat(edt1.Text);
      rI := ((StrToFloat(edt2.Text))/100)/12;
      rN := StrToFloat(edt3.Text)*12;

      rF :=  ((rX*(Power((1 + rI), rN) -1)))/ (rI);
      redtOut.Lines.Add('Your future investment will be R' + floatToStrf( rF ,ffFixed , 8, 2 ));

      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Append;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Username'] := LoginReg_u.frmLoginReg.sActiveUser;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Calculation Type'] := 'Investment Standard' ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var1'] := floatToStrf( rX ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var2'] := floatToStrf( rI ,ffFixed , 8, 3 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var3'] := floatToStrf( rN ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Result'] :=floatToStrf( rF ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Post;



      end;
  1 : Begin
      rF := StrToFloat(edt1.Text);
      rI := ((StrToFloat(edt2.Text))/100)/12;
      rN := StrToFloat(edt3.Text)*12;

      rX := (rF *rI)/  ( Power(1+rI ,rN) -1 ) ;
      redtOut.Lines.Add('Your Monthly Installments Will Need to be ' + floatToStrf( rX ,ffFixed , 8, 2 ));

      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Append;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Username'] := LoginReg_u.frmLoginReg.sActiveUser;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Calculation Type'] := 'Investment Installment' ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var1'] := floatToStrf( rF ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var2'] := floatToStrf( rI ,ffFixed , 8, 3 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var3'] := floatToStrf( rN ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Result'] := floatToStrf( rX ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Post;




      end;
  2 : Begin
      rF := StrToFloat(edt1.Text);
      rX := ((StrToFloat(edt2.Text))/100)/12;
      rI := StrToFloat(edt3.Text);

      rN := Log10(((rF*rI)+1)/rX) / (Log10(1+rI)) ;
      redtOut.Lines.Add('You will need ' + floatToStrf( rN ,ffFixed , 8, 2 ) + 'Installments');

      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Append;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Username'] := LoginReg_u.frmLoginReg.sActiveUser;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Calculation Type'] := 'Investment Time' ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var1'] := floatToStrf( rF ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var2'] := floatToStrf( rX ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Var3'] := floatToStrf( rI ,ffFixed , 8, 3 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory['Result'] := floatToStrf( rN ,ffFixed , 8, 2 ) ;
      dmFinCalc_u.DataModule1.ADOTFinCalcHistory.Post;

      end;
  end;

end;

procedure TfrmInvestment.Button1Click(Sender: TObject);
begin
frmInvestment.Hide;
frmChoose.Show
end;

procedure TfrmInvestment.BitBtn2Click(Sender: TObject);
begin
frmInvestment.Hide;
frmChoose.Visible := True ;
end;

procedure TfrmInvestment.btnClearClick(Sender: TObject);
begin
redtOut.Clear;
end;

procedure TfrmInvestment.comboInvestmentChange(Sender: TObject);
var iItemIndex :Integer ;
begin
redtOut.Lines.Clear;
case comboInvestment.ItemIndex of
  0 : Begin
      lbl1.Caption := 'Installment Ammount in R:';
      lbl2.Caption := 'Interrest in %: ';
      lbl3.Caption := 'Time in Years :';
      redtOut.Lines.Add('=================================');
      redtOut.Lines.Add('');
      edt1.Clear;
      edt2.Clear;
      edt3.Clear;

      end;
  1 : Begin
      lbl1.Caption := 'Future Amount in R:';
      lbl2.Caption := 'Interrest in %: ';
      lbl3.Caption := 'Time in Y:';
      redtOut.Lines.Add('You Are About to Calculate the Nessacary Monthly Installment for Said Future Amount :');
      redtOut.Lines.Add('=================================');
      redtOut.Lines.Add('');
      edt1.Clear;
      edt2.Clear;
      edt3.Clear;

      end;
  2 : Begin
      lbl1.Caption := 'Future Ammount in R:';
      lbl2.Caption := 'Monthly Installment Amount in R: ';
      lbl3.Caption := 'Interrest in %: ';
      redtOut.Lines.Add('You are About to Calculate the Count of Installments (Monthly Payments) Needed to Realise the Investment :');
      redtOut.Lines.Add('=================================');
      redtOut.Lines.Add('');
      edt1.Clear;
      edt2.Clear;
      edt3.Clear;

      end;
end;

lbl1.Visible := True ;
lbl2.Visible := True ;
lbl3.Visible := True;

edt1.Visible := True ;
edt2.Visible := True;
edt3.Visible := True;

Panel1.Visible := True;
Panel2.Visible := True;
Panel3.Visible := True;

btnInvestment.Visible := True ;
btnClear.Visible := True ;
redtOut.Visible := True ;


rdgOut.Visible := True ;

end;

procedure TfrmInvestment.FormCreate(Sender: TObject);     ////////////ERROR Unknown directive
begin

lbl1.Visible := False ;
lbl2.Visible := False ;
lbl3.Visible := False;

edt1.Visible := False ;
edt2.Visible := False;
edt3.Visible := False;

Panel1.Visible := False;
Panel2.Visible := False;
Panel3.Visible := False;

btnInvestment.Visible := False ;
btnClear.Visible := False ;

redtOut.Visible := False ;
redtOut.Lines.Clear;

rdgOut.Visible := False ;

end;

end.


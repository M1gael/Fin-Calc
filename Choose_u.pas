unit Choose_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmChoose = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    btnInvestments: TButton;
    btnAnnuity: TButton;
    btnLoan: TButton;
    rdgOther: TRadioGroup;
    btnInterestSimp: TButton;
    btnInterestComb: TButton;
    btnInflation: TButton;
    btnValueDepression: TButton;
    rdgInterest: TRadioGroup;
    btnBack: TButton;
    Button1: TButton;
    procedure btnInvestmentsClick(Sender: TObject);
    procedure btnLoanClick(Sender: TObject);
    procedure btnAnnuityClick(Sender: TObject);
    procedure btnInflationClick(Sender: TObject);
    procedure btnInterestSimpClick(Sender: TObject);
    procedure btnInterestCombClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnValueDepressionClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var
    bFlagS : boolean;
  end;

var
  frmChoose: TfrmChoose;


implementation

uses Loan_u ,Investment_u ,Annuity_u , Inflation_u, LoginReg_u,
  History_u, ValueDec_u, Interest_u, dmFinCalc_u;

{$R *.dfm}

procedure TfrmChoose.btnBackClick(Sender: TObject);
begin
frmChoose.Hide;
frmLoginReg.Show;

with DataModule1 do
  begin
  ADOTFinCalcHistory.Filtered:= False;
  ADOTFinCalcHistory.Filter := 'Username = ' +QuotedStr(LoginReg_u.frmLoginReg.sActiveUser);
  ADOTFinCalcHistory.Filtered := True;
  end;

end;

procedure TfrmChoose.btnInflationClick(Sender: TObject);
begin
Inflation_u.frmInflation.Show;
frmChoose.Hide;
end;

procedure TfrmChoose.btnInterestCombClick(Sender: TObject);
begin
Interest_u.SimpleIntrest.Caption := 'Compunded Intrest' ;
Interest_u.SimpleIntrest.Show;
frmChoose.Hide;
bFlagS := False ;
end;

procedure TfrmChoose.btnInterestSimpClick(Sender: TObject);
begin
Interest_u.SimpleIntrest.Caption := 'Simple Intrest';
Interest_u.SimpleIntrest.Show;
frmChoose.Hide;
bFlagS := True;
end;

procedure TfrmChoose.btnInvestmentsClick(Sender: TObject);
begin
Investment_u.frmInvestment.Show;
frmChoose.Hide;
end;

procedure TfrmChoose.btnAnnuityClick(Sender: TObject);
begin
Annuity_u.frmAnnuity.Show;
frmChoose.Hide;
end;

procedure TfrmChoose.btnLoanClick(Sender: TObject);
begin
Loan_u.frmLoan.Show;
end;

procedure TfrmChoose.btnValueDepressionClick(Sender: TObject);
begin
ValueDec_u.frmValueDec.show;
frmChoose.Hide;
end;

procedure TfrmChoose.Button1Click(Sender: TObject);
begin
frmHistory.Show;
frmChoose.Hide;
end;

end.

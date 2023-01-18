program FinancialCalculator;

uses
  Forms,
  Investment_u in 'Investment_u.pas' {frmInvestment},
  Loan_u in 'Loan_u.pas' {frmLoan},
  Annuity_u in 'Annuity_u.pas' {frmAnnuity},
  Inflation_u in 'Inflation_u.pas' {frmInflation},
  Choose_u in 'Choose_u.pas' {frmChoose},
  dmFinCalc_u in 'dmFinCalc_u.pas' {DataModule1: TDataModule},
  LoginReg_u in 'LoginReg_u.pas' {frmLoginReg},
  History_u in 'History_u.pas' {frmHistory},
  ValueDec_u in 'ValueDec_u.pas' {frmValueDec},
  Interest_u in 'Interest_u.pas' {SimpleIntrest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Financial Calculator';
  Application.CreateForm(TfrmLoginReg, frmLoginReg);
  Application.CreateForm(TfrmChoose, frmChoose);
  Application.CreateForm(TfrmInvestment, frmInvestment);
  Application.CreateForm(TfrmLoan, frmLoan);
  Application.CreateForm(TfrmAnnuity, frmAnnuity);
  Application.CreateForm(TfrmInflation, frmInflation);
  Application.CreateForm(TfrmChoose, frmChoose);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmHistory, frmHistory);
  Application.CreateForm(TfrmValueDec, frmValueDec);
  Application.CreateForm(TSimpleIntrest, SimpleIntrest);
  Application.Run;
end.

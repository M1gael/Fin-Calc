unit dmFinCalc_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule1 = class(TDataModule)
    ds1FincalcUsers: TDataSource;
    ds2FinCalcHistory: TDataSource;
    ADOFinCalc: TADOConnection;
    ADOTFinCalcUsers: TADOTable;
    ADOTFinCalcHistory: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.

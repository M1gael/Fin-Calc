unit Loan_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmLoan = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Edit3: TEdit;
    Panel3: TPanel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoan: TfrmLoan;

implementation

{$R *.dfm}

end.

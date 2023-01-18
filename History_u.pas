unit History_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons ;

type
  TfrmHistory = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistory: TfrmHistory;

implementation

uses dmFinCalc_u, LoginReg_u, Choose_u;

{$R *.dfm}

procedure TfrmHistory.BitBtn2Click(Sender: TObject);
begin
History_u.frmHistory.Hide;
Choose_u.frmChoose.Show;
end;

procedure TfrmHistory.Button1Click(Sender: TObject);
begin
frmHistory.Hide;
Choose_u.frmChoose.Show;
end;

end.




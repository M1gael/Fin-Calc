unit LoginReg_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, pngimage;

type
  TfrmLoginReg = class(TForm)
    imgIcon: TImage;
    edtUsername: TEdit;
    edtPassword: TEdit;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public

  var sUsername , sPassword , sActiveUser : String ;
      bValidUser ,bValidInput ,bValidRegister :Boolean ;
  end;

var
  frmLoginReg: TfrmLoginReg;

implementation

uses dmFinCalc_u, Choose_u, Inflation_u;

{$R *.dfm}

procedure TfrmLoginReg.BitBtn1Click(Sender: TObject);
begin
ShowMessage('This build was made by Michael Smit , Dillon Mallee , K Crank');
end;

procedure TfrmLoginReg.Button1Click(Sender: TObject);
begin
  sUsername := edtUsername.Text;
  sPassword := edtPassword.Text;
  bValidUser := False;


  with dmFinCalc_u.DataModule1 do
  begin
    ADOTFinCalcUsers.First;
  while (not  ADOTFinCalcUsers.Eof) and (bValidUser = False) do
    begin
      if( ADOTFinCalcUsers['Username'] = sUsername) AND (ADOTFinCalcUsers['Password'] = sPassword) then
      begin
        bValidUser := True;
        sUsername :=  ADOTFinCalcUsers['Username'];
        frmChoose.Show;
        frmLoginReg.Hide;
        sActiveUser := sUsername;
        edtUsername.Clear;
        edtPassword.Clear;
      end;

       ADOTFinCalcUsers.Next
    end;

  end;

  if bValidUser = False then
  begin
    ShowMessage('The entered Username or Password is incorrect');
  End;

end;

procedure TfrmLoginReg.Button2Click(Sender: TObject);
begin
  sUsername := edtUsername.Text;                      //Read Input
  sPassword := edtPassword.Text;
  bValidInput := True;
  bValidRegister := True ;


with dmFinCalc_u.DataModule1 do
begin
  ADOTFinCalcUsers.First;

  while (not  ADOTFinCalcUsers.Eof) and (bValidRegister = True) do
  begin
      if( ADOTFinCalcUsers['Username'] = sUsername)  then
      begin
        bValidRegister := False;
      end
          else
          begin
          bValidRegister := True;
          end;

    ADOTFinCalcUsers.Next
  end;
end;








if bValidRegister = true then
begin
dmFinCalc_u.DataModule1.ADOTFinCalcUsers.Append;
dmFinCalc_u.DataModule1.ADOTFinCalcUsers['Username'] := sUsername;
dmFinCalc_u.DataModule1.ADOTFinCalcUsers['Password'] := sPassword;
dmFinCalc_u.DataModule1.ADOTFinCalcUsers.Post;

sActiveUser := sUsername;
frmLoginReg.Hide;
frmChoose.Show;


end
else
ShowMessage('This user is already registered');


end;
procedure TfrmLoginReg.Button3Click(Sender: TObject);
begin
Choose_u.frmChoose.Show;
end;

end.

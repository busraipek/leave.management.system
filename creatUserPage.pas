unit creatUserPage;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dbConnection;
type
  TcreateNewUser = class(TForm)
    firstNameLabel: TLabel;
    lastNameLabel: TLabel;
    phoneLabel: TLabel;
    departmentLabel: TLabel;
    emailLabel: TLabel;
    firstNameBox: TEdit;
    lastNameBox: TEdit;
    phoneBox: TEdit;
    departmentBox: TEdit;
    emailBox: TEdit;
    Button1: TButton;
    userNameLabel: TLabel;
    passwordLabel: TLabel;
    userNameBox: TEdit;
    passwordBox: TEdit;
    passwordAgainBox: TEdit;
    paswordAgainLabel: TLabel;
    senioritybox: TEdit;
    Seniority: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure phoneBoxKeyPress(Sender: TObject; var Key: Char);
    procedure phoneBoxClick(Sender: TObject);
    procedure phoneBoxExit(Sender: TObject);
    function phoneca(phone:string):string;
    Function Strin(Deger:String;ilk:string; ara, KacAdet:Integer):String;
    procedure firstNameBoxKeyPress(Sender: TObject; var Key: Char);
    procedure lastNameBoxKeyPress(Sender: TObject; var Key: Char);
    procedure departmentBoxKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure emailBoxKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure seniorityboxKeyPress(Sender: TObject; var Key: Char);
  private
    function getUserId(): integer;
    function checkPasswordBoxes(): boolean;
    procedure insertUserCrewDatabase();
    procedure insertUserLoginDatabase();
    { Private declarations }
  public
    { Public declarations }
  end;
var
  createNewUser: TcreateNewUser;
implementation
uses
  userpage;
{$R *.dfm}

procedure TcreateNewUser.phoneBoxClick(Sender: TObject);
begin
  phonebox.Clear;
end;

procedure TcreateNewUser.phoneBoxExit(Sender: TObject);
begin
if length(phonebox.Text)=10 then
begin
 phonebox.Text:=self.phoneca(phonebox.text);
end;
end;
 Function TcreateNewUser.Strin(Deger:String; ilk:string; ara, KacAdet:Integer):String;
Begin
if ilk='ilk' then
begin
 Result:=copy(Deger,ara,KacAdet);
end;
if ilk='son' then
begin
 Result:=copy(Deger,length(Deger)-(KacAdet-1),KacAdet);
end;
End;
procedure TcreateNewUser.phoneBoxKeyPress(Sender: TObject;  var Key: Char);
begin
phonebox.MaxLength:=10;
    if not charinset(key, ['0'..'9', #8]) then
      Key := #0;
end;
function TcreateNewUser.phoneca(phone:string):string;
var
ab:string;
sure:string;
begin
    phone:=phonebox.Text;
    if length(phone)=10 then
    ab:=self.Strin(phone,'ilk',1,3);
    sure:='('+ab+') ';
    ab:=self.Strin(phone,'ilk',4,3);
    sure:=sure+ab+' ';
    ab:=self.Strin(phone,'ilk',6,2);
    sure:=sure+ab+' ';
    ab:=self.Strin(phone,'son',1,2);
    phone:=sure+ab;
    result:=phone;
end;

procedure TcreateNewUser.seniorityboxKeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(AnsiString(Key)[1], ['1'..'3', #8]) then
  Key := #0;
end;

procedure TcreateNewUser.Button1Click(Sender: TObject);
begin
  dbconnection.dbForm.depart.SetVariable('department',departmentbox.Text);
  dbconnection.dbForm.depart.Execute;
  if dbconnection.dbForm.depart.RowCount<1  then
  begin
  showmessage('geçersiz departman');
  end
  else
  if length(passwordbox.text)<6 then
  begin
  showmessage('Password length cannot be less than 6 characters.');
  end
  else
  begin
 if Self.checkPasswordBoxes() then
  begin
    Self.insertUserCrewDatabase;
    Self.insertUserLoginDatabase;
    ShowMessage('User successfully created.');
    userForm.fillTable(dbConnection.dbForm.employeesTableQ);
    Self.Free;
  end
  else
  begin
    ShowMessage('Passwords are not matched, try again.');
  end;
  end;
end;
function TcreateNewUser.getUserId(): Integer;
begin
   getUserId := -1;
   try
      with dbConnection.dbForm.getUserIdQ do
        begin
           SetVariable('firstname', firstNameBox.Text);
           SetVariable('lastname', lastNameBox.Text);
           SetVariable('phone', phonebox.Text);
           SetVariable('department', departmentBox.Text);
           SetVariable('email', emailBox.Text);
           SetVariable('seniority', senioritybox.Text);
           Execute;
           getUserId := Field(0);
        end;
      except
        ShowMessage('Error occured while adding new user.');
    end;
    dbConnection.dbForm.getUserIdQ.Close;
end;
function TcreateNewUser.checkPasswordBoxes(): boolean;
begin
  checkPasswordBoxes := False;
  if Self.passwordBox.Text = Self.passwordAgainBox.Text then
  begin
    checkPasswordBoxes := True;
  end;
end;
procedure TcreateNewUser.lastNameBoxKeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(AnsiString(Key)[1], ['A'..'Z','Þ','Ð','Ý','Ö','Ç','Ü', #8]) then
  Key := #0;
end;
procedure TcreateNewUser.departmentBoxKeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(Key, ['A'..'Z', ' ', #8]) then
  Key := #0;
end;

procedure TcreateNewUser.emailBoxKeyPress(Sender: TObject; var Key: Char);
begin
 if  charinset(AnsiString(Key)[1], ['Þ','þ','Ð','ð','Ý','i','Ö','ö','Ç','ç','Ü','ü',' ', #8]) then
  Key := #0;
end;

procedure TcreateNewUser.firstNameBoxKeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(AnsiString(Key)[1], ['A'..'Z','Þ','Ð','Ý','Ö','Ç','Ü', #8]) then
  Key := #0;
end;
procedure TcreateNewUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  userpage.userForm.fillTable(dbConnection.dbForm.employeesTableQ);
  Self.Destroy;
end;

procedure TcreateNewUser.FormMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
if self.firstNameBox.Text<>null  then
 emailbox.Text:=firstnamebox.text+'.'+lastnamebox.text+'@gmail.com';
end;

procedure TcreateNewUser.insertUserCrewDatabase();
begin
     try
      with dbConnection.dbForm.insertUserQ do
        begin
           SetVariable('firstname', firstNameBox.Text);
           SetVariable('lastname', lastNameBox.Text);
           SetVariable('phone', phonebox.Text);
           SetVariable('department', departmentBox.Text);
           SetVariable('email', emailBox.Text);
           SetVariable('seniority', senioritybox.Text);
           Execute;
        end;
      except
        ShowMessage('Error occured while adding new user.');
    end;
    dbConnection.dbForm.insertUserQ.Close;
end;

procedure TcreateNewUser.insertUserLoginDatabase();
begin
    try
      with dbConnection.dbForm.insertNewUserLoginQ do
        begin
           SetVariable('user_id', Self.getUserId());
           SetVariable('user_name', Self.userNameBox.Text);
           SetVariable('user_password', Self.passwordBox.Text);
           Execute;
        end;
      except
        ShowMessage('Error occured while adding new user.');
    end;
    dbConnection.dbForm.insertNewUserLoginQ.Close;
end;
 end.

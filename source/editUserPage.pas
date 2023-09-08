unit editUserPage;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, dbConnection;
type
  TeditUser = class(TForm)
    firstNameBox: TEdit;
    lastNameBox: TEdit;
    phoneBox: TEdit;
    departmentBox: TEdit;
    emailBox: TEdit;
    firstNameEditLabel: TLabel;
    lastNameEditLabel: TLabel;
    phoneEditLabel: TLabel;
    departmentEditLabel: TLabel;
    emailEditLabel: TLabel;
    editButton: TButton;
    senioritybox: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure editButtonClick(Sender: TObject);
    constructor Create(AOwner: TComponent; const userId: integer);reintroduce;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fill();
    procedure firstNameBoxKeyPress(Sender: TObject; var Key: Char);
    procedure lastNameBoxKeyPress(Sender: TObject; var Key: Char);
    procedure departmentBoxKeyPress(Sender: TObject; var Key: Char);
    procedure phoneBoxKeyPress(Sender: TObject; var Key: Char);
    function phoneca(phone:string):string;
    Function Strin(Deger:String;ilk:string; ara, KacAdet:Integer):String;
    procedure phoneBoxExit(Sender: TObject);
    procedure emailBoxKeyPress(Sender: TObject; var Key: Char);
    procedure seniorityboxKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    m_userid : integer;
  end;
var
  editUser: TeditUser;
implementation
uses
  userpage;
{$R *.dfm}
 procedure TeditUser.Button1Click(Sender: TObject);
begin
fill;
end;

constructor tedituser.Create(AOwner: TComponent; const userId : integer);
begin
  inherited Create(AOwner);
  Self.m_userId := userId;
end;
procedure TeditUser.phoneBoxExit(Sender: TObject);
begin
if length(phonebox.Text)=10 then
begin
 phonebox.Text:=self.phoneca(phonebox.text);
end;

end;
Function Tedituser.Strin(Deger:String; ilk:string; ara, KacAdet:Integer):String;
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

function tedituser.phoneca(phone:string):string;
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
procedure TeditUser.seniorityboxKeyPress(Sender: TObject; var Key: Char);
begin
   if not charinset(AnsiString(Key)[1], ['1'..'3', #8]) then
  Key := #0;
end;

procedure TeditUser.departmentBoxKeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(AnsiString(Key)[1], ['A'..'Z', ' ', #8]) then
  Key := #0;
end;

procedure TeditUser.editButtonClick(Sender: TObject);
begin
    try
      with dbConnection.dbForm.editUserQ do
        begin
        dbconnection.dbForm.depart.SetVariable('department',departmentbox.Text);
        dbconnection.dbForm.depart.Execute;
           if dbconnection.dbForm.depart.RowCount<1  then
           begin
           showmessage('geçersiz departman');
           end
           else
           begin
           SetVariable('id', self.m_userid);
           SetVariable('firstname', firstNameBox.Text);
           SetVariable('lastname', lastNameBox.Text);
           SetVariable('phone', phoneBox.Text);
           SetVariable('department', departmentBox.Text);
           SetVariable('email', emailBox.Text);
           SetVariable('seniority', senioritybox.Text);
           Execute;
           fill;
           userpage.userForm.fillTable(dbConnection.dbForm.employeesTableQ);
           ShowMessage('Successfully edited...');
        end;
        end;
      except
        begin
          ShowMessage('Edit failed!');
        end;
    end;
    dbConnection.dbForm.editUserQ.Close;
end;

procedure TeditUser.emailBoxKeyPress(Sender: TObject; var Key: Char);
begin
begin
 if  charinset(AnsiString(Key)[1], [' ','Þ','þ','Ð','ð','Ý','i','Ö','ö','Ç','ç','Ü','ü', #8]) then
  Key := #0;
end;
end;

procedure tedituser.fill();
var
  j: integer;
begin
try
   dbConnection.dbForm.getEmployeeByIdQ.SetVariable('id', self.m_userid);
   dbConnection.dbForm.getEmployeeByIdQ.Execute;
   Self.firstNameBox.Text  := dbConnection.dbForm.getEmployeeByIdQ.Field('firstname');
   Self.lastnamebox.Text  := dbConnection.dbForm.getEmployeeByIdQ.Field('lastname');
   Self.phonebox.Text  := dbConnection.dbForm.getEmployeeByIdQ.Field('phone');
   Self.departmentBox.Text  := dbConnection.dbForm.getEmployeeByIdQ.Field('department');
   Self.emailBox.Text  := dbConnection.dbForm.getEmployeeByIdQ.Field('email');
   Self.senioritybox.Text  := dbConnection.dbForm.getEmployeeByIdQ.Field('seniority');
    dbConnection.dbForm.getEmployeeByIdQ.Close;
  except
  showmessage('Form cannot load');
end;
end;
procedure TeditUser.firstNameBoxKeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(AnsiString(Key)[1],['A'..'Z','Þ','Ð','Ý','Ö','Ç','Ü', #8]) then
  Key := #0;
end;

procedure TeditUser.FormCreate(Sender: TObject);
begin

    fill;

 end;
procedure TeditUser.lastNameBoxKeyPress(Sender: TObject; var Key: Char);
begin
  if not charinset(AnsiString(Key)[1], ['A'..'Z','Þ','Ð','Ý','Ö','Ç','Ü', #8]) then
  Key := #0;
end;

procedure TeditUser.phoneBoxKeyPress(Sender: TObject; var Key: Char);
begin
if length(phonebox.text)>10 then
phonebox.Clear;
    phonebox.MaxLength:=10;
    if not charinset(AnsiString(Key)[1], ['0'..'9', #8]) then
    Key := #0;
end;

procedure TeditUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Destroy;
end;
end.

program Project1;
uses
  Vcl.Forms,
  dbConnection in 'dbConnection.pas' {dbForm},
  adminRequestControlPage in 'adminRequestControlPage.pas' {controlRequestsForm},
  loginPage in 'loginPage.pas' {loginForm},
  userPage in 'userPage.pas' {userForm},
  creatUserPage in 'creatUserPage.pas' {createNewUser},
  editUserPage in 'editUserPage.pas' {editUser},
  leaveRequestPage in 'leaveRequestPage.pas' {leaveRequestForm},
  showRequestsPage in 'showRequestsPage.pas' {usersRequestForm},
  editRequestPage in 'editRequestPage.pas' {editRequestForm};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TloginForm, loginForm);
  Application.CreateForm(TdbForm, dbForm);
  Application.CreateForm(TuserForm, userForm);
  Application.CreateForm(TcreateNewUser, createNewUser);
  Application.CreateForm(TusersRequestForm, usersRequestForm);
  Application.Run;
end.

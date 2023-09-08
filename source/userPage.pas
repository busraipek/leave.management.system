unit userPage;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, dbConnection, creatUserPage,
  Vcl.ComCtrls, editUserPage, Vcl.ExtCtrls, Oracle, adminRequestControlPage,  ComObj,
  Vcl.DBCtrls;
type
  TuserForm = class(TForm)
    createNewUserButton: TButton;
    deleteUserButton: TButton;
    filterPanel: TPanel;
    filterButton: TButton;
    idBox: TEdit;
    firstNameBox: TEdit;
    departmentBox: TEdit;
    idLabel: TLabel;
    lastNameLabel: TLabel;
    firstNameLabel: TLabel;
    departmentLabel: TLabel;
    lastNameBox: TEdit;
    resetFilterButton: TButton;
    showRequestsButton: TButton;
    exportBtn: TButton;
    employeesTable: TStringGrid;
    Button1: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure createNewUserButtonClick(Sender: TObject);
    procedure updateButtonClick(Sender: TObject);
    procedure deleteUserButtonClick(Sender: TObject);
    procedure filterButtonClick(Sender: TObject);
    procedure resetFilterButtonClick(Sender: TObject);
    procedure showRequestsButtonClick(Sender: TObject);
    procedure exportBtnClick(Sender:TObject);
    procedure employeesTableDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure exceldebilgisayisi;
  private
    { Private declarations }
    function checkEmptyBox(filterBox : TEdit): boolean;
  public
    { Public declarations }
    m_userid : integer;
    function fillTable(tableQuery: TOracleQuery): boolean;
  end;
type
  TcolumnNames = array [0..6] of string;
var
  userForm: TuserForm;
  columnNames: TcolumnNames;
  lEditUserForm: TeditUser;
  EXCELDOSYASI: Variant;
  KACSATIR,KACSUTUN:integer;

implementation
{$R *.dfm}

procedure tuserform.exceldebilgisayisi;
var
hangisatirdaverivar:variant;
begin
try
KACSATIR:=0;
KACSUTUN:=0;
hangisatirdaverivar:= EXCELDOSYASI.ActiveWorkbook.worksheets[1].UsedRange;
           KACSATIR:= hangisatirdaverivar.rows.Count;
           KACSUTUN:= hangisatirdaverivar.columns.Count;
except
end;
end;


function ExportToExcel(AGrid:TStringGrid;AFileName:String):Boolean;
var
  row,col:Integer;
  lst:TStringList;
  txt:String;
  tnd:String;
begin
  lst := TStringList.Create;
  for row := 0 to AGrid.RowCount-1 do
  begin
    txt := '';
    tnd := '';
    for col := 0 to AGrid.ColCount -1 do
    begin
      if col=AGrid.ColCount -1 then tnd := '' else tnd := ';';
      txt := txt + AGrid.Cells[col,row]+tnd;
    end;
    lst.Add(txt);
  end;
  try
    DeleteFile(AFileName);
    lst.SaveToFile(AFileName);
    Result := True;
  except
    Result := False;
  end;
  lst.Free;
end;

  procedure TuserForm.exportBtnClick(Sender: TObject);
    var saveDialog : TSaveDialog;
  begin
       saveDialog := TSaveDialog.Create(self);
       saveDialog.Title := 'Save your csv or excel file';
       saveDialog.InitialDir := GetCurrentDir;
       saveDialog.Filter := 'Csv file|*.csv|Word file|*.doc';
       saveDialog.DefaultExt := 'csv';
       saveDialog.FilterIndex := 1;
       saveDialog.FileName:='Employee.csv';
       if saveDialog.Execute then
       begin
         if ExportToExcel(employeesTable,saveDialog.FileName) then
         begin
         ShowMessage('File Successfully Saved !');
         end
         else
         begin
         ShowMessage('File Saving Error!');
         end;
       end
       else ShowMessage('Save file was cancelled');
      saveDialog.Free;
  end;
   procedure TuserForm.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    Application.Terminate;
  end;

  procedure TuserForm.FormCreate(Sender: TObject);
  begin

    userForm.employeesTable.Cells[0,0] := 'Id';
    userForm.employeesTable.Cells[1,0] := 'First Name';
    userForm.employeesTable.Cells[2,0] := 'Last Name';
    userForm.employeesTable.Cells[3,0] := 'Phone';
    userForm.employeesTable.Cells[4,0] := 'Department';
    userForm.employeesTable.Cells[5,0] := 'E-mail';
    userForm.employeesTable.Cells[6,0] := 'Seniority';
  Self.employeesTable.ColWidths[0] := 65;
  Self.employeesTable.ColWidths[1] := 120;
  Self.employeesTable.ColWidths[2] := 140;
  Self.employeesTable.ColWidths[3] := 150;
  Self.employeesTable.ColWidths[4] := 225;
  Self.employeesTable.ColWidths[5] := 220;
  Self.employeesTable.ColWidths[6] := 80;

    userForm.fillTable(dbConnection.dbForm.employeesTableQ);
  end;

  procedure TuserForm.resetFilterButtonClick(Sender: TObject);
begin
  Self.idBox.Text := '';
  Self.firstNameBox.Text := '';
  Self.lastNameBox.Text := '';
  Self.departmentBox.Text := '';
  userForm.fillTable(dbConnection.dbForm.employeesTableQ);
end;
procedure TuserForm.showRequestsButtonClick(Sender: TObject);
var
    lcontrolRequests :TcontrolRequestsForm;
    begin
      lcontrolRequests := TcontrolRequestsForm.Create(Self);
      lcontrolRequests.BringToFront;
      lcontrolRequests.Name := 'control_requests_form';
      lcontrolRequests.Show;
end;
procedure TuserForm.updateButtonClick(Sender: TObject);
  var
    j: integer;
begin
     userForm.employeesTable.RowCount := 2;
     for j := 0 to 6 do
       begin
         userForm.employeesTable.Cells[j,1] := '';
       end;
     userForm.fillTable(dbConnection.dbForm.employeesTableQ);
end;
procedure TuserForm.createNewUserButtonClick(Sender: TObject);
  var
    lAddUserForm :TcreateNewUser;
    begin
      lAddUserForm := TcreateNewUser.Create(Self);
      lAddUserForm.BringToFront;
      lAddUserForm.Name := 'add_user_form';
      lAddUserForm.Show;
    end;
procedure TuserForm.deleteUserButtonClick(Sender: TObject);
  begin
    if MessageDlg ('Do you really want to delete?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
  try
      with dbConnection.dbForm.deleteUserWithIdQ do
        begin
          m_userid :=  strtoint(employeesTable.Cells[0, employeesTable.Row]);
            begin
                SetVariable('id', m_userid);
                Execute;
            end;
        end;
      except
        ShowMessage('User not found!');
    end;
    dbConnection.dbForm.deleteUserWithIdQ.Close;
    self.employeesTable.Refresh;
    userForm.fillTable(dbConnection.dbForm.employeesTableQ);

  end;
procedure TuserForm.employeesTableDblClick(Sender: TObject);
begin
    try
      with dbConnection.dbForm.getEmployeeByIdQ do
      begin
      m_userid :=  strtoint(Self.employeesTable.Cells[0, self.employeesTable.Row]);
    SetVariable('id', m_userid);
    lEditUserForm := TeditUser.Create(Self,m_userid);
    lEditUserForm.BringToFront;
    lEditUserForm.Name := 'editUserForm';
    lEditUserForm.Show;
      end;
      except
        begin
          ShowMessage('Edit failed!');
        end;
    end;
    dbConnection.dbForm.editUserQ.Close;
end;


function TuserForm.fillTable(tableQuery: TOracleQuery): boolean;
  var
    i : integer;
    j: integer;
  begin
    try
      with tableQuery do
        begin
           Execute;
        end;
      except
        ShowMessage('Error occured while filling table.');
    end;
    columnNames[0]:='id';
    columnNames[1]:='firstname';
    columnNames[2]:='lastname';
    columnNames[3]:='phone';
    columnNames[4]:='department';
    columnNames[5]:='email';
    columnNames[6]:='seniority';
    userForm.employeesTable.RowCount := 1;
    i := 1;
    while not tableQuery.Eof do
      begin
          userForm.employeesTable.RowCount := i+1;
          for j := 0 to 6 do
          begin
              userForm.employeesTable.Cells[j,i]  := tableQuery.Field(columnNames[j]);
          end;
          i := i+1;
          tableQuery.Next;
      end;
  fillTable := True;
  tableQuery.Close;
  end;

function BuyukHarf(Harf: Char): Char;
begin
  case Harf of
    'ı': Result:='I';
    'ğ': Result:='Ğ';
    'ü': Result:='Ü';
    'ş': Result:='Ş';
    'i': Result:='İ';
    'ö': Result:='Ö';
    'ç': Result:='Ç';
    'İ': Result:='İ';
  else
    Result:=UpCase(Harf);
  end;
end;
function StringUpperTurkish(s:String):String;
var
i:byte;
begin
  for i:=1 to length(s) do s[i]:=BuyukHarf(s[i]);
  StringUpperTurkish := s;
end;

function StringUpper(s:String):String;
var
i:byte;
begin
  for i:=1 to length(s) do s[i]:=UpCase(s[i]);
  StringUpper := s;
end;
procedure TuserForm.filterButtonClick(Sender: TObject);
begin
      if Self.checkEmptyBox(idBox) then
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('id', StrToInt('-1'));
        end
      else
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('id', StrToInt(Self.idBox.Text));
        end;
       if Self.checkEmptyBox(firstNameBox) then
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('firstname', 'None');
        end
       else
        begin
           dbConnection.dbForm.getEmployeeFilterQ.SetVariable('firstname', StringUpperTurkish(Self.firstNameBox.Text));
        end;
       if Self.checkEmptyBox(lastNameBox) then
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('lastname', 'None');
        end
       else
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('lastname', StringUpperTurkish(Self.lastNameBox.Text));
        end;
       if Self.checkEmptyBox(departmentBox) then
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('department', 'None');
        end
       else
        begin
          dbConnection.dbForm.getEmployeeFilterQ.SetVariable('department', StringUpper(Self.departmentBox.Text));
        end;
        fillTable(dbConnection.dbForm.getEmployeeFilterQ);
end;
function TuserForm.checkEmptyBox(filterBox : TEdit): boolean;
begin
    if filterBox.Text = '' then
      begin
        checkEmptyBox := True;
      end
     else
      begin
        checkEmptyBox := False;
      end;
 end;
 procedure TuserForm.Button1Click(Sender: TObject);
  VAR
 EXCELDEKISATIR:Integer;
 BEGIN

  EXCELDOSYASI := CreateOleObject('Calc.Application');
  With TOpenDialog.Create(nil) do
  begin
      Filter := 'Ods file|*.ods|Csv file|*.cvs';
    if Execute then
    begin
     try
        EXCELDOSYASI.Visible:=false;
          EXCELDOSYASI.workbooks.open(FileName);
          exceldebilgisayisi;

           for EXCELDEKISATIR:=2 to KACSATIR  do
              begin
                dbconnection.dbForm.employee.SetVariable('firstname',(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,2].Value)) ;
                dbconnection.dbForm.employee.SetVariable('lastname',(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,3].Value)) ;
                dbconnection.dbForm.employee.SetVariable('department',(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,5].Value));
                dbconnection.dbForm.employee.Execute;
                if dbconnection.dbForm.employee.RowCount=0  then
                begin
              dbconnection.dbForm.depart.SetVariable('department',(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,5].Value));
              dbconnection.dbForm.depart.Execute;
              if dbconnection.dbForm.depart.RowCount>0  then
                begin
                 with   dbconnection.dbForm.insertUserQ    do
                 begin
                SetVariable('firstname',(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,2].Value)) ;
                SetVariable('lastname',(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,3].Value)) ;
                SetVariable('phone',(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,4].Value)) ;
                SetVariable('email',(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,6].Value)) ;
                SetVariable('department',(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,5].Value)) ;
                SetVariable('seniority',(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,7].Value)) ;
                 end;
                 try
                  if (exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,4].Value)>1 then
                        begin
                          if length(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,4].Value)=10  then
                            begin
                                dbconnection.dbForm.insertUserQ.Execute;
                            end
                            else
                            begin
                            showmessage('there are some values can not be imported: '+(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,2].Value)+' '+(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,3].Value));
                            continue;
                            end;
                        end;
                  except
                  begin
                   showmessage('there are some values can not be imported: '+(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,2].Value)+' '+(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,3].Value));
                  continue;
                  end;
                end;
              end;
           end
           else
           begin
             showmessage('This user is already an employee: '+(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,2].Value)+' '+(exceldosyasi.ActiveSheet.Cells[EXCELDEKISATIR,3].Value));
           end;
         end;
         userForm.fillTable(dbConnection.dbForm.employeesTableQ);

       except
       begin
      showmessage('file didnt import succesfully');
       end;

      end;
    end;


     if not VarIsEmpty(EXCELDOSYASI) then
     begin
        EXCELDOSYASI.DisplayAlerts := False;
        EXCELDOSYASI.Quit;
        EXCELDOSYASI := Unassigned;
     end;
    end;

 END;


end.


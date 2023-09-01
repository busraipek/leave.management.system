unit editRequestPage;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, dbConnection, Oracle;
type
  TeditRequestForm = class(TForm)
    editRequestTable: TStringGrid;
    editStartDatePicker: TDatePicker;
    editEndDatePicker: TDatePicker;
    Shape1: TShape;
    editRadioButtonGroup: TRadioGroup;
    priorityRadioButton1: TRadioButton;
    priorityRadioButton2: TRadioButton;
    priorityRadioButton3: TRadioButton;
    editStartDateLabel: TLabel;
    editEndDateLabel: TLabel;
    editPriorityLabel: TLabel;
    editButton: TButton;
    constructor Create(AOwner: TComponent; const userId:integer ; const reqId : integer);reintroduce;
    procedure FormCreate(Sender: TObject);
    function checkAvailableRequests(): boolean;
    function checkPriority(): integer;
    procedure editButtonClick(Sender: TObject);
    procedure editRequest();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fillrequest();
    procedure idreq();
  private
    { Private declarations }
    a_userId: integer;
    a_reqId: integer;
  public
    { Public declarations }
    bu:integer;
  end;
var
  editRequestForm: TeditRequestForm;
implementation
 uses
 showRequestsPage,
 leaveRequestPage;

{$R *.dfm}
constructor TeditRequestForm.Create(AOwner: TComponent; const userId, reqId : integer);
begin
  inherited Create(AOwner);
  Self.a_userId := userId;
  Self.a_reqId := reqId;
end;
procedure teditrequestform.idreq();
begin
//req_id:= strtoint(self.editRequestTable.Cells[1,2]);
dbconnection.dbForm.idfromreq.SetVariable('request_id',a_reqId);
dbconnection.dbForm.idfromreq.Execute;
bu:=dbconnection.dbForm.idfromreq.Field('crew_id');
dbconnection.dbForm.idfromreq.Close;
end;
procedure TeditRequestForm.editButtonClick(Sender: TObject);
begin
if leaveRequestPage.leaveRequestForm.datedif(editstartdatepicker.Date,editEndDatePicker.Date)=true then
 begin
    if (Self.editRequestTable.Cells[1,6] = 'Pending') then
      begin
      dbconnection.dbForm.crewid.SetVariable('request_priority',checkPriority());
      dbconnection.dbForm.crewid.SetVariable('crew_id',a_userId);
      dbconnection.dbForm.crewid.Execute;
      if (dbconnection.dbForm.crewid.RowCount=1) THEN
        begin
        if (dbconnection.dbForm.crewid.Field('request_id')=a_reqId) then
        begin
        editRequest();
        end
         else
        begin
       showmessage('There is another request at this priority. Change your priority.');
        end;
        end
        else
        begin
        if (dbconnection.dbForm.crewid.RowCount=0) then
         begin
         editRequest();
         end
      end;
       showRequestsPage.usersRequestForm.fillrequesttable(a_userid);
    end
    else
    begin
    Showmessage('You cannot edit requests other than pending requests');
    end;
  end
  else
  begin
    showmessage('tarih');
  end;
end;
procedure TeditRequestForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 showRequestsPage.usersRequestForm.fillrequesttable(a_userid);

 Self.Free;
end;
procedure TeditRequestForm.FormCreate(Sender: TObject);
begin

    Self.editRequestTable.Cells[0,0] := 'First Name';
    Self.editRequestTable.Cells[0,1] := 'Last Name';
    Self.editRequestTable.Cells[0,2] := 'Request ID';
    Self.editRequestTable.Cells[0,3] := 'Start Date';
    Self.editRequestTable.Cells[0,4] := 'End Date';
    Self.editRequestTable.Cells[0,5] := 'Priority';
    Self.editRequestTable.Cells[0,6] := 'Status';
    Self.editRequestTable.ColWidths[1] := 230;
    self.fillrequest();
    self.editStartDatePicker.Date:=StrTodateTime(self.editRequestTable.Cells[1,3]);
    self.editEndDatePicker.date:=StrTodateTime(self.editRequestTable.Cells[1,4]);
    self.idreq;
    teditrequestform.Create(self.editRequestTable, a_userid ,a_reqId );
end;
procedure TeditRequestForm.fillrequest();
var
  lEditRequestQuery : TOracleQuery;
  j: integer;
begin
    lEditRequestQuery :=  dbConnection.dbForm.getRequestByReqIdQ;
    lEditRequestQuery.setVariable('id', a_userId);
    lEditRequestQuery.setVariable('req_id', a_reqId);
    lEditRequestQuery.Execute;
    for j := 0 to 6 do
      begin
        Self.editRequestTable.Cells[1,j]  := lEditRequestQuery.Field(j);
      end;
    lEditRequestQuery.Close;
end;
function TeditRequestForm.checkAvailableRequests(): boolean;
  begin
    dbConnection.dbForm.requestPriorityCheckQ.SetVariable('crew_id', a_userId);
    dbConnection.dbForm.requestPriorityCheckQ.SetVariable('priority', checkPriority());
    dbConnection.dbForm.requestPriorityCheckQ.Execute;
    if dbConnection.dbForm.requestPriorityCheckQ.Eof then
    begin
      checkAvailableRequests := True;
    end
    else
    begin
      checkAvailableRequests := False;
    end;
  end;
function TeditRequestForm.checkPriority(): integer;
  begin
    checkPriority := 1;
    if self.priorityRadioButton1.Checked	= True then
      checkPriority := 1;
    if self.priorityRadioButton2.Checked	= True then
      checkPriority := 2;
    if self.priorityRadioButton3.Checked	= True then
      checkPriority := 3;
  end;

procedure TeditRequestForm.editRequest();
begin
  try
      with dbConnection.dbForm.editRequestQ do
      begin
          SetVariable('req_id', a_reqId);
          SetVariable('start_date', DateToStr(Self.editStartDatePicker.Date));
          SetVariable('end_date', DateToStr(Self.editEndDatePicker.Date));
          SetVariable('priority', checkPriority());
          Execute;
          self.fillrequest;
          ShowMessage('Edit successful!');
      end;
      except
      begin
         ShowMessage('Edit failed!');
      end;
    end;
end;

end.

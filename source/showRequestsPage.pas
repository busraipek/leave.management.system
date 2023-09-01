unit showRequestsPage;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, dbConnection, Oracle,
  Vcl.StdCtrls, Vcl.ExtCtrls, editRequestPage;
type
  TusersRequestForm = class(TForm)
    requestsTable: TStringGrid;
    Shape1: TShape;
    deleteRequestButton: TButton;
    requestIdDeleteBox: TEdit;
    deleteIdLabel: TLabel;
    editRequestButton: TButton;
    Shape2: TShape;
    requestIdEditBox: TEdit;
    editIdLabel: TLabel;
    updateRequestsButton: TButton;
    procedure FormCreate(Sender: TObject);
    constructor Create(AOwner: TComponent; const userId : integer);reintroduce;
    procedure editRequestButtonClick(Sender: TObject);
    function getRequestStatus(requestId: integer): string;
    procedure requestIdEditBoxClick(Sender: TObject);
    procedure requestIdDeleteBoxClick(Sender: TObject);
    procedure deleteRequestButtonClick(Sender: TObject);
    function checkRequestId(request : integer): boolean;
    function isApproved(requestId: integer): boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure updateRequestsButtonClick(Sender: TObject);
    procedure requestsTableDblClick(Sender: TObject);
    procedure requestsTableClick(Sender: TObject);
  private
    { Private declarations }
  public
    m_userId: integer;
    m_reqid:integer;
    function fillrequesttable(id : integer) : boolean;
    { Public declarations }
  end;
  type
  TcolumnNames = array [0..7] of string;
var
  usersRequestForm: TusersRequestForm;
  editRequestForm: TeditRequestForm;
implementation
{$R *.dfm}

function tusersrequestform.fillrequesttable(id: Integer): Boolean;
var
  j,i : integer;
begin
fillrequesttable:=true;
  dbConnection.dbForm.getRequestsByIdQ.setVariable('id', id);
  dbConnection.dbForm.getRequestsByIdQ.Execute;
  i := 1;
  Self.requestsTable.RowCount := 1;
  while not dbConnection.dbForm.getRequestsByIdQ.Eof do
  begin
    requestsTable.RowCount := i+1;
    for j := 0 to 7 do
      begin
        requestsTable.Cells[j,i]  := dbConnection.dbForm.getRequestsByIdQ.Field(j);
      end;
    dbConnection.dbForm.getRequestsByIdQ.Next;
   i := i+1;

  end;
  dbConnection.dbForm.getRequestsByIdQ.Close;
end;



function TusersRequestForm.getRequestStatus(requestId: integer): string;
begin
  getRequestStatus := '';
  dbConnection.dbForm.getRequestStatusQ.SetVariable('req_id', requestId);
  dbConnection.dbForm.getRequestStatusQ.Execute;
  getRequestStatus :=  dbConnection.dbForm.getRequestStatusQ.Field(0);
end;
constructor TusersRequestForm.Create(AOwner: TComponent; const userId: Integer);
begin
  inherited Create(AOwner);
  m_userId := userId;

end;

procedure TusersRequestForm.deleteRequestButtonClick(Sender: TObject);
var
  deleteNotification: string;
begin

  deleteNotification := 'Are you sure you want to delete Request ' +  IntToStr(m_reqid);
  if checkRequestId(m_reqid) then
  begin
    if not isApproved(m_reqid)  then
    begin
      if Vcl.Dialogs.MessageDlg(deleteNotification,
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
        dbConnection.dbForm.deleteRequestQ.SetVariable('req_id', m_reqid);
        dbConnection.dbForm.deleteRequestQ.SetVariable('crew_id', m_userId);
        dbConnection.dbForm.deleteRequestQ.Execute;
        dbConnection.dbForm.deleteRequestQ.Close;
      end;
    end else
    begin
      ShowMessage('Approved request cannot be deleted.');
    end;
  end else
  begin
  ShowMessage('Enter valid request ID.');
  end;
  fillrequesttable(m_userId);
end;
procedure TusersRequestForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Self.Free;
end;
procedure TusersRequestForm.FormCreate(Sender: TObject);
begin
    Self.requestsTable.ColWidths[2] := 70;
    Self.requestsTable.ColWidths[5] := 60;
    Self.requestsTable.Cells[0,0] := 'First Name';
    Self.requestsTable.Cells[1,0] := 'Last Name';
    Self.requestsTable.Cells[2,0] := 'Request ID';
    Self.requestsTable.Cells[3,0] := 'Start Date';
    Self.requestsTable.Cells[4,0] := 'End Date';
    Self.requestsTable.Cells[5,0] := 'Priority';
    Self.requestsTable.Cells[6,0] := 'Status';
    Self.requestsTable.Cells[7,0] := 'Seniority';
  Self.requestsTable.ColWidths[0] := 100;
  Self.requestsTable.ColWidths[1] := 160;
  Self.requestsTable.ColWidths[2] := 70;
  Self.requestsTable.ColWidths[5] := 70;
  Self.requestsTable.ColWidths[6] := 130;
  Self.requestsTable.ColWidths[7] := 90;

    fillrequesttable(m_userId);
end;

procedure TusersRequestForm.requestIdDeleteBoxClick(Sender: TObject);
begin
  Self.requestIdDeleteBox.Text := '';
end;
procedure TusersRequestForm.requestIdEditBoxClick(Sender: TObject);
begin
  Self.requestIdEditBox.Text := '';
end;
procedure TusersRequestForm.requestsTableClick(Sender: TObject);
begin
      m_reqid:=strtoint(self.requestsTable.Cells[2,self.requestsTable.Row]);
      self.requestIdDeleteBox.Text:=inttostr(m_reqid);
      self.requestIdEditBox.Text:=inttostr(m_reqid);
end;

procedure TusersRequestForm.requestsTableDblClick(Sender: TObject);
var
  lEditRequestForm: TeditRequestForm;
begin
      lEditRequestForm := TeditRequestForm.Create(usersRequestForm,m_userId, m_reqid);
      lEditRequestForm.BringToFront;
      lEditRequestForm.Name := 'editRequestForm';
      lEditRequestForm.Show;
end;

Procedure TusersRequestForm.updateRequestsButtonClick(Sender: TObject);
begin
    fillrequesttable(m_userId);
end;
procedure TusersRequestForm.editRequestButtonClick(Sender: TObject);
var
  lEditRequestForm: TeditRequestForm;
begin
    if checkRequestId(StrToInt(requestIdEditBox.Text)) and (getRequestStatus(StrToInt(Self.requestIdEditBox.Text)) = 'Pending')  then
    begin
      lEditRequestForm := TeditRequestForm.Create(usersRequestForm,m_userId, m_reqid);
      lEditRequestForm.BringToFront;
      lEditRequestForm.Name := 'editRequestForm';
      lEditRequestForm.Show;
    end
    else
    begin
      ShowMessage('Enter valid request ID.'+sLineBreak+'You can only edit pending requests.');
    end;
end;

function TusersRequestForm.checkRequestId(request : integer): boolean;
var
  i: Integer;
begin
     checkRequestId := False;
     for i := 1 to requestsTable.RowCount - 1 do
     begin
       if StrToInt(requestsTable.Cells[2,i]) = request then
       begin
         checkRequestId := True;
       end;
     end;
end;

function TusersRequestForm.isApproved(requestId: integer): boolean;
begin
  isApproved := False;
  dbConnection.dbForm.getRequestStatusQ.SetVariable('req_id', requestId);
  dbConnection.dbForm.getRequestStatusQ.Execute;
  if dbConnection.dbForm.getRequestStatusQ.Field(0) = 'Approved' then
  begin
    isApproved := True;
  end;
  dbConnection.dbForm.getRequestStatusQ.Close;
end;
end.

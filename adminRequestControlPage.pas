unit adminRequestControlPage;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls, dbConnection, Oracle,DateUtils ;
type
  TcontrolRequestsForm = class(TForm)
    requestsTable: TStringGrid;
    filterPanel: TPanel;
    idLabel: TLabel;
    lastNameLabel: TLabel;
    firstNameLabel: TLabel;
    departmentLabel: TLabel;
    filterButton: TButton;
    idBox: TEdit;
    lastNameBox: TEdit;
    firstNameBox: TEdit;
    departmentBox: TEdit;
    resetFilterButton: TButton;
    requestIdBox: TEdit;
    requestIdLabel: TLabel;
    approveRequestPanel: TPanel;
    approveRequestButton: TButton;
    denyRequestButton: TButton;
    approveRequestIdBox: TEdit;
    approveByRquestIdLabel: TLabel;
    pendingRequestButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure fillRequestsTable(tableQuery: TOracleQuery);
    procedure filterButtonClick(Sender: TObject);
    procedure resetFilterButtonClick(Sender: TObject);
    procedure approveRequestButtonClick(Sender: TObject);
    procedure denyRequestButtonClick(Sender: TObject);
    procedure pendingRequestButtonClick(Sender: TObject);
    procedure requestsTableClick(Sender: TObject);
    procedure requestsTableDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function datecontrol(senior,reqid:string):boolean;
  private
  reqid:string;
  public
    { Public declarations }
  end;
var
  controlRequestsForm: TcontrolRequestsForm;
implementation
{$R *.dfm}


procedure TcontrolRequestsForm.filterButtonClick(Sender: TObject);
begin
  if not (Self.idBox.Text = '') then
  begin
    dbConnection.dbForm.requestsFilterQ.SetVariable('id', StrToInt(Self.idBox.Text));
  end
  else
  begin
    dbConnection.dbForm.requestsFilterQ.SetVariable('id', -1);
  end;
  if not (Self.requestIdBox.Text = '') then
  begin
    dbConnection.dbForm.requestsFilterQ.SetVariable('req_id', StrToInt(Self.requestIdBox.Text));
  end
  else
  begin
    dbConnection.dbForm.requestsFilterQ.SetVariable('req_id', -1);
  end;
  if not (Self.departmentBox.Text= '') then
  begin
    dbConnection.dbForm.requestsFilterQ.SetVariable('department', '^' + Self.departmentBox.Text);
  end
  else
  begin
    dbConnection.dbForm.requestsFilterQ.SetVariable('department', '');
  end;
  dbConnection.dbForm.requestsFilterQ.SetVariable('firstname', Self.firstNameBox.Text);
  dbConnection.dbForm.requestsFilterQ.SetVariable('lastname', Self.lastNameBox.Text);
  Self.fillRequestsTable(dbConnection.dbForm.requestsFilterQ);
end;
procedure TcontrolRequestsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
self.Destroy;
end;

procedure TcontrolRequestsForm.FormCreate(Sender: TObject);
begin
  Self.requestsTable.Cells[0,0] := 'Request ID';
  Self.requestsTable.Cells[1,0] := 'First Name';
  Self.requestsTable.Cells[2,0] := 'Last Name';
  Self.requestsTable.Cells[3,0] := 'ID';
  Self.requestsTable.Cells[4,0] := 'Department';
  Self.requestsTable.Cells[5,0] := 'Start Date';
  Self.requestsTable.Cells[6,0] := 'End Date';
  Self.requestsTable.Cells[7,0] := 'Priority';
  Self.requestsTable.Cells[8,0] := 'Status';
  Self.requestsTable.Cells[9,0] := 'Seniority';
  Self.requestsTable.ColWidths[0] := 70;
  Self.requestsTable.ColWidths[1] := 100;
  Self.requestsTable.ColWidths[2] := 155;
  Self.requestsTable.ColWidths[3] := 55;
  Self.requestsTable.ColWidths[4] := 205;
  Self.requestsTable.ColWidths[5] := 130;
  Self.requestsTable.ColWidths[6] := 130;
  Self.requestsTable.ColWidths[7] := 70;
  Self.requestsTable.ColWidths[8] := 100;
  Self.requestsTable.ColWidths[9] := 80;
  Self.fillRequestsTable(dbConnection.dbForm.getRequestsTableQ);
end;
procedure TcontrolRequestsForm.pendingRequestButtonClick(Sender: TObject);
begin
   dbConnection.dbForm.setPendingRequestQ.SetVariable('req_id', StrToInt(Self.approveRequestIdBox.Text));
   dbConnection.dbForm.setPendingRequestQ.Execute;
   dbConnection.dbForm.setPendingRequestQ.Close;
   self.requestsTable.Refresh;
   Self.fillRequestsTable(dbConnection.dbForm.getRequestsTableQ);

end;
procedure TcontrolRequestsForm.requestsTableClick(Sender: TObject);
begin
   self.approveRequestIdBox.Text := self.requestsTable.Cells[0,self.requestsTable.Row];
   //m_reqid:=strtoint(self.requestsTable.Cells[2,self.requestsTable.Row]);
   with dbConnection.dbForm.comparedate do
   begin
   SetVariable('department', requestsTable.Cells[4,self.requestsTable.Row]);

   SetVariable('request_priority', requestsTable.Cells[7,self.requestsTable.Row]);
   end;
   dbConnection.dbForm.getUserIdQ.Close;
end;

procedure TcontrolRequestsForm.requestsTableDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
 begin

 end;
 {*var
  color:string;
  row: Integer;
begin
try
dbconnection.dbForm.getrequestByAp.Execute;
   color:=dbconnection.dbForm.getrequestByAp.Field('approved');
 if (arow > 0) then
 begin
  color := self.requestsTable.Cells[0, ARow];
  if (Pos('KIR', color) > 0) then
  begin
     self.requestsTable.Brush.Color := clRed;
     self.requestsTable.Canvas.FillRect(Rect);
     end;
       if (Pos('YES', color) > 0) then
  begin
     self.requestsTable.Brush.Color := clgreen;
     self.requestsTable.Canvas.FillRect(Rect);
     end;
 end;    
 except
   self.Free;
 end
 end;
    {*try
      begin
        for row := 1 to dbconnection.dbForm.getrequestByAp.RowCount do
          begin
   color:=dbconnection.dbForm.getrequestByAp.Field('approved');
     dbconnection.dbForm.getrequestByAp.Execute;
            if color = 'Approved' then
            begin

            end;
            if color ='Denied' then
            begin

            end;
            if color ='Pending' then
            begin
        self.requestsTable.Canvas.Brush.Color := clAqua ;
            end;
       self.requestsTable.Canvas.FillRect(rect);

       end;
   end;
     dbconnection.dbForm.getrequestByAp.Close;
    except
   self.Free;*}


procedure TcontrolRequestsForm.resetFilterButtonClick(Sender: TObject);
begin
   Self.idBox.Text  := '';
   Self.requestIdBox.Text := '';
   Self.firstNameBox.Text := '';
   Self.lastNameBox.Text  := '';
   Self.departmentBox.Text  := '';
   Self.fillRequestsTable(dbConnection.dbForm.getRequestsTableQ);
end;

procedure TcontrolRequestsForm.approveRequestButtonClick(Sender: TObject);
var
senior:string;
begin
reqid:= approveRequestIdBox.Text;
senior:=requestsTable.Cells[9,requestsTable.Row];

try
if self.datecontrol(senior,reqid)=true then
begin
  dbConnection.dbForm.approveRequestQ.SetVariable('request_id', StrToInt(Self.approveRequestIdBox.Text));
  dbConnection.dbForm.approveRequestQ.Execute;
  dbConnection.dbForm.approveRequestQ.Close;
  self.requestsTable.Refresh;
  Self.fillRequestsTable(dbConnection.dbForm.getRequestsTableQ);
end
  except
   showmessage('çalýþmadý');

end;

end;
procedure TcontrolRequestsForm.denyRequestButtonClick(Sender: TObject);
begin
  dbConnection.dbForm.denyRequestQ.SetVariable('req_id', StrToInt(Self.approveRequestIdBox.Text));
  dbConnection.dbForm.denyRequestQ.Execute;
  dbConnection.dbForm.denyRequestQ.Close;
  self.requestsTable.Refresh;
  Self.fillRequestsTable(dbConnection.dbForm.getRequestsTableQ);
end;
procedure TcontrolRequestsForm.fillRequestsTable(tableQuery: TOracleQuery);
var
  lgetRequestsQuery : TOracleQuery;
  j : integer;
  i : integer;
begin
    lgetRequestsQuery :=  tableQuery;
    lgetRequestsQuery.Execute;
    i := 1;
    Self.requestsTable.RowCount := 1;
    while not lgetRequestsQuery.Eof do
    begin
      Self.requestsTable.RowCount := i+1;
      for j := 0 to 9 do
      begin
        Self.requestsTable.Cells[j,i]  := lgetRequestsQuery.Field(j);
      end;
      i := i+1;
      lgetRequestsQuery.Next;
    end;
    lgetRequestsQuery.Close;
end;
function tcontrolrequestsform.datecontrol(senior,reqid:string):boolean;
var
i:tdatetime;
j:tdatetime;
s:string;
fday:tdatetime;
lday:tdatetime;
approved:string;
app:string;
id:integer;
department:string;
request_priority:integer;
begin
  datecontrol:=true;
 try
   begin
  dbconnection.dbForm.datebyreid.SetVariable('request_id',reqid);
  dbconnection.dbForm.datebyreid.Execute;
  department:=dbconnection.dbForm.datebyreid.Field('department');
  request_priority:=dbconnection.dbForm.datebyreid.Field('request_priority');
  fday:=dbconnection.dbForm.datebyreid.Field('start_date');
  lday:=dbconnection.dbForm.datebyreid.Field('end_date');
  dbconnection.dbForm.datebyreid.Close;

   with dbConnection.dbForm.comparedate do
   begin
   SetVariable('department', department);
   SetVariable('request_priority', request_priority);
   end;
   dbconnection.dbForm.comparedate.Execute;

  if senior = '2'  then
  begin

    while not dbconnection.dbForm.comparedate.Eof do
    begin
      i:= fday;
      repeat
       j:= dbconnection.dbForm.comparedate.Field('start_date');
       repeat
       s:= dbconnection.dbForm.comparedate.Field('seniority');
       app:= dbconnection.dbForm.comparedate.Field('approved');
          if (i=j) then
          begin
            if (s='2') and (app=('Approved')) then
            begin
            showmessage('bu kýdemde biri izinli');
            datecontrol:=false;
            exit;
          end
            else if (s='1') and (app=('Pending')) then
          begin
            showmessage('yüksek kýdemde bekleyen var');
            datecontrol:=false;
            exit;
          end;
          end;

      j:= DateUtils.IncDay( j, 1 );
      until j> dbconnection.dbForm.comparedate.Field('end_date');

      i:= DateUtils.IncDay( i, 1 );
     until i> lday;
       dbconnection.dbForm.comparedate.Next;
    end;
   dbconnection.dbForm.comparedate.close;
  end

    else if senior = '3'  then
  begin
    while not dbconnection.dbForm.comparedate.Eof do
      begin
      i:= fday;
      repeat
       j:= dbconnection.dbForm.comparedate.Field('start_date');
      repeat
       s:= dbconnection.dbForm.comparedate.Field('seniority');
       app:= dbconnection.dbForm.comparedate.Field('approved');
          if (i=j) then
          begin
            if (s='3') and (app=('Approved'))  then
            begin
            showmessage('bu kýdemde biri izinli');
            datecontrol:=false;
            exit;
          end
            else if (s<>'3') and (app=('Pending')) then
          begin
            showmessage('yüksek kýdemde bekleyen var');
            datecontrol:=false;
            exit;
          end;
          end;

      j:= DateUtils.IncDay( j, 1 );
      until j> dbconnection.dbForm.comparedate.Field('end_date');

      i:= DateUtils.IncDay( i, 1 );
     until i> lday;
       dbconnection.dbForm.comparedate.Next;
    end;
   dbconnection.dbForm.comparedate.close;
  end;
   end;
 except
 showmessage('bir þeyler hatalý');
 end;
end;


 //CompareDate();
end.
{*
        for i := DateTimeToUnix(fday) to DateTimeToUnix(lday) do
        begin
           for j  := DateTimeToUnix(dbconnection.dbForm.comparedate.Field('start_date')) to DateTimeToUnix(dbconnection.dbForm.comparedate.Field('end_date')) do
           begin
             s:= dbconnection.dbForm.comparedate.Field('seniority');
             if (i=j) and (s<>'3') then
             begin
                datecontrol:=false;
                break;
             end;
           end;
        end;

ikisi de ayný
departman
pending
tarih
priorityde

Select firstname,
       lastname,
       department,
       start_date,
       end_date,
       request_priority,
       approved,
       seniority
from crew_request
inner join employee on crew_request.crew_id = employee.id
where
department = :department and
approved = : approved and

request_priority = : request_priority
*}

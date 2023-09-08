object dbForm: TdbForm
  Left = 0
  Top = 0
  Caption = 'dbForm'
  ClientHeight = 441
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object OracleDataSet1: TOracleDataSet
    Optimize = False
    Session = OracleSession1
    Left = 792
    Top = 104
  end
  object OracleSession1: TOracleSession
    LogonUsername = 'system'
    LogonPassword = 'oracle'
    LogonDatabase = 'localhost:1521/XEPDB1'
    Preferences.ConvertUTF = cuUTF8ToUTF16
    Connected = True
    Left = 120
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 712
    Top = 104
  end
  object userLoginTable: TOracleQuery
    SQL.Strings = (
      'Select * from user_login ')
    Session = OracleSession1
    Optimize = False
    Left = 32
    Top = 96
  end
  object employeesTableQ: TOracleQuery
    SQL.Strings = (
      'select * from employee  order by id desc')
    Session = OracleSession1
    Optimize = False
    Left = 552
    Top = 32
  end
  object insertUserQ: TOracleQuery
    SQL.Strings = (
      
        'INSERT INTO employee (id,Firstname, Lastname, Phone ,Department,' +
        'Email,Seniority)'
      
        'values (:id,:firstname, :lastname, :phone, :department, :email, ' +
        ':seniority)'
      '')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000007000000060000003A00490044000300000000000000000000001400
      00003A00460049005200530054004E0041004D00450005000000000000000000
      0000120000003A004C004100530054004E0041004D0045000500000000000000
      000000000C0000003A00500048004F004E004500050000000000000000000000
      160000003A004400450050004100520054004D0045004E005400050000000000
      0000000000000C0000003A0045004D00410049004C0005000000000000000000
      0000140000003A00530045004E0049004F005200490054005900050000000000
      000000000000}
    Left = 640
    Top = 24
  end
  object deleteUserWithIdQ: TOracleQuery
    SQL.Strings = (
      'delete from employee where id = :id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400050000000000000000000000}
    Left = 296
    Top = 96
  end
  object getEmployeeByIdQ: TOracleQuery
    SQL.Strings = (
      'select id,'
      '       firstname,'
      '       lastname,'
      '       phone,'
      '       department,'
      '       email,'
      '       seniority'
      'from employee where id = :id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Left = 440
    Top = 32
  end
  object getEmployeeFilterQ: TOracleQuery
    SQL.Strings = (
      
        'select *'#10'  from employee t'#10' where (:id = -1 or t.id = :id)'#10'  and' +
        ' (:department = '#39'None'#39' or t.department LIKE '#39'%'#39' || :department |' +
        '| '#39'%'#39') and (:firstname='#39'None'#39' or firstname LIKE '#39'%'#39' || :firstnam' +
        'e || '#39'%'#39') and (:lastname='#39'None'#39' or lastname LIKE '#39'%'#39' || :lastnam' +
        'e || '#39'%'#39')'
      ''
      ''
      ''
      ''
      ''
      '  '
      '  '
      ' ')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000004000000140000003A00460049005200530054004E0041004D004500
      050000000000000000000000120000003A004C004100530054004E0041004D00
      4500050000000000000000000000060000003A00490044000300000000000000
      00000000160000003A004400450050004100520054004D0045004E0054000500
      00000000000000000000}
    Left = 720
    Top = 24
  end
  object editUserQ: TOracleQuery
    SQL.Strings = (
      'UPDATE employee'
      'SET '
      '       firstname = :firstname,'
      '       lastname = :lastname,'
      '       phone = :phone,'
      '       email = :email,'
      '       department = :department,'
      '       seniority = :seniority'
      'where ID = :id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000007000000060000003A00490044000300000000000000000000001400
      00003A00460049005200530054004E0041004D00450005000000000000000000
      0000120000003A004C004100530054004E0041004D0045000500000000000000
      00000000160000003A004400450050004100520054004D0045004E0054000500
      000000000000000000000C0000003A00500048004F004E004500050000000000
      0000000000000C0000003A0045004D00410049004C0005000000000000000000
      0000140000003A00530045004E0049004F005200490054005900050000000000
      000000000000}
    Left = 488
    Top = 96
  end
  object selectUsersQ: TOracleQuery
    SQL.Strings = (
      'SELECT e.*, e.rowid  from employee e')
    Session = OracleSession1
    Optimize = False
    Left = 352
    Top = 160
  end
  object searchByNameQ: TOracleQuery
    SQL.Strings = (
      'SELECT * '
      'FROM employee'
      'WHERE regexp_like (firstname , :firstname ) ')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000001000000140000003A00460049005200530054004E0041004D004500
      050000000000000000000000}
    Left = 16
    Top = 160
  end
  object searchByLastNameQ: TOracleQuery
    SQL.Strings = (
      'SELECT * '
      'FROM employee'
      'WHERE regexp_like (lastname, :lastname)')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A004C004100530054004E0041004D0045000500
      00000000000000000000}
    Left = 424
    Top = 160
  end
  object searchByIdQ: TOracleQuery
    SQL.Strings = (
      'SELECT * '
      'FROM employee'
      'WHERE id = :id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Left = 520
    Top = 160
  end
  object searchByDepartmentQ: TOracleQuery
    SQL.Strings = (
      'SELECT * '
      'FROM employee'
      'WHERE department = :department')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A004400450050004100520054004D0045004E00
      5400050000000000000000000000}
    Left = 104
    Top = 160
  end
  object requestLeaveQ: TOracleQuery
    SQL.Strings = (
      'insert into CREW_REQUEST'
      '  (crew_id, start_date, end_date, request_priority, approved)'
      'values'
      
        '  (:crew_id, to_date(:start_date, '#39'dd-mm-yyyy'#39'), to_date(:end_da' +
        'te, '#39'dd-mm-yyyy'#39'), :priority, '#39'Pending'#39')')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A0043005200450057005F004900440003000000
      0000000000000000160000003A00530054004100520054005F00440041005400
      4500050000000000000000000000120000003A0045004E0044005F0044004100
      54004500050000000000000000000000120000003A005000520049004F005200
      490054005900030000000000000000000000}
    Left = 640
    Top = 96
  end
  object requestPriorityCheckQ: TOracleQuery
    SQL.Strings = (
      
        'select * from CREW_REQUEST where crew_id = :crew_id and request_' +
        'priority = :priority and approved = '#39'Pending'#39)
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000002000000100000003A0043005200450057005F004900440003000000
      0000000000000000120000003A005000520049004F0052004900540059000300
      00000000000000000000}
    Left = 200
    Top = 96
  end
  object getRequestsByIdQ: TOracleQuery
    SQL.Strings = (
      'select firstName, '
      '       lastname,'
      '       request_id, '
      '       start_date, '
      '       end_date, '
      '       request_priority, '
      '       approved,'
      '       seniority'
      'from CREW_REQUEST'
      'inner join employee'
      '     on  crew_request.crew_id = employee.id'
      'where employee.id = :id'
      'order by request_id desc')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Left = 816
    Top = 32
  end
  object getRequestByReqIdQ: TOracleQuery
    SQL.Strings = (
      'select firstName, '
      '       lastname,'
      '       request_id, '
      '       start_date, '
      '       end_date, '
      '       request_priority, '
      '       approved '
      'from CREW_REQUEST'
      'inner join employee'
      '     on  crew_request.crew_id = employee.id'
      'where employee.id = :id and crew_request.request_id = :req_id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000002000000060000003A00490044000300000000000000000000000E00
      00003A005200450051005F0049004400050000000000000000000000}
    Left = 392
    Top = 104
  end
  object editRequestQ: TOracleQuery
    SQL.Strings = (
      'update CREW_REQUEST'
      'set start_date = to_date(:start_date, '#39'dd-mm-yyyy'#39'),'
      '    end_date = to_date(:end_date, '#39'dd-mm-yyyy'#39'),'
      '    request_priority = :priority'
      'where REQUEST_ID = :req_id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000004000000160000003A00530054004100520054005F00440041005400
      4500050000000000000000000000120000003A0045004E0044005F0044004100
      54004500050000000000000000000000120000003A005000520049004F005200
      4900540059000300000000000000000000000E0000003A005200450051005F00
      49004400030000000000000000000000}
    Left = 360
    Top = 32
  end
  object deleteRequestQ: TOracleQuery
    SQL.Strings = (
      'delete from CREW_REQUEST'
      'where REQUEST_ID = :req_id and crew_id = :crew_id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      04000000020000000E0000003A005200450051005F0049004400030000000000
      000000000000100000003A0043005200450057005F0049004400030000000000
      000000000000}
    Left = 272
    Top = 32
  end
  object getEmployeeByNameQ: TOracleQuery
    SQL.Strings = (
      
        'select * from employee where firstname = :firstname and lastname' +
        ' = :lastname ')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000002000000140000003A00460049005200530054004E0041004D004500
      050000000000000000000000120000003A004C004100530054004E0041004D00
      4500050000000000000000000000}
    Left = 160
    Top = 32
  end
  object getRequestsTableQ: TOracleQuery
    SQL.Strings = (
      'Select request_id, '
      '       firstname,'
      '       lastname,'
      '       crew_id,'
      '       department,'
      '       start_date,'
      '       end_date,'
      '       request_priority,'
      '       approved,'
      '       seniority'
      'from crew_request'
      'inner join employee on crew_request.crew_id = employee.id'
      'order by approved desc, seniority, request_priority')
    Session = OracleSession1
    Optimize = False
    Left = 592
    Top = 160
  end
  object requestsFilterQ: TOracleQuery
    SQL.Strings = (
      'Select request_id,'
      '       firstname,'
      '       lastname,'
      '       crew_id,'
      '       department,'
      '       start_date,'
      '       end_date,'
      '       request_priority,'
      '       approved'
      'from crew_request'
      'inner join employee on crew_request.crew_id = employee.id'
      
        'where crew_id = :id or firstname = :firstname or lastname = :las' +
        'tname or request_id = :req_id or (regexp_like(department, :depar' +
        'tment))'
      'order by crew_id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000005000000060000003A00490044000300000000000000000000001400
      00003A00460049005200530054004E0041004D00450005000000000000000000
      0000120000003A004C004100530054004E0041004D0045000500000000000000
      000000000E0000003A005200450051005F004900440003000000000000000000
      0000160000003A004400450050004100520054004D0045004E00540005000000
      0000000000000000}
    Left = 560
    Top = 96
  end
  object approveRequestQ: TOracleQuery
    SQL.Strings = (
      'update CREW_REQUEST'
      'set approved = '#39'Approved'#39
      'where REQUEST_ID = :request_id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0052004500510055004500530054005F004900
      4400050000000000000000000000}
    Left = 848
    Top = 168
  end
  object denyRequestQ: TOracleQuery
    SQL.Strings = (
      'update CREW_REQUEST'
      'set approved = '#39'Denied'#39
      'where REQUEST_ID = :req_id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A005200450051005F0049004400030000000000
      000000000000}
    Left = 768
    Top = 160
  end
  object setPendingRequestQ: TOracleQuery
    SQL.Strings = (
      'update CREW_REQUEST'
      'set approved = '#39'Pending'#39
      'where REQUEST_ID = :req_id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A005200450051005F0049004400050000000000
      000000000000}
    Left = 680
    Top = 160
  end
  object insertNewUserLoginQ: TOracleQuery
    SQL.Strings = (
      'insert into USER_LOGIN'
      '  (user_id, username, password)'
      'values'
      '  (:user_id, :user_name, :user_password)')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000003000000100000003A0055005300450052005F004900440003000000
      0000000000000000140000003A0055005300450052005F004E0041004D004500
      0500000000000000000000001C0000003A0055005300450052005F0050004100
      5300530057004F0052004400050000000000000000000000}
    Left = 192
    Top = 160
  end
  object getUserIdQ: TOracleQuery
    SQL.Strings = (
      'SELECT id'
      'from employee'
      'where firstname = :firstname and '
      '      lastname = :lastname and '
      '      phone = :phone and '
      '      department = :department and '
      '      email = :email and'
      '      seniority = :seniority')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000006000000140000003A00460049005200530054004E0041004D004500
      050000000000000000000000120000003A004C004100530054004E0041004D00
      45000500000000000000000000000C0000003A00500048004F004E0045000500
      00000000000000000000160000003A004400450050004100520054004D004500
      4E0054000500000000000000000000000C0000003A0045004D00410049004C00
      050000000000000000000000140000003A00530045004E0049004F0052004900
      54005900050000000000000000000000}
    Left = 288
    Top = 160
  end
  object getRequestStatusQ: TOracleQuery
    SQL.Strings = (
      'select approved '
      'from crew_request'
      'where request_id = :req_id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A005200450051005F0049004400030000000000
      000000000000}
    Left = 40
    Top = 32
  end
  object getrequestByAp: TOracleQuery
    SQL.Strings = (
      'select * from crew_request ')
    Session = OracleSession1
    Optimize = False
    Left = 224
    Top = 240
  end
  object crewid: TOracleQuery
    SQL.Strings = (
      'select request_id '
      'from CREW_REQUEST '
      'where '
      'crew_id = :crew_id and'
      'request_priority =:request_priority and'
      'approved = '#39'Pending'#39)
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000002000000100000003A0043005200450057005F004900440005000000
      0000000000000000220000003A0052004500510055004500530054005F005000
      520049004F005200490054005900050000000000000000000000}
    Left = 432
    Top = 240
  end
  object idfromreq: TOracleQuery
    SQL.Strings = (
      'select crew_id from crew_request where request_id = :request_id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0052004500510055004500530054005F004900
      4400050000000000000000000000}
    Left = 504
    Top = 240
  end
  object depart: TOracleQuery
    SQL.Strings = (
      
        'select department from DEPARTMENTTABLE where department =:depart' +
        'ment')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A004400450050004100520054004D0045004E00
      5400050000000000000000000000}
    Left = 344
    Top = 240
  end
  object comparedate: TOracleQuery
    SQL.Strings = (
      'Select request_id, '
      '       firstname,'
      '       lastname,'
      '       crew_id,'
      '       department,'
      '       start_date,'
      '       end_date,'
      '       request_priority,'
      '       approved,'
      '       seniority'
      'from crew_request'
      'inner join employee on crew_request.crew_id = employee.id'
      'where'
      'department = :department and'
      'request_priority = :request_priority')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000002000000160000003A004400450050004100520054004D0045004E00
      5400050000000000000000000000220000003A00520045005100550045005300
      54005F005000520049004F005200490054005900050000000000000000000000}
    Left = 576
    Top = 240
  end
  object datebyreid: TOracleQuery
    SQL.Strings = (
      'Select request_id, '
      '       crew_id,'
      '       department,'
      '       start_date,'
      '       end_date,'
      '       request_priority'
      'from crew_request'
      'inner join employee on crew_request.crew_id = employee.id'
      'where request_id = :request_id')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0052004500510055004500530054005F004900
      4400050000000000000000000000}
    Left = 656
    Top = 240
  end
  object bysenior: TOracleQuery
    SQL.Strings = (
      'select approved from')
    Optimize = False
    Left = 408
    Top = 304
  end
  object employee: TOracleQuery
    SQL.Strings = (
      'select * from employee '
      'where '
      'firstname = :firstname and'
      'lastname = :lastname and'
      'department = :department')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000003000000120000003A004C004100530054004E0041004D0045000500
      00000000000000000000160000003A004400450050004100520054004D004500
      4E005400050000000000000000000000140000003A0046004900520053005400
      4E0041004D004500050000000000000000000000}
    Left = 488
    Top = 304
  end
end

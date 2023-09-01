object editUser: TeditUser
  Left = 0
  Top = 0
  Caption = 'Edit User'
  ClientHeight = 442
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object firstNameEditLabel: TLabel
    Left = 327
    Top = 75
    Width = 60
    Height = 15
    Caption = 'First Name:'
  end
  object lastNameEditLabel: TLabel
    Left = 328
    Top = 115
    Width = 59
    Height = 15
    Caption = 'Last Name:'
  end
  object phoneEditLabel: TLabel
    Left = 328
    Top = 155
    Width = 37
    Height = 15
    Caption = 'Phone:'
  end
  object departmentEditLabel: TLabel
    Left = 328
    Top = 195
    Width = 66
    Height = 15
    Caption = 'Department:'
  end
  object emailEditLabel: TLabel
    Left = 328
    Top = 237
    Width = 32
    Height = 15
    Caption = 'Email:'
  end
  object Label1: TLabel
    Left = 328
    Top = 278
    Width = 46
    Height = 15
    Caption = 'Seniority'
  end
  object userGrid: TStringGrid
    Left = 16
    Top = 72
    Width = 273
    Height = 221
    ColCount = 2
    DefaultColWidth = 80
    DefaultRowHeight = 30
    RowCount = 7
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object firstNameBox: TEdit
    Left = 400
    Top = 72
    Width = 185
    Height = 23
    TabOrder = 1
    OnKeyPress = firstNameBoxKeyPress
  end
  object lastNameBox: TEdit
    Left = 400
    Top = 112
    Width = 185
    Height = 23
    TabOrder = 2
    OnKeyPress = lastNameBoxKeyPress
  end
  object phoneBox: TEdit
    Left = 400
    Top = 152
    Width = 185
    Height = 23
    TabOrder = 3
    OnExit = phoneBoxExit
    OnKeyPress = phoneBoxKeyPress
  end
  object departmentBox: TEdit
    Left = 400
    Top = 192
    Width = 185
    Height = 23
    TabOrder = 4
    OnKeyPress = departmentBoxKeyPress
  end
  object emailBox: TEdit
    Left = 400
    Top = 234
    Width = 185
    Height = 23
    TabOrder = 5
    OnKeyPress = emailBoxKeyPress
  end
  object editButton: TButton
    Left = 312
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 6
    OnClick = editButtonClick
  end
  object senioritybox: TEdit
    Left = 400
    Top = 275
    Width = 185
    Height = 23
    MaxLength = 1
    TabOrder = 7
    OnKeyPress = seniorityboxKeyPress
  end
end

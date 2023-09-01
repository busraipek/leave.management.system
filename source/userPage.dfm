object userForm: TuserForm
  Left = 0
  Top = 0
  Caption = 'User Form'
  ClientHeight = 457
  ClientWidth = 885
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object employeesTable: TStringGrid
    Left = 24
    Top = 55
    Width = 696
    Height = 331
    ColCount = 7
    DefaultColWidth = 105
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect, goFixedRowDefAlign]
    TabOrder = 0
    OnDblClick = employeesTableDblClick
  end
  object createNewUserButton: TButton
    Left = 606
    Top = 396
    Width = 99
    Height = 33
    Caption = 'Create New User'
    TabOrder = 1
    OnClick = createNewUserButtonClick
  end
  object deleteUserButton: TButton
    Left = 478
    Top = 396
    Width = 99
    Height = 33
    Caption = 'Delete User'
    TabOrder = 2
    OnClick = deleteUserButtonClick
  end
  object filterPanel: TPanel
    Left = 726
    Top = 37
    Width = 138
    Height = 388
    TabOrder = 3
    object idLabel: TLabel
      Left = 32
      Top = 11
      Width = 14
      Height = 15
      Caption = 'ID:'
    end
    object lastNameLabel: TLabel
      Left = 32
      Top = 158
      Width = 59
      Height = 15
      Caption = 'Last Name:'
    end
    object firstNameLabel: TLabel
      Left = 32
      Top = 85
      Width = 60
      Height = 15
      Caption = 'First Name:'
    end
    object departmentLabel: TLabel
      Left = 24
      Top = 228
      Width = 66
      Height = 15
      Caption = 'Department:'
    end
    object filterButton: TButton
      Left = 32
      Top = 299
      Width = 75
      Height = 25
      Caption = 'Filter'
      TabOrder = 0
      OnClick = filterButtonClick
    end
    object idBox: TEdit
      Left = 16
      Top = 32
      Width = 97
      Height = 23
      TabOrder = 1
    end
    object lastNameBox: TEdit
      Left = 16
      Top = 179
      Width = 97
      Height = 23
      TabOrder = 2
    end
    object firstNameBox: TEdit
      Left = 16
      Top = 106
      Width = 97
      Height = 23
      TabOrder = 3
    end
    object departmentBox: TEdit
      Left = 16
      Top = 249
      Width = 97
      Height = 23
      TabOrder = 4
    end
    object resetFilterButton: TButton
      Left = 32
      Top = 351
      Width = 75
      Height = 25
      Caption = 'Reset'
      TabOrder = 5
      OnClick = resetFilterButtonClick
    end
  end
  object showRequestsButton: TButton
    Left = 24
    Top = 392
    Width = 121
    Height = 52
    Caption = 'Show All Requests'
    TabOrder = 4
    OnClick = showRequestsButtonClick
  end
  object exportBtn: TButton
    Left = 606
    Top = 8
    Width = 99
    Height = 33
    Caption = 'Export'
    TabOrder = 5
    OnClick = exportBtnClick
  end
  object Button1: TButton
    Left = 478
    Top = 8
    Width = 99
    Height = 33
    Caption = 'Import'
    TabOrder = 6
    OnClick = Button1Click
  end
end

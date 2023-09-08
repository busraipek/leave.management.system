object editUser: TeditUser
  Left = 0
  Top = 0
  Caption = 'Edit User'
  ClientHeight = 410
  ClientWidth = 393
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
    Left = 24
    Top = 45
    Width = 69
    Height = 19
    Caption = 'First Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lastNameEditLabel: TLabel
    Left = 24
    Top = 95
    Width = 68
    Height = 19
    Caption = 'Last Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object phoneEditLabel: TLabel
    Left = 24
    Top = 145
    Width = 42
    Height = 19
    Caption = 'Phone:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object departmentEditLabel: TLabel
    Left = 24
    Top = 195
    Width = 77
    Height = 19
    Caption = 'Department:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object emailEditLabel: TLabel
    Left = 24
    Top = 245
    Width = 35
    Height = 19
    Caption = 'Email:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 24
    Top = 299
    Width = 69
    Height = 25
    AutoSize = False
    Caption = 'Seniority'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object firstNameBox: TEdit
    Left = 137
    Top = 36
    Width = 224
    Height = 36
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = firstNameBoxKeyPress
  end
  object lastNameBox: TEdit
    Left = 137
    Top = 86
    Width = 224
    Height = 36
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = lastNameBoxKeyPress
  end
  object phoneBox: TEdit
    Left = 137
    Top = 136
    Width = 224
    Height = 36
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnExit = phoneBoxExit
    OnKeyPress = phoneBoxKeyPress
  end
  object departmentBox: TEdit
    Left = 137
    Top = 186
    Width = 224
    Height = 36
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnKeyPress = departmentBoxKeyPress
  end
  object emailBox: TEdit
    Left = 137
    Top = 236
    Width = 224
    Height = 36
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnKeyPress = emailBoxKeyPress
  end
  object editButton: TButton
    Left = 224
    Top = 352
    Width = 89
    Height = 41
    Caption = 'Edit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = editButtonClick
  end
  object senioritybox: TEdit
    Left = 137
    Top = 288
    Width = 224
    Height = 36
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Cambria'
    Font.Style = []
    MaxLength = 1
    ParentFont = False
    TabOrder = 6
    OnKeyPress = seniorityboxKeyPress
  end
  object Button1: TButton
    Left = 72
    Top = 352
    Width = 89
    Height = 41
    Caption = 'Restart'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button1Click
  end
end

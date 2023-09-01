object createNewUser: TcreateNewUser
  Left = 187
  Top = 52
  Caption = 'Create New User'
  ClientHeight = 271
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnClose = FormClose
  OnMouseActivate = FormMouseActivate
  TextHeight = 15
  object firstNameLabel: TLabel
    Left = 23
    Top = 24
    Width = 60
    Height = 15
    Caption = 'First Name:'
  end
  object lastNameLabel: TLabel
    Left = 23
    Top = 67
    Width = 59
    Height = 15
    Caption = 'Last Name:'
  end
  object phoneLabel: TLabel
    Left = 23
    Top = 115
    Width = 37
    Height = 15
    Caption = 'Phone:'
  end
  object departmentLabel: TLabel
    Left = 24
    Top = 158
    Width = 66
    Height = 15
    Caption = 'Department:'
  end
  object emailLabel: TLabel
    Left = 23
    Top = 203
    Width = 37
    Height = 15
    Caption = 'E-mail:'
  end
  object userNameLabel: TLabel
    Left = 288
    Top = 24
    Width = 61
    Height = 15
    Caption = 'User Name:'
  end
  object passwordLabel: TLabel
    Left = 288
    Top = 115
    Width = 53
    Height = 15
    Caption = 'Password:'
  end
  object paswordAgainLabel: TLabel
    Left = 288
    Top = 163
    Width = 87
    Height = 15
    Caption = 'Password Again:'
  end
  object Seniority: TLabel
    Left = 288
    Top = 67
    Width = 46
    Height = 15
    Caption = 'Seniority'
  end
  object firstNameBox: TEdit
    Left = 96
    Top = 21
    Width = 153
    Height = 23
    TabOrder = 0
    OnKeyPress = firstNameBoxKeyPress
  end
  object lastNameBox: TEdit
    Left = 96
    Top = 64
    Width = 153
    Height = 23
    TabOrder = 1
    OnKeyPress = lastNameBoxKeyPress
  end
  object phoneBox: TEdit
    Left = 96
    Top = 112
    Width = 153
    Height = 23
    HelpType = htKeyword
    HelpKeyword = '(5xx)-xxx-xxx'
    HideSelection = False
    MaxLength = 10
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    Text = '5xx-xxx-xxx'
    OnClick = phoneBoxClick
    OnExit = phoneBoxExit
    OnKeyPress = phoneBoxKeyPress
  end
  object departmentBox: TEdit
    Left = 96
    Top = 155
    Width = 153
    Height = 23
    TabOrder = 3
    OnKeyPress = departmentBoxKeyPress
  end
  object emailBox: TEdit
    Left = 96
    Top = 200
    Width = 153
    Height = 23
    TabOrder = 4
    OnKeyPress = emailBoxKeyPress
  end
  object Button1: TButton
    Left = 120
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 5
    OnClick = Button1Click
  end
  object userNameBox: TEdit
    Left = 381
    Top = 21
    Width = 148
    Height = 23
    TabOrder = 6
  end
  object passwordBox: TEdit
    Left = 381
    Top = 112
    Width = 148
    Height = 23
    PasswordChar = '*'
    TabOrder = 7
  end
  object passwordAgainBox: TEdit
    Left = 381
    Top = 160
    Width = 148
    Height = 23
    PasswordChar = '*'
    CanUndoSelText = True
    TabOrder = 8
  end
  object senioritybox: TEdit
    Left = 381
    Top = 64
    Width = 148
    Height = 23
    MaxLength = 1
    TabOrder = 9
    OnKeyPress = seniorityboxKeyPress
  end
end

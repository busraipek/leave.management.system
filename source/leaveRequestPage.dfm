object leaveRequestForm: TleaveRequestForm
  Left = 0
  Top = 0
  Caption = 'Leave Request'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object editRequestsLabel: TLabel
    Left = 299
    Top = 391
    Width = 207
    Height = 21
    Caption = 'View and edit your requests:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 291
    Top = 40
    Width = 321
    Height = 257
  end
  object endDateLabel: TLabel
    Left = 339
    Top = 127
    Width = 64
    Height = 20
    Caption = 'End Date:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object startDateLabel: TLabel
    Left = 339
    Top = 72
    Width = 70
    Height = 20
    Caption = 'Start Date:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object priorityLabel: TLabel
    Left = 339
    Top = 188
    Width = 50
    Height = 20
    Caption = 'Priority:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object requestButton: TButton
    Left = 443
    Top = 256
    Width = 97
    Height = 25
    Caption = 'Request'
    TabOrder = 0
    OnClick = requestButtonClick
  end
  object userGrid: TStringGrid
    Left = 24
    Top = 56
    Width = 250
    Height = 220
    ColCount = 2
    DefaultColWidth = 90
    DefaultRowHeight = 35
    RowCount = 6
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goFixedRowDefAlign]
    TabOrder = 1
  end
  object startDatePick: TDatePicker
    Left = 423
    Top = 55
    Height = 41
    Date = 45159.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 2
  end
  object endDatePick: TDatePicker
    Left = 423
    Top = 115
    Height = 41
    Date = 45159.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 3
  end
  object priorityButtonGroup: TRadioGroup
    Left = 423
    Top = 153
    Width = 150
    Height = 97
    TabOrder = 4
  end
  object priorityButton1: TRadioButton
    Left = 427
    Top = 169
    Width = 113
    Height = 17
    Caption = '1 (highest)'
    Checked = True
    TabOrder = 5
    TabStop = True
  end
  object priorityButton2: TRadioButton
    Left = 427
    Top = 192
    Width = 113
    Height = 17
    Caption = '2'
    TabOrder = 6
  end
  object priorityButton3: TRadioButton
    Left = 427
    Top = 215
    Width = 113
    Height = 17
    Caption = '3'
    TabOrder = 7
  end
  object editRequestsButton: TButton
    Left = 512
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 8
    OnClick = editRequestsButtonClick
  end
end

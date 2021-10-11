object xDes: TxDes
  Left = 113
  Top = 105
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1080#1079#1072#1081#1085#1077#1088
  ClientHeight = 912
  ClientWidth = 839
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 6
    Top = 5
    Width = 395
    Height = 75
  end
  object Label8: TLabel
    Left = 25
    Top = 18
    Width = 24
    Height = 13
    Caption = #1069#1090#1072#1087
  end
  object Label9: TLabel
    Left = 180
    Top = 18
    Width = 22
    Height = 13
    Caption = #1048#1084#1103
  end
  object Label10: TLabel
    Left = 12
    Top = 54
    Width = 50
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
  end
  object Label11: TLabel
    Left = 316
    Top = 54
    Width = 25
    Height = 13
    Caption = #1057#1080#1083#1072
  end
  object Bevel3: TBevel
    Left = 408
    Top = 5
    Width = 183
    Height = 75
  end
  object Image1: TImage
    Tag = 23
    Left = 693
    Top = 35
    Width = 23
    Height = 23
    Picture.Data = {
      07544269746D6170EE000000424DEE0000000000000076000000280000000F00
      00000F000000010004000000000078000000CE0E0000C40E0000100000000000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00700000000000007008880888880888000888088888088800000000000000
      0000080888808888080008088880888808000808888088880800000000000000
      0000088808888880880008880888888088000000000000000000080888880888
      0800080888880888080008088888088808007000000000000070}
    Stretch = True
  end
  object Label1: TLabel
    Left = 682
    Top = 16
    Width = 44
    Height = 13
    Caption = #1069#1083#1077#1084#1077#1085#1090
  end
  object Bevel1: TBevel
    Left = 665
    Top = 8
    Width = 73
    Height = 73
    Style = bsRaised
  end
  object Bevel4: TBevel
    Left = 689
    Top = 31
    Width = 33
    Height = 33
    Style = bsRaised
  end
  object Grid: TDrawGrid
    Left = 8
    Top = 87
    Width = 820
    Height = 820
    TabStop = False
    ColCount = 34
    Ctl3D = False
    DefaultColWidth = 23
    DefaultRowHeight = 23
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 34
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine]
    ParentCtl3D = False
    ScrollBars = ssNone
    TabOrder = 8
    OnDrawCell = GridDrawCell
    OnMouseDown = GridMouseDown
    OnMouseMove = GridMouseMove
    OnMouseUp = GridMouseUp
  end
  object edComment: TEdit
    Left = 70
    Top = 49
    Width = 235
    Height = 21
    MaxLength = 100
    TabOrder = 3
    OnChange = edCommentChange
    OnEnter = edTitleEnter
  end
  object edTitle: TEdit
    Left = 205
    Top = 13
    Width = 188
    Height = 21
    MaxLength = 10
    TabOrder = 2
    OnChange = edTitleChange
    OnEnter = edTitleEnter
  end
  object cbLevel: TComboBox
    Left = 63
    Top = 13
    Width = 45
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = '1'
    OnChange = cbLevelChange
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15')
  end
  object SaveBtn: TBitBtn
    Left = 415
    Top = 14
    Width = 81
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    TabOrder = 4
    OnClick = SaveBtnClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 504
    Top = 47
    Width = 81
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object Button1: TButton
    Left = 504
    Top = 14
    Width = 81
    Height = 25
    Caption = #1053#1086#1074#1099#1081
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 113
    Top = 13
    Width = 61
    Height = 21
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 597
    Top = 30
    Width = 66
    Height = 28
    Caption = #1047#1072#1083#1080#1090#1100
    TabOrder = 7
    OnClick = Button3Click
  end
  object Messages: TPanel
    Left = 139
    Top = 225
    Width = 198
    Height = 36
    BevelWidth = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object SaveAs: TBitBtn
    Left = 415
    Top = 47
    Width = 81
    Height = 25
    Caption = #1048#1084#1103'...'
    Default = True
    TabOrder = 9
    OnClick = SaveBtnClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object edEnergy: TSpinEdit
    Left = 356
    Top = 48
    Width = 45
    Height = 22
    MaxValue = 450
    MinValue = 20
    TabOrder = 11
    Value = 400
    OnChange = edEnergyChange
    OnExit = edEnergyExit
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'dat'
    Filter = 'Levels files (*.dat)|*.dat|All files (*.*)|*.*'
    Title = 'Open levels file'
    Left = 352
    Top = 26
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'dat'
    Filter = 'Levels files (*.dat)|*.dat|All files (*.*)|*.*'
    Title = 'Save levels file as...'
    Left = 328
    Top = 10
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 80
    object N1: TMenuItem
      Caption = #1069#1083#1077#1084#1077#1085#1090#1099
      object aF: TMenuItem
        Caption = #1055#1086#1083
        OnClick = aFClick
      end
      object aW: TMenuItem
        Caption = #1057#1090#1077#1085#1072
        OnClick = aFClick
      end
      object aH: TMenuItem
        Caption = #1052#1086#1085#1077#1090#1072
        OnClick = aFClick
      end
      object aL: TMenuItem
        Caption = #1057#1082#1088#1099#1090#1072#1103' '#1089#1090#1077#1085#1072
        OnClick = aFClick
      end
      object aK: TMenuItem
        Caption = #1057#1082#1088#1099#1090#1099#1081' '#1087#1088#1086#1093#1086#1076
        OnClick = aFClick
      end
      object aP: TMenuItem
        Caption = #1055#1088#1080#1074#1080#1076#1077#1085#1100#1077
        OnClick = aFClick
      end
      object aB: TMenuItem
        Caption = #1063#1091#1074#1072#1082
        OnClick = aFClick
      end
      object aA: TMenuItem
        Caption = #1058#1077#1084#1085#1086#1090#1072
        Visible = False
        OnClick = aFClick
      end
      object aD: TMenuItem
        Caption = #1044#1074#1077#1088#1100
        Visible = False
        OnClick = aFClick
      end
      object aV: TMenuItem
        Caption = #1050#1083#1102#1095
        Visible = False
        OnClick = aFClick
      end
      object aX: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = aFClick
      end
      object aE: TMenuItem
        Caption = #1040#1087#1090#1077#1095#1082#1072
        OnClick = aFClick
      end
      object aM: TMenuItem
        Caption = #1051#1086#1084
        OnClick = aFClick
      end
      object aG: TMenuItem
        Caption = #1040#1085#1086#1084#1072#1083#1080#1103
        OnClick = aFClick
      end
      object aY: TMenuItem
        Caption = #1052#1080#1085#1072
        OnClick = aFClick
      end
      object aU: TMenuItem
        Caption = #1055#1091#1083#1100#1090
        Visible = False
        OnClick = aFClick
      end
      object aI: TMenuItem
        Caption = #1055#1086#1088#1090#1072#1083
        OnClick = aFClick
      end
      object aJ: TMenuItem
        Caption = #1051#1102#1082' '#1074#1085#1080#1079
        OnClick = aFClick
      end
      object aC: TMenuItem
        Caption = #1058#1077#1083#1077#1087#1086#1088#1090#1080#1088#1091#1102#1097#1072#1103' '#1089#1090#1077#1085#1082#1072
        OnClick = aFClick
      end
      object aT: TMenuItem
        Caption = #1040#1087#1090#1077#1095#1082#1072' '#8470'2'
        OnClick = aFClick
      end
      object aR: TMenuItem
        Caption = #1041#1086#1084#1073#1072
        OnClick = aFClick
      end
      object a3: TMenuItem
        Caption = #1060#1072#1082#1077#1083
        OnClick = aFClick
      end
    end
  end
end

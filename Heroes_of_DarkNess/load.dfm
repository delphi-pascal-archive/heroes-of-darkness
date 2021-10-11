object LoadForm: TLoadForm
  Left = 423
  Top = 242
  ActiveControl = Edit1
  BorderStyle = bsDialog
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072
  ClientHeight = 161
  ClientWidth = 190
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 15
    Top = 60
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object lbFileName: TLabel
    Left = 15
    Top = 10
    Width = 69
    Height = 13
    Caption = #1060#1072#1081#1083': blip.dat'
  end
  object BitBtn1: TBitBtn
    Left = 100
    Top = 125
    Width = 75
    Height = 25
    Caption = #1044#1040
    Default = True
    TabOrder = 0
    OnClick = BitBtn1Click
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
  object Edit1: TEdit
    Left = 15
    Top = 75
    Width = 161
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 15
    Top = 30
    Width = 75
    Height = 20
    Caption = #1054#1090#1082#1088#1099#1090#1100'...'
    TabOrder = 2
    OnClick = Button1Click
  end
  object BitBtn2: TBitBtn
    Left = 15
    Top = 125
    Width = 75
    Height = 25
    Caption = #1053#1045#1058
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.dat'
    Filter = 'Levels file (*.dat)|*.dat|All files (*.*)|*.*'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist]
    Title = 'Load levels file'
    Left = 110
    Top = 25
  end
end

object BtnMessages: TBtnMessages
  Left = 215
  Top = 220
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
  ClientHeight = 65
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 262
    Height = 65
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lbComment: TLabel
      Left = 8
      Top = 10
      Width = 5
      Height = 13
      Alignment = taCenter
    end
    object BitBtn1: TBitBtn
      Left = 104
      Top = 30
      Width = 49
      Height = 25
      Caption = #1044#1040
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
  end
end

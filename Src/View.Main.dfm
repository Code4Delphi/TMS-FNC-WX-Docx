object ViewMain: TViewMain
  Left = 0
  Top = 0
  Caption = 'Docx com Delphi -TMS FNC WX Docx'
  ClientHeight = 156
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object TMSFNCWXDocx1: TTMSFNCWXDocx
    Left = 176
    Top = 122
    Width = 26
    Height = 26
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Visible = True
    OnDownloadAsFile = TMSFNCWXDocx1DownloadAsFile
  end
  object btnGenerateDocxTest: TButton
    Left = 71
    Top = 48
    Width = 242
    Height = 25
    Caption = 'Generate test Docx file'
    TabOrder = 1
    OnClick = btnGenerateDocxTestClick
  end
  object btnGenerateDocxTest2: TButton
    Left = 71
    Top = 79
    Width = 242
    Height = 25
    Caption = 'Generate test Docx file 2'
    TabOrder = 2
    OnClick = btnGenerateDocxTest2Click
  end
end

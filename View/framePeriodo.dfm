object Periodo: TPeriodo
  Left = 0
  Top = 0
  Width = 275
  Height = 62
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Calibri Light'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  OnStartDock = FrameStartDock
  object Label1: TLabel
    Left = 4
    Top = 3
    Width = 38
    Height = 18
    Caption = 'In'#237'cio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3487029
    Font.Height = -15
    Font.Name = 'Calibri Light'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 148
    Top = 3
    Width = 25
    Height = 18
    Caption = 'Fim'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3487029
    Font.Height = -15
    Font.Name = 'Calibri Light'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dtpDataInicial: TJvDatePickerEdit
    Left = 3
    Top = 24
    Width = 119
    Height = 26
    AllowNoDate = True
    ButtonFlat = True
    Checked = True
    Flat = True
    ParentFlat = False
    TabOrder = 0
    OnChange = dtpDataInicialChange
  end
  object dtpDataFinal: TJvDatePickerEdit
    Left = 147
    Top = 24
    Width = 119
    Height = 26
    AllowNoDate = True
    ButtonFlat = True
    Checked = True
    Flat = True
    ParentFlat = False
    TabOrder = 1
  end
end

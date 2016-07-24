inherited BuscaConvenio: TBuscaConvenio
  Width = 409
  OnEnter = FrameEnter
  OnExit = FrameExit
  ExplicitWidth = 409
  object Label1: TLabel [0]
    Left = 11
    Top = 3
    Width = 44
    Height = 16
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 93
    Top = 3
    Width = 57
    Height = 16
    Caption = 'Conv'#234'nio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited btnBusca: TBitBtn
    Left = 64
    Top = 24
    TabOrder = 1
    ExplicitLeft = 64
    ExplicitTop = 24
  end
  object edtCodigo: TCurrencyEdit
    Left = 8
    Top = 24
    Width = 54
    Height = 24
    DisplayFormat = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtConvenio: TEdit
    Left = 92
    Top = 24
    Width = 290
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
end

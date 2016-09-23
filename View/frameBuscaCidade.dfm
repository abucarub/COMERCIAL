inherited BuscaCidade: TBuscaCidade
  Width = 465
  OnEnter = FrameEnter
  OnExit = FrameExit
  ExplicitWidth = 465
  object Label1: TLabel [0]
    Left = 11
    Top = 3
    Width = 78
    Height = 16
    Caption = 'C'#243'digo IBGE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 116
    Top = 3
    Width = 44
    Height = 16
    Caption = 'Cidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 420
    Top = 3
    Width = 18
    Height = 16
    Caption = 'UF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited btnBusca: TBitBtn
    Left = 87
    Height = 28
    ExplicitLeft = 87
    ExplicitHeight = 28
  end
  object edtCodigo: TCurrencyEdit
    Left = 11
    Top = 24
    Width = 75
    Height = 27
    DisplayFormat = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtCidade: TEdit
    Left = 115
    Top = 24
    Width = 290
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri Light'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object edtEstado: TEdit
    Left = 419
    Top = 24
    Width = 30
    Height = 27
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri Light'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
end

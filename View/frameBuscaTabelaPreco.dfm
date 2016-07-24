inherited BuscaTabelaPreco: TBuscaTabelaPreco
  Width = 571
  OnEnter = FrameEnter
  OnExit = FrameExit
  ExplicitWidth = 571
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
    Left = 117
    Top = 3
    Width = 46
    Height = 16
    Caption = 'Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 424
    Top = 3
    Width = 32
    Height = 16
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited btnBusca: TBitBtn
    Left = 88
    ExplicitLeft = 88
  end
  object edtCodigo: TCurrencyEdit
    Left = 11
    Top = 24
    Width = 75
    Height = 24
    DisplayFormat = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtServico: TEdit
    Left = 116
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
  object edtValor: TCurrencyEdit
    Left = 424
    Top = 24
    Width = 75
    Height = 24
    DisplayFormat = ',0.00;-,0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnEnter = edtValorEnter
  end
end

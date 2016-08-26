inherited BuscaTabelaPreco: TBuscaTabelaPreco
  Width = 509
  Font.Name = 'Calibri Light'
  OnEnter = FrameEnter
  OnExit = FrameExit
  ExplicitWidth = 509
  object Label1: TLabel [0]
    Left = 11
    Top = 3
    Width = 54
    Height = 19
    Caption = 'Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2697513
    Font.Height = -16
    Font.Name = 'Calibri Light'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [1]
    Left = 424
    Top = 3
    Width = 35
    Height = 19
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2697513
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btnBusca: TBitBtn
    Left = 88
    Height = 28
    TabOrder = 1
    ExplicitLeft = 88
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
    TabOrder = 0
  end
  object edtServico: TEdit
    Left = 116
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
  object edtValor: TCurrencyEdit
    Left = 424
    Top = 24
    Width = 75
    Height = 27
    DisplayFormat = ',0.00;-,0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnEnter = edtValorEnter
  end
end

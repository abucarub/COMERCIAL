inherited BuscaPessoa: TBuscaPessoa
  Width = 409
  OnEnter = FrameEnter
  OnExit = FrameExit
  ExplicitWidth = 409
  object lbTipo: TLabel [0]
    Left = 13
    Top = 3
    Width = 50
    Height = 19
    Caption = 'Pessoa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2697513
    Font.Height = -16
    Font.Name = 'Calibri Light'
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
  object edtNome: TEdit
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
end

inherited BuscaConvenio: TBuscaConvenio
  Width = 409
  OnEnter = FrameEnter
  OnExit = FrameExit
  ExplicitWidth = 409
  object Label2: TLabel [0]
    Left = 8
    Top = 3
    Width = 68
    Height = 19
    Caption = 'Conv'#234'nio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri Light'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btnBusca: TBitBtn
    Left = 64
    Top = 24
    Height = 28
    TabOrder = 1
    ExplicitLeft = 64
    ExplicitTop = 24
    ExplicitHeight = 28
  end
  object edtCodigo: TCurrencyEdit
    Left = 8
    Top = 24
    Width = 54
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
  object edtConvenio: TEdit
    Left = 92
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

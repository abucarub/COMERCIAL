inherited BuscaDepartamento: TBuscaDepartamento
  Width = 293
  OnEnter = FrameEnter
  OnExit = FrameExit
  ExplicitWidth = 293
  object Label2: TLabel [0]
    Left = 4
    Top = 3
    Width = 107
    Height = 19
    Caption = 'Departamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2697513
    Font.Height = -16
    Font.Name = 'Calibri Light'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btnBusca: TBitBtn
    Left = 60
    Height = 28
    TabOrder = 1
    ExplicitLeft = 60
    ExplicitHeight = 28
  end
  object edtCodigo: TCurrencyEdit
    Left = 4
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
  object edtDepartamento: TEdit
    Left = 88
    Top = 24
    Width = 193
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

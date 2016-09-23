inherited frmCadastroConvenio: TfrmCadastroConvenio
  Caption = 'Cadastro de Conv'#234'nios'
  ClientHeight = 322
  ExplicitHeight = 360
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcDados: TPageControl
    Height = 263
    ActivePage = tsDados
    ExplicitHeight = 263
    inherited tsListagem: TTabSheet
      inherited DBGListagem: TDBGridCBN
        Height = 231
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONVENIO'
            Width = 505
            Visible = True
          end>
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitHeight = 231
      object Label1: TLabel [0]
        Left = 68
        Top = 65
        Width = 54
        Height = 17
        Caption = 'Conv'#234'nio'
      end
      object edtConvenio: TEdit
        Left = 68
        Top = 88
        Width = 477
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 1
      end
    end
  end
  inherited ds: TDataSource
    Top = 240
  end
  inherited dsp: TDataSetProvider
    Top = 136
  end
  inherited cds: TClientDataSet
    Top = 192
    object cdsID: TSmallintField
      FieldName = 'ID'
    end
    object cdsCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 30
    end
  end
end

inherited frmCadastroClientes: TfrmCadastroClientes
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcDados: TPageControl
    inherited tsListagem: TTabSheet
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_RAZAO'
            Title.Caption = 'CLIENTE'
            Width = 517
            Visible = True
          end>
      end
    end
    inherited tsDados: TTabSheet
      object Label2: TLabel [0]
        Left = 28
        Top = 81
        Width = 64
        Height = 17
        Caption = 'CPF / CNPJ'
      end
      object Label3: TLabel [1]
        Left = 28
        Top = 145
        Width = 40
        Height = 17
        Caption = 'RG / IE'
      end
      object Label4: TLabel [2]
        Left = 28
        Top = 273
        Width = 36
        Height = 17
        Caption = 'E-mail'
      end
      object Label5: TLabel [3]
        Left = 28
        Top = 209
        Width = 94
        Height = 17
        Caption = 'Fone residencial'
      end
      object Label6: TLabel [4]
        Left = 188
        Top = 209
        Width = 40
        Height = 17
        Caption = 'Celular'
      end
      object Label1: TLabel [5]
        Left = 28
        Top = 17
        Width = 122
        Height = 17
        Caption = 'Nome / Raz'#227'o social'
      end
      object edtNomeRazao: TEdit [6]
        Left = 28
        Top = 40
        Width = 261
        Height = 25
        TabOrder = 0
      end
      object edtCpf: TEdit [7]
        Left = 28
        Top = 104
        Width = 261
        Height = 25
        TabOrder = 1
      end
      object edtRG: TEdit [8]
        Left = 28
        Top = 168
        Width = 261
        Height = 25
        TabOrder = 2
      end
      object edtEmail: TEdit [9]
        Left = 28
        Top = 296
        Width = 261
        Height = 25
        TabOrder = 3
      end
      object edtFone1: TMaskEdit [10]
        Left = 29
        Top = 232
        Width = 100
        Height = 25
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 4
        Text = '(  )    -    '
      end
      object edtfone2: TMaskEdit [11]
        Left = 189
        Top = 232
        Width = 100
        Height = 25
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 5
        Text = '(  )    -    '
      end
      inherited edtID: TEdit
        Top = -5
        TabOrder = 6
        ExplicitTop = -5
      end
    end
  end
  inherited qry: TFDQuery
    object qryID: TIntegerField
      FieldName = 'ID'
    end
    object qryNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Size = 100
    end
  end
end

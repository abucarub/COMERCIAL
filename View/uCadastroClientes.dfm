inherited frmCadastroClientes: TfrmCadastroClientes
  Caption = 'Cadastro de Clientes'
  ClientWidth = 713
  ExplicitWidth = 729
  ExplicitHeight = 497
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcDados: TPageControl
    Width = 713
    ExplicitWidth = 713
    inherited tsListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 705
      ExplicitHeight = 368
      inherited DBGrid1: TDBGrid
        Width = 705
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
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 705
      ExplicitHeight = 368
      object Label2: TLabel [0]
        Left = 12
        Top = 81
        Width = 64
        Height = 17
        Caption = 'CPF / CNPJ'
      end
      object Label3: TLabel [1]
        Left = 12
        Top = 145
        Width = 40
        Height = 17
        Caption = 'RG / IE'
      end
      object Label4: TLabel [2]
        Left = 12
        Top = 273
        Width = 36
        Height = 17
        Caption = 'E-mail'
      end
      object Label5: TLabel [3]
        Left = 12
        Top = 209
        Width = 94
        Height = 17
        Caption = 'Fone residencial'
      end
      object Label6: TLabel [4]
        Left = 172
        Top = 209
        Width = 40
        Height = 17
        Caption = 'Celular'
      end
      object Label1: TLabel [5]
        Left = 12
        Top = 17
        Width = 122
        Height = 17
        Caption = 'Nome / Raz'#227'o social'
      end
      object Shape1: TShape [6]
        Left = 296
        Top = 8
        Width = 1
        Height = 349
        Pen.Color = 13092807
      end
      object Label7: TLabel [7]
        Left = 318
        Top = 81
        Width = 22
        Height = 17
        Caption = 'Rua'
      end
      object Label8: TLabel [8]
        Left = 316
        Top = 145
        Width = 16
        Height = 17
        Caption = 'N'#186
      end
      object Label9: TLabel [9]
        Left = 380
        Top = 145
        Width = 35
        Height = 17
        Caption = 'Bairro'
      end
      object Label10: TLabel [10]
        Left = 316
        Top = 209
        Width = 82
        Height = 17
        Caption = 'Complemento'
      end
      object edtNomeRazao: TEdit [11]
        Left = 12
        Top = 40
        Width = 261
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object edtCpf: TEdit [12]
        Left = 12
        Top = 104
        Width = 261
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 1
        OnEnter = edtCpfEnter
      end
      object edtRG: TEdit [13]
        Left = 12
        Top = 168
        Width = 261
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edtEmail: TEdit [14]
        Left = 12
        Top = 296
        Width = 261
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object edtFone1: TMaskEdit [15]
        Left = 13
        Top = 232
        Width = 100
        Height = 25
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 3
        Text = '(  )    -    '
      end
      object edtfone2: TMaskEdit [16]
        Left = 173
        Top = 232
        Width = 100
        Height = 25
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 4
        Text = '(  )    -    '
      end
      inherited edtID: TEdit
        Top = -5
        TabOrder = 6
        ExplicitTop = -5
      end
      object edtRua: TEdit
        Left = 318
        Top = 104
        Width = 370
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 8
      end
      object edtNumero: TEdit
        Left = 316
        Top = 168
        Width = 45
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 9
      end
      object edtBairro: TEdit
        Left = 380
        Top = 168
        Width = 308
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 10
      end
      object memComplemento: TMemo
        Left = 316
        Top = 232
        Width = 372
        Height = 89
        CharCase = ecUpperCase
        TabOrder = 11
      end
      inline BuscaCidade1: TBuscaCidade
        Left = 307
        Top = 16
        Width = 387
        Height = 54
        TabOrder = 7
        ExplicitLeft = 307
        ExplicitTop = 16
        ExplicitWidth = 387
        ExplicitHeight = 54
        inherited Label3: TLabel
          Left = 352
          ExplicitLeft = 352
        end
        inherited edtDescricao: TEdit
          Width = 226
          ExplicitWidth = 226
        end
        inherited edtEstado: TEdit
          Left = 351
          ExplicitLeft = 351
        end
      end
    end
  end
  inherited Panel1: TPanel
    Width = 713
    ExplicitWidth = 713
  end
  inherited ds: TDataSource
    Left = 0
    Top = 112
  end
  inherited qry: TFDQuery
    Left = 0
    Top = 160
    object qryID: TIntegerField
      FieldName = 'ID'
    end
    object qryNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Size = 100
    end
  end
end
inherited frmCadastroClientes: TfrmCadastroClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 434
  ClientWidth = 713
  ExplicitWidth = 729
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcDados: TPageControl
    Width = 713
    Height = 375
    ExplicitWidth = 713
    ExplicitHeight = 375
    inherited tsListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 705
      ExplicitHeight = 343
      inherited DBGrid1: TDBGrid
        Width = 705
        Height = 343
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
      ExplicitWidth = 705
      object Label2: TLabel [0]
        Left = 12
        Top = 81
        Width = 64
        Height = 17
        Caption = 'CPF / CNPJ'
      end
      object Label3: TLabel [1]
        Left = 156
        Top = 81
        Width = 40
        Height = 17
        Caption = 'RG / IE'
      end
      object Label4: TLabel [2]
        Left = 12
        Top = 209
        Width = 36
        Height = 17
        Caption = 'E-mail'
      end
      object Label5: TLabel [3]
        Left = 12
        Top = 145
        Width = 94
        Height = 17
        Caption = 'Fone residencial'
      end
      object Label6: TLabel [4]
        Left = 172
        Top = 145
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
        Height = 325
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
      object Label11: TLabel [11]
        Left = 11
        Top = 273
        Width = 100
        Height = 17
        Caption = 'Data Nascimento'
      end
      object Label12: TLabel [12]
        Left = 175
        Top = 273
        Width = 84
        Height = 17
        Caption = 'Data Cadastro'
      end
      object edtNomeRazao: TEdit [13]
        Left = 12
        Top = 40
        Width = 261
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object edtCpf: TEdit [14]
        Left = 12
        Top = 104
        Width = 122
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 1
        OnEnter = edtCpfEnter
      end
      object edtRG: TEdit [15]
        Left = 156
        Top = 104
        Width = 117
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edtEmail: TEdit [16]
        Left = 12
        Top = 232
        Width = 261
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object edtFone1: TMaskEdit [17]
        Left = 13
        Top = 168
        Width = 100
        Height = 25
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 3
        Text = '(  )    -    '
      end
      object edtfone2: TMaskEdit [18]
        Left = 173
        Top = 168
        Width = 100
        Height = 25
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 4
        Text = '(  )    -    '
      end
      inherited edtID: TEdit
        Top = -5
        TabOrder = 13
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
      object edtNascimento: TMaskEdit
        Left = 12
        Top = 296
        Width = 97
        Height = 25
        EditMask = '!99/99/0000;1; '
        MaxLength = 10
        TabOrder = 6
        Text = '  /  /    '
      end
      object edtCadastro: TMaskEdit
        Left = 176
        Top = 296
        Width = 97
        Height = 25
        Enabled = False
        EditMask = '!99/99/0000;1; '
        MaxLength = 10
        TabOrder = 12
        Text = '  /  /    '
      end
      object edtIDEndereco: TEdit
        Left = 307
        Top = -5
        Width = 41
        Height = 25
        TabOrder = 14
        Visible = False
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

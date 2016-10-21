inherited frmCadastroFuncionarios: TfrmCadastroFuncionarios
  Caption = 'Cadastro de Funcion'#225'rios'
  ClientHeight = 435
  ClientWidth = 713
  ExplicitWidth = 729
  ExplicitHeight = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcDados: TPageControl
    Width = 713
    Height = 376
    ActivePage = tsDados
    ExplicitWidth = 713
    ExplicitHeight = 376
    inherited tsListagem: TTabSheet
      ExplicitWidth = 705
      ExplicitHeight = 344
      inherited DBGListagem: TDBGridCBN
        Width = 705
        Height = 344
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_RAZAO'
            Title.Caption = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = False
          end>
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 705
      ExplicitHeight = 344
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
      object Label7: TLabel [6]
        Left = 318
        Top = 81
        Width = 22
        Height = 17
        Caption = 'Rua'
      end
      object Label8: TLabel [7]
        Left = 316
        Top = 145
        Width = 16
        Height = 17
        Caption = 'N'#186
      end
      object Label9: TLabel [8]
        Left = 380
        Top = 145
        Width = 35
        Height = 17
        Caption = 'Bairro'
      end
      object Label10: TLabel [9]
        Left = 316
        Top = 209
        Width = 82
        Height = 17
        Caption = 'Complemento'
      end
      object Label11: TLabel [10]
        Left = 11
        Top = 273
        Width = 100
        Height = 17
        Caption = 'Data Nascimento'
      end
      object Label12: TLabel [11]
        Left = 175
        Top = 273
        Width = 84
        Height = 17
        Caption = 'Data Cadastro'
      end
      object Shape1: TShape [12]
        Left = 296
        Top = 8
        Width = 1
        Height = 325
        Pen.Color = 13092807
      end
      inherited edtID: TEdit
        Top = -5
        ExplicitTop = -5
      end
      object edtNomeRazao: TEdit
        Left = 12
        Top = 40
        Width = 256
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object edtCpf: TEdit
        Left = 12
        Top = 104
        Width = 117
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edtRG: TEdit
        Left = 156
        Top = 104
        Width = 112
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object edtEmail: TEdit
        Left = 12
        Top = 232
        Width = 256
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 6
      end
      object edtFone1: TMaskEdit
        Left = 13
        Top = 168
        Width = 97
        Height = 25
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 4
        Text = '(  )    -    '
      end
      object edtfone2: TMaskEdit
        Left = 173
        Top = 168
        Width = 99
        Height = 25
        EditMask = '!\(99\)9999-9999;1; '
        MaxLength = 13
        TabOrder = 5
        Text = '(  )    -    '
      end
      object edtRua: TEdit
        Left = 318
        Top = 104
        Width = 369
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 9
      end
      object edtNumero: TEdit
        Left = 316
        Top = 168
        Width = 44
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 10
      end
      object edtBairro: TEdit
        Left = 380
        Top = 168
        Width = 307
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 11
      end
      object memComplemento: TMemo
        Left = 316
        Top = 232
        Width = 371
        Height = 89
        CharCase = ecUpperCase
        TabOrder = 12
      end
      object edtCadastro: TMaskEdit
        Left = 176
        Top = 296
        Width = 97
        Height = 25
        Enabled = False
        EditMask = '!99/99/0000;1; '
        MaxLength = 10
        TabOrder = 13
        Text = '  /  /    '
      end
      inline BuscaCidade1: TBuscaCidade
        Left = 307
        Top = 16
        Width = 399
        Height = 59
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2697513
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        ExplicitLeft = 307
        ExplicitTop = 16
        ExplicitWidth = 399
        ExplicitHeight = 59
        inherited Label3: TLabel
          Left = 356
          ExplicitLeft = 356
        end
        inherited edtCidade: TEdit
          Left = 116
          Width = 233
          ExplicitLeft = 116
          ExplicitWidth = 233
        end
        inherited edtEstado: TEdit
          Left = 356
          Width = 25
          ExplicitLeft = 356
          ExplicitWidth = 25
        end
      end
      object dtpNascimento: TJvDatePickerEdit
        Left = 11
        Top = 296
        Width = 118
        Height = 26
        AllowNoDate = True
        Checked = False
        TabOrder = 7
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
  inherited cds: TClientDataSet
    object cdsID: TIntegerField
      FieldName = 'ID'
    end
    object cdsNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Size = 100
    end
    object cdsTIPO: TSmallintField
      FieldName = 'TIPO'
    end
  end
end

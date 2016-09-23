inherited frmCadastroClientes: TfrmCadastroClientes
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 493
  ClientWidth = 888
  ExplicitWidth = 904
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcDados: TPageControl
    Width = 888
    Height = 434
    ExplicitWidth = 713
    ExplicitHeight = 375
    inherited tsListagem: TTabSheet
      ExplicitWidth = 705
      ExplicitHeight = 343
      inherited DBGListagem: TDBGridCBN
        Width = 880
        Height = 402
        Font.Height = -13
        Font.Name = 'Calibri Light'
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
          end>
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 705
      ExplicitHeight = 343
      object Label2: TLabel [0]
        Left = 44
        Top = 81
        Width = 69
        Height = 19
        Caption = 'CPF / CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel [1]
        Left = 228
        Top = 81
        Width = 45
        Height = 19
        Caption = 'RG / IE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel [2]
        Left = 44
        Top = 209
        Width = 42
        Height = 19
        Caption = 'E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel [3]
        Left = 44
        Top = 145
        Width = 106
        Height = 19
        Caption = 'Fone residencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel [4]
        Left = 227
        Top = 145
        Width = 47
        Height = 19
        Caption = 'Celular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel [5]
        Left = 44
        Top = 17
        Width = 133
        Height = 19
        Caption = 'Nome / Raz'#227'o social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Shape1: TShape [6]
        Left = 400
        Top = 8
        Width = 1
        Height = 377
        Pen.Color = 13092807
      end
      object Label7: TLabel [7]
        Left = 454
        Top = 81
        Width = 25
        Height = 19
        Caption = 'Rua'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel [8]
        Left = 452
        Top = 145
        Width = 17
        Height = 19
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel [9]
        Left = 516
        Top = 145
        Width = 41
        Height = 19
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel [10]
        Left = 452
        Top = 209
        Width = 92
        Height = 19
        Caption = 'Complemento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel [11]
        Left = 43
        Top = 273
        Width = 112
        Height = 19
        Caption = 'Data Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel [12]
        Left = 226
        Top = 273
        Width = 93
        Height = 19
        Caption = 'Data Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
      end
      object edtNomeRazao: TEdit [13]
        Left = 44
        Top = 40
        Width = 301
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtCpf: TEdit [14]
        Left = 44
        Top = 104
        Width = 122
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtRG: TEdit [15]
        Left = 228
        Top = 104
        Width = 117
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edtEmail: TEdit [16]
        Left = 44
        Top = 232
        Width = 301
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edtFone1: TMaskEdit [17]
        Left = 45
        Top = 168
        Width = 121
        Height = 27
        EditMask = '!\(99\)9999-9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 3
        Text = '(  )    -    '
      end
      object edtfone2: TMaskEdit [18]
        Left = 228
        Top = 168
        Width = 117
        Height = 27
        EditMask = '!\(99\)9999-9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 4
        Text = '(  )    -    '
      end
      inherited edtID: TEdit
        Left = 35
        Top = -5
        TabOrder = 12
        ExplicitLeft = 35
        ExplicitTop = -5
      end
      object edtRua: TEdit
        Left = 454
        Top = 104
        Width = 370
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object edtNumero: TEdit
        Left = 452
        Top = 168
        Width = 45
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object edtBairro: TEdit
        Left = 516
        Top = 168
        Width = 308
        Height = 27
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object memComplemento: TMemo
        Left = 452
        Top = 232
        Width = 372
        Height = 89
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object edtCadastro: TMaskEdit
        Left = 227
        Top = 296
        Width = 118
        Height = 27
        Enabled = False
        EditMask = '!99/99/0000;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 11
        Text = '  /  /    '
      end
      object edtIDEndereco: TEdit
        Left = 339
        Top = -3
        Width = 41
        Height = 25
        TabOrder = 13
        Visible = False
      end
      inline BuscaCidade1: TBuscaCidade
        Left = 443
        Top = 16
        Width = 399
        Height = 59
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2697513
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        ExplicitLeft = 443
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
        Left = 43
        Top = 296
        Width = 123
        Height = 27
        AllowNoDate = True
        Checked = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Dados adicionais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      ExplicitLeft = 8
      ExplicitWidth = 705
      ExplicitHeight = 343
      object Label13: TLabel
        Left = 11
        Top = 3
        Width = 28
        Height = 18
        Caption = 'Q.P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12423972
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 447
        Top = 3
        Width = 44
        Height = 18
        Caption = 'H.D.A.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12423972
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 12
        Top = 137
        Width = 29
        Height = 18
        Caption = 'D.C.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12423972
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 11
        Top = 269
        Width = 59
        Height = 18
        Caption = 'Conduta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12423972
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 447
        Top = 137
        Width = 102
        Height = 18
        Caption = 'Medicamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12423972
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object memQP: TMemo
        Left = 12
        Top = 24
        Width = 415
        Height = 105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object memHDA: TMemo
        Left = 447
        Top = 24
        Width = 415
        Height = 105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object memDC: TMemo
        Left = 12
        Top = 158
        Width = 415
        Height = 105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object memConduta: TMemo
        Left = 12
        Top = 290
        Width = 415
        Height = 105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object memMedicamentos: TMemo
        Left = 447
        Top = 158
        Width = 415
        Height = 105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtIDDadosAdicionais: TEdit
        Left = 67
        Top = -7
        Width = 41
        Height = 23
        TabOrder = 5
        Visible = False
      end
    end
  end
  inherited Panel1: TPanel
    Width = 888
    ExplicitWidth = 713
  end
  inherited ds: TDataSource
    Left = 65528
    Top = 312
  end
  inherited dsp: TDataSetProvider
    Left = 65528
    Top = 216
  end
  inherited cds: TClientDataSet
    Left = 65528
    Top = 264
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

inherited frmCadastroServicos: TfrmCadastroServicos
  Caption = 'Cadastro de Servi'#231'os'
  ClientHeight = 407
  ClientWidth = 642
  ExplicitWidth = 658
  ExplicitHeight = 445
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcDados: TPageControl
    Width = 642
    Height = 348
    ActivePage = TabSheet1
    ExplicitWidth = 642
    ExplicitHeight = 348
    inherited tsListagem: TTabSheet
      ExplicitWidth = 634
      ExplicitHeight = 316
      inherited DBGListagem: TDBGridCBN
        Width = 634
        Height = 316
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DEPARTAMENTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'SERVICO'
            Width = 385
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DURACAO'
            Width = 62
            Visible = True
          end>
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 634
      ExplicitHeight = 316
      object Label1: TLabel [0]
        Left = 100
        Top = 99
        Width = 42
        Height = 17
        Caption = 'Servi'#231'o'
      end
      object Label2: TLabel [1]
        Left = 408
        Top = 97
        Width = 94
        Height = 17
        Caption = 'Dura'#231#227'o servi'#231'o'
      end
      inline BuscaDepartamento1: TBuscaDepartamento
        Left = 96
        Top = 32
        Width = 293
        Height = 69
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2697513
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 96
        ExplicitTop = 32
        inherited Label2: TLabel
          Width = 95
          Font.Style = []
          ExplicitWidth = 95
        end
      end
      object edtServico: TEdit
        Left = 100
        Top = 120
        Width = 277
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 2
        OnChange = edtServicoChange
      end
      object cmbDuracao: TComboBox
        Left = 408
        Top = 120
        Width = 105
        Height = 25
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          '00:00'
          '00:15'
          '00:30'
          '00:45'
          '01:00'
          '01:15'
          '01:30'
          '01:45'
          '02:00'
          '02:15'
          '02:30'
          '02:45'
          '03:00'
          '03:15'
          '03:30'
          '03:45'
          '04:00'
          '04:15'
          '04:30'
          '04:45'
          '05:00'
          '05:15'
          '05:30'
          '05:45'
          '06:00')
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Tabela de pre'#231'o'
      ImageIndex = 2
      object Label7: TLabel
        Left = 396
        Top = 44
        Width = 99
        Height = 18
        Caption = 'Valor do Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2631720
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 20
        Top = 12
        Width = 49
        Height = 18
        Caption = 'Servi'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2631720
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbServico: TLabel
        Left = 76
        Top = 13
        Width = 18
        Height = 18
        Caption = '. . .'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12880685
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inline BuscaConvenio1: TBuscaConvenio
        Left = 11
        Top = 40
        Width = 374
        Height = 69
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2697513
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 11
        ExplicitTop = 40
        ExplicitWidth = 374
        inherited Label2: TLabel
          Width = 60
          Font.Style = []
          ExplicitWidth = 60
        end
        inherited edtConvenio: TEdit
          Width = 269
          ExplicitWidth = 269
        end
      end
      object edtValorServico: TCurrencyEdit
        Left = 396
        Top = 64
        Width = 121
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 530
        Top = 63
        Width = 96
        Height = 28
        Caption = 'Adicionar'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF05793AEDF8F2FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E8245
          63CE9D108447EFF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0D844472D1A76DD0A466CE9F0F8747E8F4ECFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF0D864480D7B07ED5AE76D2A96DD0A465CD9F108947EBF6EEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF04823D8FDAB98FDAB986D8B37DD5AE74D2A86ACF
          A261CC9D0F8B48EEF7F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C88469CDFC19FE0C398DDBF8EDBB8
          85D7B27AD4AB6FD1A665CE9F5CCB9A0F8D4AEEF7F1FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF098C47A5E1C6ADE4CCA7
          E2C89FDFC395DCBC8AD9B67ED6AE72D1A868CEA05ECB9A57C9970E904CCBE3CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF099048A7E2
          C8B8E7D2B5E6D0AEE4CCA4E1C699DDBF26B46688D9B475D2A96ACFA260CC9B57
          C99651C794048C41D5E9D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          079347A1E1C4B8E7D2BEE9D6B7E7D3AFE5CDA3E0C60D964AFFFFFF1FAD5F83D7
          B26BD0A260CC9C58C99651C89351C7930E974DDAECDBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF0291438FDBB9AEE4CCB4E6D0B8E7D2B5E6D0A7E2C80B974BFFFFFF
          FFFFFFFFFFFF1FAD5F7CD5AD60CC9C57CA9651C89350C79251C7920E984EDDEE
          DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF19A359A0E0C3AEE4CCB0E4CDA4E1C51D
          A35BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF23B16373D1A856C99650C7924FC791
          4FC79251C791119C51DEEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CA75C9DDF
          C2A6E2C7109F51FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF23B1636B
          D0A24FC7924FC79250C79250C79250C791139E53E3F2E5FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1AA85A16A557FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF24B36563CD9E50C7924FC79250C79250C79251C7920C9B4DFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20AF615FCC9A4FC79250C79251C8
          93088D46FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1BAA5C
          5ACA9853C8940A964BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF11A052139F53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object DBGrid1: TDBGrid
        Left = 19
        Top = 112
        Width = 498
        Height = 180
        DataSource = dsTabela
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = -1
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_CONVENIO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CONVENIO'
            Width = 282
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Width = 129
            Visible = True
          end>
      end
    end
  end
  inherited Panel1: TPanel
    Width = 642
    ExplicitWidth = 642
  end
  inherited cds: TClientDataSet
    object cdsID: TIntegerField
      FieldName = 'ID'
    end
    object cdsSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 30
    end
    object cdsDURACAO: TTimeField
      FieldName = 'DURACAO'
    end
  end
  object cdsTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 456
    Top = 248
    object cdsTabelaID: TIntegerField
      FieldName = 'ID'
    end
    object cdsTabelaID_CONVENIO: TIntegerField
      FieldName = 'ID_CONVENIO'
    end
    object cdsTabelaVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = 'R$ ,0.00'
    end
    object cdsTabelaCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 25
    end
  end
  object dsTabela: TDataSource
    DataSet = cdsTabela
    Left = 456
    Top = 296
  end
end

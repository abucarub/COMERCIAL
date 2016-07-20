inherited frmAgendamentos: TfrmAgendamentos
  Caption = 'Agendamentos'
  ClientHeight = 620
  ClientWidth = 1075
  ExplicitTop = -13
  ExplicitWidth = 1091
  ExplicitHeight = 658
  PixelsPerInch = 96
  TextHeight = 18
  object Shape2: TShape
    Left = 0
    Top = 0
    Width = 1075
    Height = 70
    Align = alClient
    Brush.Color = 15590611
    Pen.Style = psClear
    ExplicitHeight = 89
  end
  inline BuscaPessoa1: TBuscaPessoa
    Left = 8
    Top = 0
    Width = 385
    Height = 57
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitWidth = 385
    ExplicitHeight = 57
    inherited lbTipo: TLabel
      Left = 88
      ExplicitLeft = 88
    end
    inherited edtCodigo: TCurrencyEdit
      Width = 43
      ExplicitWidth = 43
    end
    inherited btnBusca: TBitBtn
      Left = 57
      ExplicitLeft = 57
    end
    inherited edtNome: TEdit
      Left = 87
      ExplicitLeft = 87
    end
  end
  inline BuscaConvenio1: TBuscaConvenio
    Left = 398
    Top = 0
    Width = 253
    Height = 56
    TabOrder = 1
    ExplicitLeft = 398
    ExplicitWidth = 253
    inherited Label1: TLabel
      Left = 8
      ExplicitLeft = 8
    end
    inherited Label2: TLabel
      Left = 85
      ExplicitLeft = 85
    end
    inherited edtCodigo: TCurrencyEdit
      Left = 8
      Width = 44
      ExplicitLeft = 8
      ExplicitWidth = 44
    end
    inherited btnBusca: TBitBtn
      Left = 55
      ExplicitLeft = 55
    end
    inherited edtConvenio: TEdit
      Left = 84
      Width = 157
      ExplicitLeft = 84
      ExplicitWidth = 157
    end
  end
  inline BuscaTabelaPreco1: TBuscaTabelaPreco
    Left = 648
    Top = 0
    Width = 433
    Height = 53
    TabOrder = 2
    ExplicitLeft = 648
    ExplicitWidth = 433
    ExplicitHeight = 53
    inherited Label2: TLabel
      Left = 89
      ExplicitLeft = 89
    end
    inherited Label3: TLabel
      Left = 337
      ExplicitLeft = 337
    end
    inherited edtCodigo: TCurrencyEdit
      Width = 44
      ExplicitWidth = 44
    end
    inherited btnBusca: TBitBtn
      Left = 58
      ExplicitLeft = 58
    end
    inherited edtServico: TEdit
      Left = 88
      Width = 233
      ExplicitLeft = 88
      ExplicitWidth = 233
    end
    inherited edtValor: TCurrencyEdit
      Left = 337
      Width = 51
      ExplicitLeft = 337
      ExplicitWidth = 51
    end
  end
  object rgpHorarios: TGroupBox
    Left = 0
    Top = 70
    Width = 1075
    Height = 550
    Align = alBottom
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    ExplicitTop = 80
    object Shape1: TShape
      Left = 384
      Top = 3
      Width = 281
      Height = 567
      Brush.Color = 14737632
      Pen.Style = psClear
    end
    object Label2: TLabel
      Left = 62
      Top = 16
      Width = 152
      Height = 30
      Caption = 'Hor'#225'rios do dia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12481552
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 15
      Top = 44
      Width = 40
      Height = 21
      Caption = '06:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 15
      Top = 76
      Width = 40
      Height = 21
      Caption = '07:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 15
      Top = 108
      Width = 40
      Height = 21
      Caption = '08:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 15
      Top = 140
      Width = 40
      Height = 21
      Caption = '09:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 15
      Top = 172
      Width = 40
      Height = 21
      Caption = '10:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 15
      Top = 204
      Width = 40
      Height = 21
      Caption = '11:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 15
      Top = 236
      Width = 40
      Height = 21
      Caption = '12:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 15
      Top = 268
      Width = 40
      Height = 21
      Caption = '13:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 15
      Top = 300
      Width = 40
      Height = 21
      Caption = '14:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 15
      Top = 332
      Width = 40
      Height = 21
      Caption = '15:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 15
      Top = 364
      Width = 40
      Height = 21
      Caption = '16:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 15
      Top = 396
      Width = 40
      Height = 21
      Caption = '17:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 15
      Top = 428
      Width = 40
      Height = 21
      Caption = '18:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 15
      Top = 460
      Width = 40
      Height = 21
      Caption = '19:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 15
      Top = 492
      Width = 40
      Height = 21
      Caption = '20:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 15
      Top = 524
      Width = 40
      Height = 21
      Caption = '21:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 25
      Top = 62
      Width = 31
      Height = 17
      Caption = '06:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 25
      Top = 94
      Width = 31
      Height = 17
      Caption = '07:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 25
      Top = 158
      Width = 31
      Height = 17
      Caption = '09:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 25
      Top = 126
      Width = 31
      Height = 17
      Caption = '08:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 25
      Top = 286
      Width = 31
      Height = 17
      Caption = '13:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 25
      Top = 254
      Width = 31
      Height = 17
      Caption = '12:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 25
      Top = 222
      Width = 31
      Height = 17
      Caption = '11:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label29: TLabel
      Left = 25
      Top = 190
      Width = 31
      Height = 17
      Caption = '10:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 25
      Top = 414
      Width = 31
      Height = 17
      Caption = '17:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 25
      Top = 382
      Width = 31
      Height = 17
      Caption = '16:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 25
      Top = 350
      Width = 31
      Height = 17
      Caption = '15:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 25
      Top = 318
      Width = 31
      Height = 17
      Caption = '14:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label34: TLabel
      Left = 25
      Top = 446
      Width = 31
      Height = 17
      Caption = '18:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label35: TLabel
      Left = 25
      Top = 478
      Width = 31
      Height = 17
      Caption = '19:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label36: TLabel
      Left = 25
      Top = 510
      Width = 31
      Height = 17
      Caption = '20:30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 492
      Top = 53
      Width = 145
      Height = 17
      Caption = 'Quantidade de consultas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 680
      Top = 16
      Width = 184
      Height = 30
      Caption = 'Hor'#225'rios marcados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4162331
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label37: TLabel
      Left = 400
      Top = 20
      Width = 237
      Height = 25
      Caption = 'Marcando hor'#225'rio  1 de 10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object JvMonthCalendar1: TJvMonthCalendar
      Left = 398
      Top = 116
      Width = 253
      Height = 218
      Date = 42566.611074490740000000
      TabOrder = 0
    end
    object btnCriaHorario: TBitBtn
      Left = 411
      Top = 442
      Width = 227
      Height = 29
      Caption = ' Criar Hor'#225'rio'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E5CABB00CE976D00BF6D1F00C56C0B00C56C0B00C06D
        1E00CD966C00E5CABA00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00816657006A3309005B09000061080000610800005C09
        000069320800816656009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FCF9F700C7855300D6850B00E69C0A00E7AF2500F7C95900F7C85800E9AD
        2300E5980800D0800500C5835300FCF9F700FFFFFF00FFFFFF009B9B9B009B9B
        9B0098959300632100007221000082380000834B000093650000936400008549
        0000813400006C1C0000611F0000989593009B9B9B009B9B9B00FFFFFF00FDFA
        F800C97E3200E59E1200EBB43700F0D69F00DFB27300D0985600D0985600DFB2
        7200F2D79D00EAB23300E0940700C77A2D00FDFAF800FFFFFF009B9B9B009996
        9400651A0000813A0000875000008C723B007B4E0F006C3400006C3400007B4E
        0E008E733900864E00007C30000063160000999694009B9B9B00FFFFFF00D093
        5D00E9A82100EBC16400E4CBAA00DFDDDD00F1F0F10024232600D9D9DA00D9D9
        DA00D0CECE00D7B69000F0C55F00E29C1100D0905A00FFFFFF009B9B9B006C2F
        000085440000875D0000806746007B7979008D8C8D0000000000757576007575
        76006C6A6A0073522C008C6100007E3800006C2C00009B9B9B00EBD1BF00E1A3
        2F00EAB43D00EAD2B400FCFFFF0024232600F1F1F000EFEEED00EBEAE900D0CE
        CE0024232600CDCFD300D0AD8700F1B83800DC971F00EBD1BF00876D5B007D3F
        000086500000866E5000989B9B00000000008D8D8C008B8A8900878685006C6A
        6A0000000000696B6F006C4923008D54000078330000876D5B00DCAB7900EEBE
        3E00F2CF8300FCFFFF0024232600F0EFEF00ECEBEB00E6E4E300E1E0DF00D8D6
        D500D3D1CF0024232600D3D1CF00EDC67200EDB43100DBA77800784715008A5A
        00008E6B1F00989B9B00000000008C8B8B008887870082807F007D7C7B007472
        71006F6D6B00000000006F6D6B0089620E008950000077431400DA9C4500EDBD
        4200E9C18100F0EFEF00F0EFEF00F0EFEF00ECEBEB00E6E4E300E1E0DF00D8D6
        D500D3D1CF00D3D1CF00D3D1CF00E5BB7900F1B93700D7953E00763800008959
        0000855D1D008C8B8B008C8B8B008C8B8B008887870082807F007D7C7B007472
        71006F6D6B006F6D6B006F6D6B00815715008D55000073310000E2AB4D00F9CD
        5C00EFD2A10024232600FFFFFF00F0EFEF00ECEBEB0004030600040306001918
        1B0019181B0019181B00D3D1CF00DDB67C00FBC95000DFA343007E4700009569
        00008B6E3D00000000009B9B9B008C8B8B008887870000000000000000000000
        000000000000000000006F6D6B0079521800976500007B3F0000E5B66300FDD7
        7300E9BC6F00BDBBBE00FFFFFF00EFEEED00EDEDEC0019181B009C9A9B00FFFF
        FF00FFFFFF00E6E4E300E1DFDE00D59A4800FDD36200E3B05700815200009973
        0F0085580B0059575A009B9B9B008B8A89008989880000000000383637009B9B
        9B009B9B9B0082807F007D7B7A0071360000996F00007F4C0000E4B16400F5D9
        8600E9BE6A00FCFDFE00FCFBFA00F4F3F200F1F1F00019181B00B1AFB000E5E3
        E200E1E0DF00D6D4D200D6D4D200E9C47A00F8E09900E1AE6100804D00009175
        2200855A060098999A0098979600908F8E008D8D8C00000000004D4B4C00817F
        7E007D7C7B0072706E0072706E0085601600947C35007D4A0000E9C18700FDF8
        D500F2D99800F0F2F40024232600F4F3F200F1F1F00019181B00BDBBBE00E5E3
        E200E1E0DF0024232600DAD9DC00F5D69100FEF9DA00E8C08900855D23009994
        71008E7534008C8E900000000000908F8E008D8D8C000000000059575A00817F
        7E007D7C7B00000000007675780091722D009A957600845C2500F4DEBF00F7E5
        B600FBECC800F0DBB100FEFFFF00E9E8E700EDEBEC00F6F5F400EFEEED00E9E8
        E700E1DFDE00DADCE200E7C89500FDEDC800F6E0AE00F3DEBF00907A5B009381
        5200978864008C774D009A9B9B008584830089878800929190008B8A89008584
        83007D7B7A0076787E008364310099896400927C4A008F7A5B00FFFFFF00EAC1
        7600FDF9E500F9E5B300F4DFB50024232600CDCDCE0019181B00E1DFDE00E8E6
        E50024232600E5CB9900FBE5B300FCF7E200EBBF7400FFFFFF009B9B9B00865D
        12009995810095814F00907B51000000000069696A00000000007D7B7A008482
        8100000000008167350097814F0098937E00875B10009B9B9B00FFFFFF00FEFC
        F800EEC56F00FEFAE700FBF0D300F9E3A800F5D99100F4DEA900F4DDA900F2D6
        8E00F8DEA300FFF3D900FDF9E400EDC26C00FEFCF800FFFFFF009B9B9B009A98
        94008A610B009A968300978C6F00957F440091752D00907A4500907945008E72
        2A00947A3F009B8F750099958000895E08009A9894009B9B9B00FFFFFF00FFFF
        FF00FEFCF800EFC77700FAE8BC00FCFAEA00FCF1DF00FFF7D800FFF7D900FEF5
        E000FFFBEB00F7E8BA00EDC67600FEFCF800FFFFFF00FFFFFF009B9B9B009B9B
        9B009A9894008B6313009684580098968600988D7B009B9374009B9375009A91
        7C009B97870093845600896212009A9894009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00F8E7C200F3D59400F2D18400F4DB9700F4DB9700F2D1
        8400F3D49200F8E7C200FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B0094835E008F7130008E6D200090773300907733008E6D
        20008F702E0094835E009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnCriaHorarioClick
    end
    object BitBtn1: TBitBtn
      Left = 411
      Top = 482
      Width = 227
      Height = 29
      Caption = ' Gerar Consultas Restantes'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CB641300FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00670000009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D5730A00DE871D00F5DC
        C200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00710F00007A2300009178
        5E009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FDF9F700DDA28000D7740900E58C0000E084
        0E00F0C99A00FFFDFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B0099959300793E1C0073100000812800007C20
        00008C6536009B9997009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FEFDFD00DFAE9300D27E3800D97D0B00E28A0700E58C0400E183
        0100DE7B0800E9AD6A00FDF7F000FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009A9999007B4A2F006E1A0000751900007E260000812800007D1F
        00007A1700008549060099938C009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FAF4F100C87B5300D97D0D00EB9C0F00EA9B0900E9980A00E58F0C00E185
        0A00EAAD3300E29A3200F2C89D00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B0096908D006417000075190000873800008637000085340000812B00007D21
        0000864900007E3600008E6439009B9B9B009B9B9B009B9B9B00FFFFFF00FEFC
        FB00CF917300DB831400F2AD1C00EFAA1D00F2C04700EFB84200E8961300F2C2
        5800DC934000E9BA9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009A98
        97006B2D0F00771F00008E4900008B4600008E5C00008B540000843200008E5E
        0000782F0000855637009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00E3C2
        B200CB6D1500F6BD2C00F2B82D00EAB04700D4813F00E3A13E00F8D67800DE99
        5F00F3DCD100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B007F5E
        4E0067090000925900008E540000864C0000701D00007F3D0000947214007A35
        00008F786D009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00C57B
        4F00ECAB2D00F5C33B00ECB03600DB9E7700E9C3AB00E7B56600DD9E6000FBF4
        EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B006117
        000088470000915F0000884C0000773A1300855F470083510200793A00009790
        8B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00CC7A
        3A00F5C74600F8CC4800DC8D2800F2DCD100FFFFFF00D9905B00FFFFFF00FFFF
        FF00FFFFFF00F7DDB700F8DFB600F9E3B400FCECC700FFFFFF009B9B9B006816
        00009163000094680000782900008E786D009B9B9B00752C00009B9B9B009B9B
        9B009B9B9B0093795300947B5200957F5000988863009B9B9B00FFFFFF00D488
        4000F6CF5600FAD35700DC903E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F6DAB700EAA22D00F3C34800F4C64900F6CB5C00FFFFFF009B9B9B007024
        0000926B0000966F0000782C00009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B0092765300863E00008F5F000090620000926700009B9B9B00FFFFFF00C977
        3D00F9D76100FEE06900E2A03700EBCCBC00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F5D7B400F1BD4600FADD6800F9D86600F6CB5D00FFFFFF009B9B9B006513
        0000957300009A7C05007E3C0000876858009B9B9B009B9B9B009B9B9B009B9B
        9B00917350008D5900009679040095740200926700009B9B9B00FFFFFF00CD8E
        6A00EDBB4B00FFEA7A00F9D76600D5884400F7E8DF00FFFFFF00FFFFFF00FAED
        E000EBAF5300FADB6900FCE07300F8D86B00F7D48000FFFFFF009B9B9B00692A
        0600895700009B861600957302007124000093847B009B9B9B009B9B9B009689
        7C00874B000096770500987C0F009474070093701C009B9B9B00FFFFFF00EFDC
        D300C8783800FFEF8700FEEA8000FADD7100DE933C00E3A66700E7AD6900E9AA
        4200FBDE7200FDE67D00FDE98E00F5C96000FDF3DC00FFFFFF009B9B9B008B78
        6F00641400009B8B23009A861C0096790D007A2F00007F420300834905008546
        0000977A0E009982190099852A0091650000998F78009B9B9B00FFFFFF00FFFF
        FF00DCB19E00DC9C4500FFF69B00FFF08F00FFF08A00FCE27500FCE27500FFED
        8700FFEC8D00FFEF9F00F3CE6B00F9DFAD00FFFFFF00FFFFFF009B9B9B009B9B
        9B00784D3A00783800009B9237009B8C2B009B8C2600987E1100987E11009B89
        23009B8829009B8B3B008F6A0700957B49009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00D9A79200DA954A00F8E08D00FFF8A900FFF5AB00FFF5AC00FFF4
        AC00FBE59A00F2C36700F6D49F00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B0075432E0076310000947C29009B9445009B9147009B9148009B90
        4800978136008E5F030092703B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00F0DACF00DDA47A00DE9C5900E8B36300EBBB6600E8B1
        6400EFC18400FAEAD300FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B008C766B00794016007A380000844F000087570200844D
        00008B5D200096866F009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object GroupBox1: TGroupBox
      Left = 412
      Top = 345
      Width = 225
      Height = 84
      TabOrder = 3
      object Label3: TLabel
        Left = 32
        Top = 19
        Width = 29
        Height = 17
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 128
        Top = 19
        Width = 47
        Height = 17
        Caption = 'Minutos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object speHoras: TSpinEdit
        Left = 31
        Top = 40
        Width = 64
        Height = 28
        MaxValue = 21
        MinValue = 6
        TabOrder = 0
        Value = 7
      end
      object speMinutos: TSpinEdit
        Left = 127
        Top = 40
        Width = 64
        Height = 28
        Increment = 10
        MaxValue = 50
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
    object StringGrid1: TStringGrid
      Left = 62
      Top = 55
      Width = 307
      Height = 484
      ColCount = 1
      DefaultColWidth = 300
      DefaultRowHeight = 15
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      GradientEndColor = clBtnFace
      ParentFont = False
      TabOrder = 4
      OnDrawCell = StringGrid1DrawCell
      ColWidths = (
        300)
      RowHeights = (
        15)
    end
    object edtCodigo: TCurrencyEdit
      Left = 562
      Top = 76
      Width = 75
      Height = 24
      Ctl3D = True
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MinValue = 1.000000000000000000
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      Value = 1.000000000000000000
    end
    object DBGridCBN1: TDBGridCBN
      Left = 680
      Top = 55
      Width = 377
      Height = 484
      Color = 14803425
      DataSource = dsHorarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      BuscaHabilitada = True
      ConfCores.Normal.CorFonte = clWindowText
      ConfCores.Normal.CorFundo = 14803425
      ConfCores.Normal.Tipo.Charset = DEFAULT_CHARSET
      ConfCores.Normal.Tipo.Color = clWindowText
      ConfCores.Normal.Tipo.Height = -11
      ConfCores.Normal.Tipo.Name = 'MS Sans Serif'
      ConfCores.Normal.Tipo.Style = []
      ConfCores.Zebrada.CorFonte = clWindowText
      ConfCores.Zebrada.CorFundo = clWhite
      ConfCores.Zebrada.Tipo.Charset = DEFAULT_CHARSET
      ConfCores.Zebrada.Tipo.Color = clWindowText
      ConfCores.Zebrada.Tipo.Height = -11
      ConfCores.Zebrada.Tipo.Name = 'MS Sans Serif'
      ConfCores.Zebrada.Tipo.Style = []
      ConfCores.Selecao.CorFonte = clWindowText
      ConfCores.Selecao.CorFundo = 16037533
      ConfCores.Selecao.Tipo.Charset = DEFAULT_CHARSET
      ConfCores.Selecao.Tipo.Color = clWindowText
      ConfCores.Selecao.Tipo.Height = -11
      ConfCores.Selecao.Tipo.Name = 'MS Sans Serif'
      ConfCores.Selecao.Tipo.Style = []
      ConfCores.Destacado.CorFonte = 8650884
      ConfCores.Destacado.CorFundo = clWhite
      ConfCores.Destacado.Tipo.Charset = DEFAULT_CHARSET
      ConfCores.Destacado.Tipo.Color = 8650884
      ConfCores.Destacado.Tipo.Height = -11
      ConfCores.Destacado.Tipo.Name = 'Lucida Console'
      ConfCores.Destacado.Tipo.Style = [fsBold]
      ConfCores.Titulo.CorFonte = clWindowText
      ConfCores.Titulo.CorFundo = clBtnFace
      ConfCores.Titulo.Tipo.Charset = DEFAULT_CHARSET
      ConfCores.Titulo.Tipo.Color = clWindowText
      ConfCores.Titulo.Tipo.Height = -11
      ConfCores.Titulo.Tipo.Name = 'MS Sans Serif'
      ConfCores.Titulo.Tipo.Style = []
      Ordenavel = True
      TipoBusca.ListarApenasEncontrados = False
      TipoBusca.QualquerParte = False
      SalvaConfiguracoes = False
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA_HORA'
          Title.Caption = 'Data e Hora'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIA_SEMANA'
          Title.Caption = 'Dia da Semana'
          Width = 206
          Visible = True
        end>
    end
  end
  object cdsHorarios: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 256
    object cdsHorariosDATA_HORA: TDateTimeField
      FieldName = 'DATA_HORA'
    end
    object cdsHorariosDIA_SEMANA: TStringField
      FieldName = 'DIA_SEMANA'
      Size = 30
    end
  end
  object dsHorarios: TDataSource
    DataSet = cdsHorarios
    Left = 768
    Top = 256
  end
end

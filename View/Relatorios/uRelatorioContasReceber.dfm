inherited frmRelatorioContasReceber: TfrmRelatorioContasReceber
  Caption = 'Relat'#243'rio'
  ClientHeight = 308
  ClientWidth = 777
  ExplicitWidth = 793
  ExplicitHeight = 346
  PixelsPerInch = 96
  TextHeight = 18
  object RLReport1: TRLReport
    Left = 0
    Top = 201
    Width = 794
    Height = 1123
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = dsContas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
    object RLBand1: TRLBand
      Left = 20
      Top = 39
      Width = 754
      Height = 51
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 208
        Top = 8
        Width = 280
        Height = 23
        Caption = 'RELAT'#211'RIO DE CONTAS '#192' RECEBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 495
        Top = 32
        Width = 32
        Height = 15
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 632
        Top = 32
        Width = 32
        Height = 15
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 533
        Top = 31
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 670
        Top = 31
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
    end
    object RLGroup1: TRLGroup
      Left = 20
      Top = 90
      Width = 754
      Height = 103
      DataFields = 'ID_DEPARTAMENTO'
      object RLBand2: TRLBand
        Left = 0
        Top = 43
        Width = 754
        Height = 21
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clWhite
        ParentColor = False
        Transparent = False
        BeforePrint = RLBand2BeforePrint
        object RLDBText1: TRLDBText
          Left = 3
          Top = 3
          Width = 44
          Height = 15
          DataField = 'PESSOA'
          DataSource = dsContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText2: TRLDBText
          Left = 365
          Top = 3
          Width = 40
          Height = 15
          Alignment = taCenter
          DataField = 'FONE1'
          DataSource = dsContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText3: TRLDBText
          Left = 429
          Top = 3
          Width = 79
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTAL_CONTA'
          DataSource = dsContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText4: TRLDBText
          Left = 517
          Top = 3
          Width = 75
          Height = 15
          Alignment = taRightJustify
          DataField = 'VALOR_PAGO'
          DataSource = dsContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 615
          Top = 3
          Width = 55
          Height = 15
          Alignment = taRightJustify
          DataField = 'RESTANTE'
          DataSource = dsContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText6: TRLDBText
          Left = 695
          Top = 3
          Width = 44
          Height = 15
          Alignment = taCenter
          DataField = 'STATUS'
          DataSource = dsContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
          BeforePrint = RLDBText6BeforePrint
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 754
        Height = 43
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText7: TRLDBText
          Left = 9
          Top = 2
          Width = 120
          Height = 19
          DataField = 'DEPARTAMENTO'
          DataSource = dsContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLDraw1: TRLDraw
          Left = 1
          Top = 22
          Width = 755
          Height = 1
          Pen.Color = 8355711
        end
        object RLLabel3: TRLLabel
          Left = 1
          Top = 28
          Width = 736
          Height = 14
          Caption = 
            'NOME                                                            ' +
            '                                                TELEFONE       T' +
            'OTAL CONTA      VALOR PAGO          RESTANTE          STATUS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 64
        Width = 754
        Height = 22
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDraw3: TRLDraw
          Left = 411
          Top = 0
          Width = 343
          Height = 21
          Brush.Color = 15461355
          Pen.Style = psClear
        end
        object RLDBResult1: TRLDBResult
          Left = 368
          Top = 4
          Width = 140
          Height = 16
          Alignment = taRightJustify
          DataField = 'TOTAL_CONTA'
          DataSource = dsContas
          DisplayMask = ' ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4276545
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLDBText3
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult2: TRLDBResult
          Left = 457
          Top = 4
          Width = 135
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_PAGO'
          DataSource = dsContas
          DisplayMask = ' ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4276545
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLDBText4
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult3: TRLDBResult
          Left = 557
          Top = 3
          Width = 113
          Height = 16
          Alignment = taRightJustify
          DataField = 'RESTANTE'
          DataSource = dsContas
          DisplayMask = ' ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4276545
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLDBText5
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 0
          Width = 410
          Height = 21
          Brush.Color = 14869218
          Brush.Style = bsBDiagonal
          Pen.Style = psClear
        end
        object RLLabel5: TRLLabel
          Left = 256
          Top = 3
          Width = 141
          Height = 15
          Caption = 'TOTAL DEPARTAMENTO >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBand5: TRLBand
      Left = 20
      Top = 193
      Width = 754
      Height = 22
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Color = 15066597
      ParentColor = False
      Transparent = False
      object RLDBResult4: TRLDBResult
        Left = 368
        Top = 3
        Width = 140
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTAL_CONTA'
        DataSource = dsContas
        DisplayMask = ' ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Holder = RLDBText3
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBResult5: TRLDBResult
        Left = 457
        Top = 4
        Width = 135
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_PAGO'
        DataSource = dsContas
        DisplayMask = ' ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Holder = RLDBText4
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBResult6: TRLDBResult
        Left = 557
        Top = 3
        Width = 113
        Height = 16
        Alignment = taRightJustify
        DataField = 'RESTANTE'
        DataSource = dsContas
        DisplayMask = ' ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Holder = RLDBText5
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 256
        Top = 3
        Width = 139
        Height = 15
        Caption = 'TOTAL GERAL                   >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object RLReport2: TRLReport
    Left = 38
    Top = 394
    Width = 1123
    Height = 794
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = dsContasMensal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    Visible = False
    object RLBand6: TRLBand
      Left = 20
      Top = 39
      Width = 1083
      Height = 51
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel7: TRLLabel
        Left = 348
        Top = 9
        Width = 280
        Height = 23
        Caption = 'RELAT'#211'RIO DE CONTAS '#192' RECEBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 834
        Top = 32
        Width = 32
        Height = 15
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 971
        Top = 32
        Width = 32
        Height = 15
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 872
        Top = 31
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 1009
        Top = 31
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
      object RLLabel13: TRLLabel
        Left = 3
        Top = 31
        Width = 58
        Height = 19
        Caption = 'PILATES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup2: TRLGroup
      Left = 20
      Top = 90
      Width = 1083
      Height = 103
      DataFields = 'MES'
      object RLBand7: TRLBand
        Left = 0
        Top = 43
        Width = 1083
        Height = 21
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clWhite
        ParentColor = False
        Transparent = False
        BeforePrint = RLBand2BeforePrint
        object RLDBText8: TRLDBText
          Left = 3
          Top = 3
          Width = 260
          Height = 15
          AutoSize = False
          DataField = 'PESSOA'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText9: TRLDBText
          Left = 280
          Top = 3
          Width = 40
          Height = 15
          Alignment = taCenter
          DataField = 'FONE1'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText10: TRLDBText
          Left = 757
          Top = 3
          Width = 79
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTAL_CONTA'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText11: TRLDBText
          Left = 845
          Top = 3
          Width = 75
          Height = 15
          Alignment = taRightJustify
          DataField = 'VALOR_PAGO'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
          BeforePrint = RLDBText11BeforePrint
        end
        object RLDBText12: TRLDBText
          Left = 943
          Top = 3
          Width = 55
          Height = 15
          Alignment = taRightJustify
          DataField = 'RESTANTE'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText13: TRLDBText
          Left = 1023
          Top = 3
          Width = 44
          Height = 15
          Alignment = taCenter
          DataField = 'STATUS'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
          BeforePrint = RLDBText13BeforePrint
        end
        object RLDBText15: TRLDBText
          Left = 530
          Top = 3
          Width = 36
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'PRESENCA'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText16: TRLDBText
          Left = 586
          Top = 3
          Width = 36
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'FALTA'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText17: TRLDBText
          Left = 642
          Top = 3
          Width = 36
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'CANCELADO'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText18: TRLDBText
          Left = 698
          Top = 3
          Width = 36
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'REPOSTO'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText19: TRLDBText
          Left = 337
          Top = 2
          Width = 181
          Height = 15
          AutoSize = False
          DataField = 'SERVICO'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
      object RLBand8: TRLBand
        Left = 0
        Top = 0
        Width = 1083
        Height = 43
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText14: TRLDBText
          Left = 9
          Top = 2
          Width = 34
          Height = 19
          DataField = 'MES'
          DataSource = dsContasMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          BeforePrint = RLDBText14BeforePrint
        end
        object RLDraw4: TRLDraw
          Left = 1
          Top = 22
          Width = 1082
          Height = 1
          Pen.Color = 8355711
        end
        object RLLabel10: TRLLabel
          Left = 1
          Top = 28
          Width = 1066
          Height = 14
          Caption = 
            'NOME                                                            ' +
            '                    TELEFONE    SERVI'#199'O                         ' +
            '                          PRES.        FALTA         CANC.      ' +
            '  REPOS.          TOTAL CONTA      VALOR PAGO          RESTANTE ' +
            '        STATUS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand9: TRLBand
        Left = 0
        Top = 64
        Width = 1083
        Height = 22
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDraw5: TRLDraw
          Left = 741
          Top = 0
          Width = 343
          Height = 21
          Brush.Color = 15461355
          Pen.Style = psClear
        end
        object RLDBResult7: TRLDBResult
          Left = 696
          Top = 4
          Width = 140
          Height = 16
          Alignment = taRightJustify
          DataField = 'TOTAL_CONTA'
          DataSource = dsContasMensal
          DisplayMask = ' ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4276545
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLDBText10
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult8: TRLDBResult
          Left = 785
          Top = 4
          Width = 135
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_PAGO'
          DataSource = dsContasMensal
          DisplayMask = ' ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4276545
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLDBText11
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult9: TRLDBResult
          Left = 885
          Top = 3
          Width = 113
          Height = 16
          Alignment = taRightJustify
          DataField = 'RESTANTE'
          DataSource = dsContasMensal
          DisplayMask = ' ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4276545
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLDBText12
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDraw6: TRLDraw
          Left = 0
          Top = 0
          Width = 678
          Height = 21
          Brush.Color = 14869218
          Brush.Style = bsBDiagonal
          Pen.Style = psClear
        end
        object RLLabel11: TRLLabel
          Left = 526
          Top = 2
          Width = 141
          Height = 15
          Caption = 'TOTAL DEPARTAMENTO >'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBand10: TRLBand
      Left = 20
      Top = 193
      Width = 1083
      Height = 22
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Color = 15066597
      ParentColor = False
      Transparent = False
      object RLDBResult10: TRLDBResult
        Left = 696
        Top = 3
        Width = 140
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTAL_CONTA'
        DataSource = dsContasMensal
        DisplayMask = ' ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Holder = RLDBText10
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBResult11: TRLDBResult
        Left = 785
        Top = 4
        Width = 135
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_PAGO'
        DataSource = dsContasMensal
        DisplayMask = ' ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Holder = RLDBText11
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBResult12: TRLDBResult
        Left = 885
        Top = 3
        Width = 113
        Height = 16
        Alignment = taRightJustify
        DataField = 'RESTANTE'
        DataSource = dsContasMensal
        DisplayMask = ' ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Holder = RLDBText12
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLLabel12: TRLLabel
        Left = 528
        Top = 3
        Width = 139
        Height = 15
        Caption = 'TOTAL GERAL                   >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 68
    Align = alTop
    Color = 14732969
    ParentBackground = False
    TabOrder = 0
    object Shape1: TShape
      Left = 1
      Top = 1
      Width = 775
      Height = 31
      Align = alTop
      Brush.Color = 14073227
      Pen.Style = psClear
      ExplicitWidth = 665
    end
    object lbTitulo: TLabel
      Left = 10
      Top = 8
      Width = 231
      Height = 21
      Caption = 'Relat'#243'rio de contas a receber'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Calibri Light'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 18
      Top = 36
      Width = 418
      Height = 19
      Caption = 
        'Use os filtros seguintes para visualizar as informa'#231#245'es desejada' +
        's'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 263
    Width = 777
    Height = 45
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      777
      45)
    object btnImprimir: TBitBtn
      Left = 595
      Top = 8
      Width = 158
      Height = 30
      Anchors = [akTop, akRight]
      Caption = ' Visualizar'
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5BEC3035C8100
        5B84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFBCBCBC414141414141FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAFAFAF8F8F8F8
        F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
        FAFAFAFDFDFDB5BEC30C6E8C005B84005B84FFFFFFFFFFFFFFFFFFFFFFFFFDFD
        FDFAFAFAF8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
        F8F8F8F8F8F8F8F8FAFAFAFDFDFDBCBCBC4C4C4C414141414141FFFFFFFFFFFF
        FFFFFFFDFDFDEDEDEDCECECEB58158B48056B48055B47F55B47F55B48055B480
        55B47F55B38056B48056B48056B58158CECECEB4BABA0A5F7A0069910F6287CA
        CACAFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDCECECE868686838383838383838383
        838383838383838383838383838383838383838383868686CECECEB6B6B64141
        414848484B4B4BCACACAFFFFFFAAABAB7171716E6F6F5B5B5B333333B18057F3
        DEC5F4DEC5F3DDC5F3DEC5F4DDC5F4DEC5F3DEC5F4DEC5F3DDC5F3DEC7B27F57
        2A2A2A0A34480053770788B176797BFFFFFFFFFFFFAAAAAA7171716E6E6E5B5B
        5B333333838383DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDDDDDD8383832A2A2A2828283B3B3B5C5C5C787878FFFFFFFFFFFF686868
        6162625E5F5F4849491B1B1BB38158F9EADAF8EADAF8EADAF8E9DAF8EADAF8EA
        DAF2E4D4E4D6C7EDE0D1F8E9DAB381580053770053770685AE414B4F646565FF
        FFFFFFFFFF6868686161615E5E5E4848481B1B1B858585E9E9E9E9E9E9E9E9E9
        E9E9E9E9E9E9E9E9E9E3E3E3D5D5D5DFDFDFE9E9E98585853B3B3B3B3B3B5959
        59484848646464FFFFFFFFFFFF8E8F8F878888838484636464232323B4845BFB
        F1E7FBF2E7FBF1E7FBF1E7E6DDD5A088749A6C448E5F36A773459991766A6348
        003E4E042A3D5A62658788888B8C8CFFFFFFFFFFFF8E8E8E8787878383836363
        63232323878787F1F1F1F1F1F1F1F1F1F1F1F1DDDDDD8A8A8A6F6F6F61616176
        76768787875959592727272020205F5F5F8787878B8B8BFFFFFFFFFFFF949495
        8D8D8E89898A69696A272727B6875FFBF2E7FBF1E7FBF1E7DED6CCCFA06CF0DC
        C0F4E6D1F7ECDCF5E7D8F3E2CBE4CDAE23493E68686989898A8D8D8E919192FF
        FFFFFFFFFF9393938D8D8D8989896969692727278A8A8AF1F1F1F1F1F1F1F1F1
        D5D5D59D9D9DD8D8D8E2E2E2E9E9E9E6E6E6DFDFDFC9C9C93636366868688989
        898D8D8D919191FFFFFFFFFFFF9B9B9C95959692929378787943434429292A26
        26272626272626276D492BFCF9F5FCF8F4FFFFFFFFFFFFFFFFFFFEFBF8FCF8F4
        A48C6676767792929395959699999AFFFFFFFFFFFF9B9B9B9595959292927878
        784343432828282626262626262626264C4C4CF8F8F8F8F8F8FFFFFFFFFFFFFF
        FFFFFBFBFBF8F8F8838383767676929292959595999999FFFFFFFFFFFFA9A9AA
        A4A4A5A3A3A49898998484857A7A7B7979797979796C6B6BDBBB94F7EDDFFFFE
        FCFFFEFCFFFFFFFFFFFFFFFFFFF9F4EAF7EDDF7C7975A3A3A4A4A4A5A7A7A8FF
        FFFFFFFFFFA9A9A9A3A3A3A3A3A39898988383837979797979797979796B6B6B
        B7B7B7EBEBEBFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFF1F1F1EBEBEB787878A3A3
        A3A3A3A3A7A7A7FFFFFFFFFFFFBCBCBCB8B8B8B8B8B8B7B7B7B4B4B4B3B3B3B3
        B3B3B3B3B3979390E0BB8CF5E7D6FFFFFFFEFBF8FEFBF8FEFBF8FCF8F4FCF7F1
        F1DFC4948579B8B8B8B8B8B8BBBBBBFFFFFFFFFFFFBCBCBCB8B8B8B8B8B8B7B7
        B7B3B3B3B3B3B3B3B3B3B3B3B3939393B6B6B6E5E5E5FFFFFFFBFBFBFBFBFBFB
        FBFBF8F8F8F6F6F6DADADA868686B8B8B8B8B8B8BBBBBBFFFFFFFFFFFFCFCFCF
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCA9A5A1D3A46CEEDABCF7EC
        DCF7ECDCF8EEE1F7EDDFF9F3E7F8F0E3E2C093A19287EAEAEAEAEAEACECECEFF
        FFFFFFFFFFCFCFCFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCA3A3A3
        9F9F9FD5D5D5E9E9E9E9E9E9ECECECEBEBEBF0F0F0EDEDEDBABABA939393EAEA
        EAEAEAEACECECEFFFFFFFFFFFFDDDDDDDADADADADADADADADA3F3F3F3F3F3F3F
        3F3F3F3F3F3A3A3AAF7E49D4A66EE5C399E9CFA8EEDABCF5E9D8F7EADAE7CBA3
        CF9E65B1AEACC4C4C4C4C4C5DCDCDCFFFFFFFFFFFFDDDDDDDADADADADADADADA
        DA3F3F3F3F3F3F3F3F3F3F3F3F3A3A3A7C7C7CA1A1A1BFBFBFC8C8C8D5D5D5E6
        E6E6E8E8E8C3C3C39A9A9AAEAEAEC3C3C3C3C3C3DCDCDCFFFFFFFFFFFFE0E0E0
        DEDEDEDEDEDEDEDEDE494949626262747474909090B0B0B09C8A7EB57E43C791
        56D4A66EE6C79DF0DBBFDEB785BD864A74553BDEDEDE8B8C8B8B8B8BE0E0E0FF
        FFFFFFFFFFE0E0E0DEDEDEDEDEDEDEDEDE494949616161747474909090B0B0B0
        8D8D8D7C7C7C8E8E8EA1A1A1C1C1C1D7D7D7B1B1B1838383575757DEDEDE8B8B
        8B8B8B8BE0E0E0FFFFFFFFFFFFD0D0D0CDCDCDCDCDCDCDCDCD53545462626275
        7574909090B0B0B0CECECFAD9785AB723BB37A40BD874BBD864AAE743B826349
        4F4F50CDCDCDCDCDCDCDCDCDCFCFCFFFFFFFFFFFFFD0D0D0CDCDCDCDCDCDCDCD
        CD535353616161747474909090B0B0B0CECECE99999971717179797983838383
        83837474746565654F4F4FCDCDCDCDCDCDCDCDCDCFCFCFFFFFFFFFFFFF979797
        7070707070706F6F6F5E5E5E5E5D5E5D5D5D5E5E5E5E5E5E5E5E5E5E5E5E605B
        587E6A568A6A4A856F58665F5A5E5E5E5E5E5E6F6F6F7070707070708E8E8EFF
        FFFFFFFFFF9797977070707070706F6F6F5E5E5E5D5D5D5D5D5D5E5E5E5E5E5E
        5E5E5E5E5E5E5C5C5C6969696969696E6E6E6060605E5E5E5E5E5E6F6F6F7070
        707070708E8E8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF909090777777CDA882F6
        EDE6F5EEE6F6EDE7F5EEE7F6EEE7F6EDE7F6EEE7F5EEE6F6EDE7F5EEE6CDA782
        777777909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9090
        90777777A7A7A7EEEEEEEDEDEDEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEDEDEDEE
        EEEEEDEDEDA7A7A7777777909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8C8C8C7A7A7ACFAB86F4EDE5F4EDE6F4EDE5F4EDE5F5EDE5F4ED
        E6F4EDE6F5EDE5F4EDE6F5EDE6CFAA867A7A7A8C8C8CFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8C8C797979AAAAAAECECECEDEDEDECECEC
        ECECECEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDAAAAAA7979798C8C8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A7C7B7CD1AD89F4
        ECE5F4ECE4F4ECE5F4ECE5F4ECE5F4ECE4F4ECE5F4ECE4F4ECE4F4ECE4D1AD89
        7C7B7C8A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A
        8A7B7B7BADADADECECECEBEBEBECECECECECECECECECEBEBEBECECECEBEBEBEB
        EBEBEBEBEBADADAD7B7B7B8A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8888887C7C7CD3B08CF3EBE3F3EBE3F3EBE3F3EBE4F4EBE4F3EC
        E4F4ECE3F3EBE4F3EBE3F4EBE3D3B18C7C7C7C888888FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8888887C7C7CAFAFAFEBEBEBEBEBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBAFAFAF7C7C7C888888FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9393937C7C7CD4B38FF1
        E9E0F2E9DFF2E9E0F2E9DFF2E8DFF2E9DFF2E9DFF1E9E0F2E9E0F2E9DFD5B38F
        7C7C7C939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9393
        937C7C7CB1B1B1E8E8E8E8E8E8E9E9E9E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E9
        E9E9E8E8E8B2B2B27C7C7C939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF9F9F9868686D5B591EFE3D5F0E3D5F0E3D5EFE3D5EFE3D5EFE3
        D5F0E3D6EFE3D5F0E3D6F0E3D5D6B691868686F9F9F9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9868686B3B3B3E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E3E3E3E2E2E2E3E3E3E2E2E2B3B3B3868686F9F9F9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D9BA96EE
        DFCDEEDFCDEEDFCDEEDFCDEEDFCDEEDECEEEDFCDEEDFCDEEDFCEEEDFCED9BB96
        F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF6F6F6B7B7B7DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDEDEDEDDDDDDDDDDDDDE
        DEDEDEDEDEB7B7B7F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDBBC99DABA96DABA96DABA96DABA96DABA96DABA
        96DABA96DABA96DABA96DABA96DBBC99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABABAB8B8B8B8B8B8B8B8B8
        B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8BABABAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnImprimirClick
    end
    object btnVoltar: TBitBtn
      Left = 419
      Top = 8
      Width = 158
      Height = 30
      Anchors = [akTop, akRight]
      Caption = ' Voltar'
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF638EB45B8AB35F8CB45E8CB35E8CB35E8CB35E8CB35E8CB35E8BB35D8B
        B35D8BB35D8BB35D8BB35D8BB35D8BB35C8BB35E8CB35D8BB3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8B8B8B878787898989888888888888888888888888
        8888888888888888888888888888888888888888888888888787878888888888
        88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6093BEA1DDEFA1DEEFA1DDEFA0
        DDEFA1DDEF1331801F60CD276ED9276ED91F60CD133180A0DEEFA0DEEFA1DDF0
        A1DDF0A1DDEF5A90BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FC8C8
        C8C8C8C8C8C8C8C7C7C7C8C8C8494949767676808080808080767676494949C7
        C7C7C7C7C7C8C8C8C8C8C8C8C8C88C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6194BE9EDCF05EB0EB5BAEEA58ACEA53AAE91331802561C82E70D52E70
        D52561C813318053AAE958ACEA5BAEEA5EB0EB9FDCF05E91BEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8F8F8FC7C7C7A3A3A3A2A2A2A1A1A19E9E9E494949
        7676768181818181817676764949499E9E9EA1A1A1A2A2A2A3A3A3C7C7C78E8E
        8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6392BA9CD9F064B4EC60B2EB5C
        AFEB59AEEA133180215BC32B6BD12B6BD1215BC313318059AEEA5CAFEB60B2EB
        64B4EC9CDAF06091BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8EC6C6
        C6A8A8A8A5A5A5A3A3A3A1A1A14949497171717E7E7E7E7E7E717171494949A1
        A1A1A3A3A3A5A5A5A8A8A8C6C6C68D8D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6593BB98D6F16AB7ED66B5ED62B2EC5FB0EB1331801F55BF2A68CF2A68
        CF1F55BF1331805FB0EB62B2EC66B5ED6AB7ED99D7F16191BAFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF909090C3C3C3ABABABA9A9A9A7A7A7A3A3A3494949
        6F6F6F7C7C7C7C7C7C6F6F6F494949A3A3A3A7A7A7A9A9A9ABABABC3C3C38D8D
        8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6994B995D3F170BBEF6CB8EE68
        B5ED63B1EC1331801C50BA2763C92763C91C50BA13318063B1EC68B5ED6CB8EE
        70BBEF95D4F26190B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919191C3C3
        C3AFAFAFADADADAAAAAAA7A7A7494949696969787878787878696969494949A7
        A7A7AAAAAAADADADAFAFAFC3C3C38C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6A92B593D2F276BEF071BBF06EB9EE68B5ED1331801A4EB82560C72560
        C71A4EB813318068B5ED6EB9EE71BBF076BEF093D1F2628EB4FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8F8F8FC2C2C2B3B3B3B0B0B0AEAEAEAAAAAA494949
        696969767676767676696969494949AAAAAAAEAEAEB0B0B0B3B3B3C2C2C28B8B
        8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6992B590CFF37CC2F277BFF174
        BCF06EB8ED13318013399F1C48AD1C48AD13399F1331806EB8ED74BCF077BFF1
        7CC2F291CFF3628EB4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FC1C1
        C1B7B7B7B3B3B3B2B2B2ADADAD494949595959646464646464595959494949AD
        ADADB2B2B2B3B3B3B7B7B7C2C2C28B8B8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6690B58CCDF381C5F37EC3F279C0F174BBEF1331801331801331801331
        8013318013318074BBEF79C0F17EC3F281C5F38CCDF3618DB4FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8D8D8DBFBFBFBABABAB8B8B8B3B3B3B1B1B1494949
        494949494949494949494949494949B1B1B1B3B3B3B8B8B8BABABABFBFBF8A8A
        8AFFFFFFFFFFFFFFFFFFFFFFFF658FB46790B46992B68ACCF488C9F483C7F37F
        C4F27BC1F278BFF174BDF06AB5ED70BAEF74BDF078BFF17BC1F27FC4F283C7F3
        88C9F48ACCF46891B5608DB4608DB4FFFFFFFFFFFF8C8C8C8D8D8D8F8F8FBFBF
        BFBEBEBEBBBBBBB8B8B8B6B6B6B3B3B3B2B2B2ABABABAFAFAFB2B2B2B3B3B3B6
        B6B6B8B8B8BBBBBBBEBEBEBFBFBF8E8E8E8A8A8A8A8A8AFFFFFFFFFFFF1B53C1
        1A49B0173B9586C4F18DCCF589CAF585C8F381C4F37EC2F2AE7A3DA26F339564
        298A591F7EC2F281C4F385C8F389CAF58DCCF584C2EF173B951A49B01B53C1FF
        FFFFFFFFFF6D6D6D656565565656BBBBBBC1C1C1BFBFBFBCBCBCBABABAB8B8B8
        7575756969695F5F5F545454B8B8B8BABABABCBCBCBFBFBFC1C1C1B9B9B95656
        566565656D6D6DFFFFFFFFFFFFFFFFFF1B53C11A4AAF1B449C86C5F18FCEF68B
        CBF487CAF483C7F3BA8547D0A065CB945496632983C7F387CAF48BCBF48FCEF6
        84C3EF1B449C1A4AAF1B53C1FFFFFFFFFFFFFFFFFFFFFFFF6D6D6D6464645B5B
        5BBBBBBBC2C2C2BFBFBFBDBDBDBBBBBB8080809A9A9A8F8F8F5F5F5FBBBBBBBD
        BDBDBFBFBFC2C2C2B9B9B95B5B5B6464646D6D6DFFFFFFFFFFFFFFFFFFFCFCFC
        F4F4F41B53C2184AB11B459C7DBCEC90CEF68DCCF589CAF4C38E4ED6AD76D1A2
        68A26F3289CAF48DCCF590CEF67CBBEB1B459C184AB11B53C2FEFEFEFFFFFFFF
        FFFFFFFFFFFCFCFCF3F3F36E6E6E6464645B5B5BB3B3B3C3C3C3C1C1C1BEBEBE
        888888A6A6A69C9C9C696969BEBEBEC1C1C1C3C3C3B3B3B35B5B5B6464646E6E
        6EFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEE6F61B53C31A4AB21B459D7E
        BCEC92CFF68FCEF6CB9454C48E4FBA8546AE7B3D8FCEF692CFF67DBBEA1B459D
        1A4AB21B53C3DEE6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEA6E6E
        6E6565655C5C5CB5B5B5C3C3C3C2C2C28F8F8F898989808080757575C2C2C2C3
        C3C3B3B3B35C5C5C6565656E6E6EEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF6EB6EC1B54C31A4AB019429B7EBCEC94D1F791CEF688CAF48DCD
        F591CEF694D1F77DBBEA19429B1A4AB01B54C3F0F4FBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFADADAD6E6E6E656565595959B5B5B5C5C5C5
        C3C3C3BEBEBEC1C1C1C3C3C3C5C5C5B3B3B35959596565656E6E6EF5F5F5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EC3F171BAEF1B54C318
        4AB01B429B81BDEB96D2F78FCEF692D0F796D2F77EBBE81B429B184AB01B54C3
        F8FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7
        B7B0B0B06E6E6E646464595959B5B5B5C6C6C6C2C2C2C3C3C3C6C6C6B3B3B359
        59596464646E6E6EFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF87C8F47EC2F273BCEE1B56C3184AB219439A82BCE998D3F798D3
        F77EB9E619439A184AB21B56C3FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBDB8B8B8B0B0B06E6E6E656565595959
        B5B5B5C7C7C7C7C7C7B2B2B25959596565656E6E6EFEFEFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8DCCF587C9F47EC2F2FF
        FFFF1B53C31A4AB119429979B1E072AAD91942991A4AB11B53C3FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1
        C1BDBDBDB8B8B8FFFFFF6E6E6E656565595959ACACACA5A5A55959596565656E
        6E6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8DCCF58DCCF587C9F3FFFFFFFFFFFF1C59CF1B4BAF1632841632
        841B4BAF1C59CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1C1C1C1C1BDBDBDFFFFFFFFFFFF757575
        6565654D4D4D4D4D4D656565757575FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B46A21B4AAA1B4EB31B50BB1B
        53C1FFFFFFFFFFFF1C58CC1B48AC1B48AC1C58CCFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5E5E6161
        616666666969696D6D6DFFFFFFFFFFFF747474636363636363747474FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF1B4EB41B50BC1B53C11B53C11B53C1FFFFFFFFFFFFF2F2F22B63CF2B63
        CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF6767676B6B6B6D6D6D6D6D6D6D6D6DFFFFFFFFFFFF
        F2F2F27D7D7D7D7D7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnVoltarClick
    end
  end
  object Panel3: TPanel
    Left = 12
    Top = 74
    Width = 1121
    Height = 89
    BevelOuter = bvNone
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 310
      Top = 0
      Width = 13
      Height = 89
      ExplicitLeft = 311
      ExplicitTop = 1
      ExplicitHeight = 87
    end
    object Splitter2: TSplitter
      Left = 439
      Top = 0
      Width = 13
      Height = 89
      ExplicitLeft = 440
      ExplicitTop = 1
      ExplicitHeight = 87
    end
    object gpbStatus: TGroupBox
      Left = 323
      Top = 0
      Width = 116
      Height = 89
      Align = alLeft
      Caption = ' Filtro Status '
      TabOrder = 0
      object chkQuitadas: TCheckBox
        Left = 18
        Top = 24
        Width = 93
        Height = 17
        Caption = 'QUITADAS'
        TabOrder = 0
      end
      object chkParciais: TCheckBox
        Left = 18
        Top = 43
        Width = 93
        Height = 17
        Caption = 'PARCIAIS'
        TabOrder = 1
      end
      object chkEmAberto: TCheckBox
        Left = 18
        Top = 62
        Width = 93
        Height = 17
        Caption = 'EM ABERTO'
        TabOrder = 2
      end
    end
    object gpbPeriodoDiario: TGroupBox
      Left = 452
      Top = 0
      Width = 297
      Height = 89
      Align = alLeft
      Caption = ' Filtro Per'#237'odo '
      TabOrder = 1
      inline Periodo1: TPeriodo
        Left = 13
        Top = 19
        Width = 275
        Height = 62
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 13
        ExplicitTop = 19
      end
    end
    object GroupBox3: TGroupBox
      Left = 0
      Top = 0
      Width = 310
      Height = 89
      Align = alLeft
      Caption = ' '
      TabOrder = 2
      inline BuscaDepartamento1: TBuscaDepartamento
        Left = 3
        Top = 10
        Width = 293
        Height = 58
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2697513
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 10
        ExplicitHeight = 58
        inherited edtDepartamento: TEdit
          OnChange = BuscaDepartamento1edtDepartamentoChange
        end
      end
    end
    object gpbPeriodoMensal: TGroupBox
      Left = 749
      Top = 0
      Width = 351
      Height = 89
      Align = alLeft
      Caption = 'Filtro Per'#237'odo '
      TabOrder = 3
      Visible = False
      object Label2: TLabel
        Left = 23
        Top = 24
        Width = 27
        Height = 18
        Caption = 'Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3487029
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape2: TShape
        Left = 104
        Top = 17
        Width = 1
        Height = 65
        Pen.Color = 14671839
      end
      object Label1: TLabel
        Left = 118
        Top = 24
        Width = 38
        Height = 18
        Caption = 'In'#237'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3487029
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 232
        Top = 24
        Width = 25
        Height = 18
        Caption = 'Fim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3487029
        Font.Height = -15
        Font.Name = 'Calibri Light'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cmbAno: TComboBox
        Left = 24
        Top = 43
        Width = 57
        Height = 26
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = '2016'
        Items.Strings = (
          '2016'
          '2017'
          '2018'
          '2019'
          '2020'
          '2021'
          '2022'
          '2023'
          '2024'
          '2025'
          '2026'
          '2027'
          '2028'
          '2029'
          '2030')
      end
      object cmbIni: TComboBox
        Left = 120
        Top = 43
        Width = 97
        Height = 26
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = 'JANEIRO'
        OnChange = cmbIniChange
        Items.Strings = (
          'JANEIRO'
          'FEVEREIRO'
          'MAR'#199'O'
          'ABRIL'
          'MAIO'
          'JUNHO'
          'JULHO'
          'AGOSTO'
          'SETEMBRO'
          'OUTUBRO'
          'NOVEMBRO'
          'DEZEMBRO')
      end
      object cmbFim: TComboBox
        Left = 232
        Top = 43
        Width = 97
        Height = 26
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 2
        Text = 'JANEIRO'
        OnChange = cmbFimChange
        Items.Strings = (
          'JANEIRO'
          'FEVEREIRO'
          'MAR'#199'O'
          'ABRIL'
          'MAIO'
          'JUNHO'
          'JULHO'
          'AGOSTO'
          'SETEMBRO'
          'OUTUBRO'
          'NOVEMBRO'
          'DEZEMBRO')
      end
    end
  end
  object qryContas: TFDQuery
    OnCalcFields = qryContasCalcFields
    SQL.Strings = (
      'select c.*, p.*, SPA.id_departamento from contas c'
      'inner join parcelas p on p.id_conta = c.id'
      'inner join SPA on SPA.id = c.id_spa'
      
        'where SPA.id_departamento = :id_dpto and p.dt_vencimento between' +
        ' :dti and :dtf')
    Left = 48
    Top = 160
    ParamData = <
      item
        Name = 'ID_DPTO'
        ParamType = ptInput
      end
      item
        Name = 'DTI'
        ParamType = ptInput
      end
      item
        Name = 'DTF'
        ParamType = ptInput
      end>
    object qryContasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 12
    end
    object qryContasID_DEPARTAMENTO: TIntegerField
      FieldName = 'ID_DEPARTAMENTO'
    end
    object qryContasDEPARTAMENTO: TStringField
      FieldName = 'DEPARTAMENTO'
      Size = 30
    end
    object qryContasPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 50
    end
    object qryContasFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object qryContasTOTAL_CONTA: TBCDField
      FieldName = 'TOTAL_CONTA'
      DisplayFormat = ' ,0.00'
      Size = 2
    end
    object qryContasVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = ' ,0.00'
      Size = 2
    end
    object qryContasRESTANTE: TBCDField
      FieldKind = fkCalculated
      FieldName = 'RESTANTE'
      DisplayFormat = ' ,0.00'
      Calculated = True
    end
  end
  object dsContas: TDataSource
    DataSet = qryContas
    Left = 104
    Top = 160
  end
  object dsContasMensal: TDataSource
    DataSet = qryContasMensal
    Left = 104
    Top = 216
  end
  object qryContasMensal: TFDQuery
    OnCalcFields = qryContasMensalCalcFields
    SQL.Strings = (
      'select c.*, p.*, SPA.id_departamento from contas c'
      'inner join parcelas p on p.id_conta = c.id'
      'inner join SPA on SPA.id = c.id_spa'
      
        'where SPA.id_departamento = :id_dpto and p.dt_vencimento between' +
        ' :dti and :dtf')
    Left = 48
    Top = 216
    ParamData = <
      item
        Name = 'ID_DPTO'
        ParamType = ptInput
      end
      item
        Name = 'DTI'
        ParamType = ptInput
      end
      item
        Name = 'DTF'
        ParamType = ptInput
      end>
    object qryContasMensalPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 50
    end
    object qryContasMensalFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object qryContasMensalTOTAL_CONTA: TBCDField
      FieldName = 'TOTAL_CONTA'
      DisplayFormat = ' ,0.00'
      Size = 2
    end
    object qryContasMensalVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = ' ,0.00'
      Size = 2
    end
    object qryContasMensalRESTANTE: TBCDField
      FieldKind = fkCalculated
      FieldName = 'RESTANTE'
      DisplayFormat = ' ,0.00'
      Calculated = True
    end
    object qryContasMensalMES: TSmallintField
      FieldName = 'MES'
    end
    object qryContasMensalANO: TSmallintField
      FieldName = 'ANO'
    end
    object qryContasMensalSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 30
    end
    object qryContasMensalPRESENCA: TSmallintField
      FieldName = 'PRESENCA'
    end
    object qryContasMensalFALTA: TSmallintField
      FieldName = 'FALTA'
    end
    object qryContasMensalCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
    object qryContasMensalREPOSTO: TSmallintField
      FieldName = 'REPOSTO'
    end
  end
end

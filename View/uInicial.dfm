object frmInicial: TfrmInicial
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'frmInicial'
  ClientHeight = 430
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 256
    Top = 128
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\User\Desktop\Projeto\Base\BASE.FDB'
      'ConnectionDef=FIREDAC')
    Left = 392
    Top = 80
  end
end

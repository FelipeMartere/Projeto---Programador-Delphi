object MainForm: TMainForm
  Left = 1973
  Top = 58
  Width = 1305
  Height = 728
  Caption = 'Tabela de Aplica'#231#227'o Rasther'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 72
    Top = 16
    Width = 236
    Height = 24
    Caption = 'Escolha uma das categorias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 16
    Top = 128
    Width = 99
    Height = 24
    Caption = 'Montadoras'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 264
    Top = 128
    Width = 73
    Height = 24
    Caption = 'Veiculos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btn1: TButton
    Left = 128
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Enviar GET'
    TabOrder = 0
    OnClick = btn1Click
  end
  object cbb1: TComboBox
    Left = 72
    Top = 56
    Width = 225
    Height = 21
    ItemHeight = 13
    MaxLength = 50
    TabOrder = 1
  end
  object lst1: TListBox
    Left = 16
    Top = 160
    Width = 233
    Height = 497
    ItemHeight = 13
    TabOrder = 2
    OnClick = lst1Click
  end
  object pnl1: TPanel
    Left = 336
    Top = 40
    Width = 185
    Height = 41
    Caption = 'pnl1'
    TabOrder = 3
  end
  object lst2: TListBox
    Left = 264
    Top = 160
    Width = 233
    Height = 497
    ItemHeight = 13
    TabOrder = 4
    OnClick = lst1Click
  end
  object pnl2: TPanel
    Left = 536
    Top = 40
    Width = 185
    Height = 41
    Caption = 'pnl2'
    TabOrder = 5
  end
  object idhtp1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 16
    Top = 8
  end
end

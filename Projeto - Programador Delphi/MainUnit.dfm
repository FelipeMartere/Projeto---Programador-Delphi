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
    Left = 256
    Top = 88
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
    Left = 608
    Top = 96
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
  object btn1: TButton
    Left = 256
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Enviar GET'
    TabOrder = 0
    OnClick = btn1Click
  end
  object cbb1: TComboBox
    Left = 256
    Top = 128
    Width = 225
    Height = 21
    ItemHeight = 13
    MaxLength = 50
    TabOrder = 1
  end
  object lst1: TListBox
    Left = 608
    Top = 128
    Width = 233
    Height = 281
    ItemHeight = 13
    TabOrder = 2
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

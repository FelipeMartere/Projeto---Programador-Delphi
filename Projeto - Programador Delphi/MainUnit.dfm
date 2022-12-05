object MainForm: TMainForm
  Left = 1973
  Top = 58
  Width = 1305
  Height = 728
  Caption = 'i'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
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
    Visible = False
  end
  object lbl4: TLabel
    Left = 496
    Top = 128
    Width = 102
    Height = 24
    Caption = 'Motoriza'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lbl5: TLabel
    Left = 744
    Top = 128
    Width = 75
    Height = 24
    Caption = 'Sistemas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object cbb1: TComboBox
    Left = 72
    Top = 56
    Width = 225
    Height = 21
    ItemHeight = 13
    MaxLength = 50
    TabOrder = 0
    OnChange = cbb1Change
  end
  object pnl1: TPanel
    Left = 336
    Top = 40
    Width = 185
    Height = 41
    Caption = 'pnl1'
    TabOrder = 1
  end
  object pnl2: TPanel
    Left = 536
    Top = 40
    Width = 185
    Height = 41
    Caption = 'pnl2'
    TabOrder = 2
  end
  object btn2: TButton
    Left = 1152
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Enviar Tabela'
    TabOrder = 3
    OnClick = btn2Click
  end
  object pnl3: TPanel
    Left = 752
    Top = 40
    Width = 185
    Height = 41
    Caption = 'pnl3'
    TabOrder = 4
  end
  object lvMontadoras: TListView
    Left = 8
    Top = 160
    Width = 225
    Height = 513
    Columns = <
      item
        Caption = 'ID'
        Width = 0
      end
      item
        Width = 225
      end>
    ColumnClick = False
    RowSelect = True
    TabOrder = 5
    ViewStyle = vsReport
    OnSelectItem = lvMontadorasSelectItem
  end
  object lvVeiculos: TListView
    Left = 248
    Top = 160
    Width = 225
    Height = 513
    Columns = <
      item
        Caption = 'ID'
      end
      item
        Width = 225
      end>
    ColumnClick = False
    RowSelect = True
    TabOrder = 6
    ViewStyle = vsReport
    Visible = False
    OnSelectItem = lvVeiculosSelectItem
  end
  object lvMotorizacao: TListView
    Left = 496
    Top = 160
    Width = 225
    Height = 513
    Columns = <
      item
        Caption = 'ID'
      end
      item
        Width = 225
      end>
    ColumnClick = False
    RowSelect = True
    TabOrder = 7
    ViewStyle = vsReport
    Visible = False
    OnSelectItem = lvMotorizacaoSelectItem
  end
  object lvSistemas: TListView
    Left = 744
    Top = 160
    Width = 225
    Height = 513
    Columns = <
      item
        Caption = 'ID'
      end
      item
        Width = 225
      end>
    ColumnClick = False
    RowSelect = True
    TabOrder = 8
    ViewStyle = vsReport
    Visible = False
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

object MainForm: TMainForm
  Left = 1996
  Top = 65
  Width = 1310
  Height = 701
  Caption = ' Tabela de Aplica'#231#227'o- Rasther'
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
    Width = 154
    Height = 24
    Caption = 'Tipos de Sistemas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lbl6: TLabel
    Left = 992
    Top = 128
    Width = 80
    Height = 24
    Caption = ' Sistemas'
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
    TabOrder = 1
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
        Width = 0
      end
      item
        Width = 225
      end>
    ColumnClick = False
    RowSelect = True
    TabOrder = 2
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
        Width = 0
      end
      item
        Width = 225
      end>
    ColumnClick = False
    RowSelect = True
    TabOrder = 3
    ViewStyle = vsReport
    Visible = False
    OnSelectItem = lvMotorizacaoSelectItem
  end
  object lvTipoSistemas: TListView
    Left = 744
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
    TabOrder = 4
    ViewStyle = vsReport
    Visible = False
    OnSelectItem = lvTipoSistemasSelectItem
  end
  object lvSistemas: TListView
    Left = 992
    Top = 158
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
    Visible = False
    OnSelectItem = lvSistemasSelectItem
  end
  object edt1: TEdit
    Left = 464
    Top = 16
    Width = 409
    Height = 21
    TabOrder = 6
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

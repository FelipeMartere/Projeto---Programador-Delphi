object MainForm: TMainForm
  Left = 2062
  Top = 117
  Width = 1258
  Height = 762
  Caption = ' Tabela de Aplica'#231#227'o- Rasther'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
    Visible = False
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
  object SobrePanel: TPanel
    Left = 410
    Top = 160
    Width = 473
    Height = 361
    Color = cl3DLight
    TabOrder = 7
    Visible = False
    OnClick = SobrePanelClick
    object lbl7: TLabel
      Left = 112
      Top = 128
      Width = 278
      Height = 72
      Caption = 
        '                                          '#13#10'Projeto desenvolvido' +
        ' como teste.'#13#10'Vers'#227'o: 1.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 112
      Top = 24
      Width = 253
      Height = 24
      Caption = 'Tabela de Aplica'#231#227'o - Rasther'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn1: TButton
      Left = 200
      Top = 304
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btn1Click
    end
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
    TabOrder = 0
    ViewStyle = vsReport
    Visible = False
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
    TabOrder = 1
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
    TabOrder = 2
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
    TabOrder = 3
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
    TabOrder = 4
    ViewStyle = vsReport
    Visible = False
    OnSelectItem = lvSistemasSelectItem
  end
  object stat1: TStatusBar
    Left = 0
    Top = 684
    Width = 1242
    Height = 19
    Panels = <>
  end
  object MainPanel: TPanel
    Left = 408
    Top = 137
    Width = 473
    Height = 361
    Color = cl3DLight
    TabOrder = 6
    Visible = False
    object lbl1: TLabel
      Left = 125
      Top = 80
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
    object cbb1: TComboBox
      Left = 128
      Top = 120
      Width = 225
      Height = 21
      Color = cl3DLight
      ItemHeight = 13
      MaxLength = 50
      TabOrder = 0
      OnChange = cbb1Change
    end
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
    Left = 1192
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 1120
    Top = 24
    object A1: TMenuItem
      Caption = 'Arquivo'
      object N1: TMenuItem
        Caption = 'Nova Consulta'
        OnClick = N1Click
      end
    end
    object S1: TMenuItem
      Caption = 'Sobre'
      OnClick = S1Click
    end
  end
end

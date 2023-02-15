object FormPedido: TFormPedido
  Left = 0
  Top = 0
  Caption = 'Pedido do dia'
  ClientHeight = 402
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    980
    402)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 73
    Top = 85
    Width = 79
    Height = 13
    Caption = 'Card'#225'pio do dia:'
  end
  object Label2: TLabel
    Left = 8
    Top = 107
    Width = 30
    Height = 13
    Caption = 'Arroz:'
  end
  object Label3: TLabel
    Left = 8
    Top = 134
    Width = 33
    Height = 13
    Caption = 'Feij'#227'o:'
  end
  object Label4: TLabel
    Left = 8
    Top = 161
    Width = 33
    Height = 13
    Caption = 'Carne:'
  end
  object Label5: TLabel
    Left = 8
    Top = 188
    Width = 52
    Height = 13
    Caption = 'Guarni'#231#227'o:'
  end
  object Label6: TLabel
    Left = 8
    Top = 215
    Width = 36
    Height = 13
    Caption = 'Salada:'
  end
  object Label7: TLabel
    Left = 8
    Top = 242
    Width = 47
    Height = 13
    Caption = '2'#170' op'#231#227'o:'
  end
  object DBText1: TDBText
    Left = 352
    Top = 69
    Width = 200
    Height = 17
    DataField = 'NomePessoa'
    DataSource = DSPedido
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 680
    Top = 23
    Width = 27
    Height = 13
    Caption = 'Hora:'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 73
    Top = 23
    Width = 97
    Height = 21
    Date = 44971.000000000000000000
    Time = 0.792449201391718800
    Enabled = False
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 72
    Top = 104
    Width = 200
    Height = 21
    DataField = 'OPC1'
    DataSource = DSCardapio
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 72
    Top = 131
    Width = 200
    Height = 21
    DataField = 'OPC2'
    DataSource = DSCardapio
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 72
    Top = 158
    Width = 200
    Height = 21
    DataField = 'OPC3'
    DataSource = DSCardapio
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 72
    Top = 185
    Width = 200
    Height = 21
    DataField = 'OPC4'
    DataSource = DSCardapio
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 72
    Top = 212
    Width = 200
    Height = 21
    DataField = 'OPC5'
    DataSource = DSCardapio
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 72
    Top = 239
    Width = 200
    Height = 21
    DataField = 'OPC6'
    DataSource = DSCardapio
    TabOrder = 6
  end
  object Button3: TButton
    Left = 72
    Top = 280
    Width = 200
    Height = 33
    Caption = 'Atualizar'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 352
    Top = 8
    Width = 200
    Height = 33
    Caption = 'Inicializar pedidos'
    TabOrder = 8
    OnClick = Button4Click
  end
  object DBEdit7: TDBEdit
    Left = 352
    Top = 104
    Width = 200
    Height = 21
    DataField = 'Prato1'
    DataSource = DSPedido
    TabOrder = 9
  end
  object DBEdit8: TDBEdit
    Left = 352
    Top = 131
    Width = 200
    Height = 21
    DataField = 'Prato2'
    DataSource = DSPedido
    TabOrder = 10
  end
  object DBEdit9: TDBEdit
    Left = 352
    Top = 158
    Width = 200
    Height = 21
    DataField = 'Prato3'
    DataSource = DSPedido
    TabOrder = 11
  end
  object DBEdit10: TDBEdit
    Left = 352
    Top = 185
    Width = 200
    Height = 21
    DataField = 'Prato4'
    DataSource = DSPedido
    TabOrder = 12
  end
  object DBEdit11: TDBEdit
    Left = 352
    Top = 212
    Width = 200
    Height = 21
    DataField = 'Prato5'
    DataSource = DSPedido
    TabOrder = 13
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 352
    Top = 246
    Width = 89
    Height = 67
    Caption = 'Tamanho'
    DataField = 'Tamanho'
    DataSource = DSPedido
    Items.Strings = (
      'Pequeno'
      'Grande')
    TabOrder = 14
    Values.Strings = (
      'P'
      'G')
  end
  object Button5: TButton
    Left = 558
    Top = 60
    Width = 41
    Height = 33
    Caption = '>'
    TabOrder = 16
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 305
    Top = 60
    Width = 41
    Height = 33
    Caption = '<'
    TabOrder = 17
    OnClick = Button6Click
  end
  object DBCheckBox1: TDBCheckBox
    Left = 352
    Top = 46
    Width = 97
    Height = 17
    Caption = 'Pedir'
    DataField = 'Pedir'
    DataSource = DSPedido
    TabOrder = 18
    OnClick = DBCheckBox1Click
  end
  object Button7: TButton
    Left = 464
    Top = 351
    Width = 88
    Height = 33
    Caption = 'Atualizar'
    TabOrder = 15
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 558
    Top = 103
    Width = 75
    Height = 22
    Caption = 'Limpar'
    TabOrder = 19
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 558
    Top = 131
    Width = 75
    Height = 22
    Caption = 'Limpar'
    TabOrder = 20
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 558
    Top = 157
    Width = 75
    Height = 22
    Caption = 'Limpar'
    TabOrder = 21
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 558
    Top = 184
    Width = 75
    Height = 22
    Caption = 'Limpar'
    TabOrder = 22
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 558
    Top = 212
    Width = 75
    Height = 22
    Caption = 'Limpar'
    TabOrder = 23
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 728
    Top = 351
    Width = 193
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = 'Copiar texto WhatsApp'
    TabOrder = 24
    OnClick = Button13Click
  end
  object Memo1: TMemo
    Left = 680
    Top = 60
    Width = 281
    Height = 285
    Anchors = [akLeft, akTop, akBottom]
    Lines.Strings = (
      '')
    TabOrder = 25
  end
  object Edit1: TEdit
    Left = 713
    Top = 20
    Width = 41
    Height = 21
    TabOrder = 26
    Text = '12:00'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 352
    Top = 328
    Width = 161
    Height = 17
    Caption = 'Selecionar segunda op'#231#227'o'
    DataField = 'SegOpc'
    DataSource = DSPedido
    TabOrder = 27
    OnClick = DBCheckBox2Click
  end
  object Button1: TButton
    Left = 352
    Top = 351
    Width = 88
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 28
    OnClick = Button1Click
  end
  object DSCardapio: TDataSource
    DataSet = FDQueryCardapio
    OnStateChange = DSCardapioStateChange
    Left = 144
    Top = 48
  end
  object FDQueryCardapio: TFDQuery
    Connection = dm.FDConnection1
    SQL.Strings = (
      'SELECT * FROM TbCardapioDia;')
    Left = 224
    Top = 48
    object FDQueryCardapioDia: TDateField
      FieldName = 'Dia'
      Origin = 'Dia'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryCardapioOPC1: TWideStringField
      FieldName = 'OPC1'
      Origin = 'OPC1'
      Size = 40
    end
    object FDQueryCardapioOPC2: TWideStringField
      FieldName = 'OPC2'
      Origin = 'OPC2'
      Size = 40
    end
    object FDQueryCardapioOPC3: TWideStringField
      FieldName = 'OPC3'
      Origin = 'OPC3'
      Size = 40
    end
    object FDQueryCardapioOPC4: TWideStringField
      FieldName = 'OPC4'
      Origin = 'OPC4'
      Size = 40
    end
    object FDQueryCardapioOPC5: TWideStringField
      FieldName = 'OPC5'
      Origin = 'OPC5'
      Size = 40
    end
    object FDQueryCardapioOPC6: TWideStringField
      FieldName = 'OPC6'
      Origin = 'OPC6'
      Size = 40
    end
  end
  object DSPedido: TDataSource
    DataSet = FDQueryPedido
    OnStateChange = DSPedidoStateChange
    OnDataChange = DSPedidoDataChange
    Left = 568
    Top = 280
  end
  object FDQueryPedido: TFDQuery
    Connection = dm.FDConnection1
    SQL.Strings = (
      
        'SELECT IdPedido, Pessoa, DataPedido, Pedir, Tamanho, Prato1, Pra' +
        'to2, Prato3, Prato4, Prato5, SegOpc, NomePessoa FROM TbPedido'
      
        'LEFT JOIN (SELECT IdPessoa, NomePessoa, Ordem FROM TbPessoas) ON' +
        ' IdPessoa = Pessoa'
      'ORDER BY Ordem;')
    Left = 624
    Top = 280
    object FDQueryPedidoIdPedido: TFDAutoIncField
      FieldName = 'IdPedido'
      Origin = 'IdPedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQueryPedidoPessoa: TIntegerField
      FieldName = 'Pessoa'
      Origin = 'Pessoa'
      Required = True
    end
    object FDQueryPedidoDataPedido: TDateField
      FieldName = 'DataPedido'
      Origin = 'DataPedido'
      Required = True
    end
    object FDQueryPedidoPedir: TBooleanField
      FieldName = 'Pedir'
      Origin = 'Pedir'
      Required = True
    end
    object FDQueryPedidoTamanho: TWideStringField
      FieldName = 'Tamanho'
      Origin = 'Tamanho'
      Required = True
      Size = 1
    end
    object FDQueryPedidoPrato1: TWideStringField
      FieldName = 'Prato1'
      Origin = 'Prato1'
      Size = 40
    end
    object FDQueryPedidoPrato2: TWideStringField
      FieldName = 'Prato2'
      Origin = 'Prato2'
      Size = 40
    end
    object FDQueryPedidoPrato3: TWideStringField
      FieldName = 'Prato3'
      Origin = 'Prato3'
      Size = 40
    end
    object FDQueryPedidoPrato4: TWideStringField
      FieldName = 'Prato4'
      Origin = 'Prato4'
      Size = 40
    end
    object FDQueryPedidoPrato5: TWideStringField
      FieldName = 'Prato5'
      Origin = 'Prato5'
      Size = 40
    end
    object FDQueryPedidoNomePessoa: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NomePessoa'
      Origin = 'NomePessoa'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object FDQueryPedidoSegOpc: TBooleanField
      FieldName = 'SegOpc'
      Origin = 'SegOpc'
    end
  end
  object DSPessoa: TDataSource
    DataSet = FDQueryPessoa
    Left = 544
    Top = 16
  end
  object FDQueryPessoa: TFDQuery
    Connection = dm.FDConnection1
    SQL.Strings = (
      
        'SELECT IdPessoa, NomePessoa, Recorrencia, TamanhoPadrao FROM TbP' +
        'essoas ORDER BY Ordem;')
    Left = 616
    Top = 16
    object FDQueryPessoaIdPessoa: TFDAutoIncField
      FieldName = 'IdPessoa'
      Origin = 'IdPessoa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQueryPessoaNomePessoa: TWideStringField
      FieldName = 'NomePessoa'
      Origin = 'NomePessoa'
      Required = True
      Size = 40
    end
    object FDQueryPessoaRecorrencia: TWideStringField
      FieldName = 'Recorrencia'
      Origin = 'Recorrencia'
      Required = True
      Size = 7
    end
    object FDQueryPessoaTamanhoPadrao: TWideStringField
      FieldName = 'TamanhoPadrao'
      Origin = 'TamanhoPadrao'
      Required = True
      Size = 1
    end
  end
end

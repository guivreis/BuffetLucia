object FormAgenda: TFormAgenda
  Left = 0
  Top = 0
  Caption = 'Agenda'
  ClientHeight = 299
  ClientWidth = 984
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
    984
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 725
    Top = 67
    Width = 30
    Height = 13
    Caption = 'Arroz:'
  end
  object Label2: TLabel
    Left = 725
    Top = 94
    Width = 33
    Height = 13
    Caption = 'Feij'#227'o:'
  end
  object Label3: TLabel
    Left = 725
    Top = 121
    Width = 33
    Height = 13
    Caption = 'Carne:'
  end
  object Label4: TLabel
    Left = 725
    Top = 148
    Width = 52
    Height = 13
    Caption = 'Guarni'#231#227'o:'
  end
  object Label5: TLabel
    Left = 725
    Top = 175
    Width = 36
    Height = 13
    Caption = 'Salada:'
  end
  object Label6: TLabel
    Left = 725
    Top = 202
    Width = 49
    Height = 13
    Caption = '2'#170' Op'#231#227'o:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 705
    Height = 251
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DSAgenda
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DataAgenda'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome1'
        Title.Caption = 'Arroz'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome2'
        Title.Caption = 'Feij'#227'o'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome3'
        Title.Caption = 'Carne'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome4'
        Title.Caption = 'Guarni'#231#227'o'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome5'
        Title.Caption = 'Salada'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome6'
        Title.Caption = 'Op'#231#227'o alternativa'
        Width = 100
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 785
    Top = 25
    Width = 41
    Height = 33
    Caption = '<'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 935
    Top = 25
    Width = 41
    Height = 33
    Caption = '>'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 832
    Top = 32
    Width = 97
    Height = 21
    Date = 44971.000000000000000000
    Time = 0.792449201391718800
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 789
    Top = 64
    Width = 187
    Height = 21
    MaxLength = 60
    TabOrder = 4
    OnClick = ComboBox1Click
  end
  object ComboBox2: TComboBox
    Left = 789
    Top = 91
    Width = 187
    Height = 21
    MaxLength = 60
    TabOrder = 5
    OnClick = ComboBox2Click
  end
  object ComboBox3: TComboBox
    Left = 789
    Top = 118
    Width = 187
    Height = 21
    MaxLength = 60
    TabOrder = 6
    OnClick = ComboBox3Click
  end
  object ComboBox4: TComboBox
    Left = 789
    Top = 145
    Width = 187
    Height = 21
    MaxLength = 60
    TabOrder = 7
    OnClick = ComboBox4Click
  end
  object ComboBox5: TComboBox
    Left = 789
    Top = 172
    Width = 187
    Height = 21
    MaxLength = 60
    TabOrder = 8
    OnClick = ComboBox5Click
  end
  object ComboBox6: TComboBox
    Left = 789
    Top = 199
    Width = 187
    Height = 21
    MaxLength = 60
    TabOrder = 9
    OnClick = ComboBox6Click
  end
  object Button3: TButton
    Left = 879
    Top = 240
    Width = 97
    Height = 35
    Caption = 'Inserir'
    TabOrder = 10
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 592
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Excluir registro'
    TabOrder = 11
    OnClick = Button4Click
  end
  object DSAgenda: TDataSource
    DataSet = FDQueryAgenda
    Left = 72
    Top = 64
  end
  object FDQueryAgenda: TFDQuery
    Connection = dm.FDConnection1
    SQL.Strings = (
      'SELECT * FROM TbAgenda ORDER BY DataAgenda;')
    Left = 192
    Top = 64
    object FDQueryAgendaIdAgenda: TFDAutoIncField
      FieldName = 'IdAgenda'
      Origin = 'IdAgenda'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQueryAgendaDataAgenda: TDateField
      FieldName = 'DataAgenda'
      Origin = 'DataAgenda'
      Required = True
    end
    object FDQueryAgendaAlimento1: TIntegerField
      FieldName = 'Alimento1'
      Origin = 'Alimento1'
    end
    object FDQueryAgendaAlimento2: TIntegerField
      FieldName = 'Alimento2'
      Origin = 'Alimento2'
    end
    object FDQueryAgendaAlimento3: TIntegerField
      FieldName = 'Alimento3'
      Origin = 'Alimento3'
    end
    object FDQueryAgendaAlimento4: TIntegerField
      FieldName = 'Alimento4'
      Origin = 'Alimento4'
    end
    object FDQueryAgendaAlimento5: TIntegerField
      FieldName = 'Alimento5'
      Origin = 'Alimento5'
    end
    object FDQueryAgendaAlimento6: TIntegerField
      FieldName = 'Alimento6'
      Origin = 'Alimento6'
    end
    object FDQueryAgendaNome1: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome1'
      LookupDataSet = FDQueryAlimento
      LookupKeyFields = 'IdAlimento'
      LookupResultField = 'NomeAlimento'
      KeyFields = 'Alimento1'
      Size = 40
      Lookup = True
    end
    object FDQueryAgendaNome2: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome2'
      LookupDataSet = FDQueryAlimento
      LookupKeyFields = 'IdAlimento'
      LookupResultField = 'NomeAlimento'
      KeyFields = 'Alimento2'
      Size = 40
      Lookup = True
    end
    object FDQueryAgendaNome3: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome3'
      LookupDataSet = FDQueryAlimento
      LookupKeyFields = 'IdAlimento'
      LookupResultField = 'NomeAlimento'
      KeyFields = 'Alimento3'
      Size = 40
      Lookup = True
    end
    object FDQueryAgendaNome4: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome4'
      LookupDataSet = FDQueryAlimento
      LookupKeyFields = 'IdAlimento'
      LookupResultField = 'NomeAlimento'
      KeyFields = 'Alimento4'
      Size = 40
      Lookup = True
    end
    object FDQueryAgendaNome5: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome5'
      LookupDataSet = FDQueryAlimento
      LookupKeyFields = 'IdAlimento'
      LookupResultField = 'NomeAlimento'
      KeyFields = 'Alimento5'
      Size = 40
      Lookup = True
    end
    object FDQueryAgendaNome6: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome6'
      LookupDataSet = FDQueryAlimento
      LookupKeyFields = 'IdAlimento'
      LookupResultField = 'NomeAlimento'
      KeyFields = 'Alimento6'
      Size = 40
      Lookup = True
    end
  end
  object FDQueryAlimento: TFDQuery
    Connection = dm.FDConnection1
    SQL.Strings = (
      
        'SELECT IdAlimento, NomeAlimento FROM TbAlimentos ORDER BY NomeAl' +
        'imento;')
    Left = 192
    Top = 136
  end
end

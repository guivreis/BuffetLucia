object FormAlimentos: TFormAlimentos
  Left = 0
  Top = 0
  Caption = 'Alimentos'
  ClientHeight = 350
  ClientWidth = 740
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
    740
    350)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton8: TSpeedButton
    Left = 295
    Top = 21
    Width = 31
    Height = 27
    Glyph.Data = {
      B6030000424DB603000000000000360000002800000012000000100000000100
      1800000000008003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFABABABE1E1E1FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE0E0E0ABABABFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      FFFFFFFFFFFFE1E1E1515151E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFE1E1E15151
      51E1E1E1FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFE1E1E1515151E1E1E1FFFFFFFFFFFFE1E1E1515151E1E1E1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E151
      5151E1E1E1E1E1E1515151E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1474747474747
      E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1474747474747E1E1E1FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE1E1E1515151E1E1E1E1E1E1515151E1E1E1FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1515151E1
      E1E1FFFFFFFFFFFFE1E1E1515151E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFE1E1E1515151E1E1E1FFFFFFFFFFFFFFFFFF
      FFFFFFE1E1E1515151E1E1E1FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      FFFFFFFFFFFFABABABE1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0
      E0ABABABFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
    OnClick = SpeedButton8Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 51
    Width = 417
    Height = 291
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DSAlimentos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NomeAlimento'
        Title.Caption = 'Alimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeTipo'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ativo'
        Visible = True
      end>
  end
  object LabeledEdit1: TLabeledEdit
    Left = 472
    Top = 24
    Width = 185
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Alimento:'
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 472
    Top = 51
    Width = 185
    Height = 150
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 66
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object RadioButton1: TRadioButton
      Left = 56
      Top = 8
      Width = 113
      Height = 17
      Caption = 'Arroz'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 56
      Top = 31
      Width = 113
      Height = 17
      Caption = 'Feij'#227'o'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 56
      Top = 54
      Width = 113
      Height = 17
      Caption = 'Carne'
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Left = 56
      Top = 77
      Width = 113
      Height = 17
      Caption = 'Guarni'#231#227'o'
      TabOrder = 3
    end
    object RadioButton5: TRadioButton
      Left = 56
      Top = 100
      Width = 113
      Height = 17
      Caption = 'Salada'
      TabOrder = 4
    end
    object RadioButton6: TRadioButton
      Left = 56
      Top = 123
      Width = 113
      Height = 17
      Caption = 'Op'#231#227'o alternativa'
      TabOrder = 5
    end
  end
  object Button1: TButton
    Left = 576
    Top = 207
    Width = 81
    Height = 25
    Caption = 'Inserir'
    TabOrder = 3
    OnClick = Button1Click
  end
  object SearchBox1: TSearchBox
    Left = 8
    Top = 24
    Width = 281
    Height = 21
    TabOrder = 4
    OnKeyUp = SearchBox1KeyUp
  end
  object DSAlimentos: TDataSource
    DataSet = FDQueryAlimentos
    Left = 72
    Top = 72
  end
  object FDQueryAlimentos: TFDQuery
    Connection = dm.FDConnection1
    SQL.Strings = (
      'SELECT * FROM TbAlimentos ORDER BY Tipo, NomeAlimento;')
    Left = 176
    Top = 72
    object FDQueryAlimentosIdAlimento: TFDAutoIncField
      FieldName = 'IdAlimento'
      Origin = 'IdAlimento'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQueryAlimentosNomeAlimento: TWideStringField
      FieldName = 'NomeAlimento'
      Origin = 'NomeAlimento'
      Required = True
      Size = 40
    end
    object FDQueryAlimentosTipo: TIntegerField
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Required = True
    end
    object FDQueryAlimentosAtivo: TBooleanField
      FieldName = 'Ativo'
      Origin = 'Ativo'
    end
    object FDQueryAlimentosNomeTipo: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipo'
      LookupDataSet = FDQueryTipos
      LookupKeyFields = 'IdTipo'
      LookupResultField = 'NomeTipo'
      KeyFields = 'Tipo'
      Size = 15
      Lookup = True
    end
  end
  object FDQueryTipos: TFDQuery
    Connection = dm.FDConnection1
    SQL.Strings = (
      'SELECT * FROM TbTipos;')
    Left = 176
    Top = 144
  end
end

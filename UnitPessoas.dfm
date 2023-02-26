object FormPessoas: TFormPessoas
  Left = 0
  Top = 0
  Caption = 'Pessoas'
  ClientHeight = 299
  ClientWidth = 551
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
    551
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 369
    Height = 283
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DSPessoas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnColEnter = DBGrid1ColEnter
    OnColExit = DBGrid1ColExit
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'NomePessoa'
        Title.Caption = 'Nome'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Recorrencia'
        Title.Caption = 'Recorr'#234'ncia'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TamanhoPadrao'
        Title.Caption = 'Tamanho Padr'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ativa'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 400
    Top = 128
    Width = 137
    Height = 33
    Caption = 'Excluir registro'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 400
    Top = 167
    Width = 137
    Height = 33
    Caption = 'Ativa / desativa pessoa'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 400
    Top = 89
    Width = 137
    Height = 33
    Caption = 'Nova pessoa'
    TabOrder = 3
    OnClick = Button3Click
  end
  object DSPessoas: TDataSource
    DataSet = FDQueryPessoas
    Left = 112
    Top = 160
  end
  object FDQueryPessoas: TFDQuery
    Connection = dm.FDConnection1
    SQL.Strings = (
      'SELECT * FROM TbPessoas ORDER BY NomePessoa;')
    Left = 208
    Top = 160
    object FDQueryPessoasIdPessoa: TFDAutoIncField
      FieldName = 'IdPessoa'
      Origin = 'IdPessoa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQueryPessoasNomePessoa: TWideStringField
      FieldName = 'NomePessoa'
      Origin = 'NomePessoa'
      Required = True
      Size = 40
    end
    object FDQueryPessoasRecorrencia: TWideStringField
      FieldName = 'Recorrencia'
      Origin = 'Recorrencia'
      Required = True
      Size = 7
    end
    object FDQueryPessoasTamanhoPadrao: TWideStringField
      FieldName = 'TamanhoPadrao'
      Origin = 'TamanhoPadrao'
      Required = True
      Size = 1
    end
    object FDQueryPessoasAtiva: TBooleanField
      FieldName = 'Ativa'
      Origin = 'Ativa'
      OnGetText = FDQueryPessoasAtivaGetText
    end
  end
end

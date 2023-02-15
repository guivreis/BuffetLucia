object FormNovaPessoa: TFormNovaPessoa
  Left = 0
  Top = 0
  Caption = 'Nova pessoa'
  ClientHeight = 400
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabeledEdit1: TLabeledEdit
    Left = 80
    Top = 24
    Width = 209
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome:'
    LabelPosition = lpLeft
    MaxLength = 40
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 80
    Top = 64
    Width = 209
    Height = 185
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 80
      Width = 61
      Height = 13
      Caption = 'Recorr'#234'ncia:'
    end
    object CheckBox1: TCheckBox
      Left = 97
      Top = 17
      Width = 65
      Height = 17
      Caption = 'Domingo'
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 97
      Top = 39
      Width = 65
      Height = 17
      Caption = 'Segunda'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 97
      Top = 62
      Width = 48
      Height = 17
      Caption = 'Ter'#231'a'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 97
      Top = 84
      Width = 56
      Height = 17
      Caption = 'Quarta'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object CheckBox5: TCheckBox
      Left = 97
      Top = 107
      Width = 56
      Height = 17
      Caption = 'Quinta'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object CheckBox6: TCheckBox
      Left = 97
      Top = 129
      Width = 56
      Height = 17
      Caption = 'Sexta'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object CheckBox7: TCheckBox
      Left = 97
      Top = 152
      Width = 64
      Height = 17
      Caption = 'S'#225'bado'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 80
    Top = 264
    Width = 209
    Height = 73
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 30
      Width = 85
      Height = 13
      Caption = 'Tamanho padr'#227'o:'
    end
    object RadioButton1: TRadioButton
      Left = 99
      Top = 16
      Width = 62
      Height = 17
      Caption = 'Pequeno'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 99
      Top = 39
      Width = 54
      Height = 17
      Caption = 'Grande'
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 177
    Top = 352
    Width = 112
    Height = 40
    Caption = 'Gravar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 25
    Top = 352
    Width = 112
    Height = 40
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = Button2Click
  end
end

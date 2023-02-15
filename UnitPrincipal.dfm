object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Buffet L'#250'cia'
  ClientHeight = 444
  ClientWidth = 1203
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    1203
    444)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 185
    Height = 428
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    object Button1: TButton
      Left = 24
      Top = 32
      Width = 137
      Height = 33
      Caption = 'Pessoas'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 24
      Top = 71
      Width = 137
      Height = 33
      Caption = 'Alimentos'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 24
      Top = 110
      Width = 137
      Height = 33
      Caption = 'Agenda'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 24
      Top = 149
      Width = 137
      Height = 33
      Caption = 'Pedido do dia'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Left = 199
    Top = 8
    Width = 996
    Height = 428
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
end

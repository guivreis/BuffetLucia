object dm: Tdm
  OldCreateOrder = False
  Height = 150
  Width = 215
  object DSTemp: TDataSource
    DataSet = FDQueryTmp
    Left = 48
    Top = 80
  end
  object FDQueryTmp: TFDQuery
    Connection = FDConnection1
    Left = 136
    Top = 80
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    Left = 48
    Top = 16
  end
end

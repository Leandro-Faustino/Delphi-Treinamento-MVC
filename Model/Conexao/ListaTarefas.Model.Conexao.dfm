object UDMConexao: TUDMConexao
  OnCreate = DataModuleCreate
  Height = 720
  Width = 960
  PixelsPerInch = 144
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Program Files\Firebird\Firebird_4_0\PROJETOS_DELPHI.' +
        'DFB'
      'User_Name=SYSDBA'
      'Password=sql88'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 132
    Top = 96
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection
    Left = 348
    Top = 96
  end
end

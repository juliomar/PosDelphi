object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 367
  Width = 522
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Program Files\Firebird\Firebird_2_5\examples\empbuil' +
        'd\EMPLOYEE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 304
    Top = 288
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 400
    Top = 288
  end
end

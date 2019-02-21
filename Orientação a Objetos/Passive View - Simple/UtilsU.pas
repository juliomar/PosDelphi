unit UtilsU;

interface

uses
  Classes;

type
  IStringList = interface
    ['{DA91D40C-DF6B-476E-8FA5-1355691B5CA6}']
    function GetCount: Integer;
    function Get(Index: Integer): string;
    function Add(const S: string): Integer;
    procedure Clear;
  end;

  TIterfacedStringList = class(TStringList, IStringList)
  end;

implementation

end.

unit Controller.EnumUtils;

interface

uses
  System.Classes;

type
  TGenerico = 0..255;

  TControllerEnumUtils<T> = class
    class function EnumToStr(Value : T) : string;
    class procedure EnumToList(Value : TStrings);
  end;

implementation

uses
  System.TypInfo;

{ TEnumUtils<T> }

class procedure TControllerEnumUtils<T>.EnumToList(Value: TStrings);
var
 i, Pos : integer;
 Str : string;
begin
 Value.Clear;
 i := 0;
 repeat
   Str := GetEnumName(TypeInfo(T), i);
   Pos := GetEnumValue(TypeInfo(T),Str);

   if Pos > -1 then
    Value.Add(Str);

  Inc(i);
 until
  Pos < 0;
end;

class function TControllerEnumUtils<T>.EnumToStr(Value: T): string;
var
 Pos : ^Integer;
 Num : integer;
begin
  Pos := @Value;
  Num := integer(TGenerico(Pos^));
  Result := GetEnumName(TypeInfo(T),Num);
end;

end.


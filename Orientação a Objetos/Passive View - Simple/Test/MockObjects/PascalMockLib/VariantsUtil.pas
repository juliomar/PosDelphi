{: VariantsUtil<p>

  <b>History : </b><font size = -1><ul>
     <li>18/01/07 - DA - Add various conversion functions from and to variants
     <li>16/01/07 - DA - Unit creation
  </ul></font>

  <font size = -1><i>Original work courtesy of Tixeo http://www.tixeo.com</i></font>
}
unit VariantsUtil;

interface

uses
  // Delphi
  Variants,
  SysUtils
  ;

type

  TVariantArray = array of Variant;

  //: convert an array of const to an array of variants
  procedure ConstArrayToVariantArray(const AValues : array of const;
    var ADest: TVariantArray);

  //: convert an array of variant to a text representation
  function VariantArrayToString(const AVarArray: TVariantArray): string;

  //: convert a variant to an integer  
  function Var2Int(Value: Variant): Integer;
  //: convert a variant to a pointer
  function Var2Ptr(Value: Variant): Pointer;
  //: convert a pointer to a variant  
  function Ptr2Var(Value: Pointer): Variant;
  //: convert a variant to an object
  function Var2Obj(Value: Variant): TObject;
  //: convert an object to a variant
  function Obj2Var(Value: TObject): Variant;
  //: convert a variant to an interface
  function Var2Intf(Value: Variant): IInterface;
  //: convert an interface to a variant   
  function Intf2Var(Value: IInterface): Variant;


implementation


// ConstArrayToVariantArray
//
procedure ConstArrayToVariantArray(const AValues : array of const;
  var ADest: TVariantArray);
var
  i : Integer;
begin
  SetLength(ADest, Length(AValues));
  for i := Low(AValues) to High(AValues) do
  begin
    with AValues[i] do
    begin
      case AValues[i].VType of
        vtUnicodeString: ADest[i] := VString^;
        vtInteger: ADest[i] := VInteger;
        vtInt64: ADest[i] := VInt64^;
        vtBoolean: ADest[i] := VBoolean;
        vtChar: ADest[i] := VChar;
        vtWideChar: ADest[i] := VWideChar;
        vtExtended: ADest[i] := VExtended^;
        vtString: ADest[i] := VString^;
        vtPointer: ADest[i] := Integer(VPointer);
        vtPChar: ADest[i] := StrPas(VPChar);
        vtObject: ADest[i]:= Integer(VObject);
        vtAnsiString: ADest[i] := String(VAnsiString);
        vtCurrency: ADest[i] := VCurrency^;
        vtVariant: ADest[i] := VVariant^;
        vtInterface: ADest[i]:= Integer(VPointer);
      else
        raise Exception.Create ('invalid data type ' + IntToStr(VType))
      end;
    end;
  end;
end;


// VariantArrayToString
//
function VariantArrayToString(const AVarArray: TVariantArray): string;
var
  I: Integer;
begin
  Result := '';
  for i := Low(AVarArray) to High(AVarArray) do
  begin
    if Length(Result) > 0 then
      Result := Result + ', ';
    if VarIsNull(AVarArray[I]) then
      Result := Result + 'ignored'
    else
      Result := Result + VarToStr(AVarArray[I]);
  end;
  Result := '('+Result+')';
end;


function Var2Int(Value: Variant): Integer;
begin
  Result := Value;
end;

function Var2Ptr(Value: Variant): Pointer;
begin
  Result := Pointer(Var2Int(Value));
end;

function Ptr2Var(Value: Pointer): Variant;
begin
  Result := Integer(Value);
end;

function Var2Obj(Value: Variant): TObject;
begin
  Result := TObject(Var2Int(Value));
end;

function Obj2Var(Value: TObject): Variant;
begin
  Result := Integer(Value);
end;

function Var2Intf(Value: Variant): IInterface;
begin
  Result := IInterface(Var2Int(Value));
end;

function Intf2Var(Value: IInterface): Variant;
begin
  Result := Integer(Value);
end;

end.

{: PascalMock<p>

  Base class for mock objects<p>

  <b>History : </b><font size = -1><ul>
     <li>13/02/07 - DA - TMockMethod now check if its return value was set and raise an exception otherwise   
     <li>18/01/07 - DA - Add information on which method doesn't match expectations
                         TMock children can now reset their mock data by overriding ResetMockData,
                         Can now retrieve informations on a called method using CalledMethodByName
                         before calling Verify.
                         Can now specify out params to returns by the called method
     <li>17/01/07 - DA - Add ability to raise an exception when a method is called,
                         Add ability to expect a method to be called more than once
     <li>16/01/07 - DA - Add parameters equality check
     <li>15/01/07 - DA - Full rewrite
     <li>14/02/06 - DA - Unit creation
  </ul></font>

  <font size = -1><i>Original work courtesy of Tixeo http://www.tixeo.com</i></font>  
}
unit PascalMock;

interface

uses
  // Delphi
  Classes,
  SysUtils,
  Contnrs,
  Variants,

  // Pascal Mock 
  NoRefCountObject,
  VariantsUtil
  ;

type

  TMockMethodParams = array of Variant;

  // TMockMethod
  //
  TMockMethod = class
  private
    FName: string;
    FReturnValue: variant;
    FParams: TVariantArray;
    FOutParams: TVariantArray;    
    FCalls: Integer;
    FExceptionClass: ExceptClass;
    FExceptedCalls: Integer;
    FDontMatchExpected: Boolean;
    function GetReturnValue: Variant;

    function GetReturnValueAsInterface: IUnknown;
    function GetReturnValueAsObject: TObject;
    function GetReturnValueAsPointer: Pointer;
    procedure RaiseException;
  public
    constructor Create(const AName: string; AExpectedCalls: Integer);
    destructor Destroy; override;

    //: add a call to this method
    procedure AddCall;
    //: tell if this method was called enought times
    function EnoughtCalls: Boolean;

    //: describe method
    function ToString: string;

    //: Return true if it match the expected method
    function MatchExpected(AExpectedMethod: TMockMethod): Boolean;

    //: Add parameters
    function WithParams(AParams: array of const): TMockMethod;

    //: Allow to specify output parameters    
    function ReturnsOutParams(AParams: array of const): TMockMethod;

    //: Set return value
    procedure Returns(AValue: Variant); overload;
    procedure Returns(AValue: Pointer); overload;
    procedure Returns(AValue: IUnknown); overload;
    procedure Returns(AValue: TObject); overload;

    {: tell to raise an exception when called.
      Note: currently this avoid storing call parameters }
    procedure Raises(AExceptionClass: ExceptClass);

    //: method name/signature
    property Name: string read FName;

    //: Get return value and check if it was set
    property ReturnValue: Variant read GetReturnValue;
    //: Get return value directly, without any check
    property DirectReturnValue: Variant read FReturnValue;
    //: return value as pointer
    property ReturnValueAsPointer: Pointer read GetReturnValueAsPointer;
    //: return value as object
    property ReturnValueAsObject: TObject read GetReturnValueAsObject;
    //: return value as interface
    property ReturnValueAsInterface: IUnknown read GetReturnValueAsInterface;

    //: number of expected calls to this method
    property ExceptedCalls: Integer read FExceptedCalls;

    //: the method parameters
    property Params: TVariantArray read FParams;
    //: out parameters
    property OutParams: TVariantArray read FOutParams write FOutParams;
  end;
  

  // IMock
  //
  IMock = interface
    ['{29275C2F-58DE-401C-A2AE-502331AA79E8}']

    function Expects(const ASignatureCall: string; AExpectedCalls: Integer = 1): TMockMethod;
    procedure Verify(const AMessage: string = '');    
  end;

  
  // TMockMethodList
  //
  TMockMethodList = class
  private
    FMethods: TObjectList;
  public
    constructor Create;
    destructor Destroy; override;

    function ToString: string;

    procedure Clear;
    function Count: Integer;
    procedure Add(AMethod: TMockMethod);

    //: returns the method at the given index in the list
    function Method(Index: Integer): TMockMethod;    

    //: return a method which is not yet called by its name    
    function UncalledMethodByName(const AMethodName: string): TMockMethod;
  end;

  
  // EMockException
  //
  EMockException = class(Exception);


  // EMockVerifyException
  //
  EMockVerifyException = class(EMockException)
  public
    constructor Create(const AMessage, AReason: string; AExpectations, ACalls: TMockMethodList);
  end;
  

  // TMock
  //
  {: @desc Base class for mock objects }
  TMock = class(TNoRefCountObject, IMock)
  private
    FExpectations: TMockMethodList;
    FCalls: TMockMethodList;
    
    procedure CheckIfFewerCallsThanExpected(const AMessage: string;
      CntExpected: Integer; CntCalled: Integer);
  protected
    {: Override this method if you want to reset mock data after verify }
    procedure ResetMockData; virtual;
  public
    constructor Create;
    destructor Destroy; override;

    { IMock }
    function Expects(const ASignatureCall: string; AExpectedCalls: Integer = 1): TMockMethod;
    procedure Verify(const AMessage: string = '');

    //: Add a call to a function 
    function AddCall(const ASignatureCall: string): TMockMethod;

    //: return a called method by its name
    function CalledMethodByName(const AMethodName: string): TMockMethod;
  end;


  //: return the value for an ignored param
  function Ignored: Variant;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
implementation
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

//uses
//  // Delphi
//
//
//  // 
//  ;

const
  ENDL = #13#10;


// Ignored
//
function Ignored: Variant;
begin
  Result := Null;
end;


{ TMock }

function TMock.AddCall(const ASignatureCall: string): TMockMethod;
var
  ExpectedMethod: TMockMethod;
begin
  // create a new method object and store it in called method list
  Result := TMockMethod.Create(ASignatureCall, 1);
  FCalls.Add(Result);

  // is this is an expected method call ?
  ExpectedMethod := FExpectations.UncalledMethodByName(ASignatureCall);
  if ExpectedMethod <> nil then // yes
  begin
    { Count this call
      Note: this can raise an exception if the method is configured to do it }
    ExpectedMethod.AddCall;
    
    // retrieve the return value
    Result.Returns(ExpectedMethod.DirectReturnValue);

    // retrieve out params
    Result.OutParams := ExpectedMethod.OutParams;
  end;
end;

// CalledMethodByName
//
function TMock.CalledMethodByName(const AMethodName: string): TMockMethod;
begin
  Result := FCalls.UncalledMethodByName(AMethodName);
end;


// CheckIfFewerCallsThanExpected
//
procedure TMock.CheckIfFewerCallsThanExpected(const AMessage: string;
  CntExpected: Integer; CntCalled: Integer);
begin
  // check if less calls than expected
  if (CntCalled < CntExpected) or (CntCalled >= FCalls.Count) then
    raise EMockVerifyException.Create(AMessage,
      'Number of calls < expectations.', FExpectations, FCalls);
end;

// Create
//
constructor TMock.Create;
begin
  inherited;

  FExpectations := TMockMethodList.Create;
  FCalls := TMockMethodList.Create;
end;


// Destroy
//
destructor TMock.Destroy;
begin
  FreeAndNil(FExpectations);
  FreeAndNil(FCalls);

  inherited;
end;


// Expects
//
function TMock.Expects(const ASignatureCall: string; AExpectedCalls: Integer): TMockMethod;
begin
  Result := TMockMethod.Create(ASignatureCall, AExpectedCalls);
  FExpectations.Add(Result);
end;


// ResetMockData
//
procedure TMock.ResetMockData;
begin
  FExpectations.Clear;
  FCalls.Clear;
end;


// Verify
//
procedure TMock.Verify(const AMessage: string);
var
  CntExpected, CntCalled, CntCallsToExpectedMethod: Integer;
  CalledMethod, ExpectedMethod : TMockMethod;
begin
  try
    // check expectations = what was called
    CntCalled := 0;
    for CntExpected := 0 to FExpectations.Count - 1 do
    begin
      CheckIfFewerCallsThanExpected(AMessage, CntExpected, CntCalled);

      // check enought calls to expected method
      ExpectedMethod := FExpectations.Method(CntExpected);
      for CntCallsToExpectedMethod := 1 to ExpectedMethod.ExceptedCalls do
      begin
        CheckIfFewerCallsThanExpected(AMessage, CntExpected, CntCalled);
        CalledMethod := FCalls.Method(CntCalled);

        // check the call match what is expected
        if not CalledMethod.MatchExpected(ExpectedMethod) then
          raise EMockVerifyException.Create(AMessage,
            'Unexpected call to '+CalledMethod.ToString, FExpectations, FCalls);

        // go to the next call
        Inc(CntCalled);
      end;
    end;

    // check if more calls than expected
    if CntCalled < FCalls.Count then
      raise EMockVerifyException.Create(AMessage, 'Number of calls > expectations.',
        FExpectations, FCalls)
  finally
    ResetMockData;
  end;
end;

{ EMockVerifyException }


// Create
//
constructor EMockVerifyException.Create(const AMessage, AReason: string;
  AExpectations, ACalls: TMockMethodList);
begin
  inherited Create(AMessage);

  Assert(AExpectations <> nil, 'ex');
  Assert(ACalls <> nil, 'ca');  

  Message := Message+ENDL+
        AReason+ENDL+
        ENDL+
        'Expected: '+ENDL+
        AExpectations.ToString+ENDL+
        'Called: '+ENDL+
        ACalls.ToString+ENDL
end;

{ TMockMethod }


// AddCall
//
procedure TMockMethod.AddCall;
begin
  Inc(FCalls);

  RaiseException;
end;


// EnoughtCalls
//
function TMockMethod.EnoughtCalls: Boolean;
begin
  Result := FCalls >= FExceptedCalls;
end;

// Create
//
{: @param AName Method name/signature
   @param AExpectedCalls Number of expected calls
}
constructor TMockMethod.Create(const AName: string; AExpectedCalls: Integer);
begin
  inherited Create;

  Assert(AName <> '', 'method name cannot be empty');
  FName := AName;

  Assert(AExpectedCalls > 0, 'expected calls must be > 0');
  FExceptedCalls := AExpectedCalls;

  FReturnValue := Null;
end;


// Destroy
//
destructor TMockMethod.Destroy;
begin

  inherited;
end;


// GetReturnValue
//
function TMockMethod.GetReturnValue: Variant;
begin
  if VarIsNull(FReturnValue) then
  begin
    raise EMockException.Create(Format(
      'Function ''%s'' was called but no return value has been set.',
      [Name]));
  end
  else
    Result := FReturnValue;  
end;


// GetReturnValueAsInterface
//
function TMockMethod.GetReturnValueAsInterface: IUnknown;
begin
  Result := Var2Intf(ReturnValue);
end;


// GetReturnValueAsObject
//
function TMockMethod.GetReturnValueAsObject: TObject;
begin
  Result := Var2Obj(ReturnValue);
end;


// GetReturnValueAsPointer
//
function TMockMethod.GetReturnValueAsPointer: Pointer;
begin
  Result := Var2Ptr(ReturnValue);
end;


// MatchExpected
//
function TMockMethod.MatchExpected(AExpectedMethod: TMockMethod): Boolean;
var
  I: integer;
  ExpectedValue: Variant;
begin
  Assert(AExpectedMethod <> nil);

  // match name
  Result := Name = AExpectedMethod.Name;
  if Result then
  begin // match params
  
    // in case no parameter values are expected
    if Length(AExpectedMethod.Params) = 0 then
    begin
      Result := True // accept with any parameters
    end else
    begin
      // check same number of parameters
      Result := Length(FParams) = Length(AExpectedMethod.Params);
      if Result then
      begin
        // check if all parameters are identicals
        for I := Low(FParams) to High(FParams) do
        begin
          ExpectedValue := AExpectedMethod.Params[I];
          // if Null expected then ignore param, else check for equality
          if (not VarIsNull(ExpectedValue)) and (FParams[I] <> ExpectedValue) then
          begin
            Result := False;
            Exit;
          end;
        end;
        // all parameters are identicals
        Result := True;
      end;
    end;
    
  end;

  // remember if we matched or not
  FDontMatchExpected := not Result;
end;


// ReturnsOutParams
//
function TMockMethod.ReturnsOutParams(AParams: array of const): TMockMethod;
begin
  Result := Self;
  ConstArrayToVariantArray(AParams, FOutParams);
end;


// Raises
//
procedure TMockMethod.Raises(AExceptionClass: ExceptClass);
begin
  Assert(AExceptionClass <> nil, 'e');
  FExceptionClass := AExceptionClass;
end;


// RaiseException
//
procedure TMockMethod.RaiseException;
begin
  // raise exception if asked to
  if FExceptionClass <> nil then
    raise FExceptionClass.Create('');
end;


// Returns
//
procedure TMockMethod.Returns(AValue: IInterface);
begin
  FReturnValue := Intf2Var(AValue);
end;


// Returns
//
procedure TMockMethod.Returns(AValue: TObject);
begin
  FReturnValue := Obj2Var(AValue);
end;


// Returns
//
procedure TMockMethod.Returns(AValue: Variant);
begin
  FReturnValue := AValue;
end;


// Returns
//
procedure TMockMethod.Returns(AValue: Pointer);
begin
  FReturnValue := Ptr2Var(AValue);
end;


// ToString
//
function TMockMethod.ToString: string;
begin
  // name
  Result := FName;

  // params
  Result := Result + VariantArrayToString(Params);

  // name(arg1, arg2): returnValue
  if not VarIsNull(FReturnValue) then
    Result := Result + ': ' + VarToStr(FReturnValue);

  // exception if any
  if FExceptionClass <> nil then
    Result := Result + ' raise ' + FExceptionClass.ClassName;

  // expected call count is > 1
  if FExceptedCalls > 1 then
    Result := Result + ' x'+IntToStr(FExceptedCalls);

  // if don't match expected, tell it
  if FDontMatchExpected then
    Result := Result + ' <-- Don''t match expectations';
end;


// WithParams
//
function TMockMethod.WithParams(AParams: array of const): TMockMethod;
begin
  Result := Self;
  ConstArrayToVariantArray(AParams, FParams);
end;

{ TMockMethodList }

procedure TMockMethodList.Add(AMethod: TMockMethod);
begin
  Assert(AMethod <> nil);
  FMethods.Add(AMethod);
end;

procedure TMockMethodList.Clear;
begin
  FMethods.Clear;
end;

function TMockMethodList.Count: Integer;
begin
  Result := FMethods.Count;
end;

constructor TMockMethodList.Create;
begin
  inherited;

  FMethods := TObjectList.Create(True); // own objects
end;

destructor TMockMethodList.Destroy;
begin
  FreeAndNil(FMethods);
  
  inherited;
end;

function TMockMethodList.Method(Index: Integer): TMockMethod;
begin
  Result :=  FMethods[Index] as TMockMethod;
end;

function TMockMethodList.UncalledMethodByName(
  const AMethodName: string): TMockMethod;
var
  I: Integer;
begin
  Result := nil;

  // search a not yet called method by its name
  for I := 0 to Count - 1 do
    if (not Method(I).EnoughtCalls) and (Method(I).Name = AMethodName) then
    begin
      Result := Method(I);
      Break;
    end;
end;

function TMockMethodList.ToString: string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do
    Result := Result + Method(I).ToString + ENDL; 
end;

end.

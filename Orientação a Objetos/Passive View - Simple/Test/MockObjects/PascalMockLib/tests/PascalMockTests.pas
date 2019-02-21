{: PascalMockTests<p>

  <b>History : </b><font size = -1><ul>
     <li>15/01/07 - DA - Unit creation
  </ul></font>

  <font size = -1><i>Original work courtesy of Tixeo http://www.tixeo.com</i></font>
}
unit PascalMockTests;

interface

uses
  // Delphi
  Classes,

  // Dunit
  TestFrameWork,

  // Pascal Mock
  PascalMock
  ;


type

  // TMockMethodTests
  //
  TMockMethodTests = class(TTestCase)
  private
    FMethod: TMockMethod;
  protected
    procedure SetUp; override;
    procedure TearDown; override;

  published
    procedure TestToString;
    procedure TestCalls;
    procedure TestMatchExpected;
    procedure TestMatchExpectedWithParams;
    procedure TestReturnValue;
    procedure TestReturnValueNotSet;    
    procedure TestRecordAsReturnValue;
    procedure TestWithParams;
    procedure TestReturnOutputParams;
    procedure TestRaises;
  end;

  // TMockMethodListTests
  //
  TMockMethodListTests = class(TTestCase)
  private
    FList: TMockMethodList;
  protected
    procedure SetUp; override;
    procedure TearDown; override;

  published
    procedure TestToString;
    procedure TestPopulate;
    procedure TestUncalledMethodByName;
  end;

  // TMockVerifyExceptionTests
  //
  TMockVerifyExceptionTests = class(TTestCase)
  private
  protected

  published
    procedure TestCreate;
  end;    

  // TMockTests
  //
  TMockTests = class(TTestCase)
  private
    FMock: TMock;
  protected
    procedure SetUp; override;
    procedure TearDown; override;

  published

    procedure TestEmpty;
    procedure TestExpects;
    procedure TestAddCall;
    procedure TestAddCallForMethodExpectedSeveralTimes;    
    procedure TestAddCallRaiseException;
    procedure TestAddCallWithOutParams;        
    procedure TestSuccess;
    procedure TestWrongCallCount;
    procedure TestWrongCallOrder;
    procedure TestUnexpectedCall;
    procedure TestCalledMethodByName;
  end;

const

  cTestSuiteName = 'Mock tests'; 

implementation

uses
  // Delphi
  SysUtils,
  Variants,

  // Pascal Mock
  VariantsUtil // for Var2*() et *2Var() functions
  ;

  
{ TMockTests }

procedure TMockTests.SetUp;
begin
  inherited;

  FMock := TMock.Create;  
end;

procedure TMockTests.TearDown;
begin
  FreeAndNil(FMock);

  inherited;
end;

procedure TMockTests.TestAddCall;
var
  Method: TMockMethod;
begin
  // check expects return a method with the given signature as name
  Method := FMock.AddCall('SomeMethod');
  CheckNotNull(Method, 'a');
  CheckEquals('SomeMethod', Method.Name, 'b');
  Check(VarIsNull(Method.DirectReturnValue), 'c');

  // if expected function, returned method as the wanted return value
  FMock.Expects('Compute').Returns(1568);
  Method := FMock.AddCall('Compute');
  CheckEquals(1568, Method.ReturnValue, 'd');

  // if called several times and not expected there is no return value
  Method := FMock.AddCall('Compute');
  Check(VarIsNull(Method.DirectReturnValue), 'e');

  { if expect was called several times with the same method signature,
   the parameters and return value can be different }
  FMock.Expects('Function2').Returns(1);
  FMock.Expects('Function2').Returns(2);
  Method := FMock.AddCall('Function2');
  CheckEquals(1, Method.ReturnValue, 'f');
  Method := FMock.AddCall('Function2');
  CheckEquals(2, Method.ReturnValue, 'f2');
end;

procedure TMockTests.TestAddCallForMethodExpectedSeveralTimes;
var
  Method: TMockMethod;
begin
  { if expect was called several times with the same method signature,
   the parameters and return value can be different }
  FMock.Expects('Compute', 3).Returns(1); // return 3 times 1
  FMock.Expects('Compute').Returns(2); // then returns 2
  Method := FMock.AddCall('Compute');
  CheckEquals(1, Method.ReturnValue, 'a');
  Method := FMock.AddCall('Compute');
  CheckEquals(1, Method.ReturnValue, 'a2');
  Method := FMock.AddCall('Compute');
  CheckEquals(1, Method.ReturnValue, 'a3');
  Method := FMock.AddCall('Compute');
  CheckEquals(2, Method.ReturnValue, 'a4');
end;

procedure TMockTests.TestAddCallRaiseException;
begin
  // add a call to a method which raise an exception
  FMock.Expects('ErroneousFunc').Raises(EDivByZero);
  try
    FMock.AddCall('ErroneousFunc');
    Fail('Exception expected');
  except
    on E: Exception do begin
    end;
  end;
  FMock.Verify('a');
end;

procedure TMockTests.TestAddCallWithOutParams;
var
  Method: TMockMethod;
begin
  // if expected function, returned method as the wanted return value
  FMock.Expects('Compute').ReturnsOutParams([789, 'out2']).Returns(1568);
  Method := FMock.AddCall('Compute');
  CheckEquals(1568, Method.ReturnValue, 'a');
  CheckEquals(2, Length(Method.OutParams), 'a2');
  CheckEquals(789, Method.OutParams[0], 'a3');
  CheckEquals('out2', Method.OutParams[1], 'a4');
end;

procedure TMockTests.TestCalledMethodByName;
var
  Method: TMockMethod;
begin
  // no method called
  CheckNull(FMock.CalledMethodByName('Test'), 'a');

  // call a method
  Method := FMock.AddCall('MyMethod').WithParams(['test', 100]);
  CheckSame(Method, FMock.CalledMethodByName('MyMethod'), 'b');
  // check params are set
  CheckEquals('test', Method.Params[0], 'b2');
  CheckEquals(100, Method.Params[1], 'b3');

  // add call to this method
  Method.AddCall;

  // check it is no longer returned
  CheckNull(FMock.CalledMethodByName('MyMethod'), 'c');
end;

procedure TMockTests.TestEmpty;
begin
  FMock.Verify;
  FMock.Verify('Test');
end;

procedure TMockTests.TestExpects;
var
  Method: TMockMethod;
begin
  // check expects return a method with the given signature as name
  Method := FMock.Expects('SomeMethod');
  CheckNotNull(Method, 'a');
  CheckEquals('SomeMethod', Method.Name, 'a2');
  CheckEquals(1, Method.ExceptedCalls, 'a3');
  Check(VarIsNull(Method.DirectReturnValue), 'a4');

  // check with a multiple time called method
  Method := FMock.Expects('SomeMethod', 100);
  CheckNotNull(Method, 'b');
  CheckEquals('SomeMethod', Method.Name, 'b2');
  CheckEquals(100, Method.ExceptedCalls, 'b3');
  Check(VarIsNull(Method.DirectReturnValue), 'b4');
end;

procedure TMockTests.TestSuccess;
begin
  FMock.Expects('TestSuccess');
  FMock.Expects('TestUnexpectedCall', 3); // this one must be called several times
  FMock.Expects('TestEmpty');
  
  FMock.AddCall('TestSuccess');
  FMock.AddCall('TestUnexpectedCall');
  FMock.AddCall('TestUnexpectedCall');
  FMock.AddCall('TestUnexpectedCall');      
  FMock.AddCall('TestEmpty');

  FMock.Verify;
end;

procedure TMockTests.TestUnexpectedCall;
begin
  FMock.Expects('TestSuccess', 2);
  FMock.Expects('TestUnexpectedCall');
  FMock.Expects('TestEmpty');
  
  FMock.AddCall('TestSuccess');
  FMock.AddCall('TestSuccess');  
  FMock.AddCall('TestWrongCallCount'); // unexpected  
  FMock.AddCall('TestUnexpectedCall');
  FMock.AddCall('TestEmpty');

  try
    FMock.Verify('VerifMsg');
    Fail('Assertion expected');
  except
    on E: Exception do begin
      CheckIs(E, EMockVerifyException, 'expected a EMockVerifyException');
      // check exception message contains message of Verify()
      Check(Pos('VerifMsg', E.Message) > 0, 'm');
    end;
  end;
end;

procedure TMockTests.TestWrongCallCount;
begin
  // no calls
  FMock.Expects('TestSuccess');
  FMock.Expects('TestUnexpectedCall');
  FMock.Expects('TestEmpty');
  try
    FMock.Verify;
    Fail('Assertion expected');
  except
    on E: Exception do begin
      CheckIs(E, EMockVerifyException, 'expected a EMockVerifyException');
    end;
  end;

  // not enought calls
  FMock.Expects('TestSuccess');
  FMock.Expects('TestUnexpectedCall');
  FMock.Expects('TestEmpty');

  FMock.AddCall('TestSuccess');
  FMock.AddCall('TestUnexpectedCall');  
  try
    FMock.Verify;
    Fail('Assertion expected 2');
  except
    on E: Exception do begin
      CheckIs(E, EMockVerifyException, 'expected a EMockVerifyException 2');
    end;
  end;

  // not enought calls (some methods need to be called more than once)
  FMock.Expects('TestSuccess');
  FMock.Expects('TestUnexpectedCall');
  FMock.Expects('TestEmpty', 2);

  FMock.AddCall('TestSuccess');
  FMock.AddCall('TestUnexpectedCall');
  FMock.AddCall('TestEmpty');
  try
    FMock.Verify;
    Fail('Assertion expected 2b');
  except
    on E: Exception do begin
      CheckIs(E, EMockVerifyException, 'expected a EMockVerifyException 2b');
    end;
  end;  

  // too much calls
  FMock.Expects('TestSuccess');
  FMock.Expects('TestUnexpectedCall');
  FMock.Expects('TestEmpty');

  FMock.AddCall('TestSuccess');
  FMock.AddCall('TestUnexpectedCall');
  FMock.AddCall('TestEmpty');
  FMock.AddCall('TestWrongCallOrder');
  try
    FMock.Verify;
    Fail('Assertion expected 3');
  except
    on E: Exception do begin
      CheckIs(E, EMockVerifyException, 'expected a EMockVerifyException 3');
    end;
  end;

  // too much calls (some methods need to be called more than once)
  FMock.Expects('TestSuccess');
  FMock.Expects('TestUnexpectedCall', 2);
  FMock.Expects('TestEmpty');

  FMock.AddCall('TestSuccess');
  FMock.AddCall('TestUnexpectedCall');
  FMock.AddCall('TestUnexpectedCall');
  FMock.AddCall('TestUnexpectedCall'); // call 3 times, expected 2
  FMock.AddCall('TestEmpty');
  try
    FMock.Verify;
    Fail('Assertion expected 3b');
  except
    on E: Exception do begin
      CheckIs(E, EMockVerifyException, 'expected a EMockVerifyException 3b');
    end;
  end;     
end;

procedure TMockTests.TestWrongCallOrder;
begin
  FMock.Expects('TestSuccess');
  FMock.Expects('TestUnexpectedCall');
  FMock.Expects('TestEmpty');
  
  FMock.AddCall('TestSuccess');
  FMock.AddCall('TestEmpty'); // wrong order
  FMock.AddCall('TestUnexpectedCall');

  try
    FMock.Verify('VerifMsg');
    Fail('Assertion expected');
  except
    on E: Exception do begin
      CheckIs(E, EMockVerifyException, 'expected a EMockVerifyException');
      // check exception message contains message of Verify()
      Check(Pos('VerifMsg', E.Message) > 0, 'm');      
    end;
  end;
end;

{ TMockMethodTests }

procedure TMockMethodTests.SetUp;
begin
  inherited;

  FMethod := TMockMethod.Create('TestedMethod', 1);
  CheckEquals('TestedMethod', FMethod.Name, 'unexpected name value');
  Check(VarIsNull(FMethod.DirectReturnValue), 'return value <> null');
end;

procedure TMockMethodTests.TearDown;
begin
  FreeAndNil(FMethod);
  
  inherited;
end;

procedure TMockMethodTests.TestCalls;
var
  LMethod: TMockMethod;
begin
  // not yet called
  CheckEquals(False, FMethod.EnoughtCalls, 'a');

  // call it
  FMethod.AddCall;
  CheckEquals(True, FMethod.EnoughtCalls, 'b');

  // more calls expected
  LMethod := TMockMethod.Create('Called3Times', 3);
  try
    LMethod.AddCall;
    CheckFalse(LMethod.EnoughtCalls, 'c');
    LMethod.AddCall;
    CheckFalse(LMethod.EnoughtCalls, 'c2');
    LMethod.AddCall;
    CheckTrue(LMethod.EnoughtCalls, 'c3');
  finally
    LMethod.Free;
  end;
end;

procedure TMockMethodTests.TestMatchExpected;
var
  LMethod: TMockMethod;
begin
  // test with self
  CheckTrue(FMethod.MatchExpected(FMethod), 'a');

  // another method with same name
  LMethod := TMockMethod.Create(FMethod.Name, 1);
  try
    CheckTrue(FMethod.MatchExpected(LMethod), 'b');
    CheckTrue(LMethod.MatchExpected(FMethod), 'b2'); // check symetric
  finally
    LMethod.Free;
  end;

  // a method with another name
  LMethod := TMockMethod.Create('AnotherMethod', 1);
  try
    CheckFalse(FMethod.MatchExpected(LMethod), 'c');
    CheckFalse(LMethod.MatchExpected(FMethod), 'c2'); // check symetric
  finally
    LMethod.Free;
  end;

  // return value is ignored
  FMethod.Returns(123);
  CheckTrue(FMethod.MatchExpected(FMethod), 'd');

  LMethod := TMockMethod.Create(FMethod.Name, 1);
  try
    LMethod.Returns('return value is different but methods match');
    CheckTrue(FMethod.MatchExpected(LMethod), 'e');
    CheckTrue(LMethod.MatchExpected(FMethod), 'e2'); // check symetric
  finally
    LMethod.Free;
  end;
end;

procedure TMockMethodTests.TestMatchExpectedWithParams;
var
  LMethod: TMockMethod;
begin
  // test with self
  FMethod.WithParams([123, 'test', False]);
  CheckTrue(FMethod.MatchExpected(FMethod), 'a');

  // same method with same params
  LMethod := TMockMethod.Create(FMethod.Name, 1);
  try
    LMethod.WithParams([123, 'test', False]);
    CheckTrue(FMethod.MatchExpected(LMethod), 'b');
    CheckTrue(LMethod.MatchExpected(FMethod), 'b2'); // both match in this case
  finally
    LMethod.Free;
  end;

  // same method with different params
  LMethod := TMockMethod.Create(FMethod.Name, 1);
  try
    LMethod.WithParams([-1, '', False]);
    CheckFalse(FMethod.MatchExpected(LMethod), 'c');
    CheckFalse(LMethod.MatchExpected(FMethod), 'c2'); // both don't match in this case
  finally
    LMethod.Free;
  end;
  LMethod := TMockMethod.Create(FMethod.Name, 1);
  try
    LMethod.WithParams([123, 'test', True]);
    CheckFalse(FMethod.MatchExpected(LMethod), 'c3');
    CheckFalse(LMethod.MatchExpected(FMethod), 'c4'); // both don't match in this case
  finally
    LMethod.Free;
  end;

  // when an expected parameter value = Null (variant), it means it is ignored
  FMethod.WithParams([123, Null, False]);
  LMethod := TMockMethod.Create(FMethod.Name, 1);
  try
    LMethod.WithParams([123, 'different value', False]);
    CheckTrue(LMethod.MatchExpected(FMethod), 'd');
  finally
    LMethod.Free;
  end;      

  // no parameter values expected
  FMethod.Free;
  FMethod := TMockMethod.Create('TestedMethod', 1);
  LMethod := TMockMethod.Create(FMethod.Name, 1);
  try
    LMethod.WithParams([-1, '', False]);
    CheckFalse(FMethod.MatchExpected(LMethod), 'f'); // not symetric in this case
    CheckTrue(LMethod.MatchExpected(FMethod), 'f2');
  finally
    LMethod.Free;
  end;
end;

procedure TMockMethodTests.TestRaises;
begin
  FMethod.Raises(EInvalidOp);
  try
    FMethod.AddCall;
    Fail('Exception expected');
  except
    on E: Exception do begin
      CheckInherits(EInvalidOp, E.ClassType, 'a');
    end;
  end;

  // method never called (in order to check there is no memory leak)
  FMethod.Raises(EOutOfMemory);
end;

type
  TTestRecord = record
    i: integer;
    s: string;
  end;
  PTestRecord = ^TTestRecord;

procedure TMockMethodTests.TestRecordAsReturnValue;
var
  Rec, Rec2: TTestRecord;
begin
  { This test show how to use a record as return value or out parameter.
    This is a kludge, so if somebody find a better way it will be great }

  // we set values in the first record
  Rec.i := 100;
  Rec.s := 'hello';

  // we store the record address in the method return value
  FMethod.Returns(VariantsUtil.Ptr2Var(@Rec));

  // to retrieve the record back we need to cast the pointer to the right type and set it
  Rec2 := PTestRecord(Var2Ptr(FMethod.ReturnValue))^;
  CheckEquals(100, Rec2.i, 'a');
  CheckEquals('hello', Rec2.s, 'a2');
end;

procedure TMockMethodTests.TestReturnOutputParams;
var
  Intf: IInterface;
  I64: Int64;
begin
  Intf := TInterfacedObject.Create;
  I64 := $7FFFFFFFFFFFFFFF;
  
  // WithParams return the method
  Check(FMethod = FMethod.ReturnsOutParams([123, 'toto', True, Pointer(5), Self,
    Intf, I64]), '0');

  CheckEquals(7, Length(FMethod.OutParams), 'a');
  CheckEquals(123, FMethod.OutParams[0], 'b');
  CheckEquals('toto', FMethod.OutParams[1], 'c');
  CheckEquals(True, FMethod.OutParams[2], 'd');
  Check(5 = FMethod.OutParams[3], 'e');
  Check(Integer(Self) = FMethod.OutParams[4], 'f');
  Check(Integer(Intf) = FMethod.OutParams[5], 'g');
  Check($7FFFFFFFFFFFFFFF = FMethod.OutParams[6], 'h');   
end;

procedure TMockMethodTests.TestReturnValue;
var
  Intf: IUnknown;
begin
  // integer
  FMethod.Returns(123456);
  CheckEquals(123456, FMethod.ReturnValue, 'a');

  // string
  FMethod.Returns('hello');
  CheckEquals('hello', FMethod.ReturnValue, 'b');

  // float
  FMethod.Returns(3.14);
  Check(3.14 - FMethod.ReturnValue < 0.001, 'c'); // always check near equals on float

  // object
  FMethod.Returns(Self);
  Check(Self = FMethod.ReturnValueAsObject, 'd');

  // pointer
  FMethod.Returns(@Self);
  Check(@Self = FMethod.ReturnValueAsPointer, 'e');

  // interface
  Intf := TInterfacedObject.Create;
  FMethod.Returns(Intf);
  Check(Intf = FMethod.ReturnValueAsInterface, 'f');
end;

procedure TMockMethodTests.TestReturnValueNotSet;
begin
  // an exception is raised when we access the return value and it was not set
  try
    FMethod.ReturnValue;
    Fail('a - Exception expected');
  except
    on E: Exception do
    begin
      Check(E is EMockException, 'a');
    end;
  end;

  try
    FMethod.ReturnValueAsPointer;
    Fail('b - Exception expected');
  except
    on E: Exception do
    begin
      Check(E is EMockException, 'b');
    end;
  end;

  try
    FMethod.ReturnValueAsObject;
    Fail('c - Exception expected');
  except
    on E: Exception do
    begin
      Check(E is EMockException, 'c');
    end;
  end;

  try
    FMethod.ReturnValueAsInterface;
    Fail('d - Exception expected');
  except
    on E: Exception do
    begin
      Check(E is EMockException, 'd');
    end;
  end;   
end;

procedure TMockMethodTests.TestToString;
var
  LMethod: TMockMethod;
  ToStr: string;
begin
  // check ToString contains properties
  Check(Pos('TestedMethod', FMethod.ToString) > 0, 'a');

  // check ToString contains return value as a string
  FMethod.Returns('hello');
  Check(Pos('hello', FMethod.ToString) > 0, 'b');
  FMethod.Returns(4455);
  Check(Pos('4455', FMethod.ToString) > 0, 'b2');
  FMethod.Returns(Self);
  Check(Pos(IntToStr(Integer(Self)), FMethod.ToString) > 0, 'b3');
  FMethod.Returns(Pointer(56));
  Check(Pos('56', FMethod.ToString) > 0, 'b4');

  // check ToString contains parameters
  FMethod.WithParams([333, True, 'arg3', Self, Pointer(590)]);
  Check(Pos('333', FMethod.ToString) > 0, 'c');
  Check(Pos('True', FMethod.ToString) > 0, 'c2');
  Check(Pos('arg3', FMethod.ToString) > 0, 'c3');
  Check(Pos(IntToStr(Integer(Self)), FMethod.ToString) > 0, 'c4');
  Check(Pos('590', FMethod.ToString) > 0, 'c5');

  // check ToString contains exception class if any
  FMethod.Raises(EInvalidPointer);
  Check(Pos(EInvalidPointer.ClassName, FMethod.ToString) > 0, 'd');

  // check ToString contains expected calls count
  LMethod := TMockMethod.Create('Called345Times', 345);
  try
    Check(Pos('345', LMethod.ToString) > 0, 'e');
  finally
    LMethod.Free;
  end;

  // check ToString indicates if method matched
  LMethod := TMockMethod.Create('SomeMethod', 1);
  try
    ToStr := LMethod.ToString;

    // does not mach with a method
    LMethod.MatchExpected(FMethod);
    // check some data has been added to tostring
    Check(Length(LMethod.ToString) > Length(ToStr), 'f');

    // match with self
    LMethod.MatchExpected(LMethod);
    // same as before match
    CheckEquals(ToStr, LMethod.ToString, 'f2');
  finally
    LMethod.Free;
  end;  
end;

procedure TMockMethodTests.TestWithParams;
var
  Intf: IInterface;
  I64: Int64;
begin
  Intf := TInterfacedObject.Create;
  I64 := $7FFFFFFFFFFFFFFF;

  // WithParams return the method
  Check(FMethod = FMethod.WithParams([123, 'toto', True, Pointer(5), Self, Intf, I64]), '0');

  CheckEquals(7, Length(FMethod.Params), 'a');
  CheckEquals(123, FMethod.Params[0], 'b');
  CheckEquals('toto', FMethod.Params[1], 'c');
  CheckEquals(True, FMethod.Params[2], 'd');
  Check(5 = FMethod.Params[3], 'e');
  Check(Integer(Self) = FMethod.Params[4], 'f');
  Check(Integer(Intf) = FMethod.Params[5], 'g');
  Check($7FFFFFFFFFFFFFFF = FMethod.Params[6], 'h');
end;

{ TMockMethodListTests }

procedure TMockMethodListTests.SetUp;
begin
  inherited;

  FList := TMockMethodList.Create;
  CheckEquals(0, FList.Count);
end;

procedure TMockMethodListTests.TearDown;
begin
  FreeAndNil(FList);
  
  inherited;
end;

procedure TMockMethodListTests.TestUncalledMethodByName;
var
  M1, M2, M3: TMockMethod;
begin
  // add methods
  M1 := TMockMethod.Create('OneMethod', 1);
  M2 := TMockMethod.Create('AnotherMethod', 1);
  M3 := TMockMethod.Create('AThirdMethod', 1);
  FList.Add(M1);
  FList.Add(M2);
  FList.Add(M3);  

  // retrieve expected methods by name
  CheckNull(FList.UncalledMethodByName('UnknownMethod'), 'a');
  CheckSame(M1, FList.UncalledMethodByName('OneMethod'), 'a2');
  CheckSame(M2, FList.UncalledMethodByName('AnotherMethod'), 'a3');
  CheckSame(M3, FList.UncalledMethodByName('AThirdMethod'), 'a4');

  // call 'OneMethod'
  M1.AddCall;
  Check(M1.EnoughtCalls, 'b');
  CheckNull(FList.UncalledMethodByName('OneMethod'), 'b2');
  CheckSame(M2, FList.UncalledMethodByName('AnotherMethod'), 'b3');

  // call 'AnotherMethod'
  M2.AddCall;
  Check(M2.EnoughtCalls, 'c');
  CheckNull(FList.UncalledMethodByName('AnotherMethod'), 'c2');  
end;

procedure TMockMethodListTests.TestPopulate;
var
  M1, M2, M3: TMockMethod;
begin
  // add methods
  M1 := TMockMethod.Create('OneMethod', 1);
  M2 := TMockMethod.Create('AnotherMethod', 1);
  M3 := TMockMethod.Create('AThirdMethod', 1);
  FList.Add(M1);
  FList.Add(M2);
  FList.Add(M3);  
  CheckEquals(3, FList.Count, 'a');

  // retrieve methods by index
  CheckSame(M1, FList.Method(0), 'b');
  CheckSame(M2, FList.Method(1), 'b2');
  CheckSame(M3, FList.Method(2), 'b3');

  // clear list
  FList.Clear;
  CheckEquals(0, FList.Count, 'z');
end;

procedure TMockMethodListTests.TestToString;
var
  M1, M2: TMockMethod;
begin
  M1 := TMockMethod.Create('OneMethod', 1);
  M2 := TMockMethod.Create('AnotherMethod', 1);
  FList.Add(M1);
  FList.Add(M2);

  // check ToString contains methods descriptions
  Check(Pos(M1.ToString, FList.ToString) > 0, 'a');
  Check(Pos(M2.ToString, FList.ToString) > 0, 'a2');
end;

{ TMockVerifyExceptionTests }

procedure TMockVerifyExceptionTests.TestCreate;
var
  E: Exception;
  Expects, Calls: TMockMethodList;
  M1, M2: TMockMethod;
begin
  Expects := TMockMethodList.Create;
  Calls := TMockMethodList.Create;

  M1 := TMockMethod.Create('OneMethod', 1);
  M2 := TMockMethod.Create('AnotherMethod', 1);
  Expects.Add(M1);
  Calls.Add(M2);

  E := EMockVerifyException.Create('Some message', 'Error reason', Expects, Calls);
  try
    // check message contains given message
    Check(Pos('Some message', E.Message) > 0, 'a');
    // and error reason
    Check(Pos('Error reason', E.Message) > 0, 'a2');

    // check ToString contains lists descriptions
    Check(Pos(Expects.ToString, E.Message) > 0, 'b');
    Check(Pos(Calls.ToString, E.Message) > 0, 'c');
  finally
    E.Free;
    Expects.Free;
    Calls.Free;
  end;
end;

initialization

  TestFramework.RegisterTest(cTestSuiteName, TMockMethodTests.Suite);
  TestFramework.RegisterTest(cTestSuiteName, TMockMethodListTests.Suite);
  TestFramework.RegisterTest(cTestSuiteName, TMockVerifyExceptionTests.Suite);
  TestFramework.RegisterTest(cTestSuiteName, TMockTests.Suite);

end.

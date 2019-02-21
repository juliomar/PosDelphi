{: PascalMockExampleTest<p>

  This unit explain:
    - How to make and use a mock for an interface
    - How to make and use a mock for a class with virtual methods

  <b>History : </b><font size = -1><ul>
     <li>17/01/07 - DA - Unit creation
  </ul></font>

  <font size = -1><i>Courtesy of Tixeo http://www.tixeo.com</i></font>
}
unit PascalMockExampleTest;

interface

uses
  // Delphi
  Classes,

  // Dunit
  TestFrameWork,

  // Pascal Mock
  PascalMock,
  NoRefCountObject
  ;

type

////////////////////////////////////////////////////////////////////////////////
///
///  HOW TO MAKE A MOCK FOR AN INTERFACE
///
////////////////////////////////////////////////////////////////////////////////

  // IOrderPizzasInterface
  //
  {: A sample interface to show how to make a mock for an interface }
  IOrderPizzasInterface = Interface
    ['{23C288DE-0C8D-4866-9C07-AFCFF4EFE76A}']

    procedure Hello;
    procedure IWant(AIntParam: Integer; AStrParam: string);
    function HowLongWillItTake: Integer;
  end;
  
  // TOrderPizzasInterfaceMock
  //
  {: Mock object for IOrderPizzasInterface }
  TOrderPizzasInterfaceMock = class(TMock, IOrderPizzasInterface)
  public

    { IOrderPizzasInterface }
    procedure Hello;
    procedure IWant(AIntParam: Integer; AStrParam: string);
    function HowLongWillItTake: Integer;
  end;

  // TOrderPizzasInterfaceUser
  //
  {: An object which use IOrderPizzasInterface }  
  TOrderPizzasInterfaceUser = class
  private
    FIntf: IOrderPizzasInterface;
  public
    constructor Create(AInterface: IOrderPizzasInterface);

    function OrderPizzas: Integer;
  end;


  // TOrderPizzasInterfaceUserTests
  //
  {: Show how to use the mock to test TOrderPizzasInterfaceUser }
  TOrderPizzasInterfaceUserTests = class(TTestCase)
  private
    FMock: TOrderPizzasInterfaceMock;
    FTestedObject: TOrderPizzasInterfaceUser;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestOrderPizzas;
  end;
  


////////////////////////////////////////////////////////////////////////////////
///
///  HOW TO MAKE A MOCK FOR A CLASS WITH VIRTUAL METHODS
///
////////////////////////////////////////////////////////////////////////////////


  // TOrderPizzasAbstractObject
  //
  {: A sample object with virtual method to show how to make a mock for an object }
  TOrderPizzasAbstractObject = class
  public
    procedure Hello; virtual; abstract; { Note: It doesn't need to be abstract, only virtual is required }
    procedure IWant(AIntParam: Integer; AStrParam: string); virtual; abstract;
    function HowLongWillItTake: Integer; virtual; abstract;
  end;


  // TOrderPizzasObjectMock
  //
  {: Inherits from TOrderPizzasAbstractObject and override its methods }
  TOrderPizzasObjectMock = class(TOrderPizzasAbstractObject)
  private
    FMock: TMock; // a mock object which will check for us
  public
    constructor Create;
    destructor Destroy; override;

    { Publish needed mock methods.
      We can also implement IMock interface if needed }
    function Expects(const ASignatureCall: string; AExpectedCalls: Integer = 1): TMockMethod;
    procedure Verify(const AMessage: string = '');

    { Override TOrderPizzasAbstractObject methods }
    procedure Hello; override;
    procedure IWant(AIntParam: Integer; AStrParam: string); override;
    function HowLongWillItTake: Integer; override;
  end;


  // TOrderPizzasObjectUser
  //
  {: An object which use TOrderPizzasAbstractObject }
  TOrderPizzasObjectUser = class
  private
    FObj: TOrderPizzasAbstractObject;
  public
    constructor Create(AObject: TOrderPizzasAbstractObject);

    function OrderPizzas: Integer;
  end;


  // TOrderPizzasObjectUserTests
  //
  {: Show how to use the mock to test TOrderPizzasObjectUser }
  TOrderPizzasObjectUserTests = class(TTestCase)
  private
    FMock: TOrderPizzasObjectMock;
    FTestedObject: TOrderPizzasObjectUser;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestOrderPizzas;
  end;

implementation

{ TOrderPizzasInterfaceMock }

function TOrderPizzasInterfaceMock.HowLongWillItTake: Integer;
begin
  // mock object call AddCall() with the method signature and retrieve return value
  Result := AddCall('HowLongWillItTake').ReturnValue;
end;

procedure TOrderPizzasInterfaceMock.Hello;
begin
  // mock object call AddCall() with the method signature
  AddCall('Hello');
end;

procedure TOrderPizzasInterfaceMock.IWant(AIntParam: Integer; AStrParam: string);
begin
  // mock object call AddCall() with the method signature and arguments
  AddCall('IWant').WithParams([AIntParam, AStrParam]);
end;

{ TOrderPizzasInterfaceUserTests }

procedure TOrderPizzasInterfaceUserTests.TestOrderPizzas;
begin
  // 1) tell what we expect

  FMock.Expects('Hello');

  { We expect SomeProcedure to be called and we will check parameters.
   First parameter will be ignored and second parameter must be 'Pizzas' }
  FMock.Expects('IWant').WithParams([Ignored, 'Pizzas']);

  { Here we have a function, so we give it a return value of 30 minutes }
  FMock.Expects('HowLongWillItTake').Returns(30);

  // 2) Call the method we want to test
  FTestedObject.OrderPizzas;

  // 3) Verify what was called match what is expected
  FMock.Verify('Is everything ok?');
end;

procedure TOrderPizzasInterfaceUserTests.SetUp;
begin
  inherited;

  { Create a mock object }
  FMock := TOrderPizzasInterfaceMock.Create;

  { Use mock object to replace a real one }
  FTestedObject := TOrderPizzasInterfaceUser.Create(FMock as IOrderPizzasInterface);
end;

procedure TOrderPizzasInterfaceUserTests.TearDown;
begin
  FTestedObject.Free;
  FMock.Free;

  inherited;
end;

{ TOrderPizzasInterfaceUser }

constructor TOrderPizzasInterfaceUser.Create(AInterface: IOrderPizzasInterface);
begin
  inherited Create;

  FIntf := AInterface;
end;

function TOrderPizzasInterfaceUser.OrderPizzas: Integer;
begin
  // do some work which require to call interface functions
  FIntf.Hello;
  FIntf.IWant(2, 'Pizzas');
  Result := FIntf.HowLongWillItTake;
end;

{ TOrderPizzasObjectMock }

constructor TOrderPizzasObjectMock.Create;
begin
  inherited;

  // create mock which will make check for us
  FMock := TMock.Create;
end;

destructor TOrderPizzasObjectMock.Destroy;
begin
  FMock.Free;
  
  inherited;
end;

function TOrderPizzasObjectMock.Expects(const ASignatureCall: string;
  AExpectedCalls: Integer): TMockMethod;
begin
  // delegate implementation to the mock
  Result := FMock.Expects(ASignatureCall, AExpectedCalls);
end;

procedure TOrderPizzasObjectMock.Hello;
begin
  // don't call inherited

  // mock object call AddCall() with the method signature
  FMock.AddCall('Hello');  
end;

function TOrderPizzasObjectMock.HowLongWillItTake: Integer;
begin
  // don't call inherited

  // mock object call AddCall() with the method signature and retrieve return value
  Result := FMock.AddCall('HowLongWillItTake').ReturnValue;
end;

procedure TOrderPizzasObjectMock.IWant(AIntParam: Integer; AStrParam: string);
begin
  // don't call inherited

  // mock object call AddCall() with the method signature and arguments
  FMock.AddCall('IWant').WithParams([AIntParam, AStrParam]);  
end;

procedure TOrderPizzasObjectMock.Verify(const AMessage: string);
begin
  // delegate implementation to the mock
  FMock.Verify(AMessage);
end;

{ TOrderPizzasObjectUser }

constructor TOrderPizzasObjectUser.Create(
  AObject: TOrderPizzasAbstractObject);
begin
  inherited Create;

  FObj := AObject;
end;

function TOrderPizzasObjectUser.OrderPizzas: Integer;
begin
  // do some work which require to call object functions
  FObj.Hello;
  FObj.IWant(2, 'Pizzas');
  Result := FObj.HowLongWillItTake;
end;

{ TOrderPizzasObjectUserTests }

procedure TOrderPizzasObjectUserTests.SetUp;
begin
  inherited;

  { Create a mock object }
  FMock := TOrderPizzasObjectMock.Create;

  { Use mock object to replace a real one }
  FTestedObject := TOrderPizzasObjectUser.Create(FMock);
end;

procedure TOrderPizzasObjectUserTests.TearDown;
begin
  FTestedObject.Free;
  FMock.Free;

  inherited;
end;

procedure TOrderPizzasObjectUserTests.TestOrderPizzas;
begin
  // 1) tell what we expect

  FMock.Expects('Hello');

  { We expect SomeProcedure to be called and we will check parameters.
   First parameter will be ignored and second parameter must be 'Pizzas' }
  FMock.Expects('IWant').WithParams([Ignored, 'Pizzas']);

  { Here we have a function, so we give it a return value of 30 minutes }
  FMock.Expects('HowLongWillItTake').Returns(30);

  // 2) Call the method we want to test
  FTestedObject.OrderPizzas;

  // 3) Verify what was called match what is expected
  FMock.Verify('Is everything ok?');
end;

initialization

  TestFramework.RegisterTest('Example of use', TOrderPizzasInterfaceUserTests.Suite);
  TestFramework.RegisterTest('Example of use', TOrderPizzasObjectUserTests.Suite);

end.

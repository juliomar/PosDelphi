{: PascalMockDUnit<p>

  Integration of Pascal Mock and DUnit<p>

  <b>History : </b><font size = -1><ul>
     <li>02/01/07 - DA - Add RemoveMock() method
     <li>22/01/07 - DA - Unit creation
  </ul></font>

  <font size = -1><i>Original work courtesy of Tixeo http://www.tixeo.com</i></font>  
}
unit PascalMockDUnit;

interface

uses
  // Dunit
  TestFrameWork,

  // PascalMock
  PascalMock,

  // Delphi
  Classes,
  SysUtils
  ;

type

  // TMockObjectTestCase
  //
  TMockObjectTestCase = class(TTestCase)
  private
    FMocks: TStringList;
  protected
    procedure SetUp; override;
    procedure TearDown; override;

    {: Register a mock with the given name }
    function AddMock(AMock: TMock; const AName: string): TMock;
    {: Remove the mock with the given name }
    procedure RemoveMock(const AName: string);    
    {: Verify all mocks }
    procedure Verify(const AMessage: string);
  end;

implementation

{ TMockObjectTestCase }

// AddMock
//
{: @param AMock The mock object to add
   @param AName Friendly name of the mock object
   @return Value of AMock parameter
}
function TMockObjectTestCase.AddMock(AMock: TMock; const AName: string): TMock;
begin
  Assert(AMock <> nil, 'm');
  Result := AMock;
  FMocks.AddObject(AName, AMock);
end;


// RemoveMock
//
procedure TMockObjectTestCase.RemoveMock(const AName: string);
var
  Idx: Integer;
begin
  Idx := FMocks.IndexOf(AName);
  if Idx >= 0 then
    FMocks.Delete(Idx);
end;


// SetUp
//
procedure TMockObjectTestCase.SetUp;
begin
  inherited;

  FMocks := TStringList.Create;
end;


// TearDown
//
procedure TMockObjectTestCase.TearDown;
begin
  FreeAndNil(FMocks);
  inherited;
end;


// Verify
//
{: @param AMessage This message will appear in the error message }
procedure TMockObjectTestCase.Verify(const AMessage: string);
var
  I: Integer;
begin
  for I := 0 to FMocks.Count - 1 do
    (FMocks.Objects[I] as TMock).Verify(AMessage+' '+FMocks.Strings[I]);
end;

end.

unit EditIntfMockU;

interface
uses PascalMock, guicontrolsintf;

type
  TGUIEditMock = class(TMock, IGUIEdit)
  protected
    function GetText: string;
    procedure SetText(const Value: string);
    function GetAsInteger: Integer;
    function GetAsFloat: Extended;
    procedure SetReadOnly(const AValue: boolean);
    procedure SetVisible(const Value: boolean);
    function GetTextAsInteger: Integer;
    procedure SetTextAsinteger(const Value: Integer);
    function GetTextAsFloat: Extended;
    procedure SetTextAsFloat(const Value: Extended);
  public
    procedure ResetMockData; override;
  end;

implementation

function TGUIEditMock.GetAsFloat: Extended;
begin
  Result := AddCall('GetAsFloat').ReturnValue;
end;

function TGUIEditMock.GetAsInteger: Integer;
begin
  Result := AddCall('GetAsInteger').ReturnValue;
end;

function TGUIEditMock.GetText: string;
begin
  Result := AddCall('GetText').ReturnValue;
end;

function TGUIEditMock.GetTextAsFloat: Extended;
begin
  Result := AddCall('GetTextAsFloat').ReturnValue;
end;

function TGUIEditMock.GetTextAsInteger: Integer;
begin
  Result := AddCall('GetTextAsInteger').ReturnValue;
end;

procedure TGUIEditMock.ResetMockData;
begin
  inherited;

end;

procedure TGUIEditMock.SetReadOnly(const AValue: boolean);
begin
  AddCall('SetReadOnly').WithParams([AValue]);
end;

procedure TGUIEditMock.SetText(const Value: string);
begin
  AddCall('SetText').WithParams([Value]);
end;

procedure TGUIEditMock.SetTextAsFloat(const Value: Extended);
begin
  AddCall('SetTextAsFloat').WithParams([Value]);
end;

procedure TGUIEditMock.SetTextAsinteger(const Value: Integer);
begin
  AddCall('SetTextAsinteger').WithParams([Value]);
end;

procedure TGUIEditMock.SetVisible(const Value: boolean);
begin
  AddCall('SetVisible').WithParams([Value]);
end;

end.

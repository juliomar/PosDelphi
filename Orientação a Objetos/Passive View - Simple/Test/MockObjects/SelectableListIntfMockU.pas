unit SelectableListIntfMockU;

interface
uses SelectableListIntf, PascalMock, guicontrolsintf, CommonTypes;

type
  TGUISelectableListMock = class(TMock, IGUISelectableList)
  protected
    function GetText: string;
    procedure SetText(const Value: string);
    procedure SetValue(const Value: string);
    function GetValue: string;
    procedure AddPair(AKey, AValue: string);
    procedure Clear;
    function GetSelected: ISSKeyValue;
  public
    procedure ResetMockData; override;
  end;

implementation

procedure TGUISelectableListMock.AddPair(AKey,
  AValue: string);
begin
  AddCall('AddPair');
end;

procedure TGUISelectableListMock.Clear;
begin
  AddCall('Clear');
end;

function TGUISelectableListMock.GetSelected: ISSKeyValue;
begin
  Result := AddCall('GetSelected').ReturnValueAsInterface as ISSKeyValue;
end;

function TGUISelectableListMock.GetText: string;
begin
  Result := AddCall('GetText').ReturnValue;
end;

function TGUISelectableListMock.GetValue: string;
begin
  Result := AddCall('GetValue').ReturnValue;
end;

procedure TGUISelectableListMock.ResetMockData;
begin
  inherited;

end;

procedure TGUISelectableListMock.SetText(
  const Value: string);
begin
  AddCall('SetText').WithParams([Value]);
end;

procedure TGUISelectableListMock.SetValue(
  const Value: string);
begin
  AddCall('SetValue').WithParams([Value]);
end;

end.

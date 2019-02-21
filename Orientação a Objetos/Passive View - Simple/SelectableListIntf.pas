unit SelectableListIntf;

interface

uses
  GUIControlsIntf, Controls, Generics.Collections;

type
  TGUISelectableList = class(TInterfacedObject, IGUISelectableList)
  strict private
    FKeysValues : TList<TPair<string, string>>;
    function GetItemIndexByKey(const Key: string): Integer;
    function GetItemIndexByValue(const Value: string): Integer;
  protected
    FCustomList: TCustomListControl;
    function GetText: string;
    function SetText(const Value: string): IGUISelectableList;

    function SetValue(const Value: string): IGUISelectableList;
    function GetValue: string;
    function AddPair(AKey, AValue: String): IGUISelectableList;
    function GetSelected: TPair<string,string>;
  public
    constructor Create(ACustomList: TCustomListControl);
    destructor Destroy; override;
  end;

implementation

{ TGUISelectableList }

function TGUISelectableList.AddPair(AKey, AValue: String): IGUISelectableList;
var
  pair: TPair<string, string>;
begin
  pair.Key := akey;
  pair.Value := avalue;
  FKeysValues.Add(pair);
  FCustomList.AddItem(pair.Value, nil);
  Result := self;
end;

constructor TGUISelectableList.Create(ACustomList: TCustomListControl);
begin
  inherited Create;
  FCustomList := ACustomList;
  FKeysValues := TList<TPair<string, string>>.Create;
end;

destructor TGUISelectableList.Destroy;
begin
  FKeysValues.Free;
  inherited;
end;

function TGUISelectableList.GetItemIndexByKey(const Key: string): Integer;
var
  kv: TPair<string, string>;
  i: integer;
begin
  Result := -1;
  if FKeysValues.Count > 0 then
    for I := 0 to FKeysValues.Count - 1 do
    begin
      if FKeysValues[I].Key = key then
      begin
        Result := i;
        Break;
      end;
    end;
end;

function TGUISelectableList.GetItemIndexByValue(const Value: string): Integer;
var
  kv: TPair<string, string>;
  i: integer;
begin
  i := 0;
  for kv in FKeysValues do
  begin
    if kv.Value = Value then
    begin
      Result := i;
      Break;
    end;
    inc(i);
  end;
  Result := -1;
end;


function TGUISelectableList.GetSelected: TPair<string, string>;
begin
  Result := FKeysValues.Items[FCustomList.ItemIndex];
end;

function TGUISelectableList.GetText: string;
begin
  Result := GetSelected.Value;
end;

function TGUISelectableList.GetValue: string;
begin
  Result := GetSelected.Key;
end;

function TGUISelectableList.SetText(const Value: string): IGUISelectableList;
begin
  FCustomList.ItemIndex := GetItemIndexByValue(Value);
  Result := self;
end;

function TGUISelectableList.SetValue(const Value: string): IGUISelectableList;
begin
  FCustomList.ItemIndex := GetItemIndexByKey(Value);
  Result := Self;
end;

end.

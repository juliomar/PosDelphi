{*******************************************************}
{                                                       }
{           Copyright (c) 2009 Daniele Teti             }
{           www.danieleteti.it                          }
{           d.teti@bittime.it                           }
{                                                       }
{*******************************************************}


unit SelectableListIntf;

interface

uses
  GUIControlsIntf, Controls, Generics.Collections, CommonTypes;

type
  TGUISelectableList = class(TInterfacedObject, IGUISelectableList)
  strict private
    FKeysValues : TList<ISSKeyValue>;
    function GetItemIndexByKey(const Key: string): Integer;
    function GetItemIndexByValue(const Value: string): Integer;
  protected
    FCustomList: TCustomListControl;
    function GetText: string;
    procedure SetText(const Value: string);

    procedure SetValue(const Value: string);
    function GetValue: string;
    procedure AddPair(AKey, AValue: String);
    procedure Clear;
    function GetSelected: ISSKeyValue;
  public
    constructor Create(ACustomList: TCustomListControl = nil);
    destructor Destroy; override;
  end;

implementation

{ TGUISelectableList }
procedure TGUISelectableList.AddPair(AKey, AValue: String);
var
  kv: ISSKeyValue;
begin
  kv := TSSKeyValue.CreateNew(AKey, AValue);
  FKeysValues.Add(kv);
  FCustomList.AddItem(kv.GetValue, nil);
end;

procedure TGUISelectableList.Clear;
begin
  FCustomList.Clear;
  FKeysValues.Clear;
end;

constructor TGUISelectableList.Create(ACustomList: TCustomListControl);
begin
  inherited Create;
  FCustomList := ACustomList;
  FKeysValues := TList<ISSKeyValue>.Create;
end;

destructor TGUISelectableList.Destroy;
begin
  FKeysValues.Free;
  inherited;
end;

function TGUISelectableList.GetItemIndexByKey(const Key: string): Integer;
var
  i: integer;
begin
  Result := -1;
  if FKeysValues.Count > 0 then
    for I := 0 to FKeysValues.Count - 1 do
    begin
      if FKeysValues[I].GetKey = key then
      begin
        Result := i;
        Break;
      end;
    end;
end;

function TGUISelectableList.GetItemIndexByValue(const Value: string): Integer;
var
  kv: ISSKeyValue;
  i: integer;
begin
  i := 0;
  for kv in FKeysValues do
  begin
    if kv.GetValue = Value then
    begin
      Result := i;
      Break;
    end;
    inc(i);
  end;
  Result := -1;
end;


function TGUISelectableList.GetSelected: ISSKeyValue;
begin
  Result := FKeysValues.Items[FCustomList.ItemIndex];
end;

function TGUISelectableList.GetText: string;
begin
  Result := GetSelected.GetValue;
end;

function TGUISelectableList.GetValue: string;
begin
  Result := GetSelected.GetKey;
end;

procedure TGUISelectableList.SetText(const Value: string);
begin
  FCustomList.ItemIndex := GetItemIndexByValue(Value);
end;

procedure TGUISelectableList.SetValue(const Value: string);
begin
  FCustomList.ItemIndex := GetItemIndexByKey(Value);
end;

{ TGUISelectableListMock }

end.

unit EditIntf;

interface

uses
  GUIControlsIntf, Classes, StdCtrls;

type
  TGUIEdit = class(TInterfacedObject, IGUIEdit)
  protected
    FEdit: TCustomEdit;
    function GetText: string;
    procedure SetText(const Value: string);
    function GetAsInteger: Integer;
    function GetAsFloat: Extended;
    function SetReadOnly(const AValue: boolean): IGUIEdit;
    function SetVisible(const Value: Boolean): IGUIEdit;
    function GetTextAsInteger: Integer;
    function SetTextAsinteger(const Value: Integer): IGUIEdit;
    function GetTextAsFloat: Extended;
    function SetTextAsFloat(const Value: Extended): IGUIEdit;
  public
    constructor Create(AEdit: TCustomEdit);
  end;

implementation

uses
  SysUtils;

{ TGUIEdit }

constructor TGUIEdit.Create(AEdit: TCustomEdit);
begin
  inherited Create;
  FEdit := AEdit;
end;

function TGUIEdit.GetAsFloat: Extended;
begin
  if not TryStrToFloat(GetText, Result) then
    raise Exception.CreateFmt('"%s" is not a valid float', [GetText]);
end;

function TGUIEdit.GetAsInteger: Integer;
begin
  if not TryStrToInt(GetText, Result) then
    raise Exception.CreateFmt('"%s" is not a valid integer', [GetText]);
end;

function TGUIEdit.GetText: string;
begin
  Result := FEdit.Text;
end;

function TGUIEdit.GetTextAsFloat: Extended;
begin
  if not TryStrToFloat(GetText, Result) then
    raise Exception.CreateFmt('"%s" is not a valid float number', [GetText]);
end;

function TGUIEdit.GetTextAsInteger: Integer;
begin
  Result := StrToInt(GetText);
end;

function TGUIEdit.SetReadOnly(const AValue: boolean): IGUIEdit;
begin
  FEdit.ReadOnly := AValue;
  Result := self;
end;

procedure TGUIEdit.SetText(const Value: string);
begin
  FEdit.Text := Value;
end;

function TGUIEdit.SetTextAsFloat(const Value: Extended): IGUIEdit;
begin
  SetText(FloatToStrF(Value, ffFixed, 10,2));
  Result := self;
end;

function TGUIEdit.SetTextAsinteger(const Value: Integer): IGUIEdit;
begin
  SetText(IntToStr(Value));
  Result := Self;
end;

function TGUIEdit.SetVisible(const Value: Boolean): IGUIEdit;
begin
  FEdit.Visible := Value;
  Result := Self;
end;

end.

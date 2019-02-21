{*******************************************************}
{                                                       }
{           Copyright (c) 2009 Daniele Teti             }
{           www.danieleteti.it                          }
{           d.teti@bittime.it                           }
{                                                       }
{*******************************************************}


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
    procedure SetReadOnly(const AValue: boolean);
    procedure SetVisible(const Value: Boolean);
    function GetTextAsInteger: Integer;
    procedure SetTextAsinteger(const Value: Integer);
    function GetTextAsFloat: Extended;
  public
    constructor Create(AEdit: TCustomEdit = nil);
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

procedure TGUIEdit.SetReadOnly(const AValue: boolean);
begin
  FEdit.ReadOnly := AValue;
end;

procedure TGUIEdit.SetText(const Value: string);
begin
  FEdit.Text := Value;
end;

procedure TGUIEdit.SetTextAsinteger(const Value: Integer);
begin
  SetText(IntToStr(Value));
end;

procedure TGUIEdit.SetVisible(const Value: Boolean);
begin
  FEdit.Visible := Value;
end;


end.

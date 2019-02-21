{*******************************************************}
{                                                       }
{           Copyright (c) 2009 Daniele Teti             }
{           www.danieleteti.it                          }
{           d.teti@bittime.it                           }
{                                                       }
{*******************************************************}


unit CommonTypes;

interface

type
  ISSKeyValue = interface
    ['{F1765157-12BA-4477-8787-1E7498EAEF49}']
    function GetKey: String;
    function GetValue: String;
    procedure SetKey(const Value: String);
    procedure SetValue(const Value: String);
  end;

  TSSKeyValue = class(TInterfacedObject, ISSKeyValue)
  strict private
    FKey, FValue: String;
  protected
    function GetKey: String;
    function GetValue: String;
    procedure SetKey(const Value: String);
    procedure SetValue(const Value: String);
  public
    class function CreateNew(const Key, Value: String): ISSKeyValue;
  published
    property Key: String read GetKey write SetKey;
    property Value: String read GetValue write SetValue;
  end;

implementation

{ TSSKeyValue }

class function TSSKeyValue.CreateNew(const Key, Value: String): ISSKeyValue;
begin
  Result := TSSKeyValue.Create;
  Result.SetKey(Key);
  Result.SetValue(Value);
end;

function TSSKeyValue.GetKey: String;
begin
  Result := FKey;
end;

function TSSKeyValue.GetValue: String;
begin
  Result := FValue;
end;

procedure TSSKeyValue.SetKey(const Value: String);
begin
  FKey := Value;
end;

procedure TSSKeyValue.SetValue(const Value: String);
begin
  FValue := Value;
end;

end.

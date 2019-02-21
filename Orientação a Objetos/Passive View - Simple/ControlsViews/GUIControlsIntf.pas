{*******************************************************}
{                                                       }
{           Copyright (c) 2009 Daniele Teti             }
{           www.danieleteti.it                          }
{           d.teti@bittime.it                           }
{                                                       }
{*******************************************************}


unit GUIControlsIntf;

interface

uses CommonTypes;

type
  IGUIBaseInterface = interface
    ['{F0B7F031-9302-415E-8545-1FE20A365840}']
  end;

  IGUIEdit = interface(IGUIBaseInterface)
    ['{FE2D56FB-0CFB-4B33-9B56-0A523B235D37}']
    procedure SetText(const Value: String);
    function GetText: String;
    function GetAsInteger: Integer;
    function GetAsFloat: Extended;
    procedure SetReadOnly(const AValue: boolean);
    procedure SetVisible(const Value: Boolean);
    function GetTextAsInteger: Integer;
    procedure SetTextAsinteger(const Value: Integer);
    function GetTextAsFloat: Extended;
  end;

  IGUISelectableList = interface(IGUIBaseInterface)
    ['{EEFE5C52-94C3-464B-80F2-05E443B0F0F6}']
    procedure SetText(const Value: String);
    function GetText: String;
    procedure SetValue(const Value: String);
    function GetValue: String;
    function GetSelected: ISSKeyValue;
    procedure AddPair(AKey, AValue: String);
    procedure Clear;
  end;


implementation



end.

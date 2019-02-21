unit GUIControlsIntf;

interface

uses CommonTypes;

type
  IGUIBaseInterface = interface
    ['{F0B7F031-9302-415E-8545-1FE20A365840}']
  end;

  IGUIEdit = interface(IGUIBaseInterface)
    ['{FE2D56FB-0CFB-4B33-9B56-0A523B235D37}']
    function SetText(const Value: String): IGUIEdit;
    function GetText: String;
    function GetAsInteger: Integer;
    function GetAsFloat: Extended;
    function SetReadOnly(const AValue: boolean): IGUIEdit;
    function SetVisible(const Value: Boolean): IGUIEdit;
    function GetTextAsInteger: Integer;
    function SetTextAsinteger(const Value: Integer): IGUIEdit;
    function GetTextAsFloat: Extended;
    function SetTextAsFloat(const Value: Extended): IGUIEdit;
  end;

  IGUISelectableList = interface(IGUIBaseInterface)
    ['{EEFE5C52-94C3-464B-80F2-05E443B0F0F6}']
    function SetText(const Value: String): IGUISelectableList;
    function GetText: String;
    function SetValue(const Value: String): IGUISelectableList;
    function GetValue: String;
    function GetSelected: ISSKeyValue;
    function AddPair(AKey, AValue: String): IGUISelectableList;
    function Clear: IGUISelectableList;
  end;


implementation



end.

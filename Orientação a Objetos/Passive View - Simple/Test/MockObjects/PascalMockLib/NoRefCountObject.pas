{: NoRefCountObject<p>

  <b>History : </b><font size = -1><ul>
     <li>15/01/07 - DA - Unit creation
  </ul></font>

  <font size = -1><i>Original work courtesy of Tixeo http://www.tixeo.com</i></font>
}
unit NoRefCountObject;

interface

type

  // TNoRefCountObject
  //
  {: Base object to implement interfaces without reference counting }
  TNoRefCountObject =  class(TObject, IInterface)
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

implementation

{ TNoRefCountObject }

function TNoRefCountObject.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TNoRefCountObject._AddRef: Integer;
begin
  Result := -1;
end;

function TNoRefCountObject._Release: Integer;
begin
  Result := -1;
end;

end.

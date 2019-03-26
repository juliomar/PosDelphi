unit memento.model.memento;

interface

uses Memento.Model.Interfaces, System.Generics.Collections;

Type
  TModelMemento = class(TInterfacedObject, iMementoCaretaker<iAluno>)
  private
    FList: TDictionary<string, iAluno>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMementoCaretaker<iAluno>;
    function SaveState(Key: String; Value: iAluno): iMementoCaretaker<iAluno>;
    function Restore(Key: String): iAluno;
  end;

implementation

uses
  System.SysUtils;

{ TModelMemento }

constructor TModelMemento.Create;
begin
  FList := TDictionary<string, iAluno>.Create;
end;

destructor TModelMemento.Destroy;
begin
  FList.Free;
  inherited;
end;

class function TModelMemento.New: iMementoCaretaker<iAluno>;
begin
  Result := Self.Create;
end;

function TModelMemento.Restore(Key: String): iAluno;
begin
  Result := FList.Items[Key];
end;

function TModelMemento.SaveState(Key: String;
  Value: iAluno): iMementoCaretaker<iAluno>;
begin
  Result := Self;
  FList.Add(Key, Value);
end;


end.

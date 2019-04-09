unit Model.Observer;

interface

uses Classes, Generics.Collections;

type
  TSubject = class;

  IObserver = interface
    procedure Update(ASubject: TSubject);
  end;

  TSubject = class
  strict private
    FObservers: TList<IObserver>;
  private
    FHorario: TDateTime;
    procedure SetHorario(const Value: TDateTime);
  public
    constructor Create;
    property Horario:TDateTime read FHorario write SetHorario;
    procedure Attach(AObserver: IObserver);
    procedure Detach(AObserver: IObserver);
  strict protected
    procedure NotifyObservers;
  end;

  TConcreteSubject = class(TSubject)
  end;

implementation

constructor TSubject.Create;
begin
  inherited Create;
  FObservers := TList<IObserver>.Create;
end;

procedure TSubject.Attach(AObserver: IObserver);
begin
  FObservers.Add(AObserver);
end;

procedure TSubject.Detach(AObserver: IObserver);
var
  idx: Integer;
begin
  idx := FObservers.IndexOf(AObserver);
  If idx <> -1 Then
  begin
    FObservers.Delete(idx);
  end;
end;

procedure TSubject.NotifyObservers;
var
  Current: IObserver;
begin
  for Current in FObservers do
  begin
    Current.Update(self);
  end;
end;

procedure TSubject.SetHorario(const Value: TDateTime);
begin
  FHorario := Value;
  Self.NotifyObservers;
end;

end.

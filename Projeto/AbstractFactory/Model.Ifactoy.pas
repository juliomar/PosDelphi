unit Model.Ifactoy;

interface
uses
 Model.AbstractFactoy.Interfaces, Model.NomeCurso;
type
  TModelIfactory = class(TInterfacedObject, ifactory)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    Constructor create;
    Destructor Destroy; override;
    Class function New: ifactory;
    function NomeDoCurso: inomeDoCurso;

  published
    { published declarations }
  end;

implementation

{ TModelIfactory }

constructor TModelIfactory.create;
begin

end;

destructor TModelIfactory.Destroy;
begin

  inherited;
end;

class function TModelIfactory.New: ifactory;
begin
  Result := Self.create;
end;



function TModelIfactory.NomeDoCurso: inomeDoCurso;
begin
 Result := TModelNomeDoCurso.New;
end;

end.

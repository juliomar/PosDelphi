unit Model.NomeCurso;

interface

uses
  Model.AbstractFactoy.Interfaces;

type

  TModelNomeDoCurso = class(TInterfacedObject, iNomeDoCurso)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    constructor create;
    Destructor Destroy; override;
    class function New: iNomeDoCurso;
    function nome: string;
  published
    { published declarations }
  end;

implementation

{ TModelNomeDoCurso }

constructor TModelNomeDoCurso.create;
begin

end;

destructor TModelNomeDoCurso.Destroy;
begin

  inherited;
end;

class function TModelNomeDoCurso.New: iNomeDoCurso;
begin
  Result := Self.create;
end;

function TModelNomeDoCurso.nome: String;
begin
  Result := 'Pós Graduação em Desenvolvimento Delphi';
end;

end.

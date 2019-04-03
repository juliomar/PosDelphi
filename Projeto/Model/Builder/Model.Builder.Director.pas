unit Model.Builder.Director;

interface
  uses
    Model.Builder.Interfaces;

  Type
    TDirector = class
    public
      procedure Construct(Builder : IBuilder);

    end;

implementation

{ TDirector }

procedure TDirector.Construct(Builder: IBuilder);
begin
  Builder.BuildCabecalho;
  Builder.BuildDetalhes;
  Builder.BuildRodape;
end;

end.

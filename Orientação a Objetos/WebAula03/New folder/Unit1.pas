unit Unit1;

interface

type
  TMy = class
  public
    property Nome: string;
    SobreNome: string;
  end;


  TMinhaClasse = class
  private const
    minhaconstante = 'meu texto';
  private
    class var FNome : string;
  public
    class procedure soma(const AValor1: double; const AValor2: double;
      var ARetorno: double; out XYZ : double);

    class property Nome : string read FNome write FNome;
  end;

implementation

{ TMinhaClasse }

class procedure TMinhaClasse.soma(const AValor1, AValor2: double;
  var ARetorno: double; out XYZ : double);
begin
  ARetorno := AValor1 + AValor2;
  XYZ := 123;
end;

end.

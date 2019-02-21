unit Unit4;

interface

uses Unit3,unit2;

type
  TMyEmpresa = class(TMyJuliomar)
  private
    FValor: double;
    procedure SetValor(const Value: double);
    { private declarations }
  protected
    { protected declarations }
  public type
      TMarchetti = class
      strict private
        fid : integer;
      public
        property id : integer read fID write Fid;
      end;
    { public declarations }
    property Valor : double  read FValor write SetValor;

    procedure Processar;
  published
    { published declarations }
  end;


implementation

{ TMyEmpresa }

procedure TMyEmpresa.Processar;
var
  fVariavel : TMarchetti;
begin
  fVariavel := TMarchetti.Create;
  fVariavel.id := 2;
  fVariavel.Free;
end;

procedure TMyEmpresa.SetValor(const Value: double);
begin
  FValor := Value;
end;

end.

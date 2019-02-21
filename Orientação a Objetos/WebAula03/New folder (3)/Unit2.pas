unit Unit2;

interface

type
  ICarro = interface
    ['{BDCED9B8-A192-4745-8959-60142FBC9783}']
    function Velocidade: integer;
  end;

  TCarro = class abstract(TInterfacedObject,ICarro)
  public
    function Velocidade : integer;   virtual;
  end;


  TIX35 = class(TCarro)
  public
    function Velocidade : integer; override;
  end;

implementation

{ TCarro }

function TCarro.Velocidade: integer;
begin
  Result := 0;
end;

{ TIX35 }

function TIX35.Velocidade: integer;
begin
  Result := 150;
end;

end.

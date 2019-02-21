unit Unit3;

interface

uses Unit2;

type
  TMyJuliomar = class(TMyX)
  private
    FQuantidade: integer;
    { private declarations }
  protected
    { protected declarations }
  public

    property Quantidade: integer read FQuantidade write FQuantidade;
  published
    { published declarations }
  end;

implementation

end.

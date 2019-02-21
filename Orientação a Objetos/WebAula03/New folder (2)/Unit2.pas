unit Unit2;

interface

type
  TMyX = class
  private
    FDescricao: string;
    { private declarations }
  protected
    { protected declarations }
  public
    property Descricao: string read FDescricao write FDescricao;

  published
    { published declarations }
  end;

implementation

end.

unit Visitor.Model.ItemCurso;

interface



uses
  Visitor.Model.Interfaces, Visitor.Model.Venda.Simples;

type
  TModelItem = class(TInterfacedObject, iItem, iItemRegras, iVisitable)
  private
    { private declarations }
    FPrecoUnitario: Currency;
    FVisitor: ivisitor;
  protected
    { protected declarations }
  public
    { public declarations }
    Constructor Create;
    Destructor Destroy; override;
    Class function New: iItem;
    function PrecoDeVenda: Currency;
    function PrecoPromocao: Currency;
    function SetPrecoUnitario(Value: Currency): iItem;
    function Accept(Value: ivisitor): iItemRegras;
    function PrecoUnitario: Currency;
    function Visitor: ivisitor;
    function Regras: iVisitable;
  published
    { published declarations }
  end;

implementation

{ TModelItem }

function TModelItem.Accept(Value: ivisitor): iItemRegras;
begin
  FVisitor := Value;
  Result := FVisitor.Visit(Self);
end;

constructor TModelItem.Create;
begin
  FVisitor := TModelItemVendaSimples.New.Visitor;
end;

destructor TModelItem.Destroy;
begin

  inherited;
end;

class function TModelItem.New: iItem;
begin
  Result := Self.Create;
end;

function TModelItem.PrecoDeVenda: Currency;
begin
  Result := FVisitor.Visit(Self).PrecoDeVenda;
end;

function TModelItem.PrecoPromocao: Currency;
begin
  Result := FVisitor.Visit(Self).PrecoPromocao;
end;

function TModelItem.PrecoUnitario: Currency;
begin
  Result := FPrecoUnitario;
end;

function TModelItem.Regras: iVisitable;
begin
  Result := Self;
end;

function TModelItem.SetPrecoUnitario(Value: Currency): iItem;
begin
  Result := Self;
  FPrecoUnitario := Value;
end;

function TModelItem.Visitor: ivisitor;
begin
  Result := FVisitor;
end;

end.

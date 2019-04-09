unit Visitor.Model.Venda.Simples;

interface

uses
  Visitor.Model.Interfaces;

type
  TModelItemVendaSimples = class(TInterfacedObject, iItemRegras, ivisitor)
  private
    { private declarations }
    FVisit: iItem;
  protected
    { protected declarations }
  public
    { public declarations }
    Constructor Create;
    Destructor Destroy; override;
    Class function New: iItemRegras;
    function PrecoDeVenda: Currency;
    function PrecoPromocao: Currency;
    function Visit(Value: iItem): iItemRegras;
    function Visitor : iVisitor;

  published
    { published declarations }
  end;

implementation

{ TModelItemVendaSimples }

constructor TModelItemVendaSimples.Create;
begin

end;

destructor TModelItemVendaSimples.Destroy;
begin

  inherited;
end;

class function TModelItemVendaSimples.New: iItemRegras;
begin
  Result := Self.Create;
end;

function TModelItemVendaSimples.PrecoDeVenda: Currency;
begin
  Result := (FVisit.PrecoUnitario * 1);
end;

function TModelItemVendaSimples.PrecoPromocao: Currency;
begin
  Result := (FVisit.PrecoUnitario * 0.80);
end;

function TModelItemVendaSimples.Visit(Value: iItem): iItemRegras;
begin
  FVisit := Value;
  Result := Self;
end;

function TModelItemVendaSimples.Visitor: iVisitor;
begin
Result := Self;
end;

end.

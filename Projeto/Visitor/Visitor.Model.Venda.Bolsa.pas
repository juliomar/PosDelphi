unit Visitor.Model.Venda.Bolsa;

interface

uses
  Visitor.Model.Interfaces;

type
  TModelVendaBolsaEstudo = class(TInterfacedObject, iItemRegras, ivisitor)
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
    function Visitor: ivisitor;

  published
    { published declarations }
  end;

implementation

{ TModelVendaBolsaEstudo }

constructor TModelVendaBolsaEstudo.Create;
begin

end;

destructor TModelVendaBolsaEstudo.Destroy;
begin

  inherited;
end;

class function TModelVendaBolsaEstudo.New: iItemRegras;
begin
  Result := Self.Create;
end;

function TModelVendaBolsaEstudo.PrecoDeVenda: Currency;
begin
  Result := (FVisit.PrecoUnitario * 0.80);
end;

function TModelVendaBolsaEstudo.PrecoPromocao: Currency;
begin
  Result := (FVisit.PrecoUnitario * 0.50);
end;

function TModelVendaBolsaEstudo.Visit(Value: iItem): iItemRegras;
begin
  FVisit := Value;
  Result := Self;
end;

function TModelVendaBolsaEstudo.Visitor: ivisitor;
begin
  Result := Self;
end;

end.

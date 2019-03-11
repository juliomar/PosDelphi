unit Controller.Cadastro.Pessoa;

interface

uses
  Controller.Interfaces,
  Model.Cadastro.Interfaces,
  Model.Cadastro.Pessoa;

type
  TControllerCadastroPessoa = class (TInterfacedObject, iControllerCadastroPessoa)
  private
    FModelPessoa : iModelCadastroPessoa;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerCadastroPessoa;
    function Pessoa : iModelCadastroPessoa;
  end;

implementation


{ TControllerCadastroPessoa }

constructor TControllerCadastroPessoa.Create;
begin
  FModelPessoa := TModelCadastroPessoa.New;
end;

destructor TControllerCadastroPessoa.Destroy;
begin
  inherited;
end;

class function TControllerCadastroPessoa.New: iControllerCadastroPessoa;
begin
  Result := Self.Create;
end;

function TControllerCadastroPessoa.Pessoa: iModelCadastroPessoa;
begin
  Result := FModelPessoa;
end;

end.

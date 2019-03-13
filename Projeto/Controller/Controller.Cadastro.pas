unit Controller.Cadastro;

interface

uses
  System.Generics.Collections,

  entity.pessoa,

  Controller.Interfaces,

  Model.Cadastro.Interfaces,
  Model.Cadastro,
  Model.Iterator.Interfaces;

type
  TControllerCadastro<T : Class, constructor> = class (TInterfacedObject, iControllerCadastro<T>)
  private
    FModel    : iModelCadastro<T>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerCadastro<T>;
    function Entidade : iModelCadastro<T>;
  end;

implementation

uses
  System.SysUtils;

{ TControllerCadastro }

constructor TControllerCadastro<T>.Create;
begin
  FModel := TModelCadastro<T>.New;
end;

destructor TControllerCadastro<T>.Destroy;
begin
  inherited;
end;

class function TControllerCadastro<T>.New: iControllerCadastro<T>;
begin
  Result := Self.Create;
end;

function TControllerCadastro<T>.Entidade: iModelCadastro<T>;
begin
  Result := FModel;
end;

end.

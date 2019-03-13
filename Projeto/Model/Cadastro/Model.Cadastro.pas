{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit Model.Cadastro;

interface

uses
  System.Generics.Collections,
  System.SysUtils,

  ormbr.container.clientdataset,
  ormbr.container.objectset.interfaces,
  ormbr.container.objectset,

  entity.pessoa,

  Model.Cadastro.Interfaces,
  Model.Conexao,
  Model.Iterator.Interfaces;

type
  TModelCadastro<T : class, constructor> = class(TInterfacedObject, iModelCadastro<T>)
  private
    FConexao      : TdmConexao;
    FContainer    : IContainerObjectSet<T>;
    FIterator     : iIterator<T>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelCadastro<T>;
    function Entidade: iModelCadastro<T>;
    function getLista : iIterator<T>;
  end;

implementation

uses
  Model.Lista.Factory;

{ TModelCadastro<T> }

function TModelCadastro<T>.Entidade: iModelCadastro<T>;
begin
  Result := Self;
end;

function TModelCadastro<T>.getLista: iIterator<T>;
begin
  Result := FIterator;
end;

constructor TModelCadastro<T>.Create;
begin
  FConexao := TDMConexao.New;
  FContainer := TContainerObjectSet<T>.Create(FConexao.Conn, 10);
  FIterator := TModelListaFactory<T>
                .New(tpListaObjetos)
                .getIterator
                .Adicionar(FContainer.Find);
end;

destructor TModelCadastro<T>.Destroy;
begin
  inherited;
end;

class function TModelCadastro<T>.New: iModelCadastro<T>;
begin
  Result := Self.Create;
end;

end.

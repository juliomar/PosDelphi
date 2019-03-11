{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit Model.Cadastro.Pessoa;

interface

uses
  System.Generics.Collections,
  System.SysUtils,

  ormbr.container.clientdataset,
  ormbr.container.objectset.interfaces,
  ormbr.container.objectset,

  entity.pessoa,

  Model.Cadastro.Interfaces,
  Model.Conexao.Interfaces,
  Model.Conexao;

type
  TModelCadastroPessoa = class(TInterfacedObject, iModelCadastroPessoa)
  private
    FConexao : TdmConexao;
    FPessoa: IContainerObjectSet<TPessoa>;
    FPessoaLista: TObjectList<TPessoa>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelCadastroPessoa;
    function Pessoa: iModelCadastroPessoa;
    function GetListaPessoa : TObjectList<TPessoa>;
  end;

implementation

{ TModelCadastroPessoa }

function TModelCadastroPessoa.Pessoa: iModelCadastroPessoa;
begin
  Result := Self;
end;

constructor TModelCadastroPessoa.Create;
begin
  FConexao := TDMConexao.New;
  FPessoa := TContainerObjectSet<TPessoa>.Create(FConexao.Conn, 10);
  FPessoaLista := FPessoa.Find;
end;

destructor TModelCadastroPessoa.Destroy;
begin
  FreeAndNil(FPessoaLista);
  inherited;
end;

function TModelCadastroPessoa.GetListaPessoa: TObjectList<TPessoa>;
begin
  Result := FPessoaLista;
end;

class function TModelCadastroPessoa.New: iModelCadastroPessoa;
begin
  Result := Self.Create;
end;

end.

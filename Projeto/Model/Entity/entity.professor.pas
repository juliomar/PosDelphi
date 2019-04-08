{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit entity.professor;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,

  /// orm
  Ormbr.Types.Blob,
  Ormbr.Types.Lazy,
  Ormbr.Types.Mapping,
  Ormbr.Types.Nullable,
  Ormbr.Mapping.Classes,
  Ormbr.Mapping.Register,
  Ormbr.Mapping.Attributes,

  entity.Pessoa,
  entity.Titulo;

type

  [ Entity ]
  TProfessor = class(
    TPessoa)
  private
    Ftitulos: TObjectList<TTitulo>;
  public
    constructor Create;
    destructor Destroy; override;

    property Titulos: TObjectList<TTitulo> read Ftitulos write Ftitulos;

    //Padrão Prototype
    function Clonar: TProfessor;
  end;

implementation

{ TProfessor }

function TProfessor.Clonar: TProfessor;
var
  CloneProfessor: TProfessor;
begin
  CloneProfessor := TProfessor.Create;

  CloneProfessor.Id        := Self.Id;
  CloneProfessor.Nome      := Self.Nome;
  CloneProfessor.Matricula := Self.Matricula;
  CloneProfessor.sobrenome := Self.sobrenome;
  CloneProfessor.email     := Self.email;
  CloneProfessor.telefone  := Self.telefone;
  CloneProfessor.sexo      := Self.sexo;
  CloneProfessor.datanascimento  := Self.datanascimento;
  CloneProfessor.Titulos  := Self.Titulos;
  result := CloneProfessor;
end;

constructor TProfessor.Create;
begin
  Ftitulos := TObjectList<TTitulo>.Create;
end;

destructor TProfessor.Destroy;
begin
  Ftitulos.Free;
  inherited;
end;

initialization
TRegisterClass.RegisterEntity (TProfessor);
end.

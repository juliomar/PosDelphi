{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit entity.aluno;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,

  /// orm
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.types.mapping,
  ormbr.types.nullable,
  ormbr.mapping.Classes,
  ormbr.mapping.register,
  ormbr.mapping.attributes,

  entity.pessoa,
  entity.curso;

type
  // teste do GIT
  [Entity]
  [Table('aluno','dados de alunos ')]
  [Sequence('aluno')]
  TAluno = class(
    TPessoa)
  private
    fCursos: TObjectList<TCurso>;
  public
    constructor Create;
    destructor Destroy; override;

    [Association(OneToMany, 'aluno_id', 'curso', 'curso_id')]
    [CascadeActions([CascadeAutoInc, CascadeInsert, CascadeUpdate, CascadeDelete])]
    property Cursos: TObjectList<TCurso> read fCursos write fCursos;

    //Padrão Prototype
    function Clonar: TAluno;
  end;

implementation

{ TAluno }

function TAluno.Clonar: TAluno;
var
  CloneAluno: TAluno;
begin
  CloneAluno := TAluno.Create;

  CloneAluno.Id        := Self.Id;
  CloneAluno.Nome      := Self.Nome;
  CloneAluno.Matricula := Self.Matricula;
  CloneAluno.sobrenome := Self.sobrenome;
  CloneAluno.email     := Self.email;
  CloneAluno.telefone  := Self.telefone;
  CloneAluno.sexo      := Self.sexo;
  CloneAluno.datanascimento  := Self.datanascimento;
  CloneAluno.Cursos := Self.Cursos;
  result := CloneAluno;
end;

constructor TAluno.Create;
begin
  fCursos := TObjectList<TCurso>.Create;
end;

destructor TAluno.Destroy;
begin
  fCursos.Free;
  inherited;
end;

//initialization
//
//TRegisterClass.RegisterEntity (TAluno);

end.


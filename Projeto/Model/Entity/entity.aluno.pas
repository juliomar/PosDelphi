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
  ormbr.mapping.classes,
  ormbr.mapping.register,
  ormbr.mapping.attributes,

  entity.pessoa;


type
  TAluno = class(TPessoa)
  private
  public
    property Cursos : TCursos read fCursos write fCursos;
  end;

implementation

end.

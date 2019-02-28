unit entity.professor;

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
  entity.titulo;

type

  TProfessor = class(TPessoa)
  public


    property titulos: TTitulo read ftitulos write ftitulos;

  end;

implementation

end.

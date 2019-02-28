unit entity.formacao;

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
  ormbr.mapping.attributes;

type
  [Entity]
  [Table('formacao','Tipo de formação do profission')]
  [PrimaryKey()]
  TFormacao = class
  private
    fdescricao: string;
    fid: integer;
  public
    property id  : integer read fid write fid;
    property descricao : string read fdescricao write fdescricao;
  end;


implementation


initialization
  TRegisterClass.RegisterEntity(TFormacao);


end.

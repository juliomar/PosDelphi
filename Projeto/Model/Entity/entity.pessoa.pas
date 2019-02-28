unit entity.pessoa;

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
  TPessoa = class
  private
    Fsobrenome: string;
    Femail: string;
    fid: integer;
    Fnome: string;
    Ftelefone: string;
    fmatricula: integer;
    fdatanascimento: TDateTime;
    fsexo: TSexo;
  public
    property id: integer read fid write fid;
    property matricula: integer read fmatricula write fmatricula;
    property nome: string read Fnome write Fnome;
    property sobrenome: string read Fsobrenome write Fsobrenome;
    property email: string read Femail write Femail;
    property telefone: string read Ftelefone write Ftelefone;
    property sexo: TSexo read fsexo write fsexo;
    property datanascimento: TDateTime read fdatanascimento write fdatanascimento;
  end;

implementation

{ TPessoa }

end.

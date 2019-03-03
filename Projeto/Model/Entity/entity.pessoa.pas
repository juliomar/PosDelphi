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
  [Enumeration('M, F')]
  TSexo = (Masculino, Femenino);

  [entity]
  [Table('pessoa', 'pessoas do sistema')]
  [PrimaryKey('id', 'chave primaria')]
  TPessoa = class
  private
    Fsobrenome: string;
    Femail: string;
    fid: integer;
    Fnome: string;
    Ftelefone: string;
    fmatricula: integer;
    fdatanascimento: TDate;
    fsexo: TSexo;
  public
    [Restrictions([NoUpdate, NotNull])]
    [Column('id', ftInteger)]
    [Dictionary('Código', 'Mensagem validação', '', '', '', '', tacenter)]
    property id: integer read fid write fid;

    [Restrictions([Unique])]
    [Column('matricula', ftInteger)]
    [Dictionary('Matrícula', 'Mensagem validação', '', '', '', '', tacenter)]
    property matricula: integer read fmatricula write fmatricula;

    [Column('nome', ftString, 60)]
    [Dictionary('Nome', 'Mensagem validação', '', '', '', '', tacenter)]
    property nome: string read Fnome write Fnome;

    [Column('sobrenome', ftString, 60)]
    [Dictionary('Sobrenome', 'Mensagem validação', '', '', '', '', tacenter)]
    property sobrenome: string read Fsobrenome write Fsobrenome;

    [Column('email', ftString, 100)]
    [Dictionary('E-mail', 'Mensagem validação', '', '', '', '', tacenter)]
    property email: string read Femail write Femail;

    [Column('telefone', ftString, 15)]
    [Dictionary('Telefone', 'Mensagem validação', '', '', '', '', tacenter)]
    property telefone: string read Ftelefone write Ftelefone;

    [Column('sexo', ftString)]
    [Dictionary('Sexo', 'Mensagem validação', '', '', '', '', tacenter)]
    property sexo: TSexo read fsexo write fsexo;

    [Column('datanascimento', ftDate)]
    [Dictionary('Nascimento', 'Mensagem validação', '', '', '', '', tacenter)]
    property datanascimento: TDate read fdatanascimento write fdatanascimento;
  end;

implementation

{ TPessoa }

initialization

TRegisterClass.RegisterEntity(TPessoa);

end.

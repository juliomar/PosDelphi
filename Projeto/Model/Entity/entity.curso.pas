{*******************************************************}
{                                                       }
{       Projeto Teste P�s-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit entity.curso;

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
  [ Entity ]
  [ Table('Curso', 'Tipo de cursos') ]
  [ PrimaryKey('id', AutoInc, Ascending, True, 'Chave prim�ria') ]
//  [ Indexe('pk_formacao','id', '')]
  [ Sequence('Curso') ]
  [ OrderBy('descricao') ]

  TCurso = class
  private
    fdescricao       : string;
    fid              : integer;
    fnotaenad        : double;
    fareaconhecimento: string;
  public


    [ Restrictions([ NoUpdate, NotNull ]) ]
    [ Column('id', ftInteger) ]
    [ Dictionary('C�digo', 'Mensagem valida��o', '', '', '', tacenter) ]
    property id: integer read fid write fid;

    [Restrictions([NotNull])]
    [ Column('descricao', ftString, 60) ]
    [ Dictionary('Descri��o', 'Mensagem valida��o', '', '', '', tacenter) ]
    property descricao: string read fdescricao write fdescricao;

    [ Column('areaconhecimento', ftString, 60) ]
    [ Dictionary('�rea de Conhecimento', 'Mensagem valida��o', '', '', '', tacenter) ]
    property areaconhecimento : string read fareaconhecimento write fareaconhecimento;

    [ Column('notaenad', ftFloat, 2,2) ]
    [ Dictionary('Nota ENAD', 'Mensagem valida��o', '', '', '', tacenter) ]
    property notaenad: double read fnotaenad write fnotaenad;
  end;

implementation


initialization
TRegisterClass.RegisterEntity (TCurso);
end.

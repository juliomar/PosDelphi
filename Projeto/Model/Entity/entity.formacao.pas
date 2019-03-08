{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
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

  [ Entity ]
  [ Table('formacao', 'Tipo de formação do profission') ]
  [ PrimaryKey('id', AutoInc, Ascending, True, 'Chave primria') ]
//  [ Indexe('pk_formacao','id', '')]
  [ Sequence('formacao') ]
  [ OrderBy('descricao') ]
  TFormacao = class
  private
    fdescricao: string;
    fid       : integer;
  public
    [ Restrictions([ NoUpdate, NotNull ]) ]
    [ Column('id', ftInteger) ]
    [ Dictionary('Código', 'Mensagem validação', '', '', '', tacenter) ]
    property id: integer read fid write fid;

    [ Column('descricao', ftString, 60) ]
    [ Dictionary('Descrição', 'Mensagem validação', '', '', '', tacenter) ]
    property descricao: string read fdescricao write fdescricao;
  end;

implementation

initialization
TRegisterClass.RegisterEntity (TFormacao);

end.

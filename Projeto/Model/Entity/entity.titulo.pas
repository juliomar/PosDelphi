{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit entity.titulo;

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

  entity.formacao;

type

  [ Entity ]
  [ Table('titulo', 'Título') ]
  [ PrimaryKey('id', AutoInc, Ascending, True, 'Chave primária') ]
  [ Sequence('titulo') ]
  [ OrderBy('descricao') ]

  TTitulo = class
  private
    fdescricao: string;
    fformacao : TObjectList<TFormacao>;
    fid       : integer;
  public
    constructor Create;
    destructor Destroy; override;

    [ Restrictions([ NoUpdate, NotNull ]) ]
    [ Column('id', ftInteger) ]
    [ Dictionary('Código', 'Mensagem validação', '', '', '', tacenter) ]
    property id: integer read fid write fid;

    [ Restrictions([ NotNull ]) ]
    [ Column('descricao', ftString, 60) ]
    [ Dictionary('Descrição', 'Mensagem validação', '', '', '', tacenter) ]
    property descricao: string read fdescricao write fdescricao;

    [Association(OneToMany, 'titulo_id', 'formacao', 'formacao_id')]
    [CascadeActions([CascadeAutoInc, CascadeInsert, CascadeUpdate, CascadeDelete])]
    property formacao: TObjectList<TFormacao> read fformacao write fformacao;
  end;

implementation

{ TTitulo }

constructor TTitulo.Create;
begin
  fformacao := TObjectList<TFormacao>.Create;
end;

destructor TTitulo.Destroy;
begin
  fformacao.Free;
  inherited;
end;

//initialization
//
//TRegisterClass.RegisterEntity (TTitulo);
end.

{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
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
  [Entity]

  TCurso = class
  private
    fdescricao       : string;
    fid              : integer;
    fnotaenad        : double;
    fareaconhecimento: string;
  public
    property id              : integer read fid write fid;
    property descricao       : string read fdescricao write fdescricao;
    property areaconhecimento: string read fareaconhecimento
      write fareaconhecimento;
    property notaenad: double read fnotaenad write fnotaenad;
  end;

implementation


initialization
TRegisterClass.RegisterEntity (TCurso);
end.

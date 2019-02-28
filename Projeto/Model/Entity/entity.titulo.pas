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
  TTitulo = class
  private
    fdescricao: string;
    fformacao: TObjectList<TFormacao>;
    fid: integer;
  public
    constructor Create;
    destructor Destroy; override;

    property id: integer read fid write fid;
    property descricao: string read fdescricao write fdescricao;
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

end.

unit entity.mensalidades;

interface

uses
  Classes,
  Data.DB,
  Generics.Collections,
  ormbr.mapping.attributes,
  ormbr.types.nullable,
  ormbr.types.mapping,
  ormbr.mapping.register;
type
  [Entity]
  [Table('MENSALIDADES','')]
  [PrimaryKey('codigo', 'Chave primária')]
//  [Indexe('idx_client_name','client_name')]
  [OrderBy('DtLancamento')]
  TModelMensalidades = class
  private
    FDtLancamento: String;
    FCodigo: Integer;
    FAluno: String;
    FPago: String;
  public
    [Restrictions([NoUpdate, NotNull])]
    [Column('codigo', ftInteger)]
    [Dictionary('codigo','Mensagem de validação','','','',taCenter)]
    property Codigo: Integer read FCodigo write FCodigo;

    [Restrictions([NotNull])]
    [Column('DtLancamento', ftDate)]
    [Dictionary('DtLancamento','Mensagem de validação','','','',taLeftJustify)]
    property DtLancamento: String read FDtLancamento write FDtLancamento;

    [Restrictions([NotNull])]
    [Column('Aluno', ftString, 100)]
    [Dictionary('Aluno','Mensagem de validação','','','',taLeftJustify)]
    property Aluno: String read FAluno write FAluno;

    [Column('Pago', ftString, 1)]
    [Dictionary('Pago','Mensagem de validação','','','',taLeftJustify)]
    property Pago: String read FPago write FPago;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TModelMensalidades);

end.

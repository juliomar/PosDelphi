unit ormbr.model.country;

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
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('COUNTRY', '')]
  [PrimaryKey('COUNTRY', NotInc, NoSort, False, 'Chave primária')]
  TCOUNTRY = class
  private
    { Private declarations } 
    FCOUNTRY: String;
    FCURRENCY: String;
  public 
    { Public declarations } 
    [Restrictions([NotNull])]
    [Column('COUNTRY', ftString, 15)]
    [Dictionary('COUNTRY', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property country: String read FCOUNTRY write FCOUNTRY;

    [Restrictions([NotNull])]
    [Column('CURRENCY', ftString, 10)]
    [Dictionary('CURRENCY', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property currency: String read FCURRENCY write FCURRENCY;
  end;

implementation

initialization

  TRegisterClass.RegisterEntity(TCOUNTRY)

end.

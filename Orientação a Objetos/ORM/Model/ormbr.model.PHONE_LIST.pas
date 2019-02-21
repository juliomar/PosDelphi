unit ormbr.model.phone_list;

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
  [Table('PHONE_LIST', '')]
  TPHONE_LIST = class
  private
    { Private declarations } 
    FEMP_NO: Nullable<Integer>;
    FFIRST_NAME: Nullable<String>;
    FLAST_NAME: Nullable<String>;
    FPHONE_EXT: Nullable<String>;
    FLOCATION: Nullable<String>;
    FPHONE_NO: Nullable<String>;
  public 
    { Public declarations } 
    [Column('EMP_NO', ftInteger)]
    [Dictionary('EMP_NO', 'Mensagem de validação', '', '', '', taCenter)]
    property emp_no: Nullable<Integer> read FEMP_NO write FEMP_NO;

    [Column('FIRST_NAME', ftString, 15)]
    [Dictionary('FIRST_NAME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property first_name: Nullable<String> read FFIRST_NAME write FFIRST_NAME;

    [Column('LAST_NAME', ftString, 20)]
    [Dictionary('LAST_NAME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property last_name: Nullable<String> read FLAST_NAME write FLAST_NAME;

    [Column('PHONE_EXT', ftString, 4)]
    [Dictionary('PHONE_EXT', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property phone_ext: Nullable<String> read FPHONE_EXT write FPHONE_EXT;

    [Column('LOCATION', ftString, 15)]
    [Dictionary('LOCATION', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property location: Nullable<String> read FLOCATION write FLOCATION;

    [Column('PHONE_NO', ftString, 20)]
    [Dictionary('PHONE_NO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property phone_no: Nullable<String> read FPHONE_NO write FPHONE_NO;
  end;

implementation

initialization

  TRegisterClass.RegisterEntity(TPHONE_LIST)

end.

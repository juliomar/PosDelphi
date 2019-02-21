unit ormbr.model.customer;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  ormbr.model.country,
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('CUSTOMER', '')]
  [PrimaryKey('CUST_NO', NotInc, NoSort, False, 'Chave primária')]
  TCUSTOMER = class
  private
    { Private declarations } 
    FCUST_NO: Integer;
    FCUSTOMER: String;
    FCONTACT_FIRST: Nullable<String>;
    FCONTACT_LAST: Nullable<String>;
    FPHONE_NO: Nullable<String>;
    FADDRESS_LINE1: Nullable<String>;
    FADDRESS_LINE2: Nullable<String>;
    FCITY: Nullable<String>;
    FSTATE_PROVINCE: Nullable<String>;
    FCOUNTRY: Nullable<String>;
    FPOSTAL_CODE: Nullable<String>;
    FON_HOLD: Nullable<String>;

    FCOUNTRY_0: Lazy< TCOUNTRY > ;
  public 
    { Public declarations } 
    constructor Create;
    function getCOUNTRY_0 : TCOUNTRY;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('CUST_NO', ftInteger)]
    [Dictionary('CUST_NO', 'Mensagem de validação', '', '', '', taCenter)]
    property cust_no: Integer read FCUST_NO write FCUST_NO;

    [Restrictions([NotNull])]
    [Column('CUSTOMER', ftString, 25)]
    [Dictionary('CUSTOMER', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property customer: String read FCUSTOMER write FCUSTOMER;

    [Column('CONTACT_FIRST', ftString, 15)]
    [Dictionary('CONTACT_FIRST', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property contact_first: Nullable<String> read FCONTACT_FIRST write FCONTACT_FIRST;

    [Column('CONTACT_LAST', ftString, 20)]
    [Dictionary('CONTACT_LAST', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property contact_last: Nullable<String> read FCONTACT_LAST write FCONTACT_LAST;

    [Column('PHONE_NO', ftString, 20)]
    [Dictionary('PHONE_NO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property phone_no: Nullable<String> read FPHONE_NO write FPHONE_NO;

    [Column('ADDRESS_LINE1', ftString, 30)]
    [Dictionary('ADDRESS_LINE1', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property address_line1: Nullable<String> read FADDRESS_LINE1 write FADDRESS_LINE1;

    [Column('ADDRESS_LINE2', ftString, 30)]
    [Dictionary('ADDRESS_LINE2', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property address_line2: Nullable<String> read FADDRESS_LINE2 write FADDRESS_LINE2;

    [Column('CITY', ftString, 25)]
    [Dictionary('CITY', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property city: Nullable<String> read FCITY write FCITY;

    [Column('STATE_PROVINCE', ftString, 15)]
    [Dictionary('STATE_PROVINCE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property state_province: Nullable<String> read FSTATE_PROVINCE write FSTATE_PROVINCE;

    [Column('COUNTRY', ftString, 15)]
    [ForeignKey('INTEG_61', 'COUNTRY', 'COUNTRY', 'COUNTRY', SetNull, SetNull)]
    [Dictionary('COUNTRY', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property country: Nullable<String> read FCOUNTRY write FCOUNTRY;

    [Column('POSTAL_CODE', ftString, 12)]
    [Dictionary('POSTAL_CODE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property postal_code: Nullable<String> read FPOSTAL_CODE write FPOSTAL_CODE;

    [Column('ON_HOLD', ftString, 1)]
    [Dictionary('ON_HOLD', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property on_hold: Nullable<String> read FON_HOLD write FON_HOLD;

    [Association(OneToOne,'COUNTRY','COUNTRY','COUNTRY', True)]
    property country: TCOUNTRY read getCOUNTRY_0;

  end;

implementation

constructor TCUSTOMER.Create;
begin
end;

destructor TCUSTOMER.Destroy;
begin
  if Assigned(FCOUNTRY_0.Value) then
    FCOUNTRY_0.Value.Free;

  inherited;
end;

function TCUSTOMER.getCOUNTRY_0 : TCOUNTRY;
begin
  Result := FCOUNTRY_0.Value;
end;

initialization

  TRegisterClass.RegisterEntity(TCUSTOMER)

end.

unit ormbr.model.sales;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  ormbr.model.customer,
  ormbr.model.employee,
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('SALES', '')]
  [PrimaryKey('PO_NUMBER', NotInc, NoSort, False, 'Chave primária')]
  TSALES = class
  private
    { Private declarations } 
    FPO_NUMBER: String;
    FCUST_NO: Integer;
    FSALES_REP: Nullable<Integer>;
    FORDER_STATUS: String;
    FORDER_DATE: TDateTime;
    FSHIP_DATE: Nullable<TDateTime>;
    FDATE_NEEDED: Nullable<TDateTime>;
    FPAID: Nullable<String>;
    FQTY_ORDERED: Integer;
    FTOTAL_VALUE: Currency;
    FITEM_TYPE: String;
    FAGED: Nullable<Double>;

    FCUSTOMER_0: Lazy< TCUSTOMER > ;
    FEMPLOYEE_1: Lazy< TEMPLOYEE > ;
  public 
    { Public declarations } 
    constructor Create;
    function getCUSTOMER_0 : TCUSTOMER;
    function getEMPLOYEE_1 : TEMPLOYEE;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('PO_NUMBER', ftString, 8)]
    [Dictionary('PO_NUMBER', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property po_number: String read FPO_NUMBER write FPO_NUMBER;

    [Restrictions([NotNull])]
    [Column('CUST_NO', ftInteger)]
    [ForeignKey('INTEG_77', 'CUST_NO', 'CUSTOMER', 'CUST_NO', SetNull, SetNull)]
    [Dictionary('CUST_NO', 'Mensagem de validação', '', '', '', taCenter)]
    property cust_no: Integer read FCUST_NO write FCUST_NO;

    [Column('SALES_REP', ftInteger)]
    [ForeignKey('INTEG_78', 'SALES_REP', 'EMPLOYEE', 'EMP_NO', SetNull, SetNull)]
    [Dictionary('SALES_REP', 'Mensagem de validação', '', '', '', taCenter)]
    property sales_rep: Nullable<Integer> read FSALES_REP write FSALES_REP;

    [Restrictions([NotNull])]
    [Column('ORDER_STATUS', ftString, 7)]
    [Dictionary('ORDER_STATUS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property order_status: String read FORDER_STATUS write FORDER_STATUS;

    [Restrictions([NotNull])]
    [Column('ORDER_DATE', ftDateTime)]
    [Dictionary('ORDER_DATE', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_', taCenter)]
    property order_date: TDateTime read FORDER_DATE write FORDER_DATE;

    [Column('SHIP_DATE', ftDateTime)]
    [Dictionary('SHIP_DATE', 'Mensagem de validação', '', '', '', taCenter)]
    property ship_date: Nullable<TDateTime> read FSHIP_DATE write FSHIP_DATE;

    [Column('DATE_NEEDED', ftDateTime)]
    [Dictionary('DATE_NEEDED', 'Mensagem de validação', '', '', '', taCenter)]
    property date_needed: Nullable<TDateTime> read FDATE_NEEDED write FDATE_NEEDED;

    [Column('PAID', ftString, 1)]
    [Dictionary('PAID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property paid: Nullable<String> read FPAID write FPAID;

    [Restrictions([NotNull])]
    [Column('QTY_ORDERED', ftInteger)]
    [Dictionary('QTY_ORDERED', 'Mensagem de validação', '', '', '', taCenter)]
    property qty_ordered: Integer read FQTY_ORDERED write FQTY_ORDERED;

    [Restrictions([NotNull])]
    [Column('TOTAL_VALUE', ftCurrency)]
    [Dictionary('TOTAL_VALUE', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property total_value: Currency read FTOTAL_VALUE write FTOTAL_VALUE;


    [Restrictions([NotNull])]
    [Column('ITEM_TYPE', ftString, 12)]
    [Dictionary('ITEM_TYPE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property item_type: String read FITEM_TYPE write FITEM_TYPE;

    [Column('AGED', ftBCD)]
    [Dictionary('AGED', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property aged: Nullable<Double> read FAGED write FAGED;

    [Association(OneToOne,'CUST_NO','CUSTOMER','CUST_NO', True)]
    property customer: TCUSTOMER read getCUSTOMER_0;

    [Association(OneToOne,'SALES_REP','EMPLOYEE','EMP_NO', True)]
    property employee: TEMPLOYEE read getEMPLOYEE_1;

  end;

implementation

constructor TSALES.Create;
begin
end;

destructor TSALES.Destroy;
begin
  if Assigned(FCUSTOMER_0.Value) then
    FCUSTOMER_0.Value.Free;

  if Assigned(FEMPLOYEE_1.Value) then
    FEMPLOYEE_1.Value.Free;

  inherited;
end;

function TSALES.getCUSTOMER_0 : TCUSTOMER;
begin
  Result := FCUSTOMER_0.Value;
end;

function TSALES.getEMPLOYEE_1 : TEMPLOYEE;
begin
  Result := FEMPLOYEE_1.Value;
end;

initialization

  TRegisterClass.RegisterEntity(TSALES)

end.

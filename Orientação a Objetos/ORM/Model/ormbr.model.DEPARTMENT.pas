unit ormbr.model.department;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  ormbr.model.department,
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
  [Table('DEPARTMENT', '')]
  [PrimaryKey('DEPT_NO', NotInc, NoSort, False, 'Chave primária')]
  TDEPARTMENT = class
  private
    { Private declarations } 
    FDEPT_NO: String;
    FDEPARTMENT: String;
    FHEAD_DEPT: Nullable<String>;
    FMNGR_NO: Nullable<Integer>;
    FBUDGET: Nullable<Double>;
    FLOCATION: Nullable<String>;
    FPHONE_NO: Nullable<String>;

    FDEPARTMENT_0: Lazy< TDEPARTMENT > ;
    FEMPLOYEE_1: Lazy< TEMPLOYEE > ;
  public 
    { Public declarations } 
    constructor Create;
    function getDEPARTMENT_0 : TDEPARTMENT;
    function getEMPLOYEE_1 : TEMPLOYEE;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('DEPT_NO', ftString, 3)]
    [Dictionary('DEPT_NO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property dept_no: String read FDEPT_NO write FDEPT_NO;

    [Restrictions([NotNull])]
    [Column('DEPARTMENT', ftString, 25)]
    [Dictionary('DEPARTMENT', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property department: String read FDEPARTMENT write FDEPARTMENT;

    [Column('HEAD_DEPT', ftString, 3)]
    [ForeignKey('INTEG_17', 'HEAD_DEPT', 'DEPARTMENT', 'DEPT_NO', SetNull, SetNull)]
    [Dictionary('HEAD_DEPT', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property head_dept: Nullable<String> read FHEAD_DEPT write FHEAD_DEPT;

    [Column('MNGR_NO', ftInteger)]
    [ForeignKey('INTEG_31', 'MNGR_NO', 'EMPLOYEE', 'EMP_NO', SetNull, SetNull)]
    [Dictionary('MNGR_NO', 'Mensagem de validação', '', '', '', taCenter)]
    property mngr_no: Nullable<Integer> read FMNGR_NO write FMNGR_NO;

    [Column('BUDGET', ftBCD, 18, 2)]
    [Dictionary('BUDGET', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property budget: Nullable<Double> read FBUDGET write FBUDGET;

    [Column('LOCATION', ftString, 15)]
    [Dictionary('LOCATION', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property location: Nullable<String> read FLOCATION write FLOCATION;

    [Column('PHONE_NO', ftString, 20)]
    [Dictionary('PHONE_NO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property phone_no: Nullable<String> read FPHONE_NO write FPHONE_NO;

    [Association(OneToOne,'HEAD_DEPT','DEPARTMENT','DEPT_NO', True)]
    property department: TDEPARTMENT read getDEPARTMENT_0;

    [Association(OneToOne,'MNGR_NO','EMPLOYEE','EMP_NO', True)]
    property employee: TEMPLOYEE read getEMPLOYEE_1;

  end;

implementation

constructor TDEPARTMENT.Create;
begin
end;

destructor TDEPARTMENT.Destroy;
begin
  if Assigned(FDEPARTMENT_0.Value) then
    FDEPARTMENT_0.Value.Free;

  if Assigned(FEMPLOYEE_1.Value) then
    FEMPLOYEE_1.Value.Free;

  inherited;
end;

function TDEPARTMENT.getDEPARTMENT_0 : TDEPARTMENT;
begin
  Result := FDEPARTMENT_0.Value;
end;

function TDEPARTMENT.getEMPLOYEE_1 : TEMPLOYEE;
begin
  Result := FEMPLOYEE_1.Value;
end;

initialization

  TRegisterClass.RegisterEntity(TDEPARTMENT)

end.

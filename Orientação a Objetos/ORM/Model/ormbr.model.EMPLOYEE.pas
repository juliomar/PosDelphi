unit ormbr.model.employee;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  ormbr.model.department,
  ormbr.model.job,
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('EMPLOYEE', '')]
  [PrimaryKey('EMP_NO', NotInc, NoSort, False, 'Chave primária')]
  TEMPLOYEE = class
  private
    { Private declarations } 
    FEMP_NO: Integer;
    FFIRST_NAME: String;
    FLAST_NAME: String;
    FPHONE_EXT: Nullable<String>;
    FHIRE_DATE: TDateTime;
    FDEPT_NO: String;
    FJOB_CODE: String;
    FJOB_GRADE: Integer;
    FJOB_COUNTRY: String;
    FSALARY: Double;
    FFULL_NAME: Nullable<String>;

    FDEPARTMENT_0: Lazy< TDEPARTMENT > ;
    FJOB_1: Lazy< TJOB > ;
  public 
    { Public declarations } 
    constructor Create;
    function getDEPARTMENT_0 : TDEPARTMENT;
    function getJOB_1 : TJOB;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('EMP_NO', ftInteger)]
    [Dictionary('EMP_NO', 'Mensagem de validação', '', '', '', taCenter)]
    property emp_no: Integer read FEMP_NO write FEMP_NO;

    [Restrictions([NotNull])]
    [Column('FIRST_NAME', ftString, 15)]
    [Dictionary('FIRST_NAME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property first_name: String read FFIRST_NAME write FFIRST_NAME;

    [Restrictions([NotNull])]
    [Column('LAST_NAME', ftString, 20)]
    [Dictionary('LAST_NAME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property last_name: String read FLAST_NAME write FLAST_NAME;

    [Column('PHONE_EXT', ftString, 4)]
    [Dictionary('PHONE_EXT', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property phone_ext: Nullable<String> read FPHONE_EXT write FPHONE_EXT;

    [Restrictions([NotNull])]
    [Column('HIRE_DATE', ftDateTime)]
    [Dictionary('HIRE_DATE', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_', taCenter)]
    property hire_date: TDateTime read FHIRE_DATE write FHIRE_DATE;

    [Restrictions([NotNull])]
    [Column('DEPT_NO', ftString, 3)]
    [ForeignKey('INTEG_28', 'DEPT_NO', 'DEPARTMENT', 'DEPT_NO', SetNull, SetNull)]
    [Dictionary('DEPT_NO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property dept_no: String read FDEPT_NO write FDEPT_NO;

    [Restrictions([NotNull])]
    [Column('JOB_CODE', ftString, 5)]
    [ForeignKey('INTEG_29', 'JOB_CODE', 'JOB', 'JOB_CODE', SetNull, SetNull)]
    [Dictionary('JOB_CODE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property job_code: String read FJOB_CODE write FJOB_CODE;

    [Restrictions([NotNull])]
    [Column('JOB_GRADE', ftInteger)]
    [Dictionary('JOB_GRADE', 'Mensagem de validação', '', '', '', taCenter)]
    property job_grade: Integer read FJOB_GRADE write FJOB_GRADE;

    [Restrictions([NotNull])]
    [Column('JOB_COUNTRY', ftString, 15)]
    [Dictionary('JOB_COUNTRY', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property job_country: String read FJOB_COUNTRY write FJOB_COUNTRY;

    [Restrictions([NotNull])]
    [Column('SALARY', ftBCD, 18, 2)]
    [Dictionary('SALARY', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property salary: Double read FSALARY write FSALARY;

    [Column('FULL_NAME', ftString, 37)]
    [Dictionary('FULL_NAME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property full_name: Nullable<String> read FFULL_NAME write FFULL_NAME;

    [Association(OneToOne,'DEPT_NO','DEPARTMENT','DEPT_NO', True)]
    property department: TDEPARTMENT read getDEPARTMENT_0;

    [Association(OneToOne,'JOB_CODE','JOB','JOB_CODE', True)]
    property job: TJOB read getJOB_1;

  end;

implementation

constructor TEMPLOYEE.Create;
begin
end;

destructor TEMPLOYEE.Destroy;
begin
  if Assigned(FDEPARTMENT_0.Value) then
    FDEPARTMENT_0.Value.Free;

  if Assigned(FJOB_1.Value) then
    FJOB_1.Value.Free;

  inherited;
end;

function TEMPLOYEE.getDEPARTMENT_0 : TDEPARTMENT;
begin
  Result := FDEPARTMENT_0.Value;
end;

function TEMPLOYEE.getJOB_1 : TJOB;
begin
  Result := FJOB_1.Value;
end;

initialization

  TRegisterClass.RegisterEntity(TEMPLOYEE)

end.

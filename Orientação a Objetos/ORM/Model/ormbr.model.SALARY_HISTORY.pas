unit ormbr.model.salary_history;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
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
  [Table('SALARY_HISTORY', '')]
  [PrimaryKey('EMP_NO', NotInc, NoSort, False, 'Chave primária')]
  [PrimaryKey('CHANGE_DATE', NotInc, NoSort, False, 'Chave primária')]
  [PrimaryKey('UPDATER_ID', NotInc, NoSort, False, 'Chave primária')]
  TSALARY_HISTORY = class
  private
    { Private declarations } 
    FEMP_NO: Integer;
    FCHANGE_DATE: TDateTime;
    FUPDATER_ID: String;
    FOLD_SALARY: Double;
    FPERCENT_CHANGE: Currency;
    FNEW_SALARY: Nullable<Currency>;

    FEMPLOYEE_0: Lazy< TEMPLOYEE > ;
  public 
    { Public declarations } 
    constructor Create;
    function getEMPLOYEE_0 : TEMPLOYEE;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('EMP_NO', ftInteger)]
    [ForeignKey('INTEG_56', 'EMP_NO', 'EMPLOYEE', 'EMP_NO', SetNull, SetNull)]
    [Dictionary('EMP_NO', 'Mensagem de validação', '', '', '', taCenter)]
    property emp_no: Integer read FEMP_NO write FEMP_NO;

    [Restrictions([NotNull])]
    [Column('CHANGE_DATE', ftDateTime)]
    [Dictionary('CHANGE_DATE', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_', taCenter)]
    property change_date: TDateTime read FCHANGE_DATE write FCHANGE_DATE;

    [Restrictions([NotNull])]
    [Column('UPDATER_ID', ftString, 20)]
    [Dictionary('UPDATER_ID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property updater_id: String read FUPDATER_ID write FUPDATER_ID;

    [Restrictions([NotNull])]
    [Column('OLD_SALARY', ftBCD, 18, 2)]
    [Dictionary('OLD_SALARY', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property old_salary: Double read FOLD_SALARY write FOLD_SALARY;

    [Restrictions([NotNull])]
    [Column('PERCENT_CHANGE', ftCurrency)]
    [Dictionary('PERCENT_CHANGE', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property percent_change: Currency read FPERCENT_CHANGE write FPERCENT_CHANGE;

    [Column('NEW_SALARY', ftCurrency)]
    [Dictionary('NEW_SALARY', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property new_salary: Nullable<Currency> read FNEW_SALARY write FNEW_SALARY;

    [Association(OneToOne,'EMP_NO','EMPLOYEE','EMP_NO', True)]
    property employee: TEMPLOYEE read getEMPLOYEE_0;

  end;

implementation

constructor TSALARY_HISTORY.Create;
begin
end;

destructor TSALARY_HISTORY.Destroy;
begin
  if Assigned(FEMPLOYEE_0.Value) then
    FEMPLOYEE_0.Value.Free;

  inherited;
end;

function TSALARY_HISTORY.getEMPLOYEE_0 : TEMPLOYEE;
begin
  Result := FEMPLOYEE_0.Value;
end;

initialization

  TRegisterClass.RegisterEntity(TSALARY_HISTORY)

end.

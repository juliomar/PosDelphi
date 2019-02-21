unit ormbr.model.employee_project;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  ormbr.model.employee,
  ormbr.model.project,
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('EMPLOYEE_PROJECT', '')]
  [PrimaryKey('EMP_NO', NotInc, NoSort, False, 'Chave primária')]
  [PrimaryKey('PROJ_ID', NotInc, NoSort, False, 'Chave primária')]
  TEMPLOYEE_PROJECT = class
  private
    { Private declarations } 
    FEMP_NO: Integer;
    FPROJ_ID: String;

    FEMPLOYEE_0: Lazy< TEMPLOYEE > ;
    FPROJECT_1: Lazy< TPROJECT > ;
  public 
    { Public declarations } 
    constructor Create;
    function getEMPLOYEE_0 : TEMPLOYEE;
    function getPROJECT_1 : TPROJECT;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('EMP_NO', ftInteger)]
    [ForeignKey('INTEG_40', 'EMP_NO', 'EMPLOYEE', 'EMP_NO', SetNull, SetNull)]
    [Dictionary('EMP_NO', 'Mensagem de validação', '', '', '', taCenter)]
    property emp_no: Integer read FEMP_NO write FEMP_NO;

    [Restrictions([NotNull])]
    [Column('PROJ_ID', ftString, 5)]
    [ForeignKey('INTEG_41', 'PROJ_ID', 'PROJECT', 'PROJ_ID', SetNull, SetNull)]
    [Dictionary('PROJ_ID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property proj_id: String read FPROJ_ID write FPROJ_ID;

    [Association(OneToOne,'EMP_NO','EMPLOYEE','EMP_NO', True)]
    property employee: TEMPLOYEE read getEMPLOYEE_0;

    [Association(OneToOne,'PROJ_ID','PROJECT','PROJ_ID', True)]
    property project: TPROJECT read getPROJECT_1;

  end;

implementation

constructor TEMPLOYEE_PROJECT.Create;
begin
end;

destructor TEMPLOYEE_PROJECT.Destroy;
begin
  if Assigned(FEMPLOYEE_0.Value) then
    FEMPLOYEE_0.Value.Free;

  if Assigned(FPROJECT_1.Value) then
    FPROJECT_1.Value.Free;

  inherited;
end;

function TEMPLOYEE_PROJECT.getEMPLOYEE_0 : TEMPLOYEE;
begin
  Result := FEMPLOYEE_0.Value;
end;

function TEMPLOYEE_PROJECT.getPROJECT_1 : TPROJECT;
begin
  Result := FPROJECT_1.Value;
end;

initialization

  TRegisterClass.RegisterEntity(TEMPLOYEE_PROJECT)

end.

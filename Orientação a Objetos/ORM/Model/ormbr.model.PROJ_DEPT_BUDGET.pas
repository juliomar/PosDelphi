unit ormbr.model.proj_dept_budget;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  ormbr.model.department,
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
  [Table('PROJ_DEPT_BUDGET', '')]
  [PrimaryKey('FISCAL_YEAR', NotInc, NoSort, False, 'Chave primária')]
  [PrimaryKey('PROJ_ID', NotInc, NoSort, False, 'Chave primária')]
  [PrimaryKey('DEPT_NO', NotInc, NoSort, False, 'Chave primária')]
  TPROJ_DEPT_BUDGET = class
  private
    { Private declarations } 
    FFISCAL_YEAR: Integer;
    FPROJ_ID: String;
    FDEPT_NO: String;
    FQUART_HEAD_CNT[0]: Nullable<Integer>;
    FQUART_HEAD_CNT[1]: Nullable<Integer>;
    FQUART_HEAD_CNT[2]: Nullable<Integer>;
    FQUART_HEAD_CNT[3]: Nullable<Integer>;
    FPROJECTED_BUDGET: Nullable<Double>;

    FDEPARTMENT_0: Lazy< TDEPARTMENT > ;
    FPROJECT_1: Lazy< TPROJECT > ;
  public 
    { Public declarations } 
    constructor Create;
    function getDEPARTMENT_0 : TDEPARTMENT;
    function getPROJECT_1 : TPROJECT;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('FISCAL_YEAR', ftInteger)]
    [Dictionary('FISCAL_YEAR', 'Mensagem de validação', '', '', '', taCenter)]
    property fiscal_year: Integer read FFISCAL_YEAR write FFISCAL_YEAR;

    [Restrictions([NotNull])]
    [Column('PROJ_ID', ftString, 5)]
    [ForeignKey('INTEG_48', 'PROJ_ID', 'PROJECT', 'PROJ_ID', SetNull, SetNull)]
    [Dictionary('PROJ_ID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property proj_id: String read FPROJ_ID write FPROJ_ID;

    [Restrictions([NotNull])]
    [Column('DEPT_NO', ftString, 3)]
    [ForeignKey('INTEG_47', 'DEPT_NO', 'DEPARTMENT', 'DEPT_NO', SetNull, SetNull)]
    [Dictionary('DEPT_NO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property dept_no: String read FDEPT_NO write FDEPT_NO;


    [Column('QUART_HEAD_CNT[0]', ftInteger)]
    [Dictionary('QUART_HEAD_CNT[0]', 'Mensagem de validação', '', '', '', taCenter)]
    property quart_head_cnt[0]: Nullable<Integer> read FQUART_HEAD_CNT[0] write FQUART_HEAD_CNT[0];

    [Column('QUART_HEAD_CNT[1]', ftInteger)]
    [Dictionary('QUART_HEAD_CNT[1]', 'Mensagem de validação', '', '', '', taCenter)]
    property quart_head_cnt[1]: Nullable<Integer> read FQUART_HEAD_CNT[1] write FQUART_HEAD_CNT[1];

    [Column('QUART_HEAD_CNT[2]', ftInteger)]
    [Dictionary('QUART_HEAD_CNT[2]', 'Mensagem de validação', '', '', '', taCenter)]
    property quart_head_cnt[2]: Nullable<Integer> read FQUART_HEAD_CNT[2] write FQUART_HEAD_CNT[2];

    [Column('QUART_HEAD_CNT[3]', ftInteger)]
    [Dictionary('QUART_HEAD_CNT[3]', 'Mensagem de validação', '', '', '', taCenter)]
    property quart_head_cnt[3]: Nullable<Integer> read FQUART_HEAD_CNT[3] write FQUART_HEAD_CNT[3];

    [Column('PROJECTED_BUDGET', ftBCD, 18, 2)]
    [Dictionary('PROJECTED_BUDGET', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property projected_budget: Nullable<Double> read FPROJECTED_BUDGET write FPROJECTED_BUDGET;

    [Association(OneToOne,'DEPT_NO','DEPARTMENT','DEPT_NO', True)]
    property department: TDEPARTMENT read getDEPARTMENT_0;

    [Association(OneToOne,'PROJ_ID','PROJECT','PROJ_ID', True)]
    property project: TPROJECT read getPROJECT_1;

  end;

implementation

constructor TPROJ_DEPT_BUDGET.Create;
begin
end;

destructor TPROJ_DEPT_BUDGET.Destroy;
begin
  if Assigned(FDEPARTMENT_0.Value) then
    FDEPARTMENT_0.Value.Free;

  if Assigned(FPROJECT_1.Value) then
    FPROJECT_1.Value.Free;

  inherited;
end;

function TPROJ_DEPT_BUDGET.getDEPARTMENT_0 : TDEPARTMENT;
begin
  Result := FDEPARTMENT_0.Value;
end;

function TPROJ_DEPT_BUDGET.getPROJECT_1 : TPROJECT;
begin
  Result := FPROJECT_1.Value;
end;

initialization

  TRegisterClass.RegisterEntity(TPROJ_DEPT_BUDGET)

end.

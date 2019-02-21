unit ormbr.model.project;

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
  [Table('PROJECT', '')]
  [PrimaryKey('PROJ_ID', NotInc, NoSort, False, 'Chave primária')]
  TPROJECT = class
  private
    { Private declarations } 
    FPROJ_ID: String;
    FPROJ_NAME: String;
    FPROJ_DESC: TBlob;
    FTEAM_LEADER: Nullable<Integer>;
    FPRODUCT: String;

    FEMPLOYEE_0: Lazy< TEMPLOYEE > ;
  public 
    { Public declarations } 
    constructor Create;
    function getEMPLOYEE_0 : TEMPLOYEE;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('PROJ_ID', ftString, 5)]
    [Dictionary('PROJ_ID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property proj_id: String read FPROJ_ID write FPROJ_ID;

    [Restrictions([NotNull])]
    [Column('PROJ_NAME', ftString, 20)]
    [Dictionary('PROJ_NAME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property proj_name: String read FPROJ_NAME write FPROJ_NAME;

    [Column('PROJ_DESC', ftBlob)]
    [Dictionary('PROJ_DESC', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property proj_desc: TBlob read FPROJ_DESC write FPROJ_DESC;

    [Column('TEAM_LEADER', ftInteger)]
    [ForeignKey('INTEG_36', 'TEAM_LEADER', 'EMPLOYEE', 'EMP_NO', SetNull, SetNull)]
    [Dictionary('TEAM_LEADER', 'Mensagem de validação', '', '', '', taCenter)]
    property team_leader: Nullable<Integer> read FTEAM_LEADER write FTEAM_LEADER;

    [Restrictions([NotNull])]
    [Column('PRODUCT', ftString, 12)]
    [Dictionary('PRODUCT', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property product: String read FPRODUCT write FPRODUCT;

    [Association(OneToOne,'TEAM_LEADER','EMPLOYEE','EMP_NO', True)]
    property employee: TEMPLOYEE read getEMPLOYEE_0;

  end;

implementation

constructor TPROJECT.Create;
begin
end;

destructor TPROJECT.Destroy;
begin
  if Assigned(FEMPLOYEE_0.Value) then
    FEMPLOYEE_0.Value.Free;

  inherited;
end;

function TPROJECT.getEMPLOYEE_0 : TEMPLOYEE;
begin
  Result := FEMPLOYEE_0.Value;
end;

initialization

  TRegisterClass.RegisterEntity(TPROJECT)

end.

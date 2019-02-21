unit ormbr.model.job;

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
  [Table('JOB', '')]
  [PrimaryKey('JOB_CODE', NotInc, NoSort, False, 'Chave primária')]
  [PrimaryKey('JOB_GRADE', NotInc, NoSort, False, 'Chave primária')]
  [PrimaryKey('JOB_COUNTRY', NotInc, NoSort, False, 'Chave primária')]
  TJOB = class
  private
    { Private declarations } 
    FJOB_CODE: String;
    FJOB_GRADE: Integer;
    FJOB_COUNTRY: String;
    FJOB_TITLE: String;
    FMIN_SALARY: Double;
    FMAX_SALARY: Double;
    FJOB_REQUIREMENT: TBlob;
    FLANGUAGE_REQ[0]: Nullable<String>;
    FLANGUAGE_REQ[1]: Nullable<String>;
    FLANGUAGE_REQ[2]: Nullable<String>;
    FLANGUAGE_REQ[3]: Nullable<String>;
    FLANGUAGE_REQ[4]: Nullable<String>;

    FCOUNTRY_0: Lazy< TCOUNTRY > ;
  public 
    { Public declarations } 
    constructor Create;
    function getCOUNTRY_0 : TCOUNTRY;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('JOB_CODE', ftString, 5)]
    [Dictionary('JOB_CODE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property job_code: String read FJOB_CODE write FJOB_CODE;

    [Restrictions([NotNull])]
    [Column('JOB_GRADE', ftInteger)]
    [Dictionary('JOB_GRADE', 'Mensagem de validação', '', '', '', taCenter)]
    property job_grade: Integer read FJOB_GRADE write FJOB_GRADE;

    [Restrictions([NotNull])]
    [Column('JOB_COUNTRY', ftString, 15)]
    [ForeignKey('INTEG_11', 'JOB_COUNTRY', 'COUNTRY', 'COUNTRY', SetNull, SetNull)]
    [Dictionary('JOB_COUNTRY', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property job_country: String read FJOB_COUNTRY write FJOB_COUNTRY;

    [Restrictions([NotNull])]
    [Column('JOB_TITLE', ftString, 25)]
    [Dictionary('JOB_TITLE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property job_title: String read FJOB_TITLE write FJOB_TITLE;

    [Restrictions([NotNull])]
    [Column('MIN_SALARY', ftBCD, 18, 2)]
    [Dictionary('MIN_SALARY', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property min_salary: Double read FMIN_SALARY write FMIN_SALARY;

    [Restrictions([NotNull])]
    [Column('MAX_SALARY', ftBCD, 18, 2)]
    [Dictionary('MAX_SALARY', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property max_salary: Double read FMAX_SALARY write FMAX_SALARY;

    [Column('JOB_REQUIREMENT', ftBlob)]
    [Dictionary('JOB_REQUIREMENT', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property job_requirement: TBlob read FJOB_REQUIREMENT write FJOB_REQUIREMENT;


    [Column('LANGUAGE_REQ[0]', ftString, 15)]
    [Dictionary('LANGUAGE_REQ[0]', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property language_req[0]: Nullable<String> read FLANGUAGE_REQ[0] write FLANGUAGE_REQ[0];

    [Column('LANGUAGE_REQ[1]', ftString, 15)]
    [Dictionary('LANGUAGE_REQ[1]', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property language_req[1]: Nullable<String> read FLANGUAGE_REQ[1] write FLANGUAGE_REQ[1];

    [Column('LANGUAGE_REQ[2]', ftString, 15)]
    [Dictionary('LANGUAGE_REQ[2]', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property language_req[2]: Nullable<String> read FLANGUAGE_REQ[2] write FLANGUAGE_REQ[2];

    [Column('LANGUAGE_REQ[3]', ftString, 15)]
    [Dictionary('LANGUAGE_REQ[3]', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property language_req[3]: Nullable<String> read FLANGUAGE_REQ[3] write FLANGUAGE_REQ[3];

    [Column('LANGUAGE_REQ[4]', ftString, 15)]
    [Dictionary('LANGUAGE_REQ[4]', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property language_req[4]: Nullable<String> read FLANGUAGE_REQ[4] write FLANGUAGE_REQ[4];

    [Association(OneToOne,'JOB_COUNTRY','COUNTRY','COUNTRY', True)]
    property country: TCOUNTRY read getCOUNTRY_0;

  end;

implementation

constructor TJOB.Create;
begin
end;

destructor TJOB.Destroy;
begin
  if Assigned(FCOUNTRY_0.Value) then
    FCOUNTRY_0.Value.Free;

  inherited;
end;

function TJOB.getCOUNTRY_0 : TCOUNTRY;
begin
  Result := FCOUNTRY_0.Value;
end;

initialization

  TRegisterClass.RegisterEntity(TJOB)

end.

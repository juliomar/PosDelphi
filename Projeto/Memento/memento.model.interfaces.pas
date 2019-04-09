unit memento.model.interfaces;

interface

type

  iMemento<t> = interface
  ['{E23C9A35-F01C-4F93-AC87-B8BB98659AEF}']
    function Save ( Key : String ) : iMemento<t>;
    function Restore ( Key : String ) : t;
  end;

  iMementoCaretaker<t> = interface
    ['{C821E48B-CA8E-432E-9872-70D05DC13C97}']
    function SaveState(Key : String; Value : t) : iMementoCaretaker<t>;
    function Restore(Key : String) : t;
  end;

  iAluno = interface
    function GetNome : String;
    function GetSobrenome : String;
    function GetMatricula : String;
    procedure SetNome(const Value : String);
    procedure SetSobrenome(const Value : String);
    procedure SetMatricula(const Value : String);
    property Nome : String read GetNome write SetNome;
    property Sobrenome : String read GetSobrenome write SetSobrenome;
    property Matricula : String read GetMatricula write SetMatricula;
    function Memento : iMemento<iAluno>;
  end;

implementation

end.

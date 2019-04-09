{ Modelo de Projeto - State
  Autores: Lucas Montemezzo
           Pedro H. Wanot Chikoski
           Anderson Possamai (Coxinha)
}
unit Model.State.Aluno.Interfaces;

interface

type
  iState<t> = interface;
  iAlunoOperacaoes = interface;

  iAlunoStatus = interface
    ['{2FA38521-9128-49F7-87F6-8736BA74D958}']
    function State : iState<iAlunoOperacaoes>;
    function Operacoes : iAlunoOperacaoes;
  end;

  iAlunoOperacaoes = interface
    ['{F2DA98B0-4788-4633-B8D9-B45D199CDE85}']
    function Matricular : iAlunoOperacaoes;
    function CancelarMatricula : iAlunoOperacaoes;
    function Ativar : iAlunoOperacaoes;
    function Inativar : iAlunoOperacaoes;
    function Value : String;
  end;

  iState<t> = interface
    ['{0F7F0CEF-CF62-4E05-804C-36F5B428D7CB}']
    function SetState(Value : t) : t;
  end;

implementation

end.

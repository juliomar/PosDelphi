{ Modelo de Projeto - State
  Autores: Lucas Montemezzo
           Pedro H. Wanot Chikoski
           Anderson Possamai (Coxinha)
}
unit Model.State.Aluno.Matriculado;

interface

uses Model.State.Aluno.Interfaces;

Type
  TModelAlunoMatriculado = class(TInterfacedObject, iAlunoOperacaoes)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iAlunoOperacaoes;
      function Matricular : iAlunoOperacaoes;
      function CancelarMatricula : iAlunoOperacaoes;
      function Ativar : iAlunoOperacaoes;
      function Inativar : iAlunoOperacaoes;
      function Value : String;
  end;

implementation

uses
  System.SysUtils;

{ TModelItemVendido }

function TModelAlunoMatriculado.CancelarMatricula: iAlunoOperacaoes;
begin
  Result := Self;
end;

constructor TModelAlunoMatriculado.Create;
begin

end;

function TModelAlunoMatriculado.Inativar: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Não é possível inativar um aluno matriculado.');
end;

destructor TModelAlunoMatriculado.Destroy;
begin

  inherited;
end;

function TModelAlunoMatriculado.Ativar: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este aluno já está ativo.');
end;

class function TModelAlunoMatriculado.New : iAlunoOperacaoes;
begin
  Result := Self.Create;
end;

function TModelAlunoMatriculado.Value: String;
begin
  Result := 'M';
end;

function TModelAlunoMatriculado.Matricular: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este aluno já está matriculado');
end;

end.


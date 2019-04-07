{ Modelo de Projeto - State
  Autores: Lucas Montemezzo
           Pedro H. Wanot Chikoski
           Anderson Possamai (Coxinha)
}
unit Model.State.Aluno;

interface

uses Model.State.Aluno.Interfaces, Model.State.Aluno.Ativo, Model.State.Aluno.Inativo, Model.State.Aluno.Matriculado;

Type
  TModelAlunoStatus = class(TInterfacedObject, iAlunoStatus, iAlunoOperacaoes, iState<iAlunoOperacaoes>)
  private
    FState : iAlunoOperacaoes;
  public
    constructor Create;
    destructor Destroy; override;
    class function New(Status: String=''): iAlunoStatus;
    function Matricular : iAlunoOperacaoes;
    function CancelarMatricula : iAlunoOperacaoes;
    function Ativar : iAlunoOperacaoes;
    function Inativar : iAlunoOperacaoes;
    function SetState(Value : iAlunoOperacaoes) : iAlunoOperacaoes;
    function State : iState<iAlunoOperacaoes>;
    function Operacoes : iAlunoOperacaoes;
    function Value : String;
  end;

implementation

{ TModelAlunoStatus }

function TModelAlunoStatus.CancelarMatricula: iAlunoOperacaoes;
begin
  FState.CancelarMatricula;
  //Implementa o codigo de cancelamento
  FState := TModelAlunoAtivo.New;
  Result := Self;
end;

constructor TModelAlunoStatus.Create;
begin
  FState := TModelAlunoAtivo.New;
end;

function TModelAlunoStatus.Inativar: iAlunoOperacaoes;
begin
  FState.Inativar;
  //Implementa o codigo
  FState := TModelAlunoInativo.New;
  Result := Self;
end;

destructor TModelAlunoStatus.Destroy;
begin

  inherited;
end;

function TModelAlunoStatus.Ativar: iAlunoOperacaoes;
begin
  FState.Ativar;
  //Implementa o codigo
  FState := TModelAlunoAtivo.New;
  Result := Self;
end;

class function TModelAlunoStatus.New(Status: String=''): iAlunoStatus;
begin
  Result := Self.Create;
  //Status = 'A' Ativo é o Status default para Aluno.
  if Status = 'I' then
    Result.State.SetState(TModelAlunoInativo.New)
  else if Status = 'M' then
    Result.State.SetState(TModelAlunoMatriculado.New);
end;

function TModelAlunoStatus.Operacoes: iAlunoOperacaoes;
begin
  Result := Self;
end;

function TModelAlunoStatus.SetState(Value: iAlunoOperacaoes): iAlunoOperacaoes;
begin
  Result := Self;
  FState := Value;
end;

function TModelAlunoStatus.State: iState<iAlunoOperacaoes>;
begin
  Result := Self;
end;

function TModelAlunoStatus.Value: String;
begin
  Result := FState.Value;
end;

function TModelAlunoStatus.Matricular: iAlunoOperacaoes;
begin
  FState.Matricular;
  //Implementa o codigo
  FState := TModelAlunoMatriculado.New;
  Result := Self;
end;

end.

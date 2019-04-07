unit Model.State.Aluno.Inativo;

interface

uses Model.State.Aluno.Interfaces;

Type
  TModelAlunoInativo = class(TInterfacedObject, iAlunoOperacaoes)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iAlunoOperacaoes;
      function Matricular : iAlunoOperacaoes;
      function CancelarMatricula : iAlunoOperacaoes;
      function Ativar : iAlunoOperacaoes;
      function Inativar : iAlunoOperacaoes;
  end;

implementation

uses
  System.SysUtils;

{ TModelAlunoInativo }

function TModelAlunoInativo.CancelarMatricula: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este aluno está inativo');
end;

constructor TModelAlunoInativo.Create;
begin

end;

function TModelAlunoInativo.Ativar: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este aluno está inativo');
end;

destructor TModelAlunoInativo.Destroy;
begin

  inherited;
end;

function TModelAlunoInativo.Matricular: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este aluno está inativo');
end;

class function TModelAlunoInativo.New : iAlunoOperacaoes;
begin
  Result := Self.Create;
end;

function TModelAlunoInativo.Inativar: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Aluno já está inativo');
end;

end.


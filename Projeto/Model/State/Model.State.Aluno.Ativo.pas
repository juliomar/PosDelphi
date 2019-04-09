{ Modelo de Projeto - State
  Autores: Lucas Montemezzo
           Pedro H. Wanot Chikoski
           Anderson Possamai (Coxinha)
}

unit Model.State.Aluno.Ativo;

interface

uses Model.State.Aluno.Interfaces;

Type
  TModelAlunoAtivo = class(TInterfacedObject, iAlunoOperacaoes)
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

{ TModelAlunoAtivo }

function TModelAlunoAtivo.CancelarMatricula: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este aluno ainda não foi matriculado');
end;

constructor TModelAlunoAtivo.Create;
begin

end;

function TModelAlunoAtivo.Matricular: iAlunoOperacaoes;
begin
  Result := Self;
end;

destructor TModelAlunoAtivo.Destroy;
begin

  inherited;
end;

function TModelAlunoAtivo.Ativar: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este aluno já está ativo');
end;

class function TModelAlunoAtivo.New : iAlunoOperacaoes;
begin
  Result := Self.Create;
end;

function TModelAlunoAtivo.Value: String;
begin
  Result := 'A';
end;

function TModelAlunoAtivo.Inativar: iAlunoOperacaoes;
begin
  Result := Self;
end;

end.

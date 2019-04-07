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

function TModelAlunoAtivo.Desconto: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este aluno ainda não foi vendido');
end;

destructor TModelAlunoAtivo.Destroy;
begin

  inherited;
end;

function TModelAlunoAtivo.Devolver: iAlunoOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este aluno ainda não foi vendido');
end;

class function TModelAlunoAtivo.New : iAlunoOperacaoes;
begin
  Result := Self.Create;
end;

function TModelAlunoAtivo.Vender: iAlunoOperacaoes;
begin
  Result := Self;
end;

end.

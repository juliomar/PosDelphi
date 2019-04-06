unit Model.State.Aluno.Ativo;

interface

uses Model.State.Aluno.Interfaces;

Type
  TModelItemAtivo = class(TInterfacedObject, iItemOperacaoes)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iItemOperacaoes;
      function Vender : iItemOperacaoes;
      function Cancelar : iItemOperacaoes;
      function Desconto : iItemOperacaoes;
      function Devolver : iItemOperacaoes;
  end;

implementation

uses
  System.SysUtils;

{ TModelItemAtivo }

function TModelItemAtivo.Cancelar: iItemOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este item ainda não foi vendido');
end;

constructor TModelItemAtivo.Create;
begin

end;

function TModelItemAtivo.Desconto: iItemOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este item ainda não foi vendido');
end;

destructor TModelItemAtivo.Destroy;
begin

  inherited;
end;

function TModelItemAtivo.Devolver: iItemOperacaoes;
begin
  Result := Self;
  raise Exception.Create('Este item ainda não foi vendido');
end;

class function TModelItemAtivo.New : iItemOperacaoes;
begin
  Result := Self.Create;
end;

function TModelItemAtivo.Vender: iItemOperacaoes;
begin
  Result := Self;
end;

end.

unit memento.model.aluno;

interface

uses Memento.Model.Interfaces, Memento.Model.Memento;

Type
  TModelAluno = class(TInterfacedObject, iAluno, iMemento<iAluno>)
    private
      FNome : String;
      FSobrenome : String;
      FMatricula : String;
      FMemento : iMementoCaretaker<iAluno>;
      function GetNome : String;
      function GetSobrenome : String;
      function GetMatricula : String;
      procedure SetNome(const Value : String);
      procedure SetSobrenome(const Value : String);
      procedure SetMatricula(const Value : String);
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iAluno;
      property Nome : String read GetNome write SetNome;
      property Sobrenome : String read GetSobrenome write SetSobrenome;
      property Matricula : String read GetMatricula write SetMatricula;
      function Memento : iMemento<iAluno>;
      function Save(Key : String) : iMemento<iAluno>;
      function Restore(Key : String) : iAluno;
  end;

implementation

{ TModelCliente }

constructor TModelAluno.Create;
begin
  FMemento := TModelMemento.New;
end;

destructor TModelAluno.Destroy;
begin

  inherited;
end;

function TModelAluno.GetNome: String;
begin
  Result := FNome;
end;

function TModelAluno.GetSobrenome: String;
begin
  Result := FSobrenome;
end;

function TModelAluno.GetMatricula: String;
begin
  Result := FMatricula;
end;

function TModelAluno.Memento: iMemento<iAluno>;
begin
  Result := Self;
end;

class function TModelAluno.New: iAluno;
begin
  Result := Self.Create;
end;

function TModelAluno.Restore(Key: String): iAluno;
var
  Memoria : iAluno;
begin
  Memoria := FMemento.Restore(Key);
  Self.Nome      := Memoria.Nome;
  Self.Sobrenome := Memoria.Sobrenome;
  Self.Matricula := Memoria.Matricula;
  Result := Self;
end;

function TModelAluno.Save(Key: String): iMemento<iAluno>;
var
  Novo : iAluno;
begin
  Result := Self;
  Novo := TModelAluno.New;
  Novo.Nome      := Self.Nome;
  Novo.Sobrenome := Self.Sobrenome;
  Novo.Matricula := Self.Matricula;
  FMemento.SaveState(Key, Novo);
end;

procedure TModelAluno.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TModelAluno.SetSobrenome(const Value: String);
begin
  FSobrenome := Value;
end;

procedure TModelAluno.SetMatricula(const Value: String);
begin
  FMatricula := Value;
end;


end.

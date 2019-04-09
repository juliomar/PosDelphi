unit Model.TemplateMethod.ConcreteClassInsere;

interface

uses
	Model.TemplateMethod.AbstractClass, entity.curso, System.Classes;

type
	CadCurso = record
		Id: Integer;
		Descricao: string;
		AreaConhecimento: string;
		NotaEnad: Double;
	end;

	TConcreteClassInsere = class(TAbstractClass)
	private
		procedure processadados; override;
	public
		constructor Create(AOwner: TComponent; _Curso: CadCurso);
	end;

implementation

var
	RecebeDados: CadCurso;

	{ TConcreteClassInsere }

constructor TConcreteClassInsere.Create(AOwner: TComponent; _Curso: CadCurso);

begin
  RecebeDados.Id:= _Curso.Id;
  RecebeDados.Descricao:= _Curso.Descricao;
  RecebeDados.AreaConhecimento:= _Curso.AreaConhecimento;
  RecebeDados.NotaEnad:= _Curso.NotaEnad;
	processadados;
end;

procedure TConcreteClassInsere.processadados;
var
	oCurso: TCurso;                        
begin
	inherited;
	oCurso := TCurso.Create;
	try
		oCurso.Id := RecebeDados.Id;
		oCurso.Descricao := RecebeDados.Descricao;
		oCurso.AreaConhecimento := RecebeDados.AreaConhecimento;
		oCurso.NotaEnad := RecebeDados.NotaEnad;
	finally
		oCurso.Free;
	end;
end;

end.

unit Model.TemplateMethod.AbstractClass;

interface

type
	TAbstractClass = class abstract
	private

	protected
		procedure processadados; virtual; abstract;
	public
		procedure InsereDados;
    constructor Create;

	end;

implementation

{ TAbstractClass }

{ TAbstractClass }

constructor TAbstractClass.Create;
begin
//  InsereDados;
end;

procedure TAbstractClass.InsereDados;
begin
//	processadados;
end;

end.

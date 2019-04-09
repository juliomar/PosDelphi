unit View.CadCursos;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
	Vcl.ComCtrls, Model.TemplateMethod.AbstractClass,
	Model.TemplateMethod.ConcreteClassInsere;

type
	oDadosCurso = record
		IdCurso: Integer;
		DescricaoCurso: string;
		AreaConhecimento: string;
		NotaEnad: Double;
	end;

	TFrmCadCursos = class(TForm)
		edtCodCurso: TEdit;
		Label1: TLabel;
		Label2: TLabel;
		edtDescricao: TEdit;
		Label3: TLabel;
		Label4: TLabel;
		DateTimePicker1: TDateTimePicker;
		DateTimePicker2: TDateTimePicker;
		Label5: TLabel;
		Label6: TLabel;
		Label7: TLabel;
		Label8: TLabel;
		Label9: TLabel;
		ComboBox1: TComboBox;
		ComboBox2: TComboBox;
		ComboBox3: TComboBox;
		ComboBox4: TComboBox;
		Edit3: TEdit;
		Label10: TLabel;
		Edit4: TEdit;
		Button1: TButton;
		Button2: TButton;
		Button3: TButton;
		Button4: TButton;
		Button5: TButton;
		DBNavigator1: TDBNavigator;
		edtAreaConhecimentoo: TEdit;
		edtNotaEnad: TEdit;
		Label11: TLabel;
		Label12: TLabel;
		procedure Button1Click(Sender: TObject);
	private
		procedure AlimentaDadosCurso(var _oCurso: CadCurso);
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FrmCadCursos: TFrmCadCursos;

implementation

{$R *.dfm}

procedure TFrmCadCursos.Button1Click(Sender: TObject);
var
	ClasseConcreta: TAbstractClass;
	_oCurso: CadCurso;
begin
	AlimentaDadosCurso(_oCurso);
	try
		ClasseConcreta := TAbstractClass.Create;
		TConcreteClassInsere.Create(Self, _oCurso);
	finally
		ClasseConcreta.Free;
	end;
end;

procedure TFrmCadCursos.AlimentaDadosCurso(var _oCurso: CadCurso);
begin
	_oCurso.Id := StrToInt(edtCodCurso.Text);
	_oCurso.Descricao := edtDescricao.Text;
	_oCurso.AreaConhecimento := edtAreaConhecimentoo.Text;
	_oCurso.NotaEnad := StrToFloat(edtNotaEnad.Text);
end;

end.

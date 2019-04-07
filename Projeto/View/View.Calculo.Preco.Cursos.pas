unit View.Calculo.Preco.Cursos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Visitor.Model.Interfaces,
  Visitor.Model.ItemCurso, Visitor.Model.Venda.Simples,
  Visitor.Model.Venda.Bolsa;

type
  TFrmPrecoDeCursos = class(TForm)
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BtnValorSimples: TButton;
    BtnValorDesconto: TButton;
    procedure BtnValorDescontoClick(Sender: TObject);
    procedure BtnValorSimplesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    FItem: iItem;
    function TabelaPreco: ivisitor;

  public
    { Public declarations }

  end;

var
  FrmPrecoDeCursos: TFrmPrecoDeCursos;

implementation

{$R *.dfm}
{ TFrmPrecoDeCursos }

procedure TFrmPrecoDeCursos.BtnValorDescontoClick(Sender: TObject);
begin
  ShowMessage(FormatCurr('R$ #,##00.0',
    FItem.SetPrecoUnitario(StrToCurr(Edit1.Text)).Regras.Accept(TabelaPreco)
    .PrecoPromocao));
end;

procedure TFrmPrecoDeCursos.BtnValorSimplesClick(Sender: TObject);
begin
  ShowMessage(FormatCurr('R$ #,##00.0',
    FItem.SetPrecoUnitario(StrToCurr(Edit1.Text)).Regras.Accept(TabelaPreco)
    .PrecoDeVenda));
end;

procedure TFrmPrecoDeCursos.FormCreate(Sender: TObject);
begin
       FItem := TModelItem.Create.New;
end;

function TFrmPrecoDeCursos.TabelaPreco: ivisitor;
begin
  case ComboBox1.ItemIndex of
    0:
      Result := TModelItemVendaSimples.New.Visitor;
    1:
      Result := TModelVendaBolsaEstudo.New.Visitor;

  end;
end;

end.

unit View.Pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Fabrica.Pagamento, Tipo.Pagamento, Interfaces.Pagamento
  ;

type
  TPagamento = class(TForm)
    Label1: TLabel;
    cmbPagamento: TComboBox;
    Memo1: TMemo;
    procedure cmbPagamentoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pagamento: TPagamento;

implementation

{$R *.dfm}

procedure TPagamento.cmbPagamentoChange(Sender: TObject);
var
  FabricaPagamento: IFactoryMethod;
  TipoPagamento: ITipoPagamento;
begin
  FabricaPagamento := TFabricaPagamento.Create;
  TipoPagamento := FabricaPagamento.ConsultarPagamento(cmbPagamento.Text);

  Memo1.Lines.Clear;
  Memo1.Lines.Add('Descrição: ' + TipoPagamento.ConsultarDescricao);
  Memo1.Lines.Add('   ');
  Memo1.Lines.Add('Juros: ' + TipoPagamento.ConsultarJuros);
end;

end.

unit View.Mensalidades.Pagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao,
  ormbr.factory.interfaces, ormbr.container.dataset.interfaces,
  entity.mensalidades,Mensalidades.RecebimentoMensalidade;

type
  TFMensalidadePagar = class(TForm)
    cbLancamentos: TComboBox;
    btnPagar: TBitBtn;
    FDMemTable1: TFDMemTable;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
  private
    FConexao : TdmConexao;
    FMatricula: Integer;
    procedure CarregarLancamentos;
  public
    oConn: IDBConnection;
    Mensalidade: IContainerDataSet<TModelMensalidades>;
    property Matricula : Integer read FMatricula write FMatricula;
  end;

var
  FMensalidadePagar: TFMensalidadePagar;

implementation

uses
  ormbr.factory.firedac, ormbr.container.fdmemtable;

{$R *.dfm}

procedure TFMensalidadePagar.btnPagarClick(Sender: TObject);
var
  CodLancamento : Integer;
begin
  if cbLancamentos.ItemIndex < 0  then
    raise Exception.Create('Selecione um lancamento!');
  CodLancamento :=  StrToInt(Trim(Copy(cbLancamentos.Text, 1, Pos('-',cbLancamentos.Text) -1)));
  TRecebimentoMensalidade.New.QuitarMensalidade(CodLancamento);
  CarregarLancamentos;
end;

procedure TFMensalidadePagar.CarregarLancamentos;
begin
  FConexao := TDMConexao.New;
  oConn := TFactoryFireDAC.Create(FConexao.FDConnection1, dnSQLite);
  Mensalidade := TContainerFDMemTable<TModelMensalidades>.Create(oConn, FDMemTable1);
  Mensalidade.OpenWhere('aluno=' + QuotedStr(FMatricula.ToString) + ' AND pago <> ' + QuotedStr('S'));
  if FDMemTable1.RecordCount > 0 then
  begin
    FDMemTable1.First;
    cbLancamentos.Items.Clear;
    while not FDMemTable1.Eof do
    begin
      cbLancamentos.Items.Add(FDMemTable1.FieldByName('codigo').AsString + ' - ' + FDMemTable1.FieldByName('dtlancamento').AsString);
      FDMemTable1.Next;
    end;
  end
  else
    raise Exception.Create('Nenhuma mensalidade em aberto.');
  cbLancamentos.ItemIndex := -1;
end;

procedure TFMensalidadePagar.FormShow(Sender: TObject);
begin
  CarregarLancamentos;
end;

end.

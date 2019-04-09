unit View.Mensalidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  /// orm factory
  ormbr.factory.interfaces,
  /// orm injection dependency
  ormbr.container.dataset.interfaces,
  ormbr.container.fdmemtable,
  ormbr.factory.firedac,
  ormbr.types.database,
  ormbr.dml.generator.sqlite,
  /// orm model
  entity.mensalidades, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Model.Conexao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client
  ;

type
  TAcao = (aEditar, aNovo, aExcluir, aLeitura);
  TFMensalidades = class(TForm)
    pnLancamento: TPanel;
    DBGrid1: TDBGrid;
    dsMensalidades: TDataSource;
    BitBtn1: TBitBtn;
    edtCodigo: TLabeledEdit;
    BitBtn2: TBitBtn;
    edtLancamento: TLabeledEdit;
    edtAluno: TLabeledEdit;
    edtPago: TCheckBox;
    BitBtn3: TBitBtn;
    FDMensalidade: TFDMemTable;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    Acao :  TAcao;
    FConexao : TdmConexao;
  public
    oConn: IDBConnection;
    Mensalidade: IContainerDataSet<TModelMensalidades>;
  end;

var
  FMensalidades: TFMensalidades;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TFMensalidades.BitBtn1Click(Sender: TObject);
var
  Mensal : TModelMensalidades;
begin
  Mensal := Mensalidade.Current;
  edtCodigo.Text := Mensal.Codigo.ToString;
  edtLancamento.Text := Mensal.DtLancamento;
  edtAluno.Text := Mensal.Aluno;
  edtPago.Checked := (Mensal.Pago = 'S');
  Acao := aEditar;
end;

procedure TFMensalidades.BitBtn2Click(Sender: TObject);
var
  MensalSave : TModelMensalidades;
  Pago : string;
begin

  MensalSave := Mensalidade.Current;
  MensalSave.Codigo := StrToInt(edtCodigo.Text);
  MensalSave.DtLancamento := edtLancamento.Text;
  MensalSave.Aluno := edtAluno.Text;
  if edtPago.Checked then
    Pago := 'S'
  else
    Pago := 'N';
  MensalSave.Pago := Pago;
  if Acao = aEditar then
  begin
    Mensalidade.Save(MensalSave);
    oConn.StartTransaction;
    Mensalidade.ApplyUpdates(0);
    oConn.Commit;
  end
  else
  begin
    Mensalidade.Append;
    Mensalidade.Save(MensalSave);
    oConn.StartTransaction;
    Mensalidade.ApplyUpdates(0);
    oConn.Commit;
  end;
end;

procedure TFMensalidades.BitBtn3Click(Sender: TObject);
begin
  edtCodigo.Text := '-1';
  edtLancamento.Text := '';
  edtAluno.Text := '';
  edtPago.Checked := False;
  edtLancamento.SetFocus;
  Acao := aNovo;
end;

procedure TFMensalidades.FormShow(Sender: TObject);
begin
  Acao := aLeitura;
  FConexao := TDMConexao.New;
  oConn := TFactoryFireDAC.Create(FConexao.FDConnection1, dnSQLite);
  // Client
  Mensalidade := TContainerFDMemTable<TModelMensalidades>.Create(oConn, FDMensalidade);
  Mensalidade.Open;


  {FConexao := TDMConexao.New;
  FContainer := TContainerObjectSet<T>.Create(FConexao.Conn, 10);
  FIterator := TModelListaFactory<T>
                .New(tpListaObjetos)
                .getIterator
                .Adicionar(FContainer.Find);}
end;

end.

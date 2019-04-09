unit Mensalidades.RecebimentoMensalidade;

interface

uses
  Mensalidades.Interfaces;

type
  TRecebimentoMensalidade = class(TInterfacedObject, IRecebimentoMensalidade,IRecebimentoMensalidadeView)
  private

  public
    constructor Create;
    destructor Destroy;override;
    class function New:IRecebimentoMensalidadeView;
    function ReceberValor: IRecebimentoMensalidade;
    function BaixarMensalidade(aLancamento: Integer): IRecebimentoMensalidade;
    function GerarRecibo:IRecebimentoMensalidade;
    function QuitarMensalidade(aLancamento : Integer) : IRecebimentoMensalidadeView;
  end;

implementation

uses
  Mensalidades.RecebimentoMensalidade.Invoker,
  Mensalidades.RecebimentoMensalidade.ReceberValor,
  Mensalidades.RecebimentoMensalidade.GerarRecibo,
  Mensalidades.RecebimentoMensalidade.BaixarMensalidade, FireDAC.Comp.Client,
  entity.mensalidades, Model.Conexao, ormbr.container.dataset.interfaces,
  ormbr.factory.interfaces, ormbr.factory.firedac, ormbr.container.fdmemtable,
  System.SysUtils;

{ TRecebimentoMensalidade }

function TRecebimentoMensalidade.BaixarMensalidade(aLancamento: Integer): IRecebimentoMensalidade;
var
  FDMensalidade: TFDMemTable;
  MensalSave : TModelMensalidades;
  FConexao : TdmConexao;
  oConn: IDBConnection;
  Mensalidade: IContainerDataSet<TModelMensalidades>;
begin
  Result := Self;
  FDMensalidade := TFDMemTable.Create(nil);
  try
    FConexao := TDMConexao.New;
    oConn := TFactoryFireDAC.Create(FConexao.FDConnection1, dnSQLite);

    Mensalidade := TContainerFDMemTable<TModelMensalidades>.Create(oConn, FDMensalidade);
    Mensalidade.OpenWhere('codigo = ' + aLancamento.ToString);

    MensalSave := Mensalidade.Current;
    MensalSave.Pago := 'S';
    Mensalidade.Save(MensalSave);
    oConn.StartTransaction;
    Mensalidade.ApplyUpdates(0);
    oConn.Commit;
  finally
    FDMensalidade.Free;
  end;
end;

constructor TRecebimentoMensalidade.Create;
begin

end;

destructor TRecebimentoMensalidade.Destroy;
begin

  inherited;
end;

function TRecebimentoMensalidade.GerarRecibo: IRecebimentoMensalidade;
begin
  Result := Self;
end;

class function TRecebimentoMensalidade.New: IRecebimentoMensalidadeView;
begin
  Result := Self.Create;
end;

function TRecebimentoMensalidade.QuitarMensalidade(
  aLancamento: Integer): IRecebimentoMensalidadeView;
begin
  Result := Self;
  TRecebimentoMensalidadeInvoker.New
    .Add(TRecebimentoMensalidadeReceberValor.New(Self))
    .Add(TRecebimentoMensalidadeGerarRecibo.New(Self))
    .Add(TRecebimentoMensalidadeBaixarMensalidade.New(Self,aLancamento))
    .Execute;
end;

function TRecebimentoMensalidade.ReceberValor: IRecebimentoMensalidade;
begin

  Result := Self;
end;

end.

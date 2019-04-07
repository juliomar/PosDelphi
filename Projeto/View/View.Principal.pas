{*******************************************************}
{                                                       }
{       Projeto Teste P�s-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,

  Entity.Pessoa,


 ExtCtrls,


  Controller.Interfaces, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Datasnap.DBClient, Vcl.DBGrids, Model.Iterator.Interfaces,
  Model.State.Aluno.Interfaces;

type
  TStringGridHack = class(TStringGrid)
  protected
    procedure DeleteRow(ARow: Longint); reintroduce;
    procedure InsertRow(ARow: Longint);
  end;

  TPrincipal = class(TForm)
    STGridPessoa: TStringGrid;
    DBGridClientes: TDBGrid;
    ClientDataSetClientes: TClientDataSet;
    ClientDataSetClientesId: TIntegerField;
    ClientDataSetClientesNome: TStringField;
    ClientDataSetClientesMatricula: TStringField;
    DataSourceClientes: TDataSource;
    pnConsulta: TPanel;
    cbCampo: TComboBox;
    editTextoPesquisa: TEdit;
    ComboBox1: TComboBox;
    btnPesquisar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnAcoes: TPanel;
    BitBtnExportarAlunosXLS: TBitBtn;
    BitBtnExportarAlunosHTML: TBitBtn;
    btnEditar: TButton;
    btn_State: TButton;
    ClientDataSetClientesStatus: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnExportarAlunosXLSClick(Sender: TObject);
    procedure BitBtnExportarAlunosHTMLClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_StateClick(Sender: TObject);
    procedure ClientDataSetClientesStatusGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    procedure DefinicaoStringGrid;
    procedure PreencherStringGrid(ALista: iIterator<TPessoa>);
    procedure AdicionarLinhaStringGrid(AObject: TPessoa);
    function RetornaSexo(ASelecao : TSexo): string;
    function RetornaStatus(AStatus : TStatus): string;
    { Private declarations }
  public
    FControllerPessoa : iControllerCadastro<TPessoa>;
    FIterator : iIterator<TPessoa>;
    { Public declarations }
    FState: iAlunoStatus;
  end;

var
  Principal: TPrincipal;

implementation

uses
  Model.Exportador.Interfaces, Model.Exportador.Alunos, Model.Exportador.FormatoXLS, Model.Exportador.FormatoHTML,
  Controller.Cadastro, Model.State.Aluno, View.ModelState;

{$R *.dfm}

procedure TPrincipal.BitBtn1Click(Sender: TObject);
begin
  ShowMessage(FState.Operacoes.Value);
  FState.Operacoes.Matricular;
  ShowMessage(FState.Operacoes.Value);
end;

procedure TPrincipal.BitBtn2Click(Sender: TObject);
begin
  ShowMessage(FState.Operacoes.Value);
  FState.Operacoes.Ativar;
  ShowMessage(FState.Operacoes.Value);
end;

procedure TPrincipal.BitBtnExportarAlunosHTMLClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorAlunos.Create(TFormatoHTML.Create);
  try
    Exportador.ExportarDados(ClientDataSetClientes.Data);
  finally
    Exportador := nil;
  end;
end;

procedure TPrincipal.BitBtnExportarAlunosXLSClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorAlunos.Create(TFormatoXLS.Create);
  try
    Exportador.ExportarDados(ClientDataSetClientes.Data);
  finally
    Exportador := nil;
  end;
end;

procedure TPrincipal.btn_StateClick(Sender: TObject);
var
  sAux: string;
begin
  sAux:= Tfrm_ModelState.ShowModelState(ClientDataSetClientesStatus.AsString);
  if not (ClientDataSetClientes.State in dsEditModes) then
    ClientDataSetClientes.Edit;
  ClientDataSetClientesStatus.AsString := sAux;
end;

procedure TPrincipal.ClientDataSetClientesStatusGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.AsString = 'A'  then
    Text:= 'Ativo'
  else if sender.AsString = 'I' then
    Text:= 'Inativo'
  else if sender.AsString = 'M' then
    Text:= 'Matrículado';
end;

procedure TPrincipal.DefinicaoStringGrid;
var
  iFor: Integer;
begin
  STGridPessoa.ColCount := 9;

  for iFor := 0 to pred(STGridPessoa.ColCount) do
    STGridPessoa.ColWidths[iFor] := 150;

  STGridPessoa.Cols[0].Text := 'ID';
  STGridPessoa.Cols[1].Text := 'Nome';
  STGridPessoa.Cols[2].Text := 'Sobrenome';
  STGridPessoa.Cols[3].Text := 'Telefone';
  STGridPessoa.Cols[4].Text := 'Email';
  STGridPessoa.Cols[5].Text := 'Matricula';
  STGridPessoa.Cols[6].Text := 'Nascimento';
  STGridPessoa.Cols[7].Text := 'Sexo';
  STGridPessoa.Cols[8].Text := 'Status';
end;

procedure TPrincipal.PreencherStringGrid(ALista: iIterator<TPessoa>);
var
  LFor: Integer;
begin
  //for LFor := AIndex to ALista.Count -1 do
  while ALista.temProximo do
  begin
    // Adiciona a lista de objetos geral.
    AdicionarLinhaStringGrid(ALista.Proximo);
    TStringGridHack(STGridPessoa).InsertRow(1);
  end;
  if STGridPessoa.RowCount > 1 then
    STGridPessoa.FixedRows := 1;
end;

function TPrincipal.RetornaSexo(ASelecao: TSexo): string;
begin
case ASelecao of
  Masculino: Result := 'Masculino';
  Feminino: Result := 'Feminino';
end;
end;

function TPrincipal.RetornaStatus(AStatus: TStatus): string;
begin
  case AStatus of
    Ativo       : Result:= 'A';
    Inativo     : Result:= 'I';
    Matriculado : Result:= 'M';
  end;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
var
  CaminhoAplicacao: string;
begin
  CaminhoAplicacao := ExtractFilePath(Application.ExeName);
  ClientDataSetClientes.LoadFromFile(CaminhoAplicacao + 'Clientes.xml');
  //FControllerPessoa := TControllerCadastroPessoa.New;
  FControllerPessoa := TControllerCadastro<TPessoa>.New;
  if Assigned(FControllerPessoa) then
  begin
    FIterator  := FControllerPessoa.Entidade.getLista;
    DefinicaoStringGrid;
    if Assigned(FControllerPessoa.Entidade) then
      PreencherStringGrid(FIterator);
  end;
end;

procedure TPrincipal.AdicionarLinhaStringGrid(AObject: TPessoa);
begin
  STGridPessoa.Cells[0, STGridPessoa.RowCount] := inttostr(AObject.id);
  STGridPessoa.Cells[1, STGridPessoa.RowCount] := AObject.nome;
  STGridPessoa.Cells[2, STGridPessoa.RowCount] := AObject.sobrenome;
  STGridPessoa.Cells[3, STGridPessoa.RowCount] := AObject.telefone;
  STGridPessoa.Cells[4, STGridPessoa.RowCount] := AObject.email;
  STGridPessoa.Cells[5, STGridPessoa.RowCount] := IntToStr(AObject.matricula);
  STGridPessoa.Cells[6, STGridPessoa.RowCount] := DateToStr(AObject.datanascimento);
  STGridPessoa.Cells[7, STGridPessoa.RowCount] := RetornaSexo(AObject.sexo);
  STGridPessoa.Cells[8, STGridPessoa.RowCount] := RetornaStatus(AObject.status);
end;

procedure TStringGridHack.DeleteRow(ARow: Longint);
var
  GemRow: Integer;
begin
  GemRow := Row;
  if RowCount > FixedRows + 1 then
    inherited DeleteRow(ARow)
  else
    Rows[ARow].Clear;
  if GemRow < RowCount then
    Row := GemRow;
end;

procedure TStringGridHack.InsertRow(ARow: Longint);
var
  GemRow: Integer;
begin
  GemRow := Row;
  while ARow < FixedRows do
    Inc(ARow);
  RowCount := RowCount + 1;
  Row := GemRow;
end;

end.




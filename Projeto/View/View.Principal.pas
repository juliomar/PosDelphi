{ ******************************************************* }
{ }
{ Projeto Teste P�s-Delphi }
{ }
{ Copyright (C) 2019 Unoesc }
{ }
{ ******************************************************* }
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
  Entity.Aluno, Unit1,
  Model.Log.Logger,

  ExtCtrls,

  Controller.Interfaces, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Datasnap.DBClient, Vcl.DBGrids, Model.Iterator.Interfaces, Vcl.Menus,
  Vcl.ToolWin, Vcl.ComCtrls,

  Memento.Model.Interfaces, memento.model.aluno,
  Vcl.Imaging.pngimage,
  View.Tabela.Cursos,

  Controller.Cadastro,

  Model.Observer, DateUtils,
  Model.State.Aluno.Interfaces, Vcl.AppEvnts;

type
  TConcreteObserver = class(
    TInterfacedObject,
    IObserver)
  public
    procedure Update (ASubject: TSubject);
  end;

  TStringGridHack = class(
    TStringGrid)
  protected
    procedure DeleteRow (ARow: Longint); reintroduce;
    procedure InsertRow (ARow: Longint);
  end;

  TPrincipal = class(
    TForm)
    STGridPessoa: TStringGrid;
    BitBtnExportarAlunosXLS: TBitBtn;
    BitBtnExportarAlunosHTML: TBitBtn;
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
    // BitBtnExportarAlunosXLS: TBitBtn;
    // BitBtnExportarAlunosHTML: TBitBtn;
    btnEditar: TButton;
    StatusBar1: TStatusBar;
    ApplicationEvents: TApplicationEvents;
    Timer1: TTimer;
    lblRelogio: TLabel;
    btnBuilder: TBitBtn;
		procedure btnBuilderClick(Sender: TObject);
    procedure FormCreate (Sender: TObject);
    procedure esste1Click (Sender: TObject);
    procedure BitBtnExportarAlunosXLSClick (Sender: TObject);
    procedure BitBtnExportarAlunosHTMLClick (Sender: TObject);
    procedure Button1Click (Sender: TObject);
    procedure ListBox1Click (Sender: TObject);
    procedure Timer1Timer (Sender: TObject);
    procedure FormClose (Sender: TObject; var Action: TCloseAction);
    procedure ExecutaFacadeAndersonFurtilho (Sender: TObject);
    procedure BitBtn1Click (Sender: TObject);
    procedure BitBtn2Click (Sender: TObject);
    procedure btn_StateClick (Sender: TObject);
    procedure ClientDataSetClientesStatusGetText (Sender: TField; var Text: string; DisplayText: Boolean);
    procedure btnEditarClick (Sender: TObject);
  private
    FAluno: iAluno;
    procedure DefinicaoStringGrid;
    procedure PreencherStringGrid (ALista: iIterator<TPessoa>);
    procedure AdicionarLinhaStringGrid (AObject: TPessoa);
    function RetornaSexo (ASelecao: TSexo): string;
    function RetornaStatus (AStatus: TStatus): string;
    procedure ApplicationEventsException (Sender: TObject; E: Exception);
    { Private declarations }
  public
    FControllerPessoa: iControllerCadastro<TPessoa>;
    FIterator        : iIterator<TPessoa>;
    _observavel      : TSubject;
    _observador      : IObserver;
    { Public declarations }
    FState: iAlunoStatus;
  end;

var
  Principal: TPrincipal;

implementation

uses
  Model.Exportador.Interfaces, Model.Exportador.Alunos, Model.Exportador.FormatoXLS, Model.Exportador.FormatoHTML,
  Pattern.Component, View.Pagamento, Pattern.Facade.Exportar.Alunos,
  uTela, Model.State.Aluno, View.ModelState,

  Model.Builder.Interfaces,
  Model.Builder.Product,
  Model.Builder.Director,
  Model.Builder.ConcretBuilder,
  Pattern.ConcreteComponent,
  Pattern.Decorator.DataHora,
  Pattern.Decorator.NomeUsuario, Pattern.Decorator.Executavel,
  Pattern.Director, Pattern.Builder, Pattern.ConcreteBuilder, Pattern.Product;

{$R *.dfm}

procedure TPrincipal.ApplicationEventsException (Sender: TObject; E: Exception);
var
  LogExcecao: ILogExcecao;
  Arquivo   : TextFile;
  CamArq    : String;
begin
  LogExcecao := TLogExcecao.Create (E);
  LogExcecao := TDataHoraDecorator.Create (LogExcecao);
  LogExcecao := TNomeUsuarioDecorator.Create (LogExcecao);
  LogExcecao := TExecutavelDecorator.Create (LogExcecao);

  CamArq := ExtractFilePath (Application.ExeName) + 'LogErros.txt';
  AssignFile (Arquivo, CamArq);
  try
    if not FileExists (CamArq) then
      Rewrite (Arquivo);

    Append (Arquivo);

    WriteLn (Arquivo, LogExcecao.ObterDadosExcecao);

    CloseFile (Arquivo);
  Except
    CloseFile (Arquivo);
  end;
end;

procedure TPrincipal.BitBtn1Click (Sender: TObject);
begin
  ShowMessage (FState.Operacoes.Value);
  FState.Operacoes.Matricular;
  ShowMessage (FState.Operacoes.Value);
end;

procedure TPrincipal.BitBtn2Click (Sender: TObject);
begin
  ShowMessage (FState.Operacoes.Value);
  FState.Operacoes.Ativar;
  ShowMessage (FState.Operacoes.Value);
end;

procedure TPrincipal.btnBuilderClick(Sender: TObject);
var
  Director: TDirector;
  ConcreteBuilder: IBuilder;
  Product: TProduct;
begin
  // Cria uma instância do Director
  Director := TDirector.Create;

  // Cria uma instância do Concrete Builder, informando os dados como parâmetro
  ConcreteBuilder := TConcreteBuilder.Create(ClientDataSetClientes.Data);
  try
    // Solicita a construção do objeto ao Director
    Director.Construct(ConcreteBuilder);

    // Recebe o produto pronto ("constrúido")
    Product := ConcreteBuilder.GetRelatorio;

    // Chama o método para salvar o arquivo em disco
    Product.SalvarArquivo;
  finally
    // Libera o Director da memória
    FreeAndNil(Director);
  end;
end;

procedure TPrincipal.BitBtnExportarAlunosHTMLClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorAlunos.Create (TFormatoHTML.Create);
  try
    Exportador.ExportarDados (ClientDataSetClientes.Data);
  finally
    Exportador := nil;
  end;
end;

procedure TPrincipal.BitBtnExportarAlunosXLSClick (Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorAlunos.Create (TFormatoXLS.Create);
  try
    Exportador.ExportarDados (ClientDataSetClientes.Data);
  finally
    Exportador := nil;
  end;
end;

procedure TPrincipal.Button1Click (Sender: TObject);
var
  a             : integer;
  Key           : string;
  Director      : TDirector;
  ConcretBuilder: TConcretBuilder;
  Product       : TProduct;

begin
  // FAluno.Nome      := edtNome.Text;
  // FAluno.Sobrenome := edtSobrenome.Text;
  // FAluno.Matricula := edtMatricula.Text;
  Key := 'Backup - ' + datetimetostr (now);
  FAluno.Memento.Save (Key);
  // ListBox1.Items.Add (Key);
  // edtNome.Text      := '';
  // edtSobrenome.Text := '';
  // edtMatricula.Text := '';

  Director := TDirector.Create;

  ConcretBuilder := TConcretBuilder.Create (STGridPessoa);

  try
    Director.Construct (ConcretBuilder);

    Product := ConcretBuilder.getRelatorio;

    Product.SalvarArquivo;
  finally
    FreeAndNil (Director);
    FreeAndNil (Product);
  end;

  a := strtoint ('1.5');

  Form1 := TForm1.Create (Application);
  Form1.Show;

  fTela := TfTela.Create (application);
  try
    fTela.ShowModal;
  finally
    FreeAndNil (fTela);
  end;
end;

procedure TPrincipal.btn_StateClick (Sender: TObject);
var
  sAux: string;
begin
  // sAux := Tfrm_ModelState.ShowModelState (ClientDataSetClientesStatus.AsString);
  if not(ClientDataSetClientes.State in dsEditModes) then
    ClientDataSetClientes.Edit;
  // ClientDataSetClientesStatus.AsString := sAux;
end;

procedure TPrincipal.ClientDataSetClientesStatusGetText (Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString = 'A' then
    Text := 'Ativo'
  else
    if sender.AsString = 'I' then
      Text := 'Inativo'
    else
      if sender.AsString = 'M' then
        Text := 'Matrículado';
end;

procedure TPrincipal.btnEditarClick (Sender: TObject);
var
  Logger: TLog;
begin
  // obtém a instância do Singleton para registrar um log
  Logger := TLog.ObterInstancia;
  Logger.RegistrarLog ('Registro alterado!' + DateTimeToStr(Now));
end;

procedure TPrincipal.DefinicaoStringGrid;
var
  iFor: Integer;
begin
  STGridPessoa.ColCount := 9;

  for iFor                         := 0 to pred(STGridPessoa.ColCount) do
    STGridPessoa.ColWidths[ iFor ] := 150;

  STGridPessoa.Cols[ 0 ].Text := 'ID';
  STGridPessoa.Cols[ 1 ].Text := 'Nome';
  STGridPessoa.Cols[ 2 ].Text := 'Sobrenome';
  STGridPessoa.Cols[ 3 ].Text := 'Telefone';
  STGridPessoa.Cols[ 4 ].Text := 'Email';
  STGridPessoa.Cols[ 5 ].Text := 'Matricula';
  STGridPessoa.Cols[ 6 ].Text := 'Nascimento';
  STGridPessoa.Cols[ 7 ].Text := 'Sexo';
  STGridPessoa.Cols[ 8 ].Text := 'Status';
end;

procedure TPrincipal.esste1Click (Sender: TObject);
var
  LViewPagamento: TPagamento;
begin
  LViewPagamento := TPagamento.Create (self);
  try
    LViewPagamento.ShowModal;
  finally
    LViewPagamento.Free;
  end;
end;

procedure TPrincipal.ExecutaFacadeAndersonFurtilho (Sender: TObject);
var
  F: TFacadeExportarAlunos;
begin
  F := TFacadeExportarAlunos.Create;
  try
    F.ExportaTodosAlunosTodosFormatos (ClientDataSetClientes);
  finally
    F.Free;
  end;

end;

procedure TPrincipal.PreencherStringGrid (ALista: iIterator<TPessoa>);
var
  LFor: Integer;
begin
  // for LFor := AIndex to ALista.Count -1 do
  while ALista.temProximo do
  begin
    // Adiciona a lista de objetos geral.
    AdicionarLinhaStringGrid (ALista.Proximo);
    TStringGridHack (STGridPessoa).InsertRow (1);
  end;
  if STGridPessoa.RowCount > 1 then
    STGridPessoa.FixedRows := 1;
end;

function TPrincipal.RetornaSexo (ASelecao: TSexo): string;
begin
  case ASelecao of
    Masculino:
      Result := 'Masculino';
    Feminino:
      Result := 'Feminino';
  end;

end;

procedure TPrincipal.Timer1Timer (Sender: TObject);
begin
  StatusBar1.Panels.Items[ 0 ].Text := DateTimeToStr (now);
  _observavel.Horario               := IncSecond (_observavel.Horario, 1);
end;

procedure TPrincipal.FormClose (Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox ('Deseja Relamente Sair', 'informação', MB_YESNO + MB_ICONQUESTION) = mrYes then

    Application.Terminate
  else
    abort;
end;

function TPrincipal.RetornaStatus (AStatus: TStatus): string;
begin
  case AStatus of
    Ativo:
      Result := 'A';
    Inativo:
      Result := 'I';
    Matriculado:
      Result := 'M';
  end;
end;

procedure TPrincipal.FormCreate (Sender: TObject);
var
  CaminhoAplicacao: string;
begin
  _observavel := TSubject.Create;
  _observador := TConcreteObserver.Create;

  _observavel.Attach (_observador);
  Timer1.Enabled := True;

  CaminhoAplicacao := ExtractFilePath (Application.ExeName);
  ClientDataSetClientes.LoadFromFile (CaminhoAplicacao + 'Clientes.xml');
  // FControllerPessoa := TControllerCadastroPessoa.New;
  FControllerPessoa := TControllerCadastro<TPessoa>.New;
  if Assigned (FControllerPessoa) then
  begin
    FIterator := FControllerPessoa.Entidade.getLista;
    DefinicaoStringGrid;
    if Assigned (FControllerPessoa.Entidade) then
      PreencherStringGrid (FIterator);
  end;
  FAluno := TModelAluno.new;
end;

procedure TPrincipal.ListBox1Click (Sender: TObject);
begin
  // FAluno            := FAluno.Memento.Restore (ListBox1.Items[ ListBox1.ItemIndex ]);
  // edtNome.Text      := FAluno.Nome;
  // edtSobrenome.Text := FAluno.Sobrenome;
  // edtMatricula.Text := FAluno.Matricula;
end;

procedure TPrincipal.AdicionarLinhaStringGrid (AObject: TPessoa);
begin
  STGridPessoa.Cells[ 0, STGridPessoa.RowCount ] := inttostr (AObject.id);
  STGridPessoa.Cells[ 1, STGridPessoa.RowCount ] := AObject.nome;
  STGridPessoa.Cells[ 2, STGridPessoa.RowCount ] := AObject.sobrenome;
  STGridPessoa.Cells[ 3, STGridPessoa.RowCount ] := AObject.telefone;
  STGridPessoa.Cells[ 4, STGridPessoa.RowCount ] := AObject.email;
  STGridPessoa.Cells[ 5, STGridPessoa.RowCount ] := inttostr (AObject.matricula);
  STGridPessoa.Cells[ 6, STGridPessoa.RowCount ] := DateToStr (AObject.datanascimento);
  STGridPessoa.Cells[ 7, STGridPessoa.RowCount ] := RetornaSexo (AObject.sexo);
  STGridPessoa.Cells[ 8, STGridPessoa.RowCount ] := RetornaStatus (AObject.status);
end;

procedure TStringGridHack.DeleteRow (ARow: Longint);
var
  GemRow: Integer;
begin
  GemRow := Row;
  if RowCount > FixedRows + 1 then
    inherited DeleteRow (ARow)
  else
    Rows[ ARow ].Clear;
  if GemRow < RowCount then
    Row := GemRow;
end;

procedure TStringGridHack.InsertRow (ARow: Longint);
var
  GemRow: Integer;
begin
  GemRow := Row;
  while ARow < FixedRows do
    Inc (ARow);
  RowCount := RowCount + 1;
  Row      := GemRow;
end;

{ TConcreteObserver }

procedure TConcreteObserver.Update (ASubject: TSubject);
begin
  Principal.lblRelogio.Caption := FormatDateTime ('hh:mm:ss', ASubject.Horario);
end;

end.

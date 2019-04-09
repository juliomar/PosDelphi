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
  Entity.Aluno,

  ExtCtrls,


  Controller.Interfaces, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Datasnap.DBClient, Vcl.DBGrids, Model.Iterator.Interfaces,
  Memento.Model.Interfaces,memento.model.aluno,  Controller.Interfaces,
  Controller.Cadastro.Pessoa, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Datasnap.DBClient, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  Model.Iterator.Interfaces, View.Tabela.Cursos,

  Model.Iterator.Interfaces,

  Controller.Interfaces,
  Controller.Cadastro, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Datasnap.DBClient, Vcl.DBGrids;


type
  TStringGridHack = class(TStringGrid)
  protected
    procedure DeleteRow(ARow: Longint); reintroduce;
    procedure InsertRow(ARow: Longint);
  end;

  TPrincipal = class(TForm)
    STGridPessoa: TStringGrid;
    BitBtnExportarAlunosXLS: TBitBtn;
    BitBtnExportarAlunosHTML: TBitBtn;
    LabelClientes: TLabel;
    DBGridClientes: TDBGrid;
    ClientDataSetClientes: TClientDataSet;
    ClientDataSetClientesId: TIntegerField;
    ClientDataSetClientesNome: TStringField;
    ClientDataSetClientesMatricula: TStringField;
    DataSourceClientes: TDataSource;
<<<<<<< HEAD
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
    edtNome: TLabeledEdit;
    edtSobrenome: TLabeledEdit;
    EdtMatricula: TLabeledEdit;
    Button1: TButton;
    ListBox1: TListBox;
    ToolBar1: TToolBar;
    MainMenu1: TMainMenu;
    esste1: TMenuItem;    
    StaticText1: TStaticText;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ImageAluno: TImage;
    BtnFacadeAndersonFurtilho: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure esste1Click(Sender: TObject);
    procedure BitBtnExportarAlunosXLSClick(Sender: TObject);
    procedure BitBtnExportarAlunosHTMLClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecutaFacadeAndersonFurtilho(Sender: TObject);
  private
    FAluno : iAluno;
    procedure DefinicaoStringGrid;
    procedure PreencherStringGrid(ALista: iIterator<TPessoa>);
    procedure AdicionarLinhaStringGrid(AObject: TPessoa);
    function RetornaSexo(ASelecao: TSexo): string;
    { Private declarations }
  public
    FControllerPessoa: iControllerCadastro<TPessoa>;
    FIterator: iIterator<TPessoa>;
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses

  Model.Exportador.Interfaces, Model.Exportador.Alunos, Model.Exportador.FormatoXLS, Model.Exportador.FormatoHTML,
  Controller.Cadastro, View.Pagamento, Pattern.Facade.Exportar.Alunos,
  Model.Exportador.Interfaces,
  Model.Exportador.Alunos,
  Model.Exportador.FormatoXLS,
  Model.Exportador.FormatoHTML,

  Model.Builder.Interfaces,
  Model.Builder.Product,
  Model.Builder.Director,
  Model.Builder.ConcretBuilder;

{$R *.dfm}

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

procedure TPrincipal.Button1Click(Sender: TObject);
var
  Key: string;
begin
  FAluno.Nome      := edtNome.Text;
  FAluno.Sobrenome := edtSobrenome.Text;
  FAluno.Matricula := edtMatricula.Text;
  Key := 'Backup - '+datetimetostr(now);
  FAluno.Memento.Save(Key);
  ListBox1.Items.Add(Key);
  edtNome.Text:='';
  edtSobrenome.Text:='';
  edtMatricula.Text:='';



  Director : TDirector;
  ConcretBuilder : TConcretBuilder;
  Product : TProduct;

  Director := TDirector.Create;

  ConcretBuilder := TConcretBuilder.Create(STGridPessoa);

  try
    Director.Construct(ConcretBuilder);

    Product := ConcretBuilder.getRelatorio;

    Product.SalvarArquivo;
  finally
    FreeAndNil(Director);
    FreeAndNil(Product);
  end;
end;

procedure TPrincipal.DefinicaoStringGrid;
var
  iFor: Integer;
begin
  STGridPessoa.ColCount := 8;

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
end;

procedure TPrincipal.esste1Click(Sender: TObject);
var
  LViewPagamento: TPagamento;
begin
  LViewPagamento:= TPagamento.Create(self);
  try
    LViewPagamento.ShowModal;
  finally
    LViewPagamento.Free;
  end;
end;

procedure TPrincipal.ExecutaFacadeAndersonFurtilho(Sender: TObject);
var
  F: TFacadeExportarAlunos;
begin
    F := TFacadeExportarAlunos.Create;
  try
    F.ExportaTodosAlunosTodosFormatos(ClientDataSetClientes);
  finally
    F.Free;
  end;
end;

procedure TPrincipal.PreencherStringGrid(ALista: iIterator<TPessoa>);
var
  LFor: Integer;
begin
  // for LFor := AIndex to ALista.Count -1 do
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
    Masculino:
      Result := 'Masculino';
    Feminino:
      Result := 'Feminino';
  end;

end;

procedure TPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

procedure TPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Application.MessageBox('Deseja Relamente Sair','informação', MB_YESNO+MB_ICONQUESTION) =mrYes then


Application.Terminate
else
abort;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
var
  CaminhoAplicacao: string;
begin
  CaminhoAplicacao := ExtractFilePath(Application.ExeName);
  ClientDataSetClientes.LoadFromFile(CaminhoAplicacao + 'Clientes.xml');
  // FControllerPessoa := TControllerCadastroPessoa.New;
  FControllerPessoa := TControllerCadastro<TPessoa>.New;
  if Assigned(FControllerPessoa) then
  begin
    FIterator := FControllerPessoa.Entidade.getLista;
    DefinicaoStringGrid;
    if Assigned(FControllerPessoa.Entidade) then
      PreencherStringGrid(FIterator);
  end;
  FAluno := TModelAluno.new;
end;

procedure TPrincipal.ListBox1Click(Sender: TObject);
begin
  FAluno := FAluno.Memento.Restore(ListBox1.Items[ListBox1.ItemIndex]);
  edtNome.Text      := FAluno.Nome;
  edtSobrenome.Text := FAluno.Sobrenome;
  edtMatricula.Text := FAluno.Matricula;
end;

procedure TPrincipal.AdicionarLinhaStringGrid(AObject: TPessoa);
begin
  STGridPessoa.Cells[0, STGridPessoa.RowCount] := inttostr(AObject.id);
  STGridPessoa.Cells[1, STGridPessoa.RowCount] := AObject.nome;
  STGridPessoa.Cells[2, STGridPessoa.RowCount] := AObject.sobrenome;
  STGridPessoa.Cells[3, STGridPessoa.RowCount] := AObject.telefone;
  STGridPessoa.Cells[4, STGridPessoa.RowCount] := AObject.email;
  STGridPessoa.Cells[5, STGridPessoa.RowCount] := inttostr(AObject.matricula);
  STGridPessoa.Cells[6, STGridPessoa.RowCount] :=
    DateToStr(AObject.datanascimento);
  STGridPessoa.Cells[7, STGridPessoa.RowCount] := RetornaSexo(AObject.sexo);
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

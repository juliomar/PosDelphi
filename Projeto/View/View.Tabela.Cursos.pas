unit View.Tabela.Cursos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.ComCtrls,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Model.Conexao, Vcl.StdCtrls,
  Model.Iterator.Interfaces, entity.curso, Controller.Interfaces,
  Vcl.Imaging.pngimage;

type
  TStringGridHack = class(TStringGrid)
  protected
    procedure DeleteRow(ARow: Longint); reintroduce;
    procedure InsertRow(ARow: Longint);

  end;

  TfrmCurso = class(TForm)
    DBGridCurso: TDBGrid;
    DataSourceCursos: TDataSource;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Label1: TLabel;
    STGridCurso: TStringGrid;
    ClientDataSetCurso: TClientDataSet;
    ClientDataSetCursoid: TIntegerField;
    ClientDataSetCursoDescricaoDoCurso: TStringField;
    ClientDataSetCursoNotaEnad: TFloatField;
    ClientDataSetCursoAreaDoConhecimento: TStringField;
    ImageCursos: TImage;
    ButnAdicionar: TButton;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }

    procedure DefinicaoStringGrid;
    procedure PreencherStringGrid(ALista: iIterator<TCurso>);
    procedure AdicionarLinhaStringGrid(AObject: TCurso);

  public
    { Public declarations }
    FControllerCurso: iControllerCadastro<TCurso>;
    FIterator: iIterator<TCurso>;
  end;

var
  frmCurso: TfrmCurso;

implementation

{$R *.dfm}

procedure TfrmCurso.DefinicaoStringGrid;
var
  iFor: Integer;
begin
  STGridCurso.ColCount := 3;
  for iFor := 0 to pred(STGridCurso.ColCount) do
  STGridCurso.ColWidths[iFor] := 150;
  STGridCurso.Cols[0].Text := 'ID';
  STGridCurso.Cols[1].Text := 'Descricao';
  STGridCurso.Cols[2].Text := 'Area de Conhecimento';

end;

procedure TfrmCurso.PreencherStringGrid(ALista: iIterator<TCurso>);
var
  LFor: Integer;
begin
  // for LFor := AIndex to ALista.Count -1 do
  while ALista.temProximo do
  begin
    // Adiciona a lista de objetos geral.
    AdicionarLinhaStringGrid(ALista.Proximo);
    TStringGridHack(STGridCurso).InsertRow(1);
  end;
  if STGridCurso.RowCount > 1 then
    STGridCurso.FixedRows := 1;
end;

procedure TfrmCurso.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

procedure TfrmCurso.AdicionarLinhaStringGrid(AObject: TCurso);
begin
  STGridCurso.Cells[0, STGridCurso.RowCount] := inttostr(AObject.id);
  STGridCurso.Cells[1, STGridCurso.RowCount] := AObject.descricao;
  STGridCurso.Cells[2, STGridCurso.RowCount] := AObject.areaconhecimento;

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

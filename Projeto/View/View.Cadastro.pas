unit View.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Grids,

  entity.pessoa,
  Controller.Interfaces,
  Model.Iterator.Interfaces, Controller.Cadastro;

type
  TTipoCadastro = (Professor, Aluno);

  TViewCadastro = class(TForm)
    Pnl1: TPanel;
    btnNovo: TButton;
    btn1: TButton;
    btnFechar: TButton;
    grp1: TGroupBox;
    lbl1: TLabel;
    EdtNome: TEdit;
    EdtSobreNome: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    EdtDataNascimento: TMaskEdit;
    lbl4: TLabel;
    EdtMatricula: TEdit;
    CmbTipoCadastro: TComboBox;
    lbl5: TLabel;
    lbl6: TLabel;
    CmbSexo: TComboBox;
    lbl7: TLabel;
    EdtEmail: TEdit;
    EdtTelefone: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    Edt1: TEdit;
    Edt2: TEdit;
    lbl10: TLabel;
    Edt3: TEdit;
    lbl11: TLabel;
    btnAdd: TButton;
    STGridCursos: TStringGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure CmbTipoCadastroChange(Sender: TObject);
  private
   FControllerPessoa : iControllerCadastro<TPessoa>;
    procedure PreencheCombos;
    procedure LimparCampos;
    procedure DefinicaoStringGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
    uses Controller.EnumUtils;
{$R *.dfm}

procedure TViewCadastro.DefinicaoStringGrid;
var
  iFor: Integer;
begin
  STGridCursos.ColCount := 4;

  for iFor := 0 to pred(STGridCursos.ColCount) do
    STGridCursos.ColWidths[iFor] := 150;

  STGridCursos.Cols[0].Text := 'ID';
  STGridCursos.Cols[1].Text := 'Descrição';
  STGridCursos.Cols[2].Text := 'Área de Conhecimento';
  STGridCursos.Cols[3].Text := 'Enade';
end;

procedure TViewCadastro.btnFecharClick(Sender: TObject);
begin
 Self.Close;
end;

procedure TViewCadastro.btnNovoClick(Sender: TObject);
begin
 LimparCampos;
end;

procedure TViewCadastro.CmbTipoCadastroChange(Sender: TObject);
begin
 case TTipoCadastro(CmbTipoCadastro.ItemIndex) of
  Professor :
   begin
   end;
  Aluno :
   begin
   end;
 end;
end;

procedure TViewCadastro.FormCreate(Sender: TObject);
begin
 PreencheCombos;
 DefinicaoStringGrid;
end;

procedure TViewCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
   Perform(WM_NEXTDLGCTL, 0, 0);
   Key := #0;
  end;
end;

procedure TViewCadastro.LimparCampos;
begin
 CmbTipoCadastro.ItemIndex := -1;
 CmbSexo.ItemIndex := -1;
 EdtMatricula.Clear;
 EdtNome.Clear;
 EdtSobreNome.Clear;
 EdtDataNascimento.Clear;
 EdtEmail.Clear;
 EdtTelefone.Clear;
end;

procedure TViewCadastro.PreencheCombos;
begin
 TControllerEnumUtils<TSexo>.EnumToList(CmbSexo.Items);
 TControllerEnumUtils<TTipoCadastro>.EnumToList(CmbTipoCadastro.Items);
end;

end.


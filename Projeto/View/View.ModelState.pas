{ Modelo de Projeto - State
  Autores: Lucas Montemezzo
           Pedro H. Wanot Chikoski
           Anderson Possamai (Coxinha)
}

unit View.ModelState;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Generics.Collections, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Entity.Pessoa, ExtCtrls,Controller.Interfaces, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Datasnap.DBClient, Vcl.DBGrids, Model.Iterator.Interfaces, Model.State.Aluno.Interfaces;

type
  Tfrm_ModelState = class(TForm)
    btn_ativo: TButton;
    btn_inativo: TButton;
    btn_matriculado: TButton;
    btn_cancelar: TButton;
    btn_sair: TButton;
    lbl_status: TLabel;
    procedure btn_matriculadoClick(Sender: TObject);
    procedure btn_ativoClick(Sender: TObject);
    procedure btn_inativoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    FState: iAlunoStatus;
    class function ShowModelState (AShow: String) :string;
    function GetDescricao (AValues : String) : string;
  end;

var
  frm_ModelState: Tfrm_ModelState;

implementation

uses
  Model.Exportador.Interfaces, Model.Exportador.Alunos, Model.Exportador.FormatoXLS, Model.Exportador.FormatoHTML,
  Controller.Cadastro, Model.State.Aluno;

{$R *.dfm}

procedure Tfrm_ModelState.btn_ativoClick(Sender: TObject);
begin
  FState.Operacoes.Ativar;
  lbl_status.Caption := GetDescricao(FState.Operacoes.Value);
end;

procedure Tfrm_ModelState.btn_cancelarClick(Sender: TObject);
var
  sStatus: string;
begin
  FState.Operacoes.CancelarMatricula;
  lbl_status.Caption := GetDescricao(FState.Operacoes.Value);
end;

procedure Tfrm_ModelState.btn_inativoClick(Sender: TObject);
begin
  FState.Operacoes.Inativar;
  lbl_status.Caption := GetDescricao(FState.Operacoes.Value);
end;

procedure Tfrm_ModelState.btn_matriculadoClick(Sender: TObject);
begin
  FState.Operacoes.Matricular;
  lbl_status.Caption := GetDescricao(FState.Operacoes.Value);
end;

procedure Tfrm_ModelState.FormShow(Sender: TObject);
begin
  lbl_status.Caption := GetDescricao(FState.Operacoes.Value);
end;

function Tfrm_ModelState.GetDescricao(AValues: String): string;
begin
  Result:= '';
  if AValues = 'A'  then
    Result:= 'Ativo'
  else if AValues = 'I' then
    Result:= 'Inativo'
  else if AValues = 'M' then
    Result:= 'Matrículado';
end;


class function Tfrm_ModelState.ShowModelState(AShow: string): string;
var
  oShowModelState : Tfrm_ModelState;
begin
  Result:= '';
  oShowModelState := Tfrm_ModelState.Create(nil);
  try
    oShowModelState.FState := TModelAlunoStatus.New(AShow);
    oShowModelState.ShowModal;
    Result:= oShowModelState.FState.Operacoes.Value;
  finally
    oShowModelState.Free
  end;
end;

end.

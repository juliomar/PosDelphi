{*******************************************************}
{                                                       }
{       Projeto Teste P�s-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TFLogin = class(TForm)
    edtNroMatricula: TEdit;
    edtSenha: TEdit;
    labNroMatricula: TLabel;
    labSenha: TLabel;
    imgLogin: TImage;
    labTipoLogin: TLabel;
    cbTipoLogin: TComboBox;
    labDescLogin: TLabel;
    btnAcessar: TButton;
    btnSair: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure edtNroMatriculaKeyPress(Sender: TObject; var Key: Char);
  private
    FFundo: TForm;
    procedure CriarFormFundo;
    procedure DestruirFormFundo;
  public
    class function SolicitarLogin: Boolean;
  end;

implementation

uses
  Login.ConcreteFactory, Login.Types;

{$R *.dfm}

{ TFLogin }

procedure TFLogin.btnAcessarClick(Sender: TObject);
var
  oRetLogin: TRetornoLogin;
begin
  if Trim(edtNroMatricula.Text) = EmptyStr then
  begin
    edtNroMatricula.SetFocus;
    raise Exception.Create('Informe o número da matrícula!');
  end;

  if Trim(edtSenha.Text) = EmptyStr then
  begin
    edtSenha.SetFocus;
    raise Exception.Create('Informe a senha!');
  end;

  oRetLogin := TFactoryLogin.InstanciarLogin(TTipoUsuario(cbTipoLogin.ItemIndex))
    .ValidarLogin(StrToInt(edtNroMatricula.Text), edtSenha.Text);

  if oRetLogin.Valido then
    ModalResult := mrOk
  else
  begin
    edtSenha.SetFocus;
    raise Exception.Create(oRetLogin.Mensagem);
  end;
end;

procedure TFLogin.btnSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFLogin.CriarFormFundo;
begin
  FFundo := TForm.Create(Self);
  FFundo.Align           := alClient;
  FFundo.AlphaBlend      := True;
  FFundo.AlphaBlendValue := 220;
  FFundo.BorderStyle     := bsNone;
  FFundo.Color           := clBlack;
  FFundo.Show;
end;

procedure TFLogin.DestruirFormFundo;
begin
  if Assigned(FFundo) then
    FreeAndNil(FFundo);
end;

procedure TFLogin.edtNroMatriculaKeyPress(Sender: TObject; var Key: Char);
begin
  //Permite que apenas números sejam informados
  //Chr(8) = Back Space
  if not(Key in ['0'..'9', Chr(8)]) then
    Key := #0
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  CriarFormFundo;
end;

procedure TFLogin.FormDestroy(Sender: TObject);
begin
  DestruirFormFundo;
end;

class function TFLogin.SolicitarLogin: Boolean;
var
  FLogin: TFLogin;
begin
  Result := False;
  FLogin := TFLogin.Create(Application);
  try
    Result := FLogin.ShowModal = mrOk;
  finally
    FreeAndNil(FLogin);
  end;
end;

end.

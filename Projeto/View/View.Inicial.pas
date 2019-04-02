unit View.Inicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, View.Principal, View.Tabela.Cursos;

type
  TfrmTelaDeInicio = class(TForm)
    Panel1: TPanel;
    StatusBarTelaInicial: TStatusBar;
    TimerTelaInicial: TTimer;
    BtnTelaPrincipal: TButton;
    BtnCursos: TButton;
    procedure TimerTelaInicialTimer(Sender: TObject);
    procedure BtnTelaPrincipalClick(Sender: TObject);
    procedure BtnCursosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaDeInicio: TfrmTelaDeInicio;

implementation

{$R *.dfm}

procedure TfrmTelaDeInicio.BtnCursosClick(Sender: TObject);
begin

  frmCurso := TFrmcurso.Create(nil);
  try
    frmCurso.ShowModal;
  finally
    FreeAndNil(frmCurso);
  end;
end;

procedure TfrmTelaDeInicio.BtnTelaPrincipalClick(Sender: TObject);

begin
  Principal := TPrincipal.Create(nil);
  try
    Principal.ShowModal;
  finally
    FreeAndNil(Principal);
  end;
end;

procedure TfrmTelaDeInicio.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if Application.MessageBox('Deseja Relamente Sair', 'informação',
    MB_YESNO + MB_ICONQUESTION) = mrYes then

    Application.Terminate
  else
    abort;

end;

procedure TfrmTelaDeInicio.TimerTelaInicialTimer(Sender: TObject);
begin
  StatusBarTelaInicial.Panels.Items[0].Text := DateToStr(Now);
end;

end.

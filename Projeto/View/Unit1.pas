unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Unit2, System.UITypes, Contnrs;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Panel1: TPanel;
    btnNovo: TButton;
    btnCopiar: TButton;
    txtDescricao: TEdit;
    lblDescricao: TLabel;
    lblAssinarPor: TLabel;
    txtAssinadoPor: TEdit;
    procedure txtDescricaoExit(Sender: TObject);
    procedure txtAssinadoPorExit(Sender: TObject);
    procedure TListBox1Click(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    ListaComunicados: TObjectList;
    ComunicadoSelecionado: TComunicado;

    procedure AdicionarNovoComunicadoNaListBox;
    procedure PreencherDados;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.txtDescricaoExit(Sender: TObject);
begin
  ComunicadoSelecionado.Descricao := txtDescricao.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListaComunicados := TObjectList.Create;
end;

procedure TForm1.txtAssinadoPorExit(Sender: TObject);
begin
  ComunicadoSelecionado.AssinadoPor := txtAssinadoPor.Text;
end;

procedure TForm1.PreencherDados;
begin
  ComunicadoSelecionado := ListaComunicados[ListBox1.ItemIndex] as TComunicado;

  txtDescricao.Text := ComunicadoSelecionado.Descricao;
  txtAssinadoPor.text := ComunicadoSelecionado.AssinadoPor;

end;

procedure TForm1.AdicionarNovoComunicadoNaListBox;
begin
  ListBox1.Items.Add('Comunicado #' + IntToStr(ListBox1.Items.Count + 1));
  ListBox1.ItemIndex := ListBox1.Items.Count - 1;
end;

procedure TForm1.TListBox1Click(Sender: TObject);
begin
  PreencherDados;
end;


procedure TForm1.btnCopiarClick(Sender: TObject);
var
 ComunicadoClone: TComunicado;
begin
  ComunicadoClone := ComunicadoSelecionado.Clonar;
  ListaComunicados.Add(ComunicadoClone);
  AdicionarNovoComunicadoNaListBox;
  PreencherDados;

  txtDescricao.SetFocus;
end;

procedure TForm1.btnNovoClick(Sender: TObject);
var
  NovoComunicado: TComunicado;
begin
  Panel1.Visible := True;
  NovoComunicado := TComunicado.Create;
  ListaComunicados.Add(NovoComunicado);
  AdicionarNovoComunicadoNaListBox;
  PreencherDados;

  txtDescricao.SetFocus;
end;

end.

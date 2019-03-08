unit View.Tabela.Professor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.ComCtrls,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Model.Conexao, Vcl.StdCtrls,
  Model.Iterator.Interfaces;

type
  TFrmProfessor = class(TForm)
    DBGridProfessor: TDBGrid;
    DataSourceProfessor: TDataSource;
    ClientDataSet1: TClientDataSet;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Label1: TLabel;

  private
    { Private declarations }


  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TForFrmProfessormer1Timer(Sender: TObject);
begin

end;


end.

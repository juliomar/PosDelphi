{*******************************************************}
{                                                       }
{       Projeto Teste P�s-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
program PosDelphi;

uses
  Vcl.Forms,
  View.Principal in 'View\View.Principal.pas' {Principal},
  entity.pessoa in 'Model\Entity\entity.pessoa.pas',
  entity.aluno in 'Model\Entity\entity.aluno.pas',
  entity.professor in 'Model\Entity\entity.professor.pas',
  entity.curso in 'Model\Entity\entity.curso.pas',
  entity.titulo in 'Model\Entity\entity.titulo.pas',
  entity.formacao in 'Model\Entity\entity.formacao.pas',
  Model.Conexao in 'Model\Conexao\Model.Conexao.pas' {dmConexao: TDataModule},
  Model.Interfaces in 'Model\Model.Interfaces.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Model.Cadastro in 'Model\Cadastro\Model.Cadastro.pas',
  Model.Cadastro.Interfaces in 'Model\Cadastro\Model.Cadastro.Interfaces.pas',
  Model.Exportador.Interfaces in 'Model\Exportador\Model.Exportador.Interfaces.pas',
  Model.Exportador.InterfaceFormato in 'Model\Exportador\Model.Exportador.InterfaceFormato.pas',
  Model.Exportador.Alunos in 'Model\Exportador\Model.Exportador.Alunos.pas',
  Model.Exportador.FormatoHTML in 'Model\Exportador\Model.Exportador.FormatoHTML.pas',
  Model.Exportador.FormatoXLS in 'Model\Exportador\Model.Exportador.FormatoXLS.pas',
  Model.Iterator.Interfaces in 'Model\Iterator\Model.Iterator.Interfaces.pas',
  Controller.Cadastro in 'Controller\Controller.Cadastro.pas',
  Model.Lista.Factory in 'Model\Iterator\Model.Lista.Factory.pas',
  Model.Iterator in 'Model\Iterator\Model.Iterator.pas',
  Model.Lista.List in 'Model\Iterator\Model.Lista.List.pas',
  Model.Lista.ObjectList in 'Model\Iterator\Model.Lista.ObjectList.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.

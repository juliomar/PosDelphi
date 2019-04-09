{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
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
  Model.Lista.ObjectList in 'Model\Iterator\Model.Lista.ObjectList.pas',
  Model.Lista.List in 'Model\Iterator\Model.Lista.List.pas',
  View.Login in 'View\View.Login.pas' {FLogin},
  Login.AbstractFactory in 'Model\Login\Login.AbstractFactory.pas',
  Login.Aluno in 'Model\Login\Login.Aluno.pas',
  Login.Professor in 'Model\Login\Login.Professor.pas',
  Login.ConcreteFactory in 'Model\Login\Login.ConcreteFactory.pas',
  Login.Types in 'Model\Login\Login.Types.pas',
  Login.UsuarioLogado in 'Model\Login\Login.UsuarioLogado.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  if TFLogin.SolicitarLogin then
  begin
    Application.CreateForm(TPrincipal, Principal);
	  Application.CreateForm(TdmConexao, dmConexao);
  	Application.CreateForm(TfrmTelaDeInicio, frmTelaDeInicio);
  	Application.CreateForm(Tfrm_ModelState, frm_ModelState);
    Application.Run;
  end
  else
    Application.Terminate;

end.

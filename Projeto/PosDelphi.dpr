{*******************************************************}
{                                                       }
{       Projeto Teste Pós-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
program PosDelphi;

uses
<<<<<<< HEAD
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
  memento.model.interfaces in 'Memento\memento.model.interfaces.pas',
  memento.model.memento in 'Memento\memento.model.memento.pas',
  memento.model.aluno in 'Memento\memento.model.aluno.pas',
  View.Login in 'View\View.Login.pas' {FLogin},
  Login.AbstractFactory in 'Model\Login\Login.AbstractFactory.pas',
  Login.Aluno in 'Model\Login\Login.Aluno.pas',
  Login.Professor in 'Model\Login\Login.Professor.pas',
  Login.ConcreteFactory in 'Model\Login\Login.ConcreteFactory.pas',
  Login.Types in 'Model\Login\Login.Types.pas',
  Login.UsuarioLogado in 'Model\Login\Login.UsuarioLogado.pas',
  View.Tabela.Cursos in 'View\View.Tabela.Cursos.pas' {frmCurso},
  View.Inicial in 'View\View.Inicial.pas' {frmTelaDeInicio},
  Pattern.Facade.Exportar.Alunos in 'Model\Exportador\Pattern.Facade.Exportar.Alunos.pas',
  Model.Iterator in 'Model\Iterator\Model.Iterator.pas',
  Model.Builder.Product in 'Model\Builder\Model.Builder.Product.pas',
  Model.Builder.Interfaces in 'Model\Builder\Model.Builder.Interfaces.pas',
  Model.Builder.ConcretBuilder in 'Model\Builder\Model.Builder.ConcretBuilder.pas',
  Model.Builder.Director in 'Model\Builder\Model.Builder.Director.pas',
  Model.AbstractFactoy.Interfaces in 'AbstractFactory\Model.AbstractFactoy.Interfaces.pas',
  Model.NomeCurso in 'AbstractFactory\Model.NomeCurso.pas',
  Model.Ifactoy in 'AbstractFactory\Model.Ifactoy.pas',
  Visitor.Model.Interfaces in 'Visitor\Visitor.Model.Interfaces.pas',
  Visitor.Model.ItemCurso in 'Visitor\Visitor.Model.ItemCurso.pas',
  Visitor.Model.Venda.Simples in 'Visitor\Visitor.Model.Venda.Simples.pas',
  Visitor.Model.Venda.Bolsa in 'Visitor\Visitor.Model.Venda.Bolsa.pas',
  View.Calculo.Preco.Cursos in 'View\View.Calculo.Preco.Cursos.pas' {FrmPrecoDeCursos},
  Pattern.Component in 'Decorator\Pattern.Component.pas',
  Pattern.Decorator in 'Decorator\Pattern.Decorator.pas',
  Pattern.ConcreteComponent in 'Decorator\Pattern.ConcreteComponent.pas',
  Pattern.Decorator.DataHora in 'Decorator\Pattern.Decorator.DataHora.pas',
  Pattern.Decorator.NomeUsuario in 'Decorator\Pattern.Decorator.NomeUsuario.pas',
  Pattern.Decorator.Executavel in 'Decorator\Pattern.Decorator.Executavel.pas',
  Controller.SolicitacaoMatricula.Intf in 'Controller\Controller.SolicitacaoMatricula.Intf.pas',
  Controller.SolicitacaoMatricula.Aluno in 'Controller\Controller.SolicitacaoMatricula.Aluno.pas',
  Controller.SolicitacaoMatricula.Atendente in 'Controller\Controller.SolicitacaoMatricula.Atendente.pas',
  Controller.SolicitacaoMatricula.Coordenador in 'Controller\Controller.SolicitacaoMatricula.Coordenador.pas',
  Unit1 in 'View\Unit1.pas' {Form1},
  Unit2 in 'View\Unit2.pas',
  Model.Observer in 'Model\Observer\Model.Observer.pas',
  uAdapter in 'Adapter\uAdapter.pas',
  uComunicador in 'Adapter\uComunicador.pas',
  uInterfaceViaCEP in 'Adapter\uInterfaceViaCEP.pas',
  uTela in 'Adapter\uTela.pas' {fTela},
  uWebServiceCorreios in 'Adapter\uWebServiceCorreios.pas',
  uWebServiceViaCEP in 'Adapter\uWebServiceViaCEP.pas',
  uWSDL_Correios in 'Adapter\uWSDL_Correios.pas',
  Adapter.Controller.Itens in 'Model\Adapter\Adapter.Controller.Itens.pas',
  Adapter.Model.Interfaces in 'Model\Adapter\Adapter.Model.Interfaces.pas',
  Adapter.Model.Itens in 'Model\Adapter\Adapter.Model.Itens.pas',
  Model.State.Aluno.Ativo in 'Model\State\Model.State.Aluno.Ativo.pas',
  Model.State.Aluno.Inativo in 'Model\State\Model.State.Aluno.Inativo.pas',
  Model.State.Aluno.Interfaces in 'Model\State\Model.State.Aluno.Interfaces.pas',
  Model.State.Aluno.Matriculado in 'Model\State\Model.State.Aluno.Matriculado.pas',
  Model.State.Aluno in 'Model\State\Model.State.Aluno.pas',
  View.ModelState in 'View\View.ModelState.pas' {frm_ModelState},
  View.CadCursos in 'View\View.CadCursos.pas' {FCadCursos},
  Model.TemplateMethod.AbstractClass in 'Model\TemplateMethod\Model.TemplateMethod.AbstractClass.pas',
  Model.TemplateMethod.ConcreteClassInsere in 'Model\TemplateMethod\Model.TemplateMethod.ConcreteClassInsere.pas',
  Model.Log.Logger in 'Model\Log\Model.Log.Logger.pas',
  View.Pagamento in 'View\View.Pagamento.pas' {Pagamento},
  Tipo.Pagamento in 'Model\Pagamento\Tipo.Pagamento.pas',
  Fabrica.Pagamento in 'Model\Pagamento\Fabrica.Pagamento.pas',
  Interfaces.Pagamento in 'Model\Pagamento\Interfaces.Pagamento.pas',
  Pattern.Product in 'Model\Builders\Pattern.Product.pas',
  Pattern.ConcreteBuilder in 'Model\Builders\Pattern.ConcreteBuilder.pas',
  Pattern.Director in 'Model\Builders\Pattern.Director.pas',
  Pattern.Builder in 'Model\Builders\Pattern.Builder.pas';

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
  Application.CreateForm(TPagamento, Pagamento);
  Application.Run;
  end
  else
    Application.Terminate;

end.
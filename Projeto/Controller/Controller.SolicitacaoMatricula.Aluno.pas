unit Controller.SolicitacaoMatricula.Aluno;

interface

uses
  System.Generics.Collections,
  Controller.SolicitacaoMatricula.Intf,
  entity.curso;

type
  TSolicitacaoMatriculaAluno = class(TInterfacedObjectSolicitacaoMatricula, ISolicitacaoMatricula)
    //procedure ISolicitacaoMatricula.SetSucessor = SetSucessor;
    function SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
      const ACurso: TCurso): Boolean;
  end;

implementation

{ TSolicitacaoMatriculaAluno }

function TSolicitacaoMatriculaAluno.SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
  const ACurso: TCurso): Boolean;
begin
  //gravar log de solicitação de matrícula pelo aluno
  Result := FSucessor.SolicitarAutorizacaoMatricula(AListaDocumentos, ACurso);
end;

end.

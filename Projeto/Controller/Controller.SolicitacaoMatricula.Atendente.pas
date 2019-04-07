unit Controller.SolicitacaoMatricula.Atendente;

interface

uses
  System.Generics.Collections,
  Controller.SolicitacaoMatricula.Intf,
  entity.curso;

type
  TSolicitacaoMatriculaAtendente = class(TInterfacedObjectSolicitacaoMatricula, ISolicitacaoMatricula)
    //procedure ISolicitacaoMatricula.SetSucessor = SetSucessor;
    function SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
      const ACurso: TCurso): Boolean;
  end;

implementation

{ TSolicitacaoMatriculaAtendente }

function TSolicitacaoMatriculaAtendente.SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
  const ACurso: TCurso): Boolean;
begin
  //gravar log de solicitação de matrícula pelo atendente
  //verificar se o atendente tem "credenciais" suficientes para aprovar a matrícula
  //por exemplo: são necessários os documentos, aproveitamento de notas
  Result := True;
  if Assigned(FSucessor) then
    Result := FSucessor.SolicitarAutorizacaoMatricula(AListaDocumentos, ACurso);
end;

end.

unit Controller.SolicitacaoMatricula.Coordenador;

interface

uses
  System.Generics.Collections,
  Controller.SolicitacaoMatricula.Intf,
  entity.curso;

type
  TSolicitacaoMatriculaCoordenador = class(TInterfacedObjectSolicitacaoMatricula, ISolicitacaoMatricula)
    //procedure ISolicitacaoMatricula.SetSucessor = SetSucessor;
    function SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
      const ACurso: TCurso): Boolean;
  end;

implementation

{ TSolicitacaoMatriculaCoordenador }

function TSolicitacaoMatriculaCoordenador.SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
  const ACurso: TCurso): Boolean;
begin
  //gravar log de solicitação de matrícula pelo coordenador
  //entende-se que para a matrícula a maior hierarquia necessária, seria o coordenador que irá poderá aprovar ou não a matrícula,
  //porém pode ser que seja necessário que seja aprovada ainda por algum colegiado, o que faria seguir a hierarquia
  //vertical dos cargos
  Result := True;
  if Assigned(FSucessor) then
    Result := FSucessor.SolicitarAutorizacaoMatricula(AListaDocumentos, ACurso);
end;

end.

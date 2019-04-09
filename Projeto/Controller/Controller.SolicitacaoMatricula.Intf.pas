unit Controller.SolicitacaoMatricula.Intf;

interface

uses
  System.Generics.Collections,
  entity.curso;

type
  ISolicitacaoMatricula = interface(IUnknown)
    ['{DBBAB4AC-001F-47E6-899E-D76271740B90}']
    procedure SetSucessor(const ASucessor: ISolicitacaoMatricula);
    function SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
      const ACurso: TCurso): Boolean;
  end;

  TInterfacedObjectSolicitacaoMatricula = class(TInterfacedObject)
  protected
    FSucessor: ISolicitacaoMatricula;
    procedure SetSucessor(const ASucessor: ISolicitacaoMatricula);
  end;

implementation

{ TInterfacedObjectSolicitacaoMatricula }

procedure TInterfacedObjectSolicitacaoMatricula.SetSucessor(const ASucessor: ISolicitacaoMatricula);
begin
  FSucessor := ASucessor;
end;

end.

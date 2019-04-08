unit Tipo.Pagamento;

interface

uses
  Interfaces.Pagamento;

type
  TTipoPagamento = class(TInterfacedObject, ITipoPagamento)
  public
    function ConsultarDescricao: string; virtual; abstract;
    function ConsultarJuros: string; virtual; abstract;
  end;

  TPrazoMensalNormal = class(TTipoPagamento)
  public
    function ConsultarDescricao: string; override;
    function ConsultarJuros: string; override;
  end;

  TPrazoMensalParceladao = class(TTipoPagamento)
  public
    function ConsultarDescricao: string; override;
    function ConsultarJuros: string; override;

  end;

implementation

uses
  SysUtils, Classes;

{ TPrazoMensalNormal }

function TPrazoMensalNormal.ConsultarDescricao: string;
begin
  result := 'Prazo Mensal para pagamento';
end;

function TPrazoMensalNormal.ConsultarJuros: string;
begin
  result := 'Juros de 1,15% ao mês' + sLineBreak;
end;


{ TPrazoMensalParceladao }

function TPrazoMensalParceladao.ConsultarDescricao: string;
begin
  result := 'Prazo Mensal Parceladão para pagamento, você paga 50% da mensalidade e o resto parcela para pagar depois que se formar.';
end;

function TPrazoMensalParceladao.ConsultarJuros: string;
begin
  result := 'Juros de 0,5% ao mês' + sLineBreak;
end;

end.

unit Classe.Veiculo;

interface

uses
  System.SysUtils;

type
  TVeiculo = class
  strict private
    FCilidrandas: integer;
    FNome: string;
    FInformacoes: string;
    FCodigo: integer;
    procedure SetInformacoes(const Value: string);
    function GetInformacoes: string;
    procedure SetCodigo(const Value: integer);
    function GetCilidrandas: integer;
    procedure SetCilidrandas(const Value: integer);
  public
    property Codigo : integer read FCodigo write SetCodigo;
    property Nome : string read FNome write FNome;
    property Cilidrandas : integer read GetCilidrandas write SetCilidrandas;
    property Informacoes : string read GetInformacoes ;
  end;

  TVeiculoRodoviario = class(TVeiculo)
  strict private
    FFreios: string;
    FPneus: string;
  public
    property Freios : string read FFreios write FFreios;
    property Pneus : string read FPneus write FPneus;
  end;

  TVeiculoMaritimo = class(TVeiculo)
  private
    FLeme: Boolean;
    FVela: Boolean;
  public
    property Vela : Boolean read FVela write FVela;
    property Leme : Boolean read FLeme write FLeme;
  end;

  TMoto = class(TVeiculoRodoviario)

  end;

  TBarco = class(TVeiculoMaritimo)

  end;

  TCarro = class(TVeiculoRodoviario)

  end;

  TMotoBMW = class(TMoto)
  public
    constructor Create;
  end;


implementation

{ TVeiculo }

function TVeiculo.GetCilidrandas: integer;
begin
  Result := FCilidrandas;
end;

function TVeiculo.GetInformacoes: string;
begin
  Result := Format('%s - %d', [Self.Nome , Self.Cilidrandas]);
end;

procedure TVeiculo.SetCilidrandas(const Value: integer);
begin
  FCilidrandas := Value;
end;

procedure TVeiculo.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TVeiculo.SetInformacoes(const Value: string);
begin
  FInformacoes := Value;
end;

{ TMotoBMW }

constructor TMotoBMW.Create;
begin
  Self.Nome := 'Moto BMW';
end;

end.

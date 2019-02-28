unit uFormatoTXT;

interface

uses
  Classes, uInterfaceFormato;

type
  { Concrete Implementor }
  TFormatoTXT = class(TInterfacedObject, IFormato)
  private
    TXT: TStringList;

    procedure CriarCabecalhoTXT;
  public
    constructor Create;
    destructor Destroy; override;

    procedure PularLinha;
    procedure DesenharCabecalho(const Titulo: string);
    procedure ExportarCampo(const Valor: string);
    procedure SalvarArquivo(const NomeArquivo: string);
  end;

implementation

uses
  SysUtils, Forms, Windows, ShellAPI;

{ TFormatoTXT }

constructor TFormatoTXT.Create;
begin
  TXT := TStringList.Create;
  CriarCabecalhoTXT;
end;

procedure TFormatoTXT.CriarCabecalhoTXT;
begin

end;

procedure TFormatoTXT.DesenharCabecalho(const Titulo: string);
begin
  if TXT.Count > 0 then
    TXT[0] := TXT[0]+'|' + Titulo
  else
    TXT.Add(Titulo);
end;

destructor TFormatoTXT.Destroy;
begin
  FreeAndNil(TXT);
  inherited;
end;

procedure TFormatoTXT.ExportarCampo(const Valor: string);
begin
  TXT.Add(Format('%s', [Valor]));
end;

procedure TFormatoTXT.PularLinha;
begin
  TXT.Add('');
end;

procedure TFormatoTXT.SalvarArquivo(const NomeArquivo: string);
var
  CaminhoAplicacao: string;
  NomeCompleto: string;
begin

  CaminhoAplicacao := ExtractFilePath(Application.ExeName);
  NomeCompleto := Format('%s%s.txt', [CaminhoAplicacao, NomeArquivo]);
  DeleteFile(PWideChar(NomeCompleto));
  TXT.SaveToFile(NomeCompleto);
  ShellExecute(0, nil, PChar(NomeCompleto), nil,  nil, SW_SHOWNORMAL);
end;

end.


{*******************************************************}
{                                                       }
{       Projeto Teste P�s-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit Login.UsuarioLogado;

interface

uses
  Login.Types;

type
  TUsuarioLogado = class
  private
    FId            : Integer;
    FNomeCompleto  : String;
    FDataHoraLogin : TDateTime;
    FTipoUsuario   : TTipoUsuario;
  published
    property Id            : Integer      read FId            write FId;
    property NomeCompleto  : String       read FNomeCompleto  write FNomeCompleto;
    property DataHoraLogin : TDateTime    read FDataHoraLogin write FDataHoraLogin;
    property TipoUsuario   : TTipoUsuario read FTipoUsuario   write FTipoUsuario;
  public
    class function GetInstance: TUsuarioLogado;
  end;

var
  FUsuarioLogado : TUsuarioLogado;

implementation

uses
  System.SysUtils;

{ TUsuarioLogado }

class function TUsuarioLogado.GetInstance: TUsuarioLogado;
begin
  if not Assigned(FUsuarioLogado) then
    FUsuarioLogado := TUsuarioLogado.Create;

  Result := FUsuarioLogado;
end;

initialization
  FUsuarioLogado := nil;

finalization
  FreeAndNil(FUsuarioLogado);

end.

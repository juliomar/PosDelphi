program Projeto1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  system.rtti,
  Classe.Veiculo in 'Classe.Veiculo.pas';

var
  MeuCarro : TCarro;

  Moto : TMotoBMW;
  ctxRTTI : trtticontext;
  typeRTTI : TRttiType;
  propRTTI : TRttiProperty;

begin
  try
    Writeln('Pós Unoesc');
    Writeln('Orientação a Objetos com Delphi!');

    MeuCarro := TCarro.Create;
    try
      MeuCarro.Nome := 'Ferrari';
      MeuCarro.Cilidrandas := 100;

      ctxRTTI := TRttiContext.Create;
      typeRTTI := ctxRTTI.GetType(MeuCarro.ClassType);

      for propRTTI in typeRTTI.GetProperties do
      begin
        if (propRTTI.PropertyType.TypeKind = tkInteger)
        and (propRTTI.Name = 'Codigo') then
          propRTTI.SetValue(MeuCarro, 99);


        Writeln(propRTTI.Name +':'+ propRTTI.PropertyType.ToString+'='+propRTTI.GetValue(MeuCarro).ToString);
      end;


      Writeln;
      Moto := TMotoBMW.Create;
      Writeln(Moto.Nome);
      moto.Free;

    finally
      MeuCarro.Free;
    end;
    Readln;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

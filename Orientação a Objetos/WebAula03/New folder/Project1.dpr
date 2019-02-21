program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Unit1 in 'Unit1.pas';

var
  Valor1, Valor2, Resultado: double;
  Y : double;
  Texto: TStringBuilder;

begin
  try

    Valor1 := 20;
    Valor2 := 3;

    TMinhaClasse.soma(Valor1, Valor2, Resultado, y);


    Writeln(Y.ToString);
    Writeln(Format('A soma do Valor1 %3.5n e a soma do Valor2 %n é igual a %n ',
      [Valor1, Valor2, Resultado])

      );

    Writeln(Format('Nome: %s SobreNome : %s', ['Juliomar', 'Marchetti']));

    Texto := TStringBuilder.Create;
    try

      Texto.Append('-------------------------------------------');
      Texto.AppendLine;
      Texto.Append(Valor1);
      Texto.AppendLine;
      Texto.Append('Juliomar');
      Texto.AppendLine;

      Texto.AppendFormat('%n + %n = %n', [Valor1, Valor2, Resultado]);

      Writeln(Texto.ToString);
    finally
      Texto.Free;
    end;

    Writeln('================================');

    TMinhaClasse.Nome := 'Marchetti';

    Writeln(TMinhaClasse.Nome);




    readln;

    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.

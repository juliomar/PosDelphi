unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, system.rtti, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Exemplo;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Exemplo;
end;

procedure TForm2.Exemplo;
var
  ctxRTTI : trttiContext;
begin
  ctxRTTI := TRttiContext.Create;
  try
    ctxRTTI.GetType(TForm2);

    ctxRTTI.FindType('Forms.TForm');
  finally
    ctxRTTI.Free;
  end;
end;

end.

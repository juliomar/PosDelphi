unit Model.Builder.Product;

interface
  uses
    System.Classes;

  type
    TProduct = class
    private


    public
      FConteudoHTML : TStringList;

      constructor Create;
      destructor Destroy; override;

      procedure Adicionar(const Texto : string);

      procedure SalvarArquivo;
    end;

implementation

  uses
    System.SysUtils, Vcl.Dialogs;
{ TProduct }

procedure TProduct.Adicionar(const Texto: string);
begin
  FConteudoHTML.add(Texto);
end;

constructor TProduct.Create;
begin
  FConteudoHTML := TStringList.Create;
end;

destructor TProduct.Destroy;
begin
  FreeAndNil(FConteudoHTML);
  inherited;
end;

procedure TProduct.SalvarArquivo;
var
  SaveDialog : TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.DefaultExt := 'html';
    SaveDialog.InitialDir := GetCurrentDir;

    if not SaveDialog.Execute then
      Exit;

    FConteudoHTML.SaveToFile(SaveDialog.FileName, TEncoding.UTF8);
  finally
    FreeAndNil(SaveDialog);
    FreeAndNil(FConteudoHTML);
  end;
end;

end.

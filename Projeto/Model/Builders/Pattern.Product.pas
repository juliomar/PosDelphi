unit Pattern.Product;

interface

uses
  System.Classes, ShellApi, Winapi.Windows;

type
  { Product }
  TProduct = class
  private
	 // Objeto que armazenará o conteúdo HTML
	 FConteudoHTML: TStringList;
  public
    constructor Create;
    destructor Destroy; override;

    // Concatena o conteúdo HTML ao objeto "FConteudoHTML"
    procedure Adicionar(const Texto: string);

    // Abre uma caixa de diálogo para salvar o arquivo HTML
    procedure SalvarArquivo;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TProduct }

procedure TProduct.Adicionar(const Texto: string);
begin
  FConteudoHTML.Add(Texto);
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
  nomearq: string;
  SaveDialog: TSaveDialog;
begin
  try
	 nomearq := GetCurrentDir + '\testerel.html';
	 FConteudoHTML.SaveToFile(nomearq, TEncoding.UTF8);
	 ShellExecute(GetDesktopWindow, 'open', pchar(nomearq), nil, nil, sw_ShowNormal);
  finally

  end;
end;

end.

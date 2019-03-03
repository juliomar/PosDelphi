unit Model.Conexao;

interface

uses
  System.Classes,FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.VCLUI.Wait, Data.DB, System.SysUtils,FireDAC.DApt;


type
  iConnection = interface
    function Connection : TObject;
  end;

  iModelConnectionFactory = interface
    function Conexao : iConnection;
  end;


  TFireDACConnection = class()


implementation

end.

unit PosDelphiLegendaGC;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Graphics;

type
  TPosDelphiLegendaGC = class(TGraphicControl)
  private
    FCaption: TCaption;
    procedure SetCaption(const Value: TCaption);
    { Private declarations }
  protected
    { Protected declarations }
  public
    procedure Paint;override;
  published
    property Caption : TCaption read FCaption write SetCaption;
    { Published declarations }
  end;

procedure Register;

implementation

{$R *.res}

procedure Register;
begin
  RegisterComponents('Pos Delphi', [TPosDelphiLegendaGC]);
end;

{ TPosDelphiLegendaGC }

procedure TPosDelphiLegendaGC.Paint;
begin
  inherited;
  Canvas.Brush.Color := clSkyBlue;
  Canvas.Brush.Style := bsSolid;
  Canvas.Pen.Color := clBlack;
  Canvas.Pen.Width := 1;
  Canvas.Rectangle(ClientRect);
  Canvas.TextOut(10,10, FCaption);
end;

procedure TPosDelphiLegendaGC.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
  Self.Paint;
end;

end.

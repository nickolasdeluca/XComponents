unit XCheckBox;

interface

uses
  Winapi.Messages, Winapi.Windows,
  System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics;

type
  TXCheckBox = class(TCheckBox)
  private
    { Private declarations }
    FOriginalCaption: string;
    _MySetCap: Boolean;
    procedure WMPaint(var msg: TWMPaint); message WM_PAINT;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('XComponents', [TXCheckBox]);
end;

{ TXCheckBox }

{ TXCheckBox }

procedure TXCheckBox.CMTextChanged(var Message: TMessage);
begin
  inherited;

  if _MySetCap then
    Exit;

  FOriginalCaption := Caption;
end;

procedure TXCheckBox.WMPaint(var msg: TWMPaint);
var
  ButtonWidth: Integer;
  Canvas: TControlCanvas;
begin
  ButtonWidth := GetSystemMetrics(SM_CXMENUCHECK);

  _MySetCap := True;
  if not (csDesigning in ComponentState) then
    Caption := '';
  _MySetCap := False;
  inherited;
  Canvas := TControlCanvas.Create;
  try
    Canvas.Control := Self;
    Canvas.Font := Font;
    SetBkMode(Canvas.Handle, Ord(TRANSPARENT));
    Canvas.TextOut(ButtonWidth + 1, 2, FOriginalCaption);
  finally
    Canvas.Free;
  end;
end;

end.

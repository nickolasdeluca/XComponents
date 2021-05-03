unit XGroupBox;

interface

uses
  { Winapi }
  Winapi.Windows,
  { System }
  System.SysUtils, System.Classes, System.Types,
  { Vcl }
  Vcl.Controls, Vcl.StdCtrls, Vcl.Themes, Vcl.Graphics;

type
  TXGroupBox = class(TGroupBox)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure Paint; override;
  published
    { Published declarations }
  end;

implementation

{ TXGroupBox }

procedure TXGroupBox.Paint;
var
  H: Integer;
  R: TRect;
  Flags: Longint;
  CaptionRect,
  OuterRect: TRect;
  Size: TSize;
  Box: TThemedButton;
  Details: TThemedElementDetails;
begin
  with Canvas do
  begin
    Font := Self.Font;

    if ThemeControl(Self) then
    begin
      if Text <> '' then
      begin
        GetTextExtentPoint32(Handle, PChar(Text), Length(Text), Size);
        CaptionRect := Rect(0, 0, Size.cx, Size.cy);
        if not UseRightToLeftAlignment then
          OffsetRect(CaptionRect, 8, 0)
        else
          OffsetRect(CaptionRect, Width - 8 - CaptionRect.Right, 0);
      end
      else
        CaptionRect := Rect(0, 0, 0, 0);

      OuterRect := ClientRect;
      OuterRect.Top := (CaptionRect.Bottom - CaptionRect.Top) div 2;
      with CaptionRect do
        ExcludeClipRect(Handle, Left, Top, Right, Bottom);
      if Enabled then
        Box := tbGroupBoxNormal
      else
        Box := tbGroupBoxDisabled;
      Details := StyleServices.GetElementDetails(Box);

      StyleServices.DrawElement(Handle, Details, OuterRect);
      SelectClipRgn(Handle, 0);
      if Text <> '' then
      begin
         H := TextHeight('0');
         if not UseRightToLeftAlignment then
           R := Rect(8, 0, 0, H)
         else
           R := Rect(R.Right - Canvas.TextWidth(Text) - 8, 0, 0, H);
         Flags := DrawTextBiDiModeFlags(DT_SINGLELINE);

         DrawText(Handle, PChar(Text), Length(Text), R, Flags or DT_CALCRECT);
         Brush.Color := Color;
         Font.Color := Self.Font.Color;
         DrawText(Handle, PChar(Text), Length(Text), R, Flags);
      end;
    end
    else
    inherited;
  end;
end;

end.

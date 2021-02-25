unit XLabeledEdit;

interface

uses
  { Winapi }
  Winapi.Windows, Winapi.Messages,
  { System }
  System.SysUtils, System.Classes, System.StrUtils,
  { Vcl }
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Themes;

type TMaskType = (mtNone, mtCPFCNPJ, mtIERG, mtCEP, mtTelefone, mtData, mtPlaca);

type
  TXLabeledEdit = class(TLabeledEdit)
  private
    { Private declarations }
    FOnChange: Boolean;
    FMaskType: TMaskType;
    procedure SetMaskType(const Value: TMaskType);
  protected
    { Protected declarations }
    procedure Change; override;
    procedure DoSetTextHint(const Value: string); override;
  public
    { Public declarations }
  published
    { Published declarations }
    property MaskType : TMaskType read FMaskType write SetMaskType;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('XComponents', [TXLabeledEdit]);
end;

function ReturnCleanString(StrToClean: String): String;
var
  i: Integer;
begin
  {['a'..'z', 'A'..'Z', '0'..'9', '-', '_']}
  Result:='';
  for i := 1 to Length(StrToClean) do
  begin
    if (CharInSet(StrToClean[i],['a'..'z', 'A'..'Z','0'..'9'])) then
    begin
      Result:=Result+StrToClean[i];
    end;
  end;
end;

{ TXLabeledEdit }

procedure TXLabeledEdit.Change;
var
  wText : String;
  i     : Integer;
begin
  if not (csDesigning in ComponentState) then
  begin
    if FOnChange then
      Exit;

    FOnChange := True;
    inherited Change;

    if not (MaskType = mtNone) then
      Text:=ReturnCleanString(Text);

    case MaskType of
      mtNone:
      begin
        { Simple Placeholder }
      end;

      mtCEP:
      begin
        if Length(Text) > 0 then
        begin
          for i := 1 to 5 do
            wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

          wText:=wText+IfThen(Length(Text) > 5, '-', #0);

          for i := 6 to 8 do
            wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);
        end;

        Text:=wText;
      end;

      mtCPFCNPJ:
      begin
        if Length(Text) > 0 then
        begin
          case Length(Text) of
            0..11:
            begin
              { 083.766.599-01 }
              for i := 1 to 3 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) > 3, '.', #0);

              for i := 4 to 6 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) > 6, '.', #0);

              for i := 7 to 9 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) > 9, '-', #0);

              for i := 10 to 11 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);
            end;

            12..14:
            begin
              { 03.847.655/0001-98 }
              for i := 1 to 2 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) > 2, '.', #0);

              for i := 3 to 5 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) > 5, '.', #0);

              for i := 6 to 8 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) > 8, '/', #0);

              for i := 9 to 12 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) > 12, '-', #0);

              for i := 13 to 14 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);
            end;

            else
            begin
              wText:=Text;
            end;
          end;

          Text:=wText;
        end;
      end;

      mtTelefone:
      begin
        if Length(Text) > 0 then
        begin
          case Length(Text) of
            0..10:
            begin
              wText:='(';

              for i := 1 to 2 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) >= 3, ')', #0);

              for i := 3 to 6 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) > 6, '-', #0);

              for i := 7 to 10 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);
            end;
            11:
            begin
              wText:='(';
              for i := 1 to 2 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) >= 3, ')', #0);

              for i := 3 to 7 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

              wText:=wText+IfThen(Length(Text) > 7, '-', #0);

              for i := 8 to 11 do
                wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);
            end
            else
              wText:=Text;
          end;

          Text:=wText;
        end;
      end;

      mtData:
      begin
        if Length(Text) > 0 then
        begin
          for i := 1 to 2 do
            wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

          wText:=wText+IfThen(Length(Text) >= 3, '/', #0);

          for i := 3 to 4 do
            wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

          wText:=wText+IfThen(Length(Text) >= 5, '/', #0);

          for i := 5 to 8 do
            wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);
        end;

        Text:=wText;
      end;

      mtPlaca:
      begin
        if Length(Text)> 0 then
        begin
          for i := 1 to 3 do
            wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);

          wText:=wText+IfThen(Length(Text) > 4, '-', #0);

          for i := 4 to 7 do
            wText:=wText+IfThen(not (Text[i] = #0), Text[i], #0);
        end;

        Text:=wText;
      end;
    end;
    if not (MaskType = mtNone)then
      SelStart := Length(Text);

    FOnChange := False;
  end;
end;

procedure TXLabeledEdit.DoSetTextHint(const Value: string);
const
  EM_SETCUEBANNER = $1501;
begin
  inherited;
  if CheckWin32Version(5, 1) and StyleServices.Enabled then
    SendMessage(Handle, EM_SETCUEBANNER, wParam(1), Integer(PWideChar(Value)));
end;

procedure TXLabeledEdit.SetMaskType(const Value: TMaskType);
begin
  FMaskType := Value;
end;

end.

unit XEdit;

interface

uses
  { Winapi }
  Winapi.Windows, Winapi.Messages,
  { System }
  System.SysUtils, System.Classes,
  { Vcl }
  Vcl.Controls, Vcl.StdCtrls, Vcl.Themes;

type
  TXEdit = class(TEdit)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure DoSetTextHint(const Value: string); override;
  public
    { Public declarations }
  published
    { Published declarations }
  end;

implementation

{ TXEdit }

procedure TXEdit.DoSetTextHint(const Value: string);
const
  EM_SETCUEBANNER = $1501;
begin
  inherited;
  if CheckWin32Version(5, 1) and StyleServices.Enabled then
    SendMessage(Handle, EM_SETCUEBANNER, wParam(1), Integer(PWideChar(Value)));
end;

end.

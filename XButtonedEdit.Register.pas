unit XButtonedEdit.Register;

interface

uses
  { System }
  System.Classes;

procedure Register;

implementation

uses
  { XComponents }
  XButtonedEdit;

procedure Register;
begin
  RegisterComponents('XComponents', [TXButtonedEdit]);
end;

end.

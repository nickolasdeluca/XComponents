unit XEdit.Register;

interface

uses
  { System }
  System.Classes;

procedure Register;

implementation

uses
  { XComponents }
  XEdit;

procedure Register;
begin
  RegisterComponents('XComponents', [TXEdit]);
end;

end.

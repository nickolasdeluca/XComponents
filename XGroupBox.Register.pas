unit XGroupBox.Register;

interface

uses
  { System }
  System.Classes;

procedure Register;

implementation

uses
  { XComponents }
  XGroupBox;

procedure Register;
begin
  RegisterComponents('XComponents', [TXGroupBox]);
end;

end.

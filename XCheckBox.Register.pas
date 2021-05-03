unit XCheckBox.Register;

interface

uses
  { System }
  System.Classes;

procedure Register;

implementation

uses
  { XComponents }
  XCheckBox;

procedure Register;
begin
  RegisterComponents('XComponents', [TXCheckBox]);
end;

end.

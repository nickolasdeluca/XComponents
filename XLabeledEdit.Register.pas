unit XLabeledEdit.Register;

interface

uses
  { System }
  System.Classes;

procedure Register;

implementation

uses
  { XComponents }
  XLabeledEdit;

procedure Register;
begin
  RegisterComponents('XComponents', [TXLabeledEdit]);
end;

end.

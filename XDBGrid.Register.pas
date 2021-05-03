unit XDBGrid.Register;

interface

uses
  { System }
  System.Classes;

procedure Register;

implementation

uses
  { XComponents }
  XDBGrid;

procedure Register;
begin
  RegisterComponents('XComponents', [TXDBGrid]);
end;

end.

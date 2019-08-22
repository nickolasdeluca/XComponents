unit XDBGrid;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Grids, Vcl.DBGrids;

type
  TCellClickEvent = procedure (Column: TColumn) of object;

  TXDBGrid = class(TDBGrid)
  private
    FColumnClick: Boolean;
    FColumn: TColumn;
    FOnCellDblClick: TCellClickEvent;
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer); override;
    procedure DblClick; override;
    procedure CellClick(Column: TColumn); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property OnCellDblClick: TCellClickEvent read FOnCellDblClick write FOnCellDblClick;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('XComponents', [TXDBGrid]);
end;

procedure TXDBGrid.CellClick(Column: TColumn);
begin
  inherited;

  FColumn := Column;
  FColumnClick := False;
end;

constructor TXDBGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FColumnClick := False;
end;

procedure TXDBGrid.DblClick;
begin
  if FColumnClick then
    inherited
  else
  if Assigned(FOnCellDblClick) then
    FOnCellDblClick(FColumn);

  FColumnClick := False;
end;

procedure TXDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  FColumnClick := True;
end;

end.

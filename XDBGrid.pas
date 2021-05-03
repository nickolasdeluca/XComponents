unit XDBGrid;

interface

uses
  { System }
  System.SysUtils, System.Classes,
  { Vcl }
  Vcl.Controls, Vcl.Grids, Vcl.DBGrids;

type
  TCellClickEvent = procedure (Column: TColumn) of object;

  TXDBGrid = class(TDBGrid)
  private
    { Private declarations }
    FColumnClick: Boolean;
    FColumn: TColumn;
    FOnCellDblClick: TCellClickEvent;
  protected
    { Protected declarations }
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer); override;
    procedure DblClick; override;
    procedure CellClick(Column: TColumn); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property OnCellDblClick: TCellClickEvent read FOnCellDblClick write FOnCellDblClick;
  end;

implementation

{ TXDBGrid }

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

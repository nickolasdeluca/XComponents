unit StringEditorForm;

interface

uses
  { Winapi }
  Winapi.Windows, Winapi.Messages,
  { System }
  System.SysUtils, System.Variants, System.Classes,
  { Vcl }
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFStringEditor = class(TForm)
    pnlBackground: TPanel;
    pnlBottom: TPanel;
    btSave: TButton;
    btCancel: TButton;
    mmString: TMemo;
    procedure btSaveClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FStringEditor: TFStringEditor;

implementation

{$R *.dfm}

procedure TFStringEditor.btCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFStringEditor.btSaveClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFStringEditor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    btCancel.Click
  else
  if (Key = VK_F7) then
    btSave.Click;
end;

end.

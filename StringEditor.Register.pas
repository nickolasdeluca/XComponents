unit StringEditor.Register;

interface

uses
  DesignEditors, DesignIntf;

type
  TStringEditor = class(TStringProperty)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  procedure Register;

implementation

uses
  { Vcl }
  Vcl.Controls, Vcl.Forms,
  { XComponents }
  StringEditorForm;

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(String), nil, '', TStringEditor);
  RegisterPropertyEditor(TypeInfo(TCaption), nil, '', TStringEditor);
end;

{ TStringEditor }

procedure TStringEditor.Edit;
var
  Form: TFStringEditor;
begin
  Form := TFStringEditor.Create(Application);

  try
    Form.mmString.Text := GetStrValue;
    Form.mmString.SelStart := Length(Form.mmString.Text);

    if (Form.ShowModal = mrOk) then
      SetStrValue(Form.mmString.Text);
  finally
    Form.Free;
  end;
end;

function TStringEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;

end.

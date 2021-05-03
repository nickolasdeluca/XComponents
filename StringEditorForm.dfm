object FStringEditor: TFStringEditor
  Left = 0
  Top = 0
  Caption = 'String Editor'
  ClientHeight = 246
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 246
    Align = alClient
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 0
    object pnlBottom: TPanel
      Left = 0
      Top = 218
      Width = 344
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 1
      object btSave: TButton
        Left = 0
        Top = 0
        Width = 100
        Height = 28
        Align = alLeft
        Caption = '&Salvar (F7)'
        TabOrder = 0
        OnClick = btSaveClick
      end
      object btCancel: TButton
        Left = 244
        Top = 0
        Width = 100
        Height = 28
        Align = alRight
        Caption = '&Cancelar (ESC)'
        TabOrder = 1
        OnClick = btCancelClick
      end
    end
    object mmString: TMemo
      Left = 0
      Top = 0
      Width = 344
      Height = 218
      Align = alClient
      TabOrder = 0
    end
  end
end

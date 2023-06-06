object foCadTarefas: TfoCadTarefas
  Left = 0
  Top = 0
  Caption = 'Cadastro de Tarefas'
  ClientHeight = 259
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 259
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 409
    ExplicitHeight = 258
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 411
      Height = 216
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 407
      ExplicitHeight = 215
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 30
        Height = 15
        Caption = 'T'#237'tulo'
      end
      object Label2: TLabel
        Left = 8
        Top = 52
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object EdTitulo: TEdit
        Left = 8
        Top = 25
        Width = 393
        Height = 23
        TabOrder = 0
      end
      object MmDescricao: TMemo
        Left = 8
        Top = 68
        Width = 393
        Height = 140
        Lines.Strings = (
          '')
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 217
      Width = 411
      Height = 41
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 216
      ExplicitWidth = 407
      object Button1: TButton
        Left = 8
        Top = 6
        Width = 121
        Height = 27
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = Button1Click
      end
      object BtnSair: TButton
        Left = 280
        Top = 6
        Width = 121
        Height = 27
        Caption = 'Sair'
        TabOrder = 1
        OnClick = BtnSairClick
      end
    end
  end
end

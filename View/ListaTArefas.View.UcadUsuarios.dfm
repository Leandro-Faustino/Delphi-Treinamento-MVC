object FoCadUsuario: TFoCadUsuario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 199
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 199
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 413
    ExplicitHeight = 181
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 421
      Height = 157
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 411
      ExplicitHeight = 139
      object LbNome: TLabel
        Left = 16
        Top = 16
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object Label1: TLabel
        Left = 16
        Top = 59
        Width = 29
        Height = 15
        Caption = 'Email'
      end
      object Label2: TLabel
        Left = 16
        Top = 101
        Width = 32
        Height = 15
        Caption = 'Senha'
      end
      object EdNome: TEdit
        Left = 16
        Top = 32
        Width = 265
        Height = 23
        TabOrder = 0
      end
      object EdEmail: TEdit
        Left = 16
        Top = 75
        Width = 265
        Height = 23
        TabOrder = 1
      end
      object EdSenha: TEdit
        Left = 16
        Top = 116
        Width = 265
        Height = 23
        PasswordChar = '*'
        TabOrder = 2
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 158
      Width = 421
      Height = 40
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 140
      ExplicitWidth = 411
      object Button1: TButton
        Left = 160
        Top = 6
        Width = 121
        Height = 27
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
  end
end

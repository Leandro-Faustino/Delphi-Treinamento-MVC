object focadLogin: TfocadLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 145
  ClientWidth = 243
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
    Width = 243
    Height = 145
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = clWhite
    ParentBiDiMode = False
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 239
    ExplicitHeight = 144
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 243
      Height = 145
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 239
      ExplicitHeight = 144
      object Email: TLabel
        Left = 8
        Top = 12
        Width = 29
        Height = 15
        Caption = 'Email'
      end
      object lbSenha: TLabel
        Left = 8
        Top = 54
        Width = 32
        Height = 15
        Caption = 'Senha'
      end
      object BtnEntrar: TButton
        Left = 8
        Top = 106
        Width = 110
        Height = 25
        Caption = 'Entrar'
        TabOrder = 0
        OnClick = BtnEntrarClick
      end
      object Button2: TButton
        Left = 124
        Top = 106
        Width = 110
        Height = 25
        Caption = 'Cadastrar'
        TabOrder = 1
        OnClick = Button2Click
      end
      object EdEmail: TEdit
        Left = 8
        Top = 29
        Width = 225
        Height = 23
        TabOrder = 2
        Text = 'leandro@gmail.com'
      end
      object EdSenha: TEdit
        Left = 8
        Top = 72
        Width = 225
        Height = 23
        PasswordChar = '*'
        TabOrder = 3
        Text = '123'
      end
    end
  end
end

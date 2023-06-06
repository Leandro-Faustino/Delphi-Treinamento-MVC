object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Lista De Tarefas'
  ClientHeight = 262
  ClientWidth = 507
  Color = clMenu
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 262
    Align = alClient
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 503
    ExplicitHeight = 261
    object PnButtom: TPanel
      Left = 1
      Top = 220
      Width = 505
      Height = 41
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 219
      ExplicitWidth = 501
      object Button1: TButton
        Left = 8
        Top = 6
        Width = 105
        Height = 27
        Caption = 'Novo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 119
        Top = 6
        Width = 105
        Height = 27
        Caption = 'Editar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 391
        Top = 6
        Width = 105
        Height = 27
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button3Click
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 505
      Height = 219
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 501
      ExplicitHeight = 218
      object Label1: TLabel
        Left = 1
        Top = 49
        Width = 503
        Height = 169
        Align = alClient
        ExplicitWidth = 4
        ExplicitHeight = 21
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 503
        Height = 48
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 499
        object EdPesquisa: TEdit
          Left = 7
          Top = 10
          Width = 377
          Height = 29
          TabOrder = 0
        end
        object Button4: TButton
          Left = 390
          Top = 10
          Width = 105
          Height = 29
          Caption = 'Pesquisar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Button4Click
        end
      end
      object LVTarefas: TListView
        Left = 1
        Top = 49
        Width = 503
        Height = 169
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'Codigo'
          end
          item
            AutoSize = True
            Caption = 'T'#237'tulo'
          end
          item
            AutoSize = True
            Caption = 'Data de Cria'#231#227'o'
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        RowSelect = True
        ParentFont = False
        TabOrder = 1
        ViewStyle = vsReport
        ExplicitWidth = 499
        ExplicitHeight = 168
      end
    end
  end
end

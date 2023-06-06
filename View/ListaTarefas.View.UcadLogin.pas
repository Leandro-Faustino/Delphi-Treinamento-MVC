unit ListaTarefas.View.UcadLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfocadLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Email: TLabel;
    lbSenha: TLabel;
    BtnEntrar: TButton;
    Button2: TButton;
    EdEmail: TEdit;
    EdSenha: TEdit;
    procedure BtnEntrarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses
  ListaTArefas.View.UcadUsuarios;

{$R *.dfm}

procedure TfocadLogin.BtnEntrarClick(Sender: TObject);
begin
   Close;
end;

procedure TfocadLogin.Button2Click(Sender: TObject);
var
   ObjCadUsuario : TFoCadUsuario;
begin
   ObjCadUsuario := TFoCadUsuario.Create(nil);
   try
      ObjCadUsuario.ShowModal;
//      if ObjCadUsuario.ModalResult = mrOk then
//      begin
//         EdEmail.Text := ObjCadUsuario.FUsuario.Email;
//         EdSenha.Text := ObjCadUsuario.FUsuario.Senha;
//         BtnEntrar.SetFocus;
//      end;

   finally
      ObjCadUsuario.Free;
   end;
end;

end.

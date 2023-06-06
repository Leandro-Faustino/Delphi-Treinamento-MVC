unit ListaTArefas.View.UcadUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ListaTarefas.Model.Usuarios, Vcl.StdCtrls, Vcl.ExtCtrls,
  ListaTarefas.DAO.Usuario;

type
  TFoCadUsuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    LbNome: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    EdNome: TEdit;
    EdEmail: TEdit;
    EdSenha: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FDAO : TDAOUsuario;
    FUsuario : TUsuario;
    procedure Salvar;
  public

  end;

implementation

{$R *.dfm}

procedure TFoCadUsuario.Button1Click(Sender: TObject);
begin
   Salvar;
   ModalResult := MrOK;
end;

procedure TFoCadUsuario.FormCreate(Sender: TObject);
begin
   FDAO := TDAOUsuario.Create;
end;

procedure TFoCadUsuario.FormDestroy(Sender: TObject);
begin
   FDAO.Free;
end;

procedure TFoCadUsuario.Salvar;
var
   ObjUsuario : TUsuario;
begin
   ObjUsuario := TUsuario.Create;
   try
      ObjUsuario.Nome := edNome.Text;
      ObjUsuario.Email := edEmail.Text;
      ObjUsuario.Senha := edSenha.Text;
      FDAO.Inserir(ObjUsuario);
      edNome.Clear;
      edEmail.Clear;
      edSenha.Clear;
   Finally
      ObjUsuario.Free;
   end;
end;

end.

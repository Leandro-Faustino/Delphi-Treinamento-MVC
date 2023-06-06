unit ListaTarefas.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, ListaTarefas.Model.Tarefas, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.Generics.Collections, ListaTarefas.DAO.Usuario,
  ListaTarefas.Model.Usuarios, ListaTarefas.DAO.Tarefas;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    PnButtom: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel4: TPanel;
    EdPesquisa: TEdit;
    Button4: TButton;
    Label1: TLabel;
    LVTarefas: TListView;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
     FDAOUsuario : TDAOUsuario;
     FUsuario : TUsuario;
     FDAOTarefas : TDAOTarefas;
     function ValidaUsuario(pEmail, pSenha : String) : Boolean;
     procedure PreencheListView(PTarefas : TObjectList<TTarefas>);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ListaTarefas.View.UcadLogin,
  ListaTarefas.View.UcadTarefas;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   ObjCadTarefas : TfoCadTarefas;
   begin

   ObjCadTarefas :=  TfoCadTarefas.Create(Self, FUsuario,FDAOTarefas);
   try
      ObjCadTarefas.ShowModal;
      PreencheListView(FDAOTarefas.ListarTarefas(FUsuario.id));
   finally
      ObjCadTarefas.Free;
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   FormTarefas : TfoCadTarefas;
   FTarefas : TTarefas;
begin
   FTarefas := FDAOTarefas.BuscarTarefas(LVTarefas.ItemFocused.Caption.ToInteger);
   try
      FormTarefas := TfoCadTarefas.Create(Self,FUsuario,FDAOTarefas,FTarefas);
      FormTarefas.ShowModal;
      PreencheListView(FDAOTarefas.ListarTarefas(FUsuario.Id));
   finally
      FormTarefas.Free;
      FTarefas.Free;
   end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   close;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   FDAOTarefas := TDAOTarefas.Create;
   PreencheListView(FDAOTarefas.PesquisarTarefa(EdPesquisa.text));
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   ObjLogin : TfocadLogin;
begin
   ObjLogin := TfocadLogin.Create(nil);
   try
      ObjLogin.ShowModal;
      if not ValidaUsuario(ObjLogin.EdEmail.Text, ObjLogin.EdSenha.Text ) then
      begin
         ShowMessage('Usuário ou Senha Inválido!');
         Application.Terminate;
      end;

      FDAOTarefas := TDAOTarefas.Create;
      if not FUsuario.Id.ToString.IsEmpty then
         PreencheListView(FDAOTarefas.ListarTarefas(FUsuario.Id));
      finally
      ObjLogin.Free;
   end;
end;

procedure TForm1.PreencheListView(PTarefas: TObjectList<TTarefas>);
var
   ObjItem : TListItem;
   Objtarefa : TTarefas;
begin
   if not Assigned(PTarefas) then
      exit;
   LVTarefas.Clear;
   for Objtarefa in PTarefas do
   begin
      ObjItem := LVTarefas.Items.Add;
      ObjItem.Caption := Objtarefa.Codigo.ToString;
      ObjItem.SubItems.Add(Objtarefa.Titulo);
      ObjItem.SubItems.Add(FormatDateTime('dd/mm/yyyy hh:mm', Objtarefa.DataCriacao));
      ObjItem.Data := Objtarefa;
   end;
end;

function TForm1.ValidaUsuario(pEmail, pSenha: String): Boolean;
begin
   FDAOUsuario := TDAOUsuario.Create;
   FUsuario := FDAOUsuario.LoginUsuario(pEmail, pSenha);
   if not Assigned(FUsuario) then
         Result := False;
   Result := not FUsuario.id.ToString.IsEmpty;
end;

end.

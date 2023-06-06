unit ListaTarefas.View.UcadTarefas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Generics.Collections, ListaTarefas.Model.Tarefas,
  ListaTarefas.Model.Usuarios, ListaTarefas.DAO.Tarefas;

type
  TfoCadTarefas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdTitulo: TEdit;
    MmDescricao: TMemo;
    Button1: TButton;
    BtnSair: TButton;
    procedure BtnSairClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    FDAO: TDAOTarefas;
    FTArefas : TTarefas;
    FUsuario : TUsuario;
    procedure EmEdicaoTarefas(pTarefas : TTarefas);
    procedure Novo;
    procedure Editar;
  public
    constructor Create(POwner : TComponent;pUsuario : TUsuario;
     pDAOTArefas : TDAOTarefas; pTarefas : TTarefas = nil);
  end;

implementation

{$R *.dfm}

{ TfoCadTarefas }

procedure TfoCadTarefas.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfoCadTarefas.Button1Click(Sender: TObject);
begin
   if not Assigned(FTArefas) then
   begin
      Novo;
   end
   else 
      Editar;
end;

constructor TfoCadTarefas.Create(POwner: TComponent; pUsuario : TUsuario;
 pDAOTArefas : TDAOTarefas;  pTarefas : TTarefas = nil);
begin
   Inherited Create(POwner);
   EmEdicaoTarefas(pTarefas);
   FUsuario := PUsuario;
   FDAO := pDAOTarefas;
end;

procedure TfoCadTarefas.Editar;
begin
   Ftarefas.Titulo := EdTitulo.Text;
   FTArefas.Descricao :=  MmDescricao.Text;
   FDAO.Alterar(FTArefas);
end;

procedure TfoCadTarefas.EmEdicaoTarefas(pTarefas: TTarefas);
begin
   if not Assigned(pTarefas) then
   exit ;

   Ftarefas := pTarefas;
   edTitulo.Text := FTarefas.Titulo;
   MmDescricao.Lines.Add(FTarefas.Descricao);
end;

procedure TfoCadTarefas.Novo;
begin
   try
      if not assigned(Ftarefas) then
         Ftarefas := TTarefas.Create;

      Ftarefas.IdUsuario := FUsuario.Id;
      Ftarefas.Titulo := EdTitulo.Text;
      Ftarefas.Descricao := MmDescricao.Text;
      Ftarefas.DataCriacao := now;
      FDAO.Inserir(Ftarefas);
   finally
      EdTitulo.Clear;
      MmDescricao.Clear;
      Ftarefas.DisposeOf;
   end;
end;

end.

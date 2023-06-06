program ListaTarefas;

uses
  Vcl.Forms,
  ListaTarefas.View.Principal in 'View\ListaTarefas.View.Principal.pas' {Form1},
  ListaTarefas.Model.Usuarios in 'Model\ListaTarefas.Model.Usuarios.pas',
  ListaTarefas.Model.Tarefas in 'Model\ListaTarefas.Model.Tarefas.pas',
  ListaTArefas.View.UcadUsuarios in 'View\ListaTArefas.View.UcadUsuarios.pas' {FoCadUsuario},
  ListaTarefas.View.UcadTarefas in 'View\ListaTarefas.View.UcadTarefas.pas' {foCadTarefas},
  ListaTarefas.View.UcadLogin in 'View\ListaTarefas.View.UcadLogin.pas' {focadLogin},
  ListaTarefas.Model.Conexao in 'Model\Conexao\ListaTarefas.Model.Conexao.pas' {UDMConexao: TDataModule},
  ListaTarefas.DAO.Usuario in 'DAO\ListaTarefas.DAO.Usuario.pas',
  ListaTarefas.DAO.Tarefas in 'DAO\ListaTarefas.DAO.Tarefas.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

unit ListaTarefas.DAO.Usuario;

interface

uses
  ListaTarefas.Model.Usuarios, ListaTarefas.Model.Conexao;

type
   TDAOUsuario = Class
      private
         FConexao : TUDMConexao;
         function PreencheObjUsuario : TUsuario;
      public
         Constructor Create;
         Destructor Destroy; Override;
         procedure Inserir(pValue : TUsuario);
         procedure Apagar(pValue : TUsuario);
         function Alterar(pValue : TUsuario) : TUsuario;
         function LoginUsuario(pEmail, PSenha: String) : TUsuario;

   End;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TDAOUsuario }

function TDAOUsuario.Alterar(pValue: TUsuario): TUsuario;
begin
   FConexao.StartTransaction;
   try
      FConexao.SQL('UPDATE USUARIOS SET Nome=:Nome, Email=:Email, Senha=:Senha WHERE ID=:ID');
      FConexao.Params('Nome', pValue.Nome);
      FConexao.Params('Email', pValue.Email);
      FConexao.Params('Senha', pValue.Senha);
      FConexao.Params('ID', pValue.Id);
      FConexao.ExecSQL;
      FConexao.Commit;
      ShowMessage('Registro Alterado com Sucesso!');
   Except
      FConexao.RollBack;
      raise Exception.Create('Erro ao Alterar o registro do Usuário');
   end;
end;

procedure TDAOUsuario.Apagar(pValue: TUsuario);
begin
   FConexao.StartTransaction;
   try
      FConexao.SQL('Delete From USUARIOS WHERE ID=:ID');
      FConexao.Params('ID', pValue.Id);
      FConexao.ExecSQL;
      FConexao.Commit;
      ShowMessage('Registro Deletado com Sucesso!');
   Except
      FConexao.RollBack;
      raise Exception.Create('Erro ao Deletar o registro do Usuário');
   end;
end;

constructor TDAOUsuario.Create;
begin
   FConexao := TUDMConexao.Create(nil);
end;

destructor TDAOUsuario.Destroy;
begin
  FConexao.Free;
  inherited;
end;

procedure TDAOUsuario.Inserir(pValue: TUsuario);
begin
   FConexao.StartTransaction;
   try
      FConexao.SQL('INSERT INTO USUARIOS (Nome, Email, Senha) VALUES(:nome, :Email, :Senha)');
      FConexao.Params('Nome', pValue.Nome);
      FConexao.Params('Email', pValue.Email);
      FConexao.Params('Senha', pValue.Senha);
      FConexao.ExecSQL;
      FConexao.Commit;
      ShowMessage('Registro Inserido com Sucesso!');
   Except
      FConexao.RollBack;
      raise Exception.Create('Erro ao Inserir o registro do Usuário');
   end;
end;

function TDAOUsuario.LoginUsuario(pEmail, PSenha: String): TUsuario;
begin
   FConexao.SQL('select * from Usuarios where Email=:email and Senha=:Senha');
   FConexao.Params('Email', pEmail);
   FConexao.Params('Senha', pSenha);
   FConexao.Open;

   if FConexao.DataSet.IsEmpty then
   Begin
      ShowMessage('Login Inválido!');
      Exit;
   End;

   result := PreencheObjUsuario;
end;

function TDAOUsuario.PreencheObjUsuario: TUsuario;
begin
   result := TUsuario.Create;
   FConexao.DataSet.First;
   while not FConexao.DataSet.Eof do
   begin
      Result.Id := FConexao.DataSet.FieldByName('id').AsInteger;
      Result.Nome := FConexao.DataSet.FieldByName('nome').AsString;
      Result.Email := FConexao.DataSet.FieldByName('Email').AsString;
      Result.Senha := FConexao.DataSet.FieldByName('Senha').AsString;
      FConexao.DataSet.Next;
   end;
end;

end.

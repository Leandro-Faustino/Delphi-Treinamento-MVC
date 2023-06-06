unit ListaTarefas.DAO.Tarefas;

interface

uses
  ListaTarefas.Model.Conexao, ListaTarefas.Model.Tarefas,
  System.Generics.Collections;

type
   TDAOTarefas = Class
   private
      FConexao : TUDMConexao;
      function PreencheListaTarefa() : TObjectList<TTarefas>;
      function PreencheObjTarefas() : TTarefas;
   public
      Constructor Create;
      Destructor Destroy; Override;
      procedure Inserir(pTarefas : TTarefas);
      procedure Apagar(pId : Integer);
      function  Alterar(pTarefas : TTarefas) : TTarefas;
      function  ListarTarefas(pUsuario : Integer) : TObjectList<TTarefas>;
      function  BuscarTarefas(Pid : Integer) : TTarefas;
      function  PesquisarTarefa(pTituloTarefa : String) : TObjectList<TTarefas>;
   End;

implementation

uses
  Vcl.Dialogs, System.SysUtils;

{ TDAOTarefas }

function TDAOTarefas.Alterar(pTarefas: TTarefas): TTarefas;
begin
   FConexao.StartTransaction;
     try
      FConexao.SQL('UPDATE TAREFAS SET Titulo=:Titulo, Descricao=:Descricao, Datacriacao=:Datacriacao WHERE Codigo=:codigo');
      FConexao.Params('Titulo', pTarefas.Titulo);
      FConexao.Params('Descricao', pTarefas.Descricao);
      FConexao.Params('DataCriacao', pTarefas.DataCriacao);
      FConexao.Params('Codigo', pTarefas.Codigo);
      FConexao.ExecSQL;
      FConexao.Commit;
      ShowMessage('Registro Alterado com Sucesso!');
   Except
      FConexao.RollBack;
      raise Exception.Create('Erro ao Alterar a Tarefa!');
   end;
end;

procedure TDAOTarefas.Apagar(pId: Integer);
begin
   FConexao.StartTransaction;
     try
      FConexao.SQL('DELETE FROM TAREFAS WHERE id=:id');
      FConexao.Params('Id', pId);
      FConexao.ExecSQL;
      FConexao.Commit;
      ShowMessage('Tarefa Excluída com Sucesso!');
   Except
      FConexao.RollBack;
      raise Exception.Create('Erro ao Excluir a Tarefa!');
   end;
end;

function TDAOTarefas.BuscarTarefas(Pid: Integer): TTarefas;
begin
    FConexao.SQL('Select * from TAREFAS where codigo= :Id');
    FConexao.Params('id',pid);
    FConexao.Open;

    if not Fconexao.DataSet.IsEmpty then
       result := PreencheObjTarefas;
end;

constructor TDAOTarefas.Create;
begin
   FConexao := TUDMConexao.Create(nil);
end;

destructor TDAOTarefas.Destroy;
begin
  FConexao.Free;
  inherited;
end;

procedure TDAOTarefas.Inserir(pTarefas: TTarefas);
begin
   FConexao.StartTransaction;
     try
      FConexao.SQL('INSERT INTO TAREFAS (IdUsuario, Titulo, Descricao, DataCriacao)'+
                   ' VALUES( :IdUsuario, :Titulo, :Descricao, :DataCriacao)');
      FConexao.Params('IdUsuario', pTarefas.IdUsuario);
      FConexao.Params('Titulo', pTarefas.Titulo);
      FConexao.Params('Descricao', pTarefas.Descricao);
      FConexao.Params('DataCriacao', pTarefas.DataCriacao);
      FConexao.ExecSQL;
      FConexao.Commit;
      ShowMessage('Tarefa Cadastrado com Sucesso!');
   Except
      FConexao.RollBack;
      raise Exception.Create('Erro ao Cadastrar uma Tarefa!');
   end;
end;

function TDAOTarefas.ListarTarefas(pUsuario: Integer): TObjectList<TTarefas>;
begin
    FConexao.SQL('Select * from TAREFAS where IDUsuario= :Id');
    FConexao.Params('id',pUsuario);
    FConexao.Open;

    if not Fconexao.DataSet.IsEmpty then
       result := PreencheListaTarefa;
end;

function TDAOTarefas.PesquisarTarefa(pTituloTarefa : String) : TObjectList<TTarefas>;
begin
   try
      FConexao.SQL('Select * from Tarefas where titulo like :Titulo');
      FConexao.Params('Titulo', '%'+pTituloTarefa+'%');
      FConexao.Open;

      if not Fconexao.DataSet.IsEmpty then
        result := PreencheListaTarefa;

   Except
      FConexao.RollBack;
      raise Exception.Create('Erro ao Pesquisar pela Tarefa!');
   end;
end;

function TDAOTarefas.PreencheListaTarefa: TObjectList<TTarefas>;
var
   ObjTarefa : TTarefas;
begin
   Result := TObjectList<TTarefas>.Create;
   FConexao.DataSet.First;
   while not FConexao.DataSet.Eof do
   begin
      ObjTarefa := TTarefas.Create;
      objTarefa.Codigo := FConexao.DataSet.FieldByName('codigo').AsInteger;
      ObjTarefa.IdUsuario := FConexao.DataSet.FieldByName('idUsuario').AsInteger;
      ObjTarefa.Titulo := FConexao.DataSet.FieldByName('Titulo').AsString;
      ObjTarefa.Descricao := FConexao.DataSet.FieldByName('descricao').AsString;
      ObjTarefa.DataCriacao := FConexao.DataSet.FieldByName('DataCriacao').AsDateTime;
      Result.add(ObjTarefa);
      FConexao.DataSet.Next;
   end;
end;

function TDAOTarefas.PreencheObjTarefas: TTarefas;
begin
   Result := TTarefas.Create;
   Result.Codigo := FConexao.DataSet.FieldByName('codigo').AsInteger;
   Result.IdUsuario := FConexao.DataSet.FieldByName('idUsuario').AsInteger;
   Result.Titulo := FConexao.DataSet.FieldByName('Titulo').AsString;
   Result.Descricao := FConexao.DataSet.FieldByName('descricao').AsString;
   Result.DataCriacao := FConexao.DataSet.FieldByName('DataCriacao').AsDateTime;
end;

end.

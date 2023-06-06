unit ListaTarefas.Model.Tarefas;

interface

type
   TTarefas = class
   private
      FCodigo: Integer;
      FIdUsuario : Integer;
      FTitulo: String;
      FDescricao: String;
      FDataCriacao: TDatetime;
   public
      Constructor Create;
      Destructor Destroy; Override;
      property Codigo: Integer read FCodigo write FCodigo;
      property IdUsuario: Integer read FIdUsuario write FIdUsuario;
      property Titulo: String read FTitulo write FTitulo;
      property Descricao: String read FDescricao write FDescricao;
      property DataCriacao: TDatetime read FDataCriacao write FDataCriacao;
   end;

implementation

{ TTarefas }

constructor TTarefas.Create;
begin
//
end;

destructor TTarefas.Destroy;
begin

  inherited;
end;

end.

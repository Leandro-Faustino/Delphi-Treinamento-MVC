unit ListaTarefas.Model.Usuarios;

interface

uses
  System.Generics.Collections,
  ListaTarefas.Model.Tarefas;

type
   TUsuario = Class
   private
      FNome: String;
      FEmail: String;
      FSenha: String;
      FId: Integer;
      FTarefas: TObjectList<TTarefas>;
   public
      Constructor Create;
      Destructor Destroy; Override;
      property Id: Integer read FId write FId;
      property Nome: String read FNome write FNome;
      property Email: String read FEmail write FEmail;
      property Senha: String read FSenha write FSenha;
      property Tarefas: TObjectList<TTarefas> read FTarefas write FTarefas;
   End;

implementation

{ TUsuario }

Constructor TUsuario.Create;
Begin
//
end;

destructor TUsuario.Destroy;
begin

  inherited;
end;

end.

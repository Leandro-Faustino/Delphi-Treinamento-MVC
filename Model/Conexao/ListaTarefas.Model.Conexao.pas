unit ListaTarefas.Model.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TUDMConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery1: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function DataSet() : TDataSet;
    procedure SQL(pSQL : String);
    procedure Params(pParams : String; pValue : Variant); Overload;
    function Params(pParams : String) : Variant; Overload;
    procedure ExecSQL;
    procedure Open;
    procedure StartTransaction;
    procedure Commit;
    procedure RollBack;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TUDMConexao.Commit;
begin
   FDConnection.Commit;
end;

procedure TUDMConexao.DataModuleCreate(Sender: TObject);
begin
   FDConnection.Connected;
end;

function TUDMConexao.DataSet: TDataSet;
begin
   result := FDQuery1;
end;

procedure TUDMConexao.ExecSQL;
begin
   FdQuery1.ExecSQL;
end;

procedure TUDMConexao.Open;
begin
   FDQuery1.Open();
end;

function TUDMConexao.Params(pParams: String): Variant;
begin
   Result := FDQuery1.ParamByName(pParams).Value;
end;

procedure TUDMConexao.Params(pParams: String; pValue: Variant);
begin
   FdQuery1.ParamByName(pParams).Value := pValue;
end;

procedure TUDMConexao.RollBack;
begin
   FDConnection.Rollback;
end;

procedure TUDMConexao.SQL(pSQL: String);
begin
   FDQuery1.SQL.Clear;
   FdQuery1.SQl.Add(pSQL);
end;

procedure TUDMConexao.StartTransaction;
begin
   FDConnection.StartTransaction;
end;

end.

unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, IniFiles, MidasLib,
  FireDAC.Stan.Def, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef;

type
  TFormPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    FDSQLiteBackup1: TFDSQLiteBackup;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure FormShow(Sender: TObject);
    procedure FechaFormularios;
    procedure AbreFormulario(NomeForm: TForm);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation
Uses
  UnitDm, UnitPessoas, UnitAlimentos, UnitAgenda, UnitPedido;

{$R *.dfm}

procedure TFormPrincipal.Button1Click(Sender: TObject);
begin
  FechaFormularios;
  FormPessoas := TFormPessoas.Create(Self);
  AbreFormulario(FormPessoas);
end;

procedure TFormPrincipal.Button2Click(Sender: TObject);
begin
  FechaFormularios;
  FormAlimentos := TFormAlimentos.Create(Self);
  AbreFormulario(FormAlimentos);
end;

procedure TFormPrincipal.Button3Click(Sender: TObject);
begin
  FechaFormularios;
  FormAgenda := TFormAgenda.Create(Self);
  AbreFormulario(FormAgenda);
end;

procedure TFormPrincipal.Button4Click(Sender: TObject);
begin
  FechaFormularios;
  FormPedido := TFormPedido.Create(Self);
  AbreFormulario(FormPedido);
end;

procedure TFormPrincipal.AbreFormulario(NomeForm: TForm);
Begin
  NomeForm.parent := panel2;
  NomeForm.Align := alClient;
  NomeForm.BorderStyle := bsNone;
  NomeForm.Show;
End;

procedure TFormPrincipal.FechaFormularios;
Begin
  if FormPessoas <> nil then
  Begin
    FormPessoas.Close;
    FormPessoas.Release;
    FormPessoas:=nil;
    FormPessoas.Free;
  End;
  if FormAlimentos <> nil then
  Begin
    FormAlimentos.Close;
    FormAlimentos.Release;
    FormAlimentos:=nil;
    FormAlimentos.Free;
  End;
  if FormAgenda <> nil then
  Begin
    FormAgenda.Close;
    FormAgenda.Release;
    FormAgenda:=nil;
    FormAgenda.Free;
  End;
  if FormPedido <> nil then
  Begin
    FormPedido.Close;
    FormPedido.Release;
    FormPedido:=nil;
    FormPedido.Free;
  End;
End;

procedure TFormPrincipal.FormShow(Sender: TObject);
Var
  Iniconf : TInifile;
  Caminho : String;
  Arquivo : String;
  Arquivobk: String;
  Msg: String;
begin
  dm.FDConnection1.Params.Database:='';
  Caminho:=ExtractFilePath(Application.ExeName) + 'Config.ini';
  if FileExists(Caminho) then
  Begin
    Iniconf:=TInifile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
    Arquivo:=Iniconf.ReadString('Config', 'Caminho', '');
    Arquivobk:=Iniconf.ReadString('Config', 'Backup', '');
    Iniconf.Free;
    dm.FDConnection1.Connected:=False;
    dm.FDConnection1.Params.Database:=Arquivo;
    dm.FDConnection1.Connected:=True;
    FDSQLiteBackup1.DataBase:=Arquivo;
    FDSQLiteBackup1.DestDatabase:=Arquivobk;
    FDSQLiteBackup1.Backup;
    FDSQLiteBackup1.Free;
  End
  else
  Begin
    dm.FDConnection1.Connected:=False;
    dm.FDConnection1.Params.Database:='';
    Msg:='Arquivo de dados não localizado. Confirma a criação de novo arquivo vazio?';
    if Application.MessageBox(PChar(Msg),'Configurações iniciais',mb_yesno+mb_defbutton2) = id_yes then
    Begin
      Arquivo:=ExtractFilePath(Application.ExeName) + 'dbBuffetLucia.db';
      Arquivobk:=ExtractFilePath(Application.ExeName) + 'dbBackup.db';
      Iniconf:=TInifile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
      Iniconf.WriteString('Config', 'Caminho', Arquivo);
      Iniconf.WriteString('Config', 'Backup', Arquivobk);
      Iniconf.Free;
      dm.FDConnection1.Connected:=False;
      dm.FDConnection1.Params.Database:=Arquivo;
      dm.FDConnection1.Connected:=True;
      dm.Limpa;
      dm.FDQueryTmp.SQL.Add('CREATE TABLE TbPessoas (IdPessoa INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, NomePessoa TEXT (40) NOT NULL, Recorrencia TEXT (7) NOT NULL, TamanhoPadrao TEXT (1) NOT NULL, Ativa BOOLEAN, Ordem INTEGER);');
      dm.FDQueryTmp.SQL.Add('CREATE TABLE TbTipos (IdTipo INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, NomeTipo TEXT (20) NOT NULL);');
      dm.FDQueryTmp.SQL.Add('CREATE TABLE TbAlimentos (IdAlimento INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, NomeAlimento TEXT (40) NOT NULL, Tipo INTEGER NOT NULL, Ativo BOOLEAN);');
      dm.FDQueryTmp.SQL.Add('CREATE TABLE TbAgenda (IdAgenda INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, DataAgenda DATE NOT NULL, Alimento1 INTEGER REFERENCES TbAlimentos (IdAlimento), Alimento2 INTEGER REFERENCES TbAlimentos (IdAlimento),');
      dm.FDQueryTmp.SQL.Add('Alimento3 INTEGER REFERENCES TbAlimentos (IdAlimento), Alimento4 INTEGER REFERENCES TbAlimentos (IdAlimento), Alimento5 INTEGER REFERENCES TbAlimentos (IdAlimento), Alimento6 INTEGER REFERENCES TbAlimentos (IdAlimento));');
      dm.FDQueryTmp.SQL.Add('CREATE TABLE TbCardapioDia (Dia DATE PRIMARY KEY NOT NULL, OPC1 TEXT (40), OPC2 TEXT (40), OPC3 TEXT (40), OPC4 TEXT (40), OPC5 TEXT (40), OPC6 TEXT (40));');
      dm.FDQueryTmp.SQL.Add('CREATE TABLE TbPedido (IdPedido INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Pessoa INTEGER REFERENCES TbPessoas (IdPessoa) NOT NULL, DataPedido DATE NOT NULL, Pedir BOOLEAN NOT NULL, Tamanho TEXT (1) NOT NULL,');
      dm.FDQueryTmp.SQL.Add('Prato1 TEXT (40), Prato2 TEXT (40), Prato3 TEXT (40), Prato4 TEXT (40), Prato5 TEXT (40), SegOpc BOOLEAN);');
      dm.FDQueryTmp.Prepare;
      dm.FDQueryTmp.ExecSQL;
      dm.Limpa;
      dm.FDQueryTmp.SQL.Add('INSERT INTO TbTipos (IdTipo, NomeTipo) VALUES');
      dm.FDQueryTmp.SQL.Add('(1, ''Arroz''),');
      dm.FDQueryTmp.SQL.Add('(2, ''Feijão''),');
      dm.FDQueryTmp.SQL.Add('(3, ''Carne''),');
      dm.FDQueryTmp.SQL.Add('(4, ''Guarnição''),');
      dm.FDQueryTmp.SQL.Add('(5, ''Salada''),');
      dm.FDQueryTmp.SQL.Add('(6, ''Opção alternativa'');');
      dm.FDQueryTmp.Prepare;
      dm.FDQueryTmp.ExecSQL;
      dm.FDQueryTmp.Close;
      ShowMessage('Arquivo de dados criado com sucesso!');
    End;
  End;
  //Limpando datas passadas
  dm.Limpa;
  dm.FDQueryTmp.SQL.Add('DELETE FROM TbAgenda WHERE DataAgenda < '''+FormatDateTime('YYYY-MM-DD',Date)+''';');
  dm.FDQueryTmp.Prepare;
  dm.FDQueryTmp.ExecSQL;
  dm.Limpa;
  dm.FDQueryTmp.SQL.Add('DELETE FROM TbPedido WHERE DataPedido < '''+FormatDateTime('YYYY-MM-DD',Date)+''';');
  dm.FDQueryTmp.Prepare;
  dm.FDQueryTmp.ExecSQL;
  dm.FDQueryTmp.Close;
end;

end.

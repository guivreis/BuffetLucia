unit UnitPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TFormPessoas = class(TForm)
    DBGrid1: TDBGrid;
    DSPessoas: TDataSource;
    FDQueryPessoas: TFDQuery;
    FDQueryPessoasIdPessoa: TFDAutoIncField;
    FDQueryPessoasNomePessoa: TWideStringField;
    FDQueryPessoasRecorrencia: TWideStringField;
    FDQueryPessoasTamanhoPadrao: TWideStringField;
    FDQueryPessoasAtiva: TBooleanField;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPessoas: TFormPessoas;

implementation
Uses
  UnitDm, UnitNovaPessoa;

{$R *.dfm}

procedure TFormPessoas.Button1Click(Sender: TObject);
Var
  Msg: String;
begin
  Msg:='Confirma a exclusão da pessoa '+FDQueryPessoasNomePessoa.Value+'?';
  if Application.MessageBox(PChar(Msg),'Excluir pessoa',mb_yesno+mb_defbutton2) = id_yes then
  Begin
    dm.FDQueryTmp.Close;
    dm.FDQueryTmp.SQL.Clear;
    dm.FDQueryTmp.SQL.Add('DELETE FROM TbPessoas WHERE IdPessoa = '+FDQueryPessoasIdPessoa.AsString+';');
    dm.FDQueryTmp.Prepare;
    dm.FDQueryTmp.ExecSQL;
    dm.FDQueryTmp.Close;
    FDQueryPessoas.Refresh;
  End;
end;

procedure TFormPessoas.Button2Click(Sender: TObject);
Var
  Ativa: String;
begin
  dm.FDQueryTmp.Close;
  dm.FDQueryTmp.SQL.Clear;
  if FDQueryPessoasAtiva.Value = False then Ativa:='1' else Ativa:='0';
  dm.FDQueryTmp.SQL.Add('UPDATE TbPessoas SET Ativa = '+Ativa+' WHERE IdPessoa = '+FDQueryPessoasIdPessoa.AsString+';');
  dm.FDQueryTmp.Prepare;
  dm.FDQueryTmp.ExecSQL;
  FDQueryPessoas.Refresh;
end;

procedure TFormPessoas.Button3Click(Sender: TObject);
begin
  if FormNovaPessoa = nil then FormNovaPessoa:=TFormNovaPessoa.Create(Self);
  FormNovaPessoa.ShowModal;
end;

procedure TFormPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQueryPessoas.Close;
  dm.FDQueryTmp.Close;
end;

procedure TFormPessoas.FormShow(Sender: TObject);
begin
  FDQueryPessoas.Open;
  FDQueryPessoas.FetchAll;
end;

end.

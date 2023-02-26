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
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FDQueryPessoasAtivaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    GridOriginalOptions : TDBGridOptions;
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

procedure TFormPessoas.DBGrid1CellClick(Column: TColumn);
begin
  if (Column.Field.DataType=ftBoolean) then
  begin
    Column.Grid.DataSource.DataSet.Edit;
    Column.Field.Value:= not Column.Field.AsBoolean;
    Column.Grid.DataSource.DataSet.Post;
  end;
end;

procedure TFormPessoas.DBGrid1ColEnter(Sender: TObject);
begin
  if Self.DBGrid1.SelectedField.DataType = ftBoolean then
  begin
    Self.GridOriginalOptions := Self.DBGrid1.Options;
    Self.DBGrid1.Options := Self.DBGrid1.Options - [dgEditing];
  end;
end;

procedure TFormPessoas.DBGrid1ColExit(Sender: TObject);
begin
  if Self.DBGrid1.SelectedField.DataType = ftBoolean then Self.DBGrid1.Options := Self.GridOriginalOptions;
end;

procedure TFormPessoas.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   CtrlState: array[Boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED) ;
begin
  if (Column.Field.DataType=ftBoolean) then
  begin
    DBGrid1.Canvas.FillRect(Rect) ;
    if (VarIsNull(Column.Field.Value)) then
      DrawFrameControl(DBGrid1.Canvas.Handle,Rect, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_INACTIVE)
    else
      DrawFrameControl(DBGrid1.Canvas.Handle,Rect, DFC_BUTTON, CtrlState[Column.Field.AsBoolean]);
  end;
end;

procedure TFormPessoas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Self.DBGrid1.SelectedField.DataType = ftBoolean) and (key = VK_SPACE)) then
  begin
    Self.DBGrid1.DataSource.DataSet.Edit;
    Self.DBGrid1.SelectedField.Value:= not Self.DBGrid1.SelectedField.AsBoolean;
    Self.DBGrid1.DataSource.DataSet.Post;
  end;
end;

procedure TFormPessoas.FDQueryPessoasAtivaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:=EmptyStr;
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

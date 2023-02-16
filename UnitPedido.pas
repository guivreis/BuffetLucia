unit UnitPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, ClipBrd;

type
  TFormPedido = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    DSCardapio: TDataSource;
    FDQueryCardapio: TFDQuery;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button3: TButton;
    FDQueryCardapioDia: TDateField;
    FDQueryCardapioOPC1: TWideStringField;
    FDQueryCardapioOPC2: TWideStringField;
    FDQueryCardapioOPC3: TWideStringField;
    FDQueryCardapioOPC4: TWideStringField;
    FDQueryCardapioOPC5: TWideStringField;
    FDQueryCardapioOPC6: TWideStringField;
    DSPedido: TDataSource;
    FDQueryPedido: TFDQuery;
    Button4: TButton;
    DSPessoa: TDataSource;
    FDQueryPessoa: TFDQuery;
    DBText1: TDBText;
    FDQueryPedidoIdPedido: TFDAutoIncField;
    FDQueryPedidoPessoa: TIntegerField;
    FDQueryPedidoDataPedido: TDateField;
    FDQueryPedidoPedir: TBooleanField;
    FDQueryPedidoTamanho: TWideStringField;
    FDQueryPedidoPrato1: TWideStringField;
    FDQueryPedidoPrato2: TWideStringField;
    FDQueryPedidoPrato3: TWideStringField;
    FDQueryPedidoPrato4: TWideStringField;
    FDQueryPedidoPrato5: TWideStringField;
    FDQueryPedidoNomePessoa: TWideStringField;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Button5: TButton;
    Button6: TButton;
    DBCheckBox1: TDBCheckBox;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Label8: TLabel;
    FDQueryPessoaIdPessoa: TFDAutoIncField;
    FDQueryPessoaNomePessoa: TWideStringField;
    FDQueryPessoaRecorrencia: TWideStringField;
    FDQueryPessoaTamanhoPadrao: TWideStringField;
    DBCheckBox2: TDBCheckBox;
    FDQueryPedidoSegOpc: TBooleanField;
    Button1: TButton;
    Memo2: TMemo;
    Button2: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure DSPedidoDataChange(Sender: TObject; Field: TField);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure DSPedidoStateChange(Sender: TObject);
    procedure Atualiza;
    procedure DBCheckBox2Click(Sender: TObject);
    procedure DSCardapioStateChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPedido: TFormPedido;

implementation
Uses
  UnitDm;

{$R *.dfm}

procedure TFormPedido.Atualiza;
Var
  NPedido: Integer;
  Tamanho: String;
Begin
  NPedido:=0;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Segue os pedidos de hoje:');
  dm.Limpa;
  dm.FDQueryTmp.SQL.Add('SELECT NomePessoa, Tamanho, Prato1, Prato2, Prato3, Prato4, Prato5, SegOpc FROM TbPedido');
  dm.FDQueryTmp.SQL.Add('LEFT JOIN (SELECT IdPessoa, NomePessoa FROM TbPessoas) ON IdPessoa = Pessoa WHERE Pedir = 1;');
  dm.FDQueryTmp.Open;
  dm.FDQueryTmp.FetchAll;
  while not dm.FDQueryTmp.EOF do
  Begin
    if dm.FDQueryTmp.FieldByName('Tamanho').Value = 'P' then Tamanho:='pequeno' else
    if dm.FDQueryTmp.FieldByName('Tamanho').Value = 'G' then Tamanho:='grande' else Tamanho:='';
    if Tamanho='' then Memo1.Lines.Add(IntToStr(NPedido+1)+') '+dm.FDQueryTmp.FieldByName('NomePessoa').Value+':') else
    Memo1.Lines.Add(IntToStr(NPedido+1)+') '+dm.FDQueryTmp.FieldByName('NomePessoa').Value+' (tamanho '+tamanho+'):');
    if dm.FDQueryTmp.FieldByName('Prato1').Value <> '' then
    Begin
      if dm.FDQueryTmp.FieldByName('Prato1').Value <> DBEdit1.Text then Memo1.Lines.Add('- *'+dm.FDQueryTmp.FieldByName('Prato1').Value+' <<<*')
      else Memo1.Lines.Add('- '+dm.FDQueryTmp.FieldByName('Prato1').Value);
    End
    else if ((DBEdit1.Text<>'') AND (dm.FDQueryTmp.FieldByName('SegOpc').Value=0)) then Memo1.Lines.Add('- *Não colocar '+DBEdit1.Text+' <<<*');
    if dm.FDQueryTmp.FieldByName('Prato2').Value <> '' then
    Begin
      if dm.FDQueryTmp.FieldByName('Prato2').Value <> DBEdit2.Text then Memo1.Lines.Add('- *'+dm.FDQueryTmp.FieldByName('Prato2').Value+' <<<*')
      else Memo1.Lines.Add('- '+dm.FDQueryTmp.FieldByName('Prato2').Value);
    End
    else if ((DBEdit2.Text<>'') AND (dm.FDQueryTmp.FieldByName('SegOpc').Value=0)) then Memo1.Lines.Add('- *Não colocar '+DBEdit2.Text+' <<<*');
    if dm.FDQueryTmp.FieldByName('Prato3').Value <> '' then
    Begin
      if dm.FDQueryTmp.FieldByName('Prato3').Value <> DBEdit3.Text then Memo1.Lines.Add('- *'+dm.FDQueryTmp.FieldByName('Prato3').Value+' <<<*')
      else Memo1.Lines.Add('- '+dm.FDQueryTmp.FieldByName('Prato3').Value);
    End
    else if ((DBEdit3.Text<>'') AND (dm.FDQueryTmp.FieldByName('SegOpc').Value=0)) then Memo1.Lines.Add('- *Não colocar '+DBEdit3.Text+' <<<*');
    if dm.FDQueryTmp.FieldByName('Prato4').Value <> '' then
    Begin
      if dm.FDQueryTmp.FieldByName('Prato4').Value <> DBEdit4.Text then Memo1.Lines.Add('- *'+dm.FDQueryTmp.FieldByName('Prato4').Value+' <<<*')
      else Memo1.Lines.Add('- '+dm.FDQueryTmp.FieldByName('Prato4').Value);
    End
    else if ((DBEdit4.Text<>'') AND (dm.FDQueryTmp.FieldByName('SegOpc').Value=0)) then Memo1.Lines.Add('- *Não colocar '+DBEdit4.Text+' <<<*');
    if dm.FDQueryTmp.FieldByName('Prato5').Value <> '' then
    Begin
      if dm.FDQueryTmp.FieldByName('Prato5').Value <> DBEdit5.Text then Memo1.Lines.Add('- *'+dm.FDQueryTmp.FieldByName('Prato5').Value+' <<<*')
      else Memo1.Lines.Add('- '+dm.FDQueryTmp.FieldByName('Prato5').Value);
    End
    else if ((DBEdit5.Text<>'') AND (dm.FDQueryTmp.FieldByName('SegOpc').Value=0)) then Memo1.Lines.Add('- *Não colocar '+DBEdit5.Text+' <<<*');
    Inc(NPedido);
    if NPedido < dm.FDQueryTmp.RecordCount then Memo1.Lines.Add('');
    dm.FDQueryTmp.Next;
  End;
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Horário de entrega: '+Edit1.Text+'hs.');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Forma de pagamento: Cartão de crédito.');
End;

procedure TFormPedido.Button10Click(Sender: TObject);
begin
  FDQueryPedido.Edit;
  FDQueryPedidoPrato3.Value:='';
//  FDQueryPedido.Post;
end;

procedure TFormPedido.Button11Click(Sender: TObject);
begin
  FDQueryPedido.Edit;
  FDQueryPedidoPrato4.Value:='';
//  FDQueryPedido.Post;
end;

procedure TFormPedido.Button12Click(Sender: TObject);
begin
  FDQueryPedido.Edit;
  FDQueryPedidoPrato5.Value:='';
//  FDQueryPedido.Post;
end;

procedure TFormPedido.Button13Click(Sender: TObject);
begin
  Clipboard.AsText:=Memo1.Text;
end;

procedure TFormPedido.Button14Click(Sender: TObject);
begin
  FDQueryPedido.Edit;
  FDQueryPedidoSegOpc.Value:=True;
  FDQueryPedidoTamanho.Value:='U';
  FDQueryPedidoPrato1.Value:=(Sender as TButton).Caption;
  FDQueryPedidoPrato2.Value:='';
  FDQueryPedidoPrato3.Value:='';
  FDQueryPedidoPrato4.Value:='';
  FDQueryPedidoPrato5.Value:='';
end;

procedure TFormPedido.Button1Click(Sender: TObject);
begin
  FDQueryPedido.Cancel;
end;

procedure TFormPedido.Button2Click(Sender: TObject);
begin
  Clipboard.AsText:=Memo2.Text;
end;

procedure TFormPedido.Button3Click(Sender: TObject);
begin
  FDQueryCardapio.Post;
end;

procedure TFormPedido.Button4Click(Sender: TObject);
Var
  Pedir: String;
  Tamanho: String;
begin
  Memo1.Lines.Clear;
  dm.Limpa;
  dm.FDQueryTmp.SQL.Add('DELETE FROM TbPedido;');
  dm.FDQueryTmp.Prepare;
  dm.FDQueryTmp.ExecSQL;
  FDQueryPessoa.First;
  while not FDQueryPessoa.EOF do
  Begin
    Pedir:=FDQueryPessoa.FieldByName('Recorrencia').Value;
    Pedir:=Pedir[DayOfWeek(DateTimePicker1.Date)];
    Tamanho:=FDQueryPessoa.FieldByName('TamanhoPadrao').Value;
    dm.Limpa;
    dm.FDQueryTmp.SQL.Add('INSERT INTO TbPedido (IdPedido, Pessoa, DataPedido, Pedir, Tamanho, Prato1, Prato2, Prato3, Prato4, Prato5, SegOpc) VALUES');
    dm.FDQueryTmp.SQL.Add('(NULL, '+FDQueryPessoa.FieldByName('IdPessoa').AsString+', '''+FormatDateTime('YYYY-MM-DD',DateTimePicker1.Date)+''', '+Pedir+', '''+Tamanho+''', '''+DBEdit1.Text+''', '''+DBEdit2.Text+''', '''+DBEdit3.Text+''', '''+DBEdit4.Text+''', '''+DBEdit5.Text+''', 0);');
    dm.FDQueryTmp.Prepare;
    dm.FDQueryTmp.ExecSQL;
    FDQueryPessoa.Next;
  End;
  dm.FDQueryTmp.Close;
  FDQueryPedido.Refresh;
end;

procedure TFormPedido.Button5Click(Sender: TObject);
begin
  FDQueryPedido.Next;
end;

procedure TFormPedido.Button6Click(Sender: TObject);
begin
  FDQueryPedido.Prior;
end;

procedure TFormPedido.Button7Click(Sender: TObject);
begin
  FDQueryPedido.Post;
end;

procedure TFormPedido.Button8Click(Sender: TObject);
begin
  FDQueryPedido.Edit;
  FDQueryPedidoPrato1.Value:='';
//  FDQueryPedido.Post;
end;

procedure TFormPedido.Button9Click(Sender: TObject);
begin
  FDQueryPedido.Edit;
  FDQueryPedidoPrato2.Value:='';
//  FDQueryPedido.Post;
end;

procedure TFormPedido.DBCheckBox1Click(Sender: TObject);
begin
  DBEdit7.Enabled:=DBCheckBox1.Checked;
  DBEdit8.Enabled:=DBCheckBox1.Checked;
  DBEdit9.Enabled:=DBCheckBox1.Checked;
  DBEdit10.Enabled:=DBCheckBox1.Checked;
  DBEdit11.Enabled:=DBCheckBox1.Checked;
  DBRadioGroup1.Enabled:=DBCheckBox1.Checked;
  Button8.Enabled:=DBCheckBox1.Checked;
  Button9.Enabled:=DBCheckBox1.Checked;
  Button10.Enabled:=DBCheckBox1.Checked;
  Button11.Enabled:=DBCheckBox1.Checked;
  Button12.Enabled:=DBCheckBox1.Checked;
  DBCheckBox2.Enabled:=DBCheckBox1.Checked;
end;

procedure TFormPedido.DBCheckBox2Click(Sender: TObject);
begin
  if DBCheckBox2.Checked = True then
  Begin
    FDQueryPedido.Edit;
    FDQueryPedidoPrato1.Value:=DBEdit6.Text;
    FDQueryPedidoPrato2.Value:='';
    FDQueryPedidoPrato3.Value:='';
    FDQueryPedidoPrato4.Value:='';
    FDQueryPedidoPrato5.Value:='';
  End
  else
  Begin
    FDQueryPedido.Edit;
    FDQueryPedidoPrato1.Value:=DBEdit1.Text;
    FDQueryPedidoPrato2.Value:=DBEdit2.Text;
    FDQueryPedidoPrato3.Value:=DBEdit3.Text;
    FDQueryPedidoPrato4.Value:=DBEdit4.Text;
    FDQueryPedidoPrato5.Value:=DBEdit5.Text;
  End;
end;

procedure TFormPedido.DSCardapioStateChange(Sender: TObject);
begin
  if FDQueryCardapio.State = dsEdit then Button3.Enabled:=True else Button3.Enabled:=False;
end;

procedure TFormPedido.DSPedidoDataChange(Sender: TObject; Field: TField);
begin
  DBEdit7.Enabled:=FDQueryPedidoPedir.Value;
  DBEdit8.Enabled:=FDQueryPedidoPedir.Value;
  DBEdit9.Enabled:=FDQueryPedidoPedir.Value;
  DBEdit10.Enabled:=FDQueryPedidoPedir.Value;
  DBEdit11.Enabled:=FDQueryPedidoPedir.Value;
  DBRadioGroup1.Enabled:=FDQueryPedidoPedir.Value;
  Button8.Enabled:=FDQueryPedidoPedir.Value;
  Button9.Enabled:=FDQueryPedidoPedir.Value;
  Button10.Enabled:=FDQueryPedidoPedir.Value;
  Button11.Enabled:=FDQueryPedidoPedir.Value;
  Button12.Enabled:=FDQueryPedidoPedir.Value;
  DBCheckBox2.Enabled:=FDQueryPedidoPedir.Value;
  if FDQueryPedido.RecNo = 1 then Button6.Enabled:=False else Button6.Enabled:=True;
  if FDQueryPedido.RecNo = FDQueryPedido.RecordCount then Button5.Enabled:=False else Button5.Enabled:=True;
  Atualiza;
end;

procedure TFormPedido.DSPedidoStateChange(Sender: TObject);
begin
  if FDQueryPedido.State = dsEdit then
  Begin
    Button7.Enabled:=True;
    Button1.Enabled:=True;
  End
  else
  Begin
    Button7.Enabled:=False;
    Button1.Enabled:=False;
  End;
end;

procedure TFormPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQueryCardapio.Close;
  FDQueryPedido.Close;
  FDQueryPessoa.Close;
end;

procedure TFormPedido.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=Date;
  FDQueryCardapio.Open;
  FDQueryPedido.Open;
  FDQueryPessoa.Open;
  if FDQueryCardapioDia.Value <> DateTimePicker1.Date then
  Begin
    if FDQueryCardapio.RecordCount>0 then
    Begin
      FDQueryCardapio.Edit;
      FDQueryCardapioOPC1.Value:='';
      FDQueryCardapioOPC2.Value:='';
      FDQueryCardapioOPC3.Value:='';
      FDQueryCardapioOPC4.Value:='';
      FDQueryCardapioOPC5.Value:='';
      FDQueryCardapioOPC6.Value:='';
      FDQueryCardapio.Post;
    End;
    dm.Limpa;
    dm.FDQueryTmp.SQL.Add('SELECT DataAgenda, Nome1, Nome2, Nome3, Nome4, Nome5, Nome6 FROM TbAgenda');
    dm.FDQueryTmp.SQL.Add('LEFT JOIN (SELECT IdAlimento AS Id1, NomeAlimento AS Nome1 FROM TbAlimentos) ON Id1 = Alimento1');
    dm.FDQueryTmp.SQL.Add('LEFT JOIN (SELECT IdAlimento AS Id2, NomeAlimento AS Nome2 FROM TbAlimentos) ON Id2 = Alimento2');
    dm.FDQueryTmp.SQL.Add('LEFT JOIN (SELECT IdAlimento AS Id3, NomeAlimento AS Nome3 FROM TbAlimentos) ON Id3 = Alimento3');
    dm.FDQueryTmp.SQL.Add('LEFT JOIN (SELECT IdAlimento AS Id4, NomeAlimento AS Nome4 FROM TbAlimentos) ON Id4 = Alimento4');
    dm.FDQueryTmp.SQL.Add('LEFT JOIN (SELECT IdAlimento AS Id5, NomeAlimento AS Nome5 FROM TbAlimentos) ON Id5 = Alimento5');
    dm.FDQueryTmp.SQL.Add('LEFT JOIN (SELECT IdAlimento AS Id6, NomeAlimento AS Nome6 FROM TbAlimentos) ON Id6 = Alimento6');
    dm.FDQueryTmp.SQL.Add('WHERE DataAgenda = '''+FormatDateTime('YYYY-MM-DD',DateTimePicker1.Date)+''';');
    dm.FDQueryTmp.Open;
    if dm.FDQueryTmp.RecordCount > 0 then
    Begin
      FDQueryCardapio.Edit;
      FDQueryCardapioDia.Value:=dm.FDQueryTmp.FieldByName('DataAgenda').Value;
      if dm.FDQueryTmp.FieldByName('Nome1').Value <> Null then FDQueryCardapioOPC1.Value:=dm.FDQueryTmp.FieldByName('Nome1').Value;
      if dm.FDQueryTmp.FieldByName('Nome2').Value <> Null then FDQueryCardapioOPC2.Value:=dm.FDQueryTmp.FieldByName('Nome2').Value;
      if dm.FDQueryTmp.FieldByName('Nome3').Value <> Null then FDQueryCardapioOPC3.Value:=dm.FDQueryTmp.FieldByName('Nome3').Value;
      if dm.FDQueryTmp.FieldByName('Nome4').Value <> Null then FDQueryCardapioOPC4.Value:=dm.FDQueryTmp.FieldByName('Nome4').Value;
      if dm.FDQueryTmp.FieldByName('Nome5').Value <> Null then FDQueryCardapioOPC5.Value:=dm.FDQueryTmp.FieldByName('Nome5').Value;
      if dm.FDQueryTmp.FieldByName('Nome6').Value <> Null then FDQueryCardapioOPC6.Value:=dm.FDQueryTmp.FieldByName('Nome6').Value;
      FDQueryCardapio.Post;
    End;
  End;
      Memo2.Lines.Clear;
      Memo2.Lines.Add('O cardápio de hoje é:');
      if FDQueryCardapioOPC1.Value <> '' then Memo2.Lines.Add('- *'+FDQueryCardapioOPC1.Value+'*');
      if FDQueryCardapioOPC2.Value <> '' then Memo2.Lines.Add('- *'+FDQueryCardapioOPC2.Value+'*');
      if FDQueryCardapioOPC3.Value <> '' then Memo2.Lines.Add('- *'+FDQueryCardapioOPC3.Value+'*');
      if FDQueryCardapioOPC4.Value <> '' then Memo2.Lines.Add('- *'+FDQueryCardapioOPC4.Value+'*');
      if FDQueryCardapioOPC5.Value <> '' then Memo2.Lines.Add('- *'+FDQueryCardapioOPC5.Value+'*');
      if FDQueryCardapioOPC6.Value <> '' then
      Begin
        Memo2.Lines.Add('');
        Memo2.Lines.Add('Como segunda opção:');
        Memo2.Lines.Add('- *'+FDQueryCardapioOPC6.Value+'*');
      End;
      Memo2.Lines.Add('');
      Memo2.Lines.Add('Pode fazer até 2 trocas, por:');
      Memo2.Lines.Add('- Frango, boi, omelete ou tilápia');
      Memo2.Lines.Add('- Fritas');
      Memo2.Lines.Add('- Alface e tomate');
      Memo2.Lines.Add('');
      Memo2.Lines.Add('Façam suas escolhas até as 10:40hs e informem o tamanho.');
end;

end.

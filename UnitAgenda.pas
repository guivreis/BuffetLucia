unit UnitAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormAgenda = class(TForm)
    DSAgenda: TDataSource;
    FDQueryAgenda: TFDQuery;
    DBGrid1: TDBGrid;
    FDQueryAgendaIdAgenda: TFDAutoIncField;
    FDQueryAgendaAlimento1: TIntegerField;
    FDQueryAgendaAlimento2: TIntegerField;
    FDQueryAgendaAlimento3: TIntegerField;
    FDQueryAgendaAlimento4: TIntegerField;
    FDQueryAgendaAlimento5: TIntegerField;
    FDQueryAgendaAlimento6: TIntegerField;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button3: TButton;
    FDQueryAlimento: TFDQuery;
    FDQueryAgendaNome1: TStringField;
    FDQueryAgendaNome2: TStringField;
    FDQueryAgendaNome3: TStringField;
    FDQueryAgendaNome4: TStringField;
    FDQueryAgendaNome5: TStringField;
    FDQueryAgendaNome6: TStringField;
    FDQueryAgendaDataAgenda: TDateField;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure ComboBox3Click(Sender: TObject);
    procedure ComboBox4Click(Sender: TObject);
    procedure ComboBox5Click(Sender: TObject);
    procedure ComboBox6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAgenda: TFormAgenda;
  Cod1, Cod2, Cod3, Cod4, Cod5, Cod6: String;

implementation
Uses
  UnitDm;

{$R *.dfm}

procedure TFormAgenda.Button1Click(Sender: TObject);
begin
  if DayOfWeek(DateTimePicker1.Date)=2 then DateTimePicker1.Date:=DateTimePicker1.Date-2 else DateTimePicker1.Date:=DateTimePicker1.Date-1;
  DateTimePicker1.DateFormat:=dfLong;
  DateTimePicker1.DateFormat:=dfShort;
  ComboBox1.SetFocus;
end;

procedure TFormAgenda.Button2Click(Sender: TObject);
begin
  if DayOfWeek(DateTimePicker1.Date)=7 then DateTimePicker1.Date:=DateTimePicker1.Date+2 else DateTimePicker1.Date:=DateTimePicker1.Date+1;
  DateTimePicker1.DateFormat:=dfLong;
  DateTimePicker1.DateFormat:=dfShort;
  ComboBox1.SetFocus;
end;

procedure TFormAgenda.Button3Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex=-1 then Cod1:='NULL';
  if ComboBox2.ItemIndex=-1 then Cod2:='NULL';
  if ComboBox3.ItemIndex=-1 then Cod3:='NULL';
  if ComboBox4.ItemIndex=-1 then Cod4:='NULL';
  if ComboBox5.ItemIndex=-1 then Cod5:='NULL';
  if ComboBox6.ItemIndex=-1 then Cod6:='NULL';
  dm.Limpa;
  dm.FDQueryTmp.SQL.Add('INSERT INTO TbAgenda (IdAgenda, DataAgenda, Alimento1, Alimento2, Alimento3, Alimento4, Alimento5, Alimento6) VALUES');
  dm.FDQueryTmp.SQL.Add('(NULL, '''+FormatDateTime('YYYY-MM-DD',DateTimePicker1.Date)+''', '+Cod1+', '+Cod2+', '+Cod3+', '+Cod4+', '+Cod5+', '+Cod6+');');
  dm.FDQueryTmp.Prepare;
  dm.FDQueryTmp.ExecSQL;
  FDQueryAgenda.Refresh;
  if DayOfWeek(DateTimePicker1.Date)=7 then DateTimePicker1.Date:=DateTimePicker1.Date+2 else DateTimePicker1.Date:=DateTimePicker1.Date+1;
  DateTimePicker1.DateFormat:=dfLong;
  DateTimePicker1.DateFormat:=dfShort;
  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf('Arroz');
  if ComboBox1.ItemIndex <> -1 then Cod1:=IntToStr(Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]));
  ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf('Feijão');
  if ComboBox2.ItemIndex <> -1 then Cod2:=IntToStr(Integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex]));
  ComboBox3.ItemIndex:=-1;
  ComboBox4.ItemIndex:=-1;
  ComboBox5.ItemIndex:=ComboBox5.Items.IndexOf('Salada');
  if ComboBox5.ItemIndex <> -1 then Cod5:=IntToStr(Integer(ComboBox5.Items.Objects[ComboBox5.ItemIndex]));
  ComboBox6.ItemIndex:=-1;
  ComboBox1.SetFocus;
end;

procedure TFormAgenda.Button4Click(Sender: TObject);
Var
  Msg: String;
begin
  Msg:='Confirma a exclusão da agenda do dia '+FormatDateTime('DD/MM/YYYY',FDQueryAgendaDataAgenda.Value)+'?';
  if Application.MessageBox(PChar(Msg),'Excluir agenda',mb_yesno+mb_defbutton2) = id_yes then
  Begin
    dm.FDQueryTmp.Close;
    dm.FDQueryTmp.SQL.Clear;
    dm.FDQueryTmp.SQL.Add('DELETE FROM TbAgenda WHERE IdAgenda = '+FDQueryAgendaIdAgenda.AsString+';');
    dm.FDQueryTmp.Prepare;
    dm.FDQueryTmp.ExecSQL;
    dm.FDQueryTmp.Close;
    FDQueryAgenda.Refresh;
  End;
end;

procedure TFormAgenda.ComboBox1Click(Sender: TObject);
var
  Idx: Integer;
  Value: Integer;
begin
  Idx := ComboBox1.ItemIndex;
  if Idx <> -1 then
  begin
    Value := Integer(ComboBox1.Items.Objects[Idx]);
    Cod1:=IntToStr(Value);
  end;
end;

procedure TFormAgenda.ComboBox2Click(Sender: TObject);
var
  Idx: Integer;
  Value: Integer;
begin
  Idx := ComboBox2.ItemIndex;
  if Idx <> -1 then
  begin
    Value := Integer(ComboBox2.Items.Objects[Idx]);
    Cod2:=IntToStr(Value);
  end;
end;

procedure TFormAgenda.ComboBox3Click(Sender: TObject);
var
  Idx: Integer;
  Value: Integer;
begin
  Idx := ComboBox3.ItemIndex;
  if Idx <> -1 then
  begin
    Value := Integer(ComboBox3.Items.Objects[Idx]);
    Cod3:=IntToStr(Value);
  end;
end;

procedure TFormAgenda.ComboBox4Click(Sender: TObject);
var
  Idx: Integer;
  Value: Integer;
begin
  Idx := ComboBox4.ItemIndex;
  if Idx <> -1 then
  begin
    Value := Integer(ComboBox4.Items.Objects[Idx]);
    Cod4:=IntToStr(Value);
  end;
end;

procedure TFormAgenda.ComboBox5Click(Sender: TObject);
var
  Idx: Integer;
  Value: Integer;
begin
  Idx := ComboBox5.ItemIndex;
  if Idx <> -1 then
  begin
    Value := Integer(ComboBox5.Items.Objects[Idx]);
    Cod5:=IntToStr(Value);
  end;
end;

procedure TFormAgenda.ComboBox6Click(Sender: TObject);
var
  Idx: Integer;
  Value: Integer;
begin
  Idx := ComboBox6.ItemIndex;
  if Idx <> -1 then
  begin
    Value := Integer(ComboBox6.Items.Objects[Idx]);
    Cod6:=IntToStr(Value);
  end;
end;

procedure TFormAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQueryAgenda.Close;
end;

procedure TFormAgenda.FormShow(Sender: TObject);
Var
  sItem: String;
  i: Integer;
begin
  FDQueryAgenda.Open;
  FDQueryAgenda.FetchAll;
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  ComboBox3.Items.Clear;
  ComboBox4.Items.Clear;
  ComboBox5.Items.Clear;
  ComboBox6.Items.Clear;
  dm.Limpa;
  dm.FDQueryTmp.SQL.Add('SELECT IdAlimento, NomeAlimento FROM TbAlimentos ORDER BY NomeAlimento;');
  dm.FDQueryTmp.Open;
  dm.FDQueryTmp.FetchAll;
  while not dm.FDQueryTmp.EOF do
  Begin
    sItem:=dm.FDQueryTmp.FieldByName('NomeAlimento').Value;
    i:=dm.FDQueryTmp.FieldByName('IdAlimento').Value;
    ComboBox1.Items.AddObject(sItem, TObject(i));
    ComboBox2.Items.AddObject(sItem, TObject(i));
    ComboBox3.Items.AddObject(sItem, TObject(i));
    ComboBox4.Items.AddObject(sItem, TObject(i));
    ComboBox5.Items.AddObject(sItem, TObject(i));
    ComboBox6.Items.AddObject(sItem, TObject(i));
    dm.FDQueryTmp.Next;
  End;
  dm.Limpa;
  dm.FDQueryTmp.SQL.Add('SELECT DataAgenda FROM TbAgenda ORDER BY DataAgenda;');
  dm.FDQueryTmp.Open;
  dm.FDQueryTmp.FetchAll;
  dm.FDQueryTmp.Last;
  DateTimePicker1.Date:=dm.FDQueryTmp.FieldByName('DataAgenda').AsDateTime;
  if DayOfWeek(DateTimePicker1.Date)=7 then DateTimePicker1.Date:=DateTimePicker1.Date+2 else DateTimePicker1.Date:=DateTimePicker1.Date+1;
  if DateTimePicker1.Date<Date then DateTimePicker1.Date:=Date;
  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf('Arroz');
  if ComboBox1.ItemIndex <> -1 then Cod1:=IntToStr(Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]));
  ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf('Feijão');
  if ComboBox2.ItemIndex <> -1 then Cod2:=IntToStr(Integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex]));
  ComboBox5.ItemIndex:=ComboBox5.Items.IndexOf('Salada');
  if ComboBox5.ItemIndex <> -1 then Cod5:=IntToStr(Integer(ComboBox5.Items.Objects[ComboBox5.ItemIndex]));
  ComboBox1.SetFocus;
end;

end.

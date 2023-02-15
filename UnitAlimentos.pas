unit UnitAlimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.Buttons;

type
  TFormAlimentos = class(TForm)
    DSAlimentos: TDataSource;
    FDQueryAlimentos: TFDQuery;
    DBGrid1: TDBGrid;
    FDQueryAlimentosIdAlimento: TFDAutoIncField;
    FDQueryAlimentosNomeAlimento: TWideStringField;
    FDQueryAlimentosTipo: TIntegerField;
    FDQueryAlimentosAtivo: TBooleanField;
    LabeledEdit1: TLabeledEdit;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Label1: TLabel;
    Button1: TButton;
    SearchBox1: TSearchBox;
    SpeedButton8: TSpeedButton;
    FDQueryTipos: TFDQuery;
    FDQueryAlimentosNomeTipo: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure SearchBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAlimentos: TFormAlimentos;

implementation
Uses
  UnitDm;

{$R *.dfm}

procedure TFormAlimentos.Button1Click(Sender: TObject);
Var
  Tipo: String;
begin
  if RadioButton1.Checked = True then Tipo:='1';
  if RadioButton2.Checked = True then Tipo:='2';
  if RadioButton3.Checked = True then Tipo:='3';
  if RadioButton4.Checked = True then Tipo:='4';
  if RadioButton5.Checked = True then Tipo:='5';
  if RadioButton6.Checked = True then Tipo:='6';
  dm.Limpa;
  dm.FDQueryTmp.SQL.Add('INSERT INTO TbAlimentos (IdAlimento, NomeAlimento, Tipo, Ativo) VALUES');
  dm.FDQueryTmp.SQL.Add('(NULL, '''+LabeledEdit1.Text+''', '+Tipo+', 1);');
  dm.FDQueryTmp.Prepare;
  dm.FDQueryTmp.ExecSQL;
  FDQueryAlimentos.Refresh;
  LabeledEdit1.Text:='';
  LabeledEdit1.SetFocus;
end;

procedure TFormAlimentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQueryAlimentos.Close;
  dm.FDQueryTmp.Close;
  FDQueryTipos.Close;
end;

procedure TFormAlimentos.FormShow(Sender: TObject);
begin
  FDQueryAlimentos.Open;
  FDQueryAlimentos.FetchAll;
  FDQueryTipos.Open;
  SearchBox1.SetFocus;
end;

procedure TFormAlimentos.SearchBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  Procura: String;
  SQL: String;
  i: Integer;
begin
  Procura:='';
  if SearchBox1.Text<>'' then
  Begin
    Procura:=SearchBox1.Text;
    Procura:='%'+Procura+'%';
    SQL:='SELECT * FROM TbAlimentos WHERE NomeAlimento LIKE '+QuotedStr(Procura)+' COLLATE NOCASE ORDER BY Tipo, UPPER(NomeAlimento);';
    FDQueryAlimentos.Close;
    FDQueryAlimentos.SQL.Clear;
    FDQueryAlimentos.SQL.Add(SQL);
    FDQueryAlimentos.Open;
    FDQueryAlimentos.FetchAll;
  End
  else
  Begin
    FDQueryAlimentos.Close;
    FDQueryAlimentos.SQL.Clear;
    FDQueryAlimentos.SQL.Add('SELECT * FROM TbAlimentos ORDER BY Tipo, NomeAlimento;');
    FDQueryAlimentos.Open;
    FDQueryAlimentos.FetchAll;
  End;
end;

procedure TFormAlimentos.SpeedButton8Click(Sender: TObject);
begin
  FDQueryAlimentos.Close;
  FDQueryAlimentos.SQL.Clear;
  FDQueryAlimentos.SQL.Add('SELECT * FROM TbAlimentos ORDER BY Tipo, NomeAlimento;');
  FDQueryAlimentos.Open;
  FDQueryAlimentos.FetchAll;
end;

end.

unit UnitNovaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormNovaPessoa = class(TForm)
    LabeledEdit1: TLabeledEdit;
    Panel1: TPanel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Panel2: TPanel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNovaPessoa: TFormNovaPessoa;

implementation
Uses
  UnitDm, UnitPessoas;

{$R *.dfm}

procedure TFormNovaPessoa.Button1Click(Sender: TObject);
Var
  Recorrencia, Tamanho: String;
begin
  if CheckBox1.Checked = True then Recorrencia:='1' else Recorrencia:='0';
  if CheckBox2.Checked = True then Recorrencia:=Recorrencia + '1' else Recorrencia:=Recorrencia + '0';
  if CheckBox3.Checked = True then Recorrencia:=Recorrencia + '1' else Recorrencia:=Recorrencia + '0';
  if CheckBox4.Checked = True then Recorrencia:=Recorrencia + '1' else Recorrencia:=Recorrencia + '0';
  if CheckBox5.Checked = True then Recorrencia:=Recorrencia + '1' else Recorrencia:=Recorrencia + '0';
  if CheckBox6.Checked = True then Recorrencia:=Recorrencia + '1' else Recorrencia:=Recorrencia + '0';
  if CheckBox7.Checked = True then Recorrencia:=Recorrencia + '1' else Recorrencia:=Recorrencia + '0';
  if RadioButton1.Checked = True then Tamanho:='P' else Tamanho:='G';
  dm.Limpa;
  dm.FDQueryTmp.SQL.Add('INSERT INTO TbPessoas (IdPessoa, NomePessoa, Recorrencia, TamanhoPadrao, Ativa) VALUES');
  dm.FDQueryTmp.SQL.Add('(NULL, '''+LabeledEdit1.Text+''', '''+Recorrencia+''', '''+Tamanho+''', 1);');
  dm.FDQueryTmp.Prepare;
  dm.FDQueryTmp.ExecSQL;
  FormPessoas.FDQueryPessoas.Refresh;
  LabeledEdit1.Text:='';
  LabeledEdit1.SetFocus;
end;

procedure TFormNovaPessoa.Button2Click(Sender: TObject);
begin
  FormNovaPessoa.Close;
end;

procedure TFormNovaPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormNovaPessoa.Release;
  FormNovaPessoa:=nil;
end;

procedure TFormNovaPessoa.FormShow(Sender: TObject);
begin
  LabeledEdit1.SetFocus;
end;

end.

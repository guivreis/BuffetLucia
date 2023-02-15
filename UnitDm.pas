unit UnitDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  Tdm = class(TDataModule)
    DSTemp: TDataSource;
    FDQueryTmp: TFDQuery;
    FDConnection1: TFDConnection;
  private
    { Private declarations }
  public
    procedure Limpa;
    { Public declarations }
  end;

var
  dm: Tdm;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.Limpa;
Begin
  FDQueryTmp.Close;
  FDQueryTmp.SQL.Clear;
End;

end.

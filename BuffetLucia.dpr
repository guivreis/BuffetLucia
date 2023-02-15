program BuffetLucia;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitDm in 'UnitDm.pas' {dm: TDataModule},
  UnitPessoas in 'UnitPessoas.pas' {FormPessoas},
  UnitNovaPessoa in 'UnitNovaPessoa.pas' {FormNovaPessoa},
  UnitAlimentos in 'UnitAlimentos.pas' {FormAlimentos},
  UnitAgenda in 'UnitAgenda.pas' {FormAgenda},
  UnitPedido in 'UnitPedido.pas' {FormPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFormPedido, FormPedido);
  Application.Run;
end.

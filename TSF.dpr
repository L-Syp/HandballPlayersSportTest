program TSF;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  UnitLiczPunkty in 'UnitLiczPunkty.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Test Sprawnoœci Fizycznej';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

unit UnitOperacjeNaPlikach;

interface
uses  Windows, SysUtils, Forms,
  Dialogs, Buttons, IniFiles, Menus, StdCtrls, Controls, Classes;



 type
  TForm1 = class(TForm)
    SpdBtnNastepny: TSpeedButton;
    SpdBtnPoprzedni: TSpeedButton;
    MainMenu: TMainMenu;
    MenuPlik: TMenuItem;
    MenuNowy: TMenuItem;
    MenuOtworz: TMenuItem;
    MenuZapisz: TMenuItem;
    MenuZapiszJako: TMenuItem;
    MenuSeparator1: TMenuItem;
    MenuZakoncz: TMenuItem;
    MenuBaza: TMenuItem;
    MenuDodajZawodnika: TMenuItem;
    MenuUsunZawodnika: TMenuItem;
    MenuPomoc: TMenuItem;
    MenuOProgramie: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    Label1: TLabel;
    Label2: TLabel;
    EditImie: TEdit;
    EditNazwisko: TEdit;
    Edit30mCzas: TEdit;
    Edit30mPunkty: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditLekarskaPrzodem: TEdit;
    EditLekarskaTylem: TEdit;
    EditLekarskaSuma: TEdit;
    EditLekarskaPunkty: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EditRecznaPunkty: TEdit;
    EditRecznaWynik: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    EditPiecioskokWynik: TEdit;
    EditPiecioskokPunkty: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    EditKopertaPunkty: TEdit;
    EditKopertaCzas: TEdit;
    BtnZapisz: TButton;
    lRekord: TLabel;

   procedure Inicjalizacja;
  procedure WczytajPlikIni;
  procedure ZapiszPlikIni;
  procedure UstawDomyslnyRozmiarOkna;
  procedure NowaBaza;
  procedure NowyZawodnik;
  procedure Zapisz;
  procedure Otworz(Rekord : Integer);
  procedure WyczyscForme;
  procedure ZmienEtykiete;
  end;
implementation
 uses Unit1;

 procedure Otworz(Rekord: Integer);
  var
    Baza : PlikBazy;
    Zawodnik : TZawodnik;
    begin
      If CzyPokazacDialog = true then
        begin
          OpenDialog.Execute();
          SciezkaPliku := OpenDialog.FileName;
        end;
      If SciezkaPliku <> '' then
        begin
          AssignFile(Baza, SciezkaPliku);
          ReSet(Baza);
          Seek(Baza, Rekord);
          Read(Baza, Zawodnik);
        With Zawodnik do
            begin
              EditImie.Text := Imie;
              EditNazwisko.Text := Nazwisko;
              Edit30mCzas.text:= FloatToStr(Na30m.Czas);
              Edit30mPunkty.Text:= IntToStr(Na30m.Wynik);
              EditLekarskaPrzodem.Text:= FloatToStr(Lekarska.Przodem);
              EditLekarskaTylem.Text:= FloatToStr(Lekarska.Tylem);
              EditLekarskaSuma.Text:= FloatToStr(Lekarska.Suma);
              EditLekarskaPunkty.Text:= IntToStr(Lekarska.Wynik);
              EditKopertaCzas.Text:= FloatToStr(Koperta.Czas);
              EditKopertaPunkty.Text:= IntToStr(Koperta.Wynik);
              EditPiecioskokWynik.text:= FloatToStr(Piecioskok.Odleglosc);
              EditPiecioskokPunkty.Text:= IntToStr(Piecioskok.Wynik);
              EditRecznaWynik.Text:= FloatToStr(Reczna.Odleglosc);
              EditRecznaPunkty.Text:= IntToStr(Reczna.Wynik);
            end;
      IloscRekordow := (FileSize(Baza));
      ZmienEtykiete;
      Caption := ExtractFileName(SciezkaPliku) + ' - ' + AppName;
      CloseFile(Baza);
      end;
      
end;

end.

unit Unit1;

interface

uses
  Windows, SysUtils, Forms,
  Dialogs, Buttons, IniFiles, Menus, StdCtrls, UnitLiczPunkty, Controls, Classes,
  jpeg, ExtCtrls, ComCtrls;

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
    MenuZamknijBaze: TMenuItem;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuOProgramieClick(Sender: TObject);
    procedure MenuZakonczClick(Sender: TObject);
    procedure MenuNowyClick(Sender: TObject);
    procedure EditImieChange(Sender: TObject);
    procedure MenuZapiszClick(Sender: TObject);
    procedure MenuDodajZawodnikaClick(Sender: TObject);
    procedure MenuOtworzClick(Sender: TObject);
    procedure SpdBtnPoprzedniClick(Sender: TObject);
    procedure SpdBtnNastepnyClick(Sender: TObject);
    procedure MenuZamknijBazeClick(Sender: TObject);
  private
   procedure Inicjalizacja;
   procedure WczytajPlikIni;
   procedure ZapiszPlikIni;
   procedure UstawDomyslnyRozmiarOkna;
   procedure NowaBaza;
   procedure NowyZawodnik;
   procedure Zapisz;
   procedure Otworz(Rekord : Integer);
   procedure ZamknijBaze;
   procedure WyczyscForme;
   procedure ZmienEtykiete;
  public
    { Public declarations }
  end;

  Punkty = 0..80;

  TBiegNa30m = packed record
    Czas : single;
    Wynik : Punkty;
  end;

  TRzutLekarska = packed record
    Przodem, Tylem, Suma : single;
    Wynik : Punkty;
  end;

  TPiecioskok = packed record
    Odleglosc : single;
    Wynik : Punkty;
  end;

  TRzutReczna = packed record
    Odleglosc : single;
    Wynik : Punkty;
  end;

  TKoperta = packed record
    Czas : single;
    Wynik : Punkty;
  end;

  TZawodnik = packed record
    Imie, Nazwisko : string[15];
    Na30m : TBiegNa30m;
    Lekarska : TRzutLekarska;
    Piecioskok : TPiecioskok;
    Reczna : TRzutReczna;
    Koperta : TKoperta;
  end;

  PlikBazy = File of TZawodnik; //Plik typowany

var
  Form1: TForm1;

implementation

uses Unit2;

const
  AppName = 'TSF Modu³ Zapisu 0.95'; //Nazwa Aplikacji

var
  SciezkaPliku : String;
  NumerRekordu, IloscRekordow : Integer;
  CzyPokazacDialog : Boolean;
{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject); // Przy
  begin                                         //uruchomieiu
    WczytajPlikIni;
    Inicjalizacja;
  end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
  begin                      // Przy zamkniêciu programu
    ZapiszPlikIni;
  end;

procedure TForm1.Inicjalizacja; // Przy w³¹czaniu
  Var
    Wybor : Integer;
  begin
    StatusBar1.SimpleText := 'Baza nie jest otwarta';
    UstawDomyslnyRozmiarOkna;
    NumerRekordu := 0;
    IloscRekordow := 0;
    If SciezkaPliku = '' then
    Form1.Caption := '[Bez Nazwy]' + ' - ' + AppName
    else
      if FileExists(SciezkaPliku) then
        begin
          CzyPokazacDialog := False;
          Otworz(0);
          ZmienEtykiete;
          Form1.Caption := ExtractFileName(SciezkaPliku) + ' - ' + AppName;
          MenuZamknijBaze.Enabled := True;
          //Otworzenie Pliku
        end
      else
        begin
          MessageBox(Handle, Pchar('Plik: ' + ExtractFileName(SciezkaPliku) + ' zosta³ usuniêty lub przenesiony!'), 'Brak pliku!', MB_OK);
          Wybor :=  MessageBox(Handle, Pchar('Czy w zwi¹zku z tym, ¿e plik usuniêto lub przeniesiono chcesz stworzyæ now¹ bazê?'), 'Czy chcesz stworzyæ now¹ bazê?', MB_YESNO);
          If Wybor = IDYES then
            NowaBaza 
          else
            begin
                SciezkaPliku := '';
                Form1.Caption := '[Bez Nazwy]' + ' - ' + AppName;
                ZmienEtykiete;
            end;
        end;
end;



procedure TForm1.Otworz(Rekord: Integer);
  var
    Baza : PlikBazy;
    Zawodnik : TZawodnik;
  begin
    If CzyPokazacDialog = true then
      begin
        OpenDialog.Execute();
        SciezkaPliku := OpenDialog.FileName;
        MenuZamknijBaze.Enabled := True;
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

procedure TForm1.SpdBtnNastepnyClick(Sender: TObject);
begin 
  CzyPokazacDialog := False;
  NumerRekordu := NumerRekordu + 1;
  If (NumerRekordu + 1) > IloscRekordow then
    begin
      MessageBox(handle, Pchar('Ogl¹dasz ostatni rekord!'), 'Nie ma takiego rekordu!',MB_OK + MB_ICONERROR);
      NumerRekordu := NumerRekordu - 1;
    end
    else
      Otworz(NumerRekordu);
end;

procedure TForm1.SpdBtnPoprzedniClick(Sender: TObject);
begin
  CzyPokazacDialog := False;
  NumerRekordu := NumerRekordu - 1;
  If NumerRekordu < 0 then
    begin
      MessageBox(handle, Pchar('Ogl¹dasz pierwszy rekord!'), 'Nie ma takiego rekordu!',MB_OK + MB_ICONERROR);
      NumerRekordu := NumerRekordu + 1;
    end
    else
      Otworz(NumerRekordu);
end;


procedure TForm1.ZamknijBaze;
begin
  If BtnZapisz.Enabled = True then
    begin
      Zapisz;
      WyczyscForme;
      Form1.Caption := '[Bez Nazwy]' + ' - ' + AppName;
      SciezkaPliku := '';
      StatusBar1.SimpleText := 'Baza nie jest otwarta';
      MenuZamknijBaze.Enabled := False;
    end
  else
    begin
      if EditImie.text = '' then
        EditImie.Text := 'Imie';
         if EditNazwisko.text = '' then
      EditNazwisko.Text := 'Nazwisko';
         if Edit30mCzas.text = '' then
      Edit30mCzas.text := '0';
         if Edit30mPunkty.text = '' then
      Edit30mPunkty.Text := '0';
         if EditLekarskaPrzodem.text = '' then
      EditLekarskaPrzodem.Text := '0';
         if EditLekarskaTylem.text = '' then
      EditLekarskaTylem.Text := '0';
         if EditLekarskaSuma.text = '' then
      EditLekarskaSuma.Text := '0';
         if EditLekarskaPunkty.text = '' then
      EditLekarskaPunkty.Text := '0';
         if EditKopertaCzas.text = '' then
      EditKopertaCzas.Text := '0';
         if EditKopertaPunkty.text = '' then
      EditKopertaPunkty.Text := '0';
         if EditPiecioskokWynik.text = '' then
      EditPiecioskokWynik.text := '0';
         if EditPiecioskokPunkty.text = '' then
      EditPiecioskokPunkty.Text := '0';
         if EditRecznaWynik.text = '' then
      EditRecznaWynik.Text := '0';
         if EditRecznaPunkty.text = '' then
      EditRecznaPunkty.Text := '0';

      Zapisz;
      WyczyscForme;
      Form1.Caption := '[Bez Nazwy]' + ' - ' + AppName;
      SciezkaPliku := '';
      StatusBar1.SimpleText := 'Baza nie jest otwarta';
      MenuZamknijBaze.Enabled := False;
    end;
end;

procedure TForm1.Zapisz;
  var
    Baza : PlikBazy;
    Zawodnik : TZawodnik;
begin
  If SciezkaPliku = '' then
    begin
      SaveDialog.Execute();
      SciezkaPliku := SaveDialog.FileName;
    end;
  AssignFile(Baza, SciezkaPliku);
  If not FileExists(SciezkaPliku) then
    Rewrite(Baza) else
    ReSet(Baza);
  try
    Seek(Baza, NumerRekordu);
    With Zawodnik do
      begin
        Imie := EditImie.Text;
        Nazwisko := EditNazwisko.Text;
        Na30m.Czas := StrToFloat(Edit30mCzas.text);
        Na30m.Wynik := Punkty30m(Na30m.Czas);
        Lekarska.Przodem := StrToInt(EditLekarskaPrzodem.Text);
        Lekarska.Tylem := StrToInt(EditLekarskaTylem.Text);
        Lekarska.Suma  := Lekarska.Przodem + Lekarska.Tylem;
        Lekarska.Wynik := StrToInt(EditLekarskaPunkty.text);
        Koperta.Czas := StrToFloat(EditKopertaCzas.Text);
        Koperta.Wynik := StrToInt(EditKopertaPunkty.Text);
        Piecioskok.Odleglosc := StrToFloat(EditPiecioskokWynik.text);
        Piecioskok.Wynik := StrToInt(EditPiecioskokPunkty.Text);
        Reczna.Odleglosc := StrToFloat(EditRecznaWynik.Text);
        Reczna.Wynik := StrToInt(EditRecznaPunkty.Text);
      end;
    Write(Baza, Zawodnik);
  finally
    begin
      IloscRekordow := (FileSize(Baza));
      ZmienEtykiete;
      Caption := ExtractFileName(SciezkaPliku) + ' - ' + AppName;
      CloseFile(Baza);
    end;
  end;
end;


procedure TForm1.NowaBaza;
  var
    Baza : PlikBazy;
begin
  SaveDialog.Execute();
  SciezkaPliku := SaveDialog.FileName;
  AssignFile(Baza, SciezkaPliku);
  Caption := ExtractFileName(SciezkaPliku) + ' - ' + AppName;
  Rewrite(Baza);
  IloscRekordow := (FileSize(Baza)) + 1;
  ZmienEtykiete;
  CloseFile(Baza);
  MenuZamknijBaze.Enabled := True;
end; 

 procedure TForm1.NowyZawodnik;
  var
    Wybor : integer;
    Baza : PlikBazy;
begin
  WyczyscForme;
  If SciezkaPliku = '' then
    Wybor :=  MessageBox(handle, Pchar('¯eby dodaæ zawodnika musisz stworzyæ now¹ lub otworztæ isniej¹c¹ bazê! \n Chcesz to zrobiæ?'), 'Brak bazy!', MB_YESNO);
  If Wybor = IDYES then
    NowaBaza;

    AssignFile(Baza, SciezkaPliku);
    Reset(Baza);

    NumerRekordu := FileSize(Baza);
    if  NumerRekordu > 0 then
      Seek(Baza, NumerRekordu);

    Write(Baza);
    IloscRekordow := (FileSize(Baza)) + 1;
    ZmienEtykiete;
    CloseFile(Baza);
end;



 procedure TForm1.WyczyscForme;
begin
  EditImie.Text := '';
  EditNazwisko.Text := '';
  Edit30mCzas.text := '';
  Edit30mPunkty.Text := '';
  EditLekarskaPrzodem.Text := '';
  EditLekarskaTylem.Text := '';
  EditLekarskaSuma.Text := '';
  EditLekarskaPunkty.Text := '';
  EditKopertaCzas.Text := '';
  EditKopertaPunkty.Text := '';
  EditPiecioskokWynik.text := '';
  EditPiecioskokPunkty.Text := '';
  EditRecznaWynik.Text := '';
  EditRecznaPunkty.Text := '';
end;


procedure TForm1.EditImieChange(Sender: TObject);
begin
  if TEdit(Sender).text = '' then
    begin
      MenuZapisz.Enabled := False;
      MenuZapiszJako.Enabled := False;
      BtnZapisz.Enabled := False;
    end
  Else
    if (EditImie.Text <> '') and (Edit30mCzas.Text <> '') and (Edit30mCzas.Text <> '') and (EditLekarskaPrzodem.Text <> '') and (EditLekarskaTylem.Text <> '')  and (EditLekarskaPunkty.Text <> '') and (EditRecznaWynik.Text <> '') and (EditRecznaPunkty.Text <> '') and (EditPiecioskokWynik.Text <> '') and (EditPiecioskokPunkty.Text <> '') and (EditKopertaCzas.Text <> '') and (EditKopertaPunkty.Text <> '') then
      begin
        MenuZapisz.Enabled := True;
        MenuZapiszJako.Enabled := True;
        BtnZapisz.Enabled := True;
      end;
end;


 procedure TForm1.ZmienEtykiete;
begin
  StatusBar1.SimpleText := 'Rekord: ' + IntToStr(NumerRekordu+1) + '/' + IntToStr(IloscRekordow);
end;


procedure TForm1.UstawDomyslnyRozmiarOkna;
begin
   Width := 395;
   Height := 425;

   SpdBtnPoprzedni.Top := Form1.ClientHeight - 50;
   SpdBtnNastepny.Top := Form1.ClientHeight - 50;
   BtnZapisz.Top := Form1.ClientHeight - 50;

   SpdBtnPoprzedni.Left := (Form1.ClientWidth div 2) - 15;
   SpdBtnNastepny.Left := (Form1.ClientWidth div 2) + 15;
   BtnZapisz.Left := Form1.ClientWidth - 80;
end;



procedure TForm1.MenuDodajZawodnikaClick(Sender: TObject);
begin
  WyczyscForme;
  NowyZawodnik;
end;


procedure TForm1.MenuNowyClick(Sender: TObject);
begin
  NowaBaza;
end;


procedure TForm1.MenuOProgramieClick(Sender: TObject);
begin
   Form2.Show;
end;


procedure TForm1.MenuOtworzClick(Sender: TObject);
begin
  CzyPokazacDialog := True;
  Otworz(0);
end;


procedure TForm1.MenuZakonczClick(Sender: TObject);
begin
  Close;
end;


procedure TForm1.MenuZamknijBazeClick(Sender: TObject);
begin
  ZamknijBaze;
end;

procedure TForm1.MenuZapiszClick(Sender: TObject);
begin
  Zapisz;
  Otworz(NumerRekordu);
end;



procedure TForm1.ZapiszPlikIni;
var PlikIni : TIniFile;
begin
  PlikIni := TIniFile.Create('C:\TSF_config.ini');
  PlikIni.WriteInteger ('Okno','Pionowe_Polozenie_Okna',Top);
  PlikIni.WriteInteger ('Okno','Poziome_Polozenie_Okna',Left);
  PlikIni.WriteString  ('Plik','Sciezka',SciezkaPliku);
  PlikIni.Free;
end;

procedure TForm1.WczytajPlikIni;
  var PlikIni : TIniFile;
begin
   PlikIni := TIniFile.Create('C:\TSF_config.ini');
   Top := PlikIni.ReadInteger('Okno','Pionowe_Polozenie_Okna',Top);
   Left := PlikIni.ReadInteger('Okno','Poziome_Polozenie_Okna',Left);
   SciezkaPliku := PlikIni.ReadString('Plik','Sciezka',SciezkaPliku);
   PlikIni.Free;
end;

end.

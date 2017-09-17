object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 410
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpdBtnNastepny: TSpeedButton
    Left = 208
    Top = 335
    Width = 23
    Height = 22
    Caption = '>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpdBtnNastepnyClick
  end
  object SpdBtnPoprzedni: TSpeedButton
    Left = 155
    Top = 335
    Width = 23
    Height = 22
    Caption = '<<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpdBtnPoprzedniClick
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Imi'#281':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 35
    Width = 55
    Height = 13
    Caption = 'Nazwisko:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 105
    Height = 13
    Caption = 'Bieg na 30 metr'#243'w'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 101
    Width = 27
    Height = 13
    Caption = 'Czas:'
  end
  object Label5: TLabel
    Left = 8
    Top = 133
    Width = 51
    Height = 13
    Caption = 'Punktacja:'
  end
  object Label6: TLabel
    Left = 240
    Top = 8
    Width = 109
    Height = 13
    Caption = 'Rzut pi'#322'k'#261' lekarsk'#261
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 240
    Top = 47
    Width = 45
    Height = 13
    Caption = 'Przodem:'
  end
  object Label8: TLabel
    Left = 240
    Top = 72
    Width = 33
    Height = 13
    Caption = 'Ty'#322'em:'
  end
  object Label9: TLabel
    Left = 240
    Top = 101
    Width = 30
    Height = 13
    Caption = 'Suma:'
  end
  object Label10: TLabel
    Left = 240
    Top = 133
    Width = 51
    Height = 13
    Caption = 'Punktacja:'
  end
  object Label11: TLabel
    Left = 240
    Top = 168
    Width = 98
    Height = 13
    Caption = 'Rzut pi'#322'k'#261' r'#281'czn'#261
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 240
    Top = 200
    Width = 51
    Height = 13
    Caption = 'Odleg'#322'o'#347#263':'
  end
  object Label13: TLabel
    Left = 240
    Top = 230
    Width = 51
    Height = 13
    Caption = 'Punktacja:'
  end
  object Label14: TLabel
    Left = 8
    Top = 200
    Width = 51
    Height = 13
    Caption = 'Odleg'#322'o'#347#263':'
  end
  object Label15: TLabel
    Left = 8
    Top = 168
    Width = 60
    Height = 13
    Caption = 'Pi'#281'cioskok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 8
    Top = 230
    Width = 51
    Height = 13
    Caption = 'Punktacja:'
  end
  object Label17: TLabel
    Left = 8
    Top = 260
    Width = 45
    Height = 13
    Caption = 'Koperta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label18: TLabel
    Left = 8
    Top = 290
    Width = 27
    Height = 13
    Caption = 'Czas:'
  end
  object Label19: TLabel
    Left = 8
    Top = 317
    Width = 51
    Height = 13
    Caption = 'Punktacja:'
  end
  object EditImie: TEdit
    Left = 69
    Top = 5
    Width = 106
    Height = 21
    MaxLength = 15
    TabOrder = 0
    OnChange = EditImieChange
  end
  object EditNazwisko: TEdit
    Left = 69
    Top = 32
    Width = 106
    Height = 21
    MaxLength = 15
    TabOrder = 1
    OnChange = EditImieChange
  end
  object Edit30mCzas: TEdit
    Left = 72
    Top = 98
    Width = 41
    Height = 21
    MaxLength = 5
    TabOrder = 2
    OnChange = EditImieChange
  end
  object Edit30mPunkty: TEdit
    Left = 72
    Top = 125
    Width = 41
    Height = 21
    TabStop = False
    MaxLength = 2
    ReadOnly = True
    TabOrder = 13
    OnChange = EditImieChange
  end
  object EditLekarskaPrzodem: TEdit
    Left = 303
    Top = 44
    Width = 41
    Height = 21
    MaxLength = 5
    TabOrder = 5
    OnChange = EditImieChange
  end
  object EditLekarskaTylem: TEdit
    Left = 303
    Top = 71
    Width = 41
    Height = 21
    MaxLength = 5
    TabOrder = 6
    OnChange = EditImieChange
  end
  object EditLekarskaSuma: TEdit
    Left = 303
    Top = 98
    Width = 41
    Height = 21
    TabStop = False
    MaxLength = 5
    TabOrder = 11
    OnChange = EditImieChange
  end
  object EditLekarskaPunkty: TEdit
    Left = 303
    Top = 125
    Width = 41
    Height = 21
    TabStop = False
    MaxLength = 2
    TabOrder = 10
    OnChange = EditImieChange
  end
  object EditRecznaPunkty: TEdit
    Left = 303
    Top = 227
    Width = 41
    Height = 21
    TabStop = False
    MaxLength = 2
    TabOrder = 9
    OnChange = EditImieChange
  end
  object EditRecznaWynik: TEdit
    Left = 303
    Top = 192
    Width = 41
    Height = 21
    MaxLength = 5
    TabOrder = 7
    OnChange = EditImieChange
  end
  object EditPiecioskokWynik: TEdit
    Left = 72
    Top = 192
    Width = 41
    Height = 21
    MaxLength = 5
    TabOrder = 3
    OnChange = EditImieChange
  end
  object EditPiecioskokPunkty: TEdit
    Left = 72
    Top = 227
    Width = 41
    Height = 21
    TabStop = False
    MaxLength = 2
    TabOrder = 14
    OnChange = EditImieChange
  end
  object EditKopertaPunkty: TEdit
    Left = 72
    Top = 314
    Width = 41
    Height = 21
    TabStop = False
    MaxLength = 2
    TabOrder = 12
    OnChange = EditImieChange
  end
  object EditKopertaCzas: TEdit
    Left = 72
    Top = 287
    Width = 41
    Height = 21
    MaxLength = 5
    TabOrder = 4
    OnChange = EditImieChange
  end
  object BtnZapisz: TButton
    Left = 304
    Top = 332
    Width = 75
    Height = 25
    Caption = 'Zapisz'
    Default = True
    Enabled = False
    TabOrder = 8
    OnClick = MenuZapiszClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 391
    Width = 410
    Height = 19
    Panels = <>
  end
  object MainMenu: TMainMenu
    Left = 192
    Top = 160
    object MenuPlik: TMenuItem
      Caption = 'Plik'
      object MenuNowy: TMenuItem
        Caption = 'Nowy'
        ShortCut = 16462
        OnClick = MenuNowyClick
      end
      object MenuOtworz: TMenuItem
        Caption = 'Otworz'
        ShortCut = 16463
        OnClick = MenuOtworzClick
      end
      object MenuZapisz: TMenuItem
        Caption = 'Zapisz'
        Enabled = False
        ShortCut = 16467
        OnClick = MenuZapiszClick
      end
      object MenuZapiszJako: TMenuItem
        Caption = 'Zapisz jako...'
        Enabled = False
      end
      object MenuSeparator1: TMenuItem
        Caption = '-'
      end
      object MenuZakoncz: TMenuItem
        Caption = 'Zako'#324'cz'
        OnClick = MenuZakonczClick
      end
    end
    object MenuBaza: TMenuItem
      Caption = 'Baza'
      object MenuDodajZawodnika: TMenuItem
        Caption = 'Dodaj zawodnika'
        ShortCut = 16452
        OnClick = MenuDodajZawodnikaClick
      end
      object MenuUsunZawodnika: TMenuItem
        Caption = 'Usu'#324' zawodnika (jeszcze nie gotowe)'
        Enabled = False
      end
      object MenuZamknijBaze: TMenuItem
        Caption = 'Zamknij baz'#281
        Enabled = False
        OnClick = MenuZamknijBazeClick
      end
    end
    object MenuPomoc: TMenuItem
      Caption = 'Pomoc'
      object MenuOProgramie: TMenuItem
        Caption = 'O programie...'
        OnClick = MenuOProgramieClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.dat'
    Filter = 'Plik binarny (*.dat)|*.dat'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 160
    Top = 160
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.dat'
    FileName = 'Zawodnicy'
    Filter = 'Plik binarny (*.dat)|*.dat'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 128
    Top = 160
  end
end

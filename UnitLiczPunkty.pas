unit UnitLiczPunkty;

interface 

type Punkty = 0..80;

function Punkty30m(wynik : real) : punkty;

implementation

function Punkty30m(wynik : real) : punkty;
var
  DoZwrocenia : punkty;
  begin
If wynik <= 3.7 Then
 DoZwrocenia := 80
 else if  (wynik > 3.7) And (wynik <= 3.72) Then
 DoZwrocenia := 79
 else if  (wynik > 3.72) And (wynik <= 3.74) Then
 DoZwrocenia := 78
 else if  (wynik > 3.74) And (wynik <= 3.76) Then
 DoZwrocenia := 77
 else if  (wynik > 3.76) And (wynik <= 3.78) Then
 DoZwrocenia := 76
 else if  (wynik > 3.78) And (wynik <= 3.8) Then
 DoZwrocenia := 75
 else if  (wynik > 3.8) And (wynik <= 3.82) Then
 DoZwrocenia := 74
 else if  (wynik > 3.82) And (wynik <= 3.84) Then
 DoZwrocenia := 73
 else if  (wynik > 3.84) And (wynik <= 3.86) Then
 DoZwrocenia := 72
 else if  (wynik > 3.86) And (wynik <= 3.88) Then
 DoZwrocenia := 71
 else if  (wynik > 3.88) And (wynik <= 3.9) Then
 DoZwrocenia := 70
 else if  (wynik > 3.9) And (wynik <= 3.92) Then
 DoZwrocenia := 69
 else if  (wynik > 3.92) And (wynik <= 3.94) Then
 DoZwrocenia := 68
 else if  (wynik > 3.94) And (wynik <= 3.96) Then
 DoZwrocenia := 67
 else if  (wynik > 3.96) And (wynik <= 3.98) Then
 DoZwrocenia := 66
 else if  (wynik > 3.98) And (wynik <= 4) Then
 DoZwrocenia := 65
 else if  (wynik > 4) And (wynik <= 4.02) Then
 DoZwrocenia := 64
 else if  (wynik > 4.02) And (wynik <= 4.04) Then
 DoZwrocenia := 63
 else if  (wynik > 4.04) And (wynik <= 4.06) Then
 DoZwrocenia := 62
 else if  (wynik > 4.06) And (wynik <= 4.08) Then
 DoZwrocenia := 61
 else if  (wynik > 4.08) And (wynik <= 4.1) Then
 DoZwrocenia := 60
 else if  (wynik > 4.1) And (wynik <= 4.12) Then
 DoZwrocenia := 59
 else if  (wynik > 4.12) And (wynik <= 4.14) Then
 DoZwrocenia := 58
 else if  (wynik > 4.14) And (wynik <= 4.16) Then
 DoZwrocenia := 57
 else if  (wynik > 4.16) And (wynik <= 4.18) Then
 DoZwrocenia := 56
 else if  (wynik > 4.18) And (wynik <= 4.2) Then
 DoZwrocenia := 55
 else if  (wynik > 4.2) And (wynik <= 4.22) Then
 DoZwrocenia := 54
 else if  (wynik > 4.22) And (wynik <= 4.24 )Then
 DoZwrocenia := 53
 else if  (wynik > 4.24) And (wynik <= 4.26) Then
 DoZwrocenia := 52
 else if  (wynik > 4.26) And (wynik <= 4.28) Then
 DoZwrocenia := 51
 else if  (wynik > 4.28) And (wynik <= 4.3) Then
 DoZwrocenia := 50
  else if  (wynik > 4.3) And (wynik <= 4.32) Then
 DoZwrocenia := 49
  else if  (wynik > 4.32) And (wynik <= 4.34) Then
 DoZwrocenia := 48
  else if  (wynik > 4.34) And (wynik <= 4.36) Then
 DoZwrocenia := 47
  else if  (wynik > 4.36) And (wynik <= 4.38) Then
 DoZwrocenia := 46
  else if  (wynik > 4.38) And (wynik <= 4.4) Then
 DoZwrocenia := 45
  else if  (wynik > 4.4) And (wynik <= 4.42) Then
 DoZwrocenia := 44
  else if  (wynik > 4.42) And (wynik <= 4.44) Then
 DoZwrocenia := 43
  else if  (wynik > 4.44) And (wynik <= 4.46) Then
 DoZwrocenia := 42
  else if  (wynik > 4.46) And (wynik <= 4.48) Then
 DoZwrocenia := 41
  else if  (wynik > 4.48) And (wynik <= 4.5) Then
 DoZwrocenia := 40
  else if  (wynik > 4.5) And (wynik <= 4.52) Then
 DoZwrocenia := 39
  else if  (wynik > 4.52) And (wynik <= 4.54) Then
 DoZwrocenia := 38
  else if  (wynik > 4.54) And (wynik <= 4.56) Then
 DoZwrocenia := 37
  else if  (wynik > 4.56) And (wynik <= 4.58) Then
 DoZwrocenia := 36
  else if  (wynik > 4.58) And (wynik <= 4.6) Then
 DoZwrocenia := 35
 
 
 else if  (wynik > 4.6) And (wynik <= 4.64) Then
 DoZwrocenia := 34
 else if  (wynik > 4.64) And (wynik <= 4.68) Then
 DoZwrocenia := 33
 else if  (wynik > 4.68) And (wynik <= 4.72) Then
 DoZwrocenia := 32
 else if  (wynik > 4.72) And (wynik <= 4.76) Then
 DoZwrocenia := 31
 else if  (wynik > 4.76) And (wynik <= 4.8) Then
 DoZwrocenia := 30
 else if  (wynik > 4.8) And (wynik <= 4.84) Then
 DoZwrocenia := 29
 else if  (wynik > 4.84) And (wynik <= 4.88) Then
 DoZwrocenia := 28
 else if  (wynik > 4.88) And (wynik <= 4.92) Then
 DoZwrocenia := 27
 else if  (wynik > 4.92) And (wynik <= 4.96) Then
 DoZwrocenia := 26
 else if  (wynik > 4.96) And (wynik <= 5) Then
 DoZwrocenia := 25
 else if  (wynik > 5) And (wynik <= 5.04) Then
 DoZwrocenia := 24
 else if  (wynik > 5.04) And (wynik <= 5.08) Then
 DoZwrocenia := 23
 else if  (wynik > 5.08) And (wynik <= 5.12) Then
 DoZwrocenia := 22
 else if  (wynik > 5.12) And (wynik <= 5.16) Then
 DoZwrocenia := 21
 else if  (wynik > 5.16) And (wynik <= 5.2) Then
 DoZwrocenia := 20
 

 else if  (wynik > 5.2) And (wynik <= 5.25) Then
 DoZwrocenia := 19
 else if  (wynik > 5.25) And (wynik <= 5.3) Then
 DoZwrocenia := 18
 else if  (wynik > 5.3) And (wynik <= 5.35) Then
 DoZwrocenia := 17
 else if  (wynik > 5.35) And (wynik <= 5.4) Then
 DoZwrocenia := 16
 else if  (wynik > 5.4) And (wynik <= 5.45) Then
 DoZwrocenia := 15
 else if  (wynik > 5.45) And (wynik <= 5.5) Then
 DoZwrocenia := 14
 
 
 else if  (wynik > 5.5) And (wynik <= 5.6) Then
 DoZwrocenia := 13
 else if  (wynik > 5.6) And (wynik <= 5.7) Then
 DoZwrocenia := 12
 else if  (wynik > 5.7) And (wynik <= 5.8) Then
 DoZwrocenia := 11
 else if  (wynik > 5.8) And (wynik <= 5.9) Then
 DoZwrocenia := 10
 else if  wynik > 5.9 Then
 DoZwrocenia := 0;
 Result := DoZwrocenia
 end;




end.

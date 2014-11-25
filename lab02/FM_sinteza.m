## USAGE: [y_fmrek y_fm y] = FM_sinteza (f, f_mod, Am, fs, nsamp, rec)
##
## Generiraj ton na 3 različne načine:
##  1. samo osnovni ton
##  2. osnovni ton s FM sintezo
##  3. osnovni ton z rekurzivno FM sintezo
##
## PARAMETRI:
##  f     - frekvenca osnovnega tona
##  f_mod - frekvenca modulacije
##  Am    - amplituda modulacije
##  fs    - vzorčevalna frekvenca
##  nsamp - število vzorcev
##  rec   - število ponovitev rekurzivnega operatorja
##
## REZULTAT:
##  y       - osnovni ton
##  y_fm    - osnovni ton s FM sintezo
##  y_fmrek - osnovni ton z rekurzivno FM sintezo

function [y_fmrek y_fm y] = FM_sinteza (f, f_mod, Am, fs, nsamp, rec)
  n = 0 : nsamp-1;
  w = 2 * pi * f / fs * n;

  # Nerekurzivni operator
  op1 = Am * sin (2 * pi * f_mod / fs * n);

  # Rekurzivni operator
  op2 = op1;
  for i = 1:rec
    op2 = Am * sin (2 * pi * f_mod / fs * n + op2);
  end

  # Normalizirani rezultati
  y = normalize (sin (w));
  y_fm = normalize (sin (w + op1));
  y_fmrek = normalize (sin (w + op2));
endfunction

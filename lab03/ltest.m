## Simple linearity tester
function r = ltest (sys, s1, s2)
  y1 = sys (s1);
  y2 = sys (s2);
  y  = sys (s1 + s2);
  eq = y == y1 + y2;
  r = sum (eq) == length (s1);
endfunction

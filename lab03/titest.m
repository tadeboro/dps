## Simple time invariance tester
function r = titest (sys, x)
  dx = [0 0 0 x];
  y  = sys (x);
  dy = sys (dx);
  eq = [0 0 0 y] == dy;
  r = sum (eq) == length (dx);
endfunction

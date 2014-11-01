function y = envelope (n, attack, release)
  x1 = logspace (0, 1, n * attack) / 10;
  x2 = logspace (1, 0, n * release) / 10;
  y = [x1 ones(1, n - length(x1) - length(x2)) x2];
endfunction

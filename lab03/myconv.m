## Calculate convolution as specified by equation
function y = myconv (h, x)
  hl = length (h);
  xl = length (x);
  yl = hl + xl - 1;
  y = zeros (1, yl);

  for n = 1:yl
    m = max (1, n + 1 - xl);
    M = min (hl, n);
    for k = m:M
      y(n) = y(n) + h(k) * x(n + 1 - k);
    end
  end
endfunction

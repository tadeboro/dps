function [xs is] = local_max (x, n)
  if nargin < 2
    # Smoothing factor
    n = 3;
  end

  xo = x;
  xl = length (x);

  # Smooth values a bit
  kernel = ones (1, n) / n;
  x1= x(1);
  x2= x(xl);
  c = conv (kernel, x);
  x = c (2 : xl + 1);
  x(1)  = x1;
  x(xl) = x2;

  # Find local maxima
  xs = [];
  is = [];

  for i = 2 : xl - 1
    if x(i) > 0 && x(i) >= x(i - 1) && x(i) >= x(i + 1)
      if x(i) > x(i - 1)
        k = 1;
        xs = [xs xo(i)];
        is = [is    i ];
      else
        if mod (k, 2) == 1
          xs(end) = xo(i)
          is(end) = i
        end
      end
    end
  end
endfunction

function magplot (x, fs, k = 1, l = 0, h = 1e12)
  # Size of input
  [r c] = size (x);
  if r > c
    x = x';
    [r c] = size (x);
  end
  len = 2 ^ nextpow2 (c) * k;

  # Frequency presentation
  [y f] = freqz (x(1,:), 1, len, fs);

  # Trim to required frequencies
  lo = find (f >= l, 1);
  hi = length (y);
  tmp = find (f >= h, 1);
  if length (tmp) != 0
    hi = tmp;
  end

  # Display first
  tmp = abs (y(lo:hi));
  tmp = 20 * log10 (tmp / max (tmp));
  plot (f(lo:hi), tmp)

  # Calculate and display all other
  hold all
  for j = 2:r
    [y f] = freqz (x(j,:), 1, len, fs);
    tmp = abs (y(lo:hi));
    tmp = 20 * log10 (tmp / max (tmp));
    plot (f(lo:hi), tmp)
  end
  hold off
  xlabel ("Frequency [Hz]");
  ylabel ("Amplitude [dB]");
  title ("Magnitude response");
endfunction

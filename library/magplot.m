function magplot (x, fs, t = "log", k = 1, l = 0, h = 1e12)
  # Y-axis value function
  if t == "log" # Decibel scale
    yf = @ (x) 20 * log10 (x / max (x));
    yu = "[dB]";
  elseif t == "lin" # Linear scale
    yf = @ (x) x / max (x);
    yu = "[% max]";
  end
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
  plot (f(lo:hi), yf (tmp))

  # Calculate and display all other
  hold all
  for j = 2:r
    [y f] = freqz (x(j,:), 1, len, fs);
    tmp = abs (y(lo:hi));
    plot (f(lo:hi), yf (tmp))
  end
  hold off
  xlabel ("Frequency [Hz]");
  ylabel (["Amplitude " yu]);
  title ("Magnitude response");
endfunction

function s_show (x, fs)
  n = length (x);
  t = 1 / fs * (1 : n);

  y = abs (fft (x));
  y = y(1:n/2);
  f = fs * (0 : n / 2 - 1) / n;
  
  subplot (2, 1, 1);
  plot (t, x);
  axis ([0.0 0.1]);
  xlabel ("Time (s)")
  ylabel ("Amplitude")
  
  subplot (2, 1, 2);
  semilogy (f, y);
  xlabel ("Frequency (Hz)")
  ylabel ("Amplitude")
  title ("Frequency Response") 
endfunction

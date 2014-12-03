function b_freq = get_basic_freq (x, fs, max_lag)
  [c k] = xcorr (x, max_lag);
  # Take only positive values
  c = c(max_lag + 1:2 * max_lag);
  k = k(max_lag + 1:2 * max_lag);

  # Find local maximums
  [vs is] = findpeaks (c, "DoubleSided");
  b_freq = fs / is(1);
  
  # Display graph
  plot (k, c, "-", is(1), vs(1), "*r")
  xtitle ("Autocorrelation - determne basic frequency",
          "Lag [n samples]", "Autocorrelation factor");
  legend("xcorr (x, 500)", "Peak");
endfunction

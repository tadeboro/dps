function d = get_delay (ref, s1, s2)
  # Calculate cross correlation factors
  x1 = xcorr (ref, s1, 200);
  x1 = x1 (201:-1:1) - mean (x1);

  x2 = xcorr (ref, s2, 200);
  x2 = x2 (201:-1:1) - mean (x2);

  # Plot koefficients
  k = 1:200;
  plot(k, x1(k), "-", k, x2(k), "-")
  xtitle("Cross correlation - RADAR", "k", "xcorr [k]");

  # Find peaks in correlation and match them
  [ans i1] = findpeaks (x1', "DoubleSided", ...
                             "MinPeakDistance", 10, ...
                             "MinPeakHeight", 1);
  [ans i2] = findpeaks (x2', "DoubleSided", ...
                             "MinPeakDistance", 10, ...
                             "MinPeakHeight", 1);

  # Assume no correlation
  d = -1;
  # Did we get any peaks
  if length (i1) > 0
    pos1 = i1(1);
    pos2 = i2(find (i2 > pos1, 1));

    # Is this peak significant?
    if abs (x2(pos2) / x1(pos1)) > 0.6
      d = pos2 - pos1;
      hold all
      plot([pos1 pos2], [x1(pos1) x2(pos2)], "*r")
      hold off
    end
  end
  legend ("sent", "received", "related peaks");
endfunction

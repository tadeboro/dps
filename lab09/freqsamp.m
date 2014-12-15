function h = freqsamp (H)
  # Calculates filter response via freq. sampling

  [row col] = size (H);

  border = idivide (col + rem (col, 2), 2, "fix") - 1;
  alpha = (col - 1) / 2;
  h = zeros (1, border + 1);
  for i = 1:length (h)
    h(i) = 1 / col * (sum (2 * abs (H(2:border)) ...
                           .* cos (2 * pi * (1:border-1) ...
                                   * (i - 1 - alpha) / col))...
                      + H(1));
  end

  # Duplicate simetrically
  h = [h fliplr(h)];
endfunction

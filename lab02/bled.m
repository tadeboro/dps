function bled ()
  # Base
  f0 = 440; # A4
  a = nthroot (2, 12);
  fs = 8000;

  function out = play_clar (note, len)
    f = f0 * a ^ note;
    n = 0 : len - 1;
    no = 2 * pi * f / fs * n;
    env = envelope (len, .1, .05);
    out = cos (no) + 0.375 * cos (3 * no) + 0.581 * cos (5 * no)...
          + 0.382 * cos (7 * no) + 0.141 * cos (9 * no)...
          + 0.028 * cos (11 * no) + 0.009 * cos (13 * no);
    out = out .* env;
  endfunction

  notes = [5 2 3 5 5 2 7 9 7 5 5 2 2 -2 0 2 2 -7 3 0 2 -2];
  lens  = [1 1 1 1 1 3 1 1 1 1 1 3 1  1 1 1 1  3 1 1 1  3];
  music = [];
  for i = 1 : length (notes)
    music = [music play_clar(notes(i), lens(i) * 2000)];
  end
  s_play_n (music, fs);
endfunction

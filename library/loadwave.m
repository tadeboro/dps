function [y, d] = loadwave (fname)
  [y, fs, bps] = wavread (fname);
  d = [fs, bps];
endfunction

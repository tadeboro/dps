function savewave (fname, x, varargin)
  % Default values for optional parameters
  optargs = {22050 16};
  argc = length (varargin);
  optargs(1:argc) = varargin;
  [rate bits]= optargs{:};

  wavwrite (x, rate, bits, fname);
endfunction

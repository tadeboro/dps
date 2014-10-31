function [out data] = s_record ()
  sfile = tmpnam (get_dps_config ("tmp"), "dsp-play-");
  sfile = [sfile ".wav"];
  srec  = get_dps_config ("rec");
  scmd  = [srec " " sfile];

  system (scmd);
  [out data] = loadwave (sfile);
endfunction

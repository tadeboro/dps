function s_play (sss, fsample)
  sfile = tmpnam (get_dps_config ("tmp"), "dsp-play-");
  sfile = [sfile ".wav"];
  splay = get_dps_config ("play");
  scmd  = [splay " " sfile];

  # Save file, play it and delete it when done
  savewave (sfile, sss, fsample);
  system (scmd);
  unlink (sfile);
endfunction

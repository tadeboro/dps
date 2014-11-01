function out = dtmf_2f (key)
  frekv = [841 1336
           697 1209
	   697 1336
	   697 1477
	   770 1209
	   770 1336
	   770 1477
	   852 1209
	   852 1336
	   852 1477];
  out = frekv (key + 1, :);
endfunction

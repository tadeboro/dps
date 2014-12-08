figure 1
[x, fs] = wavread ("aaa.wav");
magplot (x', fs);

figure 2
[x, fs] = wavread ("iii.wav");
magplot (x', fs);

figure 3
[x, fs] = wavread ("dtmf_tipka1.wav");
magplot (x', fs);

figure 4
[x, fs] = wavread ("dtmf_tipka2.wav");
magplot (x', fs);

figure 5
[x, fs] = wavread ("clarinet.wav");
magplot (x', fs);

figure 6
[x, fs] = wavread ("test.wav");
magplot (x', fs);

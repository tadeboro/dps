# Use built-in functions from signal package
N = 256;
w = hamming (N);

# Short time magnitude response
figure 1;
subplot (2, 1, 1);
[x fs] = wavread ("zvizg.wav");
specgram (x, N, fs, w);
title ("Short-time Magnitude reponse");

# Magnitude plot
subplot (2, 1, 2);
magplot (x, fs);


# Sample signals
figure 2;
[x fs] = wavread ("sum.wav");
specgram (x, N, fs, w);
title ("Short-time Magnitude reponse - sum");

figure 3;
[x fs] = wavread ("chirp.wav");
specgram (x, N, fs, w);
title ("Short-time Magnitude reponse - chirp");

figure 4;
[x fs] = wavread ("dtmf.wav");
specgram (x, N, fs, w);
title ("Short-time Magnitude reponse - dtmf");

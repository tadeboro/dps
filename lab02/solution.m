# Common
fs = 8000;
n = 0:15999;
t = n / fs;

# n1

x1 = .5 * sin (2 * pi * 500 / fs * n);
x2 = .5 * sin (2 * pi * 1594 / fs * n);
b = ones (1, 5) / 5;

y1 = conv (x1, b);
y2 = conv (x2, b);

s_play_n (y1, fs);
s_play_n (y2, fs);


# n2

C = .8;
a1 = [1, -C];
b1 = 1 - C;
a2 = [1, C];
b2 = 1 - C;

x1 = .5 * sin (2 * pi * 200 / fs * n);
x2 = .1 * sin (2 * pi * 3800 / fs * n);
x3 = x1 + x2;
y1 = filter (b1, a1, x3);
y2 = filter (b2, a2, x3);

s_play_n (y1, fs);
s_play_n (y2, fs);


# pn1

# Generiraj enotin odziv za odmev
h = [1, zeros(1, 4999), .5, zeros(1, 4999), .25];
[ra info] = loadwave ("runaway_mono.wav");
s_play (ra, info(1));
ra1 = conv (ra, h);
s_play (ra1, info(1));


# pn2

f0 = 261.63; # C4
no = 2 * pi * f0 / fs * n;
x0 = cos (no) + 0.375 * cos (3 * no) + 0.581 * cos (5 * no)...
      + 0.382 * cos (7 * no) + 0.141 * cos (9 * no)...
      + 0.028 * cos (11 * no) + 0.009 * cos (13 * no);
s_play_n (x0, fs);
env = envelope (length (n), .2, .05);
x1 = x0 .* env;
s_play_n (x1, fs);

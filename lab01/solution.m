# Common
fs = 8000;
n = 0:39999;
t = n / fs;

# n1
x1 = .7 * cos (2 * pi * 350 / fs * n);
x2 = 3 * cos (2 * pi * 250 / fs * n);

figure (1);
plot (t, x1, t, x2, t, x1 + x2);
title ("x1, x2, x3");
xlabel ("t [sec]");
ylabel ("x(n)");
legend ("x1", "x2", "x1 + x2");

s_play (x1, fs);
s_play (x2, fs);
s_play_n (x2, fs);


# n2

x4 = 0.7 * cos (2 * pi * 8350 / fs * n);
x5 = 0.7 * cos (2 * pi * 16350 / fs * n);
figure (2);
plot (t, x1, t, x4, t, x5);
title ("x1, x4, x5");
xlabel ("t [sec]");
ylabel ("x(n)");
legend ("x1", "x4", "x5");

s_play (x1, fs);
s_play (x4, fs);
s_play (x5, fs);


# pn1

num = [0 6 1 3 2 8 5 6 2];
fs = 22050;
t = 0.2;
x = zeros (1, t * fs);
pavza = zeros (1, 100);

stev = max (size (num));

y = x;
for i  = num
  frekv = dtmf_2f (i);
  n = 0:6000;
  s1 = .5 * sin (2 * pi * frekv(1) / fs * n);
  s2 = .5 * sin (2 * pi * frekv(2) / fs * n);
  y = [y, s1 + s2, x];
end

s_play_n (y, fs);

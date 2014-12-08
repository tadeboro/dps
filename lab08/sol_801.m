N = 129;
n = 1:64;
omega_c = pi / 4;
r = sin (n * omega_c) ./ (pi * n);
hd = [r(end:-1:1) .25 r];

hn = hann (N)';
hm = hamming (N)';
k9 = kaiser (N, 9)';
magplot ([hd; hd .* hn; hd .* hm; hd .* k9], 129)
legend ("Rect", "Hann", "Hamming", "Kaiser (9)");

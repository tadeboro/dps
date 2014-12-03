# 3.2 Echo detection
[x, fs] = wavread ("danes_je_lep_dan.wav");
x = x';
xl = length (x);

# Get correlation between signal with no echo and one with echo
x1 = x + [zeros(1, 3000) 0.6 * x](1:xl);
xc = xcorr (x, x1, 3500)(3500:-1:1);
xc = xc / xc(1);

# Plot correlation coefficients
subplot (2, 1, 1)
plot(xc)
xtitle("Krizna korelacija - Odmev", "odmik [vzorcih]", "xcorr [odmik]");

# Find peaks
[vals idxs] = findpeaks (xc', "DoubleSided", "MinPeakdistance", 10);
[ans order] = sort (vals, "descend");
peak = idxs(order(1));
printf("Lokalni maksimum v %d z relativno amplitudo %f\n", peak, xc(peak));

# Get autocorrelation of signal with echo
xcc = xcorr (x1, 3500)(3500:-1:1);
xcc = xcc / xcc(1);

# Plot autocorrelation
subplot (2, 1, 2)
plot(xcc)
xtitle("Avto korelacija - Odmev", "odmik [vzorcih]", "xcorr [odmik]");

# Find peaks
[vals idxs] = findpeaks (xcc', "DoubleSided", "MinPeakdistance", 10);
[ans order] = sort (vals, "descend");
peak = idxs(order(1)); # Tole pade v vodo
peak = idxs(order(2)); # Tole pa je OK
printf("Lokalni maksimum v %d z relativno amplitudo %f\n", peak, xcc(peak));

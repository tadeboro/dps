# First task
N = 512;
n = 0:N-1;
A = 3;
f = 250;
fs = 1000;

# Generate signal and pass i through system
x = A * cos (2 * pi * n * f / fs);
h = ones (1, 5) * .2;
y = conv (x, h);

# Plot both signals
subplot (2, 1, 1);
plot (n, [x; y(1:N)]);
# Read out amplitude ratio: 0.6

r = fft ([h zeros(1, N - 5)]);
a = abs (r(1:N/2));
freq = n(1:N/2) * fs / N;
subplot (2, 1, 2);
pos = find (freq >= f, 1);
plot (freq, a, "-", freq(pos), a(pos), "*r");
legend ("Frekvencni odziv", "Odziv pri izbrani frekvenci")
xtitle ("Amplitudni odziv", "freq [Hz]", "Amplitude")
printf ("Amplitudni odziv pri %.0f Hz: %4.2f\n", f, a(pos))

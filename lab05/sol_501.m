# Lab 5, part 1
no_samples = 512;
no_samples2 = no_samples / 2;
fs = 1000;
cf = fs / no_samples; # Coversion factor from samples to frequency
n = 0 : no_samples - 1;

# Generate requested signals
x0c = 3 * cos (2 * pi * n * 250 / fs);
x0s = 3 * sin (2 * pi * n * 250 / fs);
resp_x0c = fft (x0c) / no_samples; 
resp_x0s = fft (x0s) / no_samples; 
f = n * cf;

# Frequency response - real part
subplot (4, 1, 1);
plot (f, real ([resp_x0c; resp_x0s]));
xtitle ('Frekvencni odziv - Realni del','frekv [Hz]','amplituda lin.');
legend ('cos', 'sin');

# Frequency response - imaginary part
subplot (4, 1, 2);
plot (f, imag ([resp_x0c; resp_x0s]));
xtitle ('Frekvencni odziv - Imaginarni del','frekv [Hz]','amplituda lin.');
legend ('cos', 'sin');


# Generate required signals
x1 = 3   * cos (2 * pi * n * 250      / fs + pi / 4);
x2 = 0.7 * cos (2 * pi * n * 50.78125 / fs - pi / 8);
x3 = x2 + x1;

# Calculate response: amplitude and phase
resp_x3 = fft (x3) / no_samples;
ampl_x3 = abs (resp_x3(1:no_samples2));
phase = atan2 (imag (resp_x3(1:no_samples2)),
               real (resp_x3(1:no_samples2)));
subplot (4, 1, 3);
plot (f(1:no_samples2), ampl_x3);
xtitle ("Amplitudni odziv", "frekv [Hz]", "amplituda lin.");

# Find peaks
[vs is] = findpeaks (ampl_x3', "MinPeakheight", .05);
printf("Point %4d: f = %6.2f | A = %6.2f, Ph = %6.2f\n", ...
       [is'; (is' - 1) * cf; ampl_x3(is); phase(is)])
# Plot peaks
hold all
plot (f(is), vs, "*r")
hold off


# Generate signal with frequency that fits in between two ticks
x22 = 0.7 * cos (2 * pi * n * (50.78125 + ((f(2) - f(1)) / 2)) / fs - pi / 8);
resp_x22 = fft (x22) / no_samples;
ampl_x22 = abs (resp_x22(1:no_samples2));
[ans pos] = findpeaks (ampl_x22')
subplot (4, 1, 4)
plot ((pos-10:pos+10) * cf, [ampl_x3(pos-10:pos+10); ampl_x22(pos-10:pos+10)])
xtitle('Amplitudni odziv x3 in x22','Frekvenca [Hz]','Amplituda')  

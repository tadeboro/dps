# 3.1 Autocorrelation
# Load sample data
[x, fsx] = wavread ("aaa.wav");
[y, fsy] = wavread ("iii.wav");

# Determine basic frequency
subplot(2, 1, 1);
get_basic_freq (x, fsx, 500)
subplot(2, 1, 2);
get_basic_freq (y, fsy, 500)

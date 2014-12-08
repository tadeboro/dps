# Generate windows
N = 129;
re = rectwin (N);
hm = hamming (N);
hn = hann (N);
k1 = kaiser (N, 1);
k5 = kaiser (N, 5.44);
k9 = kaiser (N, 9);

# Plot
magplot ([re hm hn k1 k5 k9]', 129, 5)
legend ("Pravokotno", "Hamming", "Hann", "Kaiser 1",...
        "Kaiser 5.44", "Kaiser 9");
#xlim ([0, 20]);

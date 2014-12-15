# Optimal FIR filters
N = 41;

# First pair
h1 = remez (N, [0 0.49998 0.5  1], [1 1 0 0])';
h2 = remez (N, [0 0.48    0.52 1], [1 1 0 0])';

h12 = [h1; h2];
subplot (2, 1, 1)
magplot ([h12 zeros(2, 256 - N - 1)], 1000, "lin");
legend ("Small gap (0.0002)", "Larger gap (0.04)")


# Second pair
h3 = remez (41, [0 0.48 0.52 1], [1 1 0 0])';
h4 = remez (42, [0 0.48 0.52 1], [1 1 0 0])';

h34 = [h3 zeros(1, 256 - 42)
       h4 zeros(1, 256 - 43)];
subplot (2, 1, 2)
magplot (h34, 1000, "lin");
legend ("N = 41", "N = 42")

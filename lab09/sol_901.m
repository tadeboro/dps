# Amplitude responses
H = [1 1 1 1 0      0      0      0
     1 1 1 1 0.4060 0      0      0
     1 1 1 1 0.5571 0.0841 0      0
     1 1 1 1 0.6018 0.1239 0.0038 0];
H = [H fliplr(H)];
r = rows (H);

# Get unit responses
for i = 1:r
  h(i,:) = freqsamp (H(i,:));
end

# Plot them
magplot ([h zeros(r, 120)], 1000, "lin");
legend ("0 trans. points", "1 trans. point", ...
        "2 trans. points", "3 trans. points");

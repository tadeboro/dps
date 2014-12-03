# Linearity tester
# Load sistems
load sistemi.bin;

# Setup some sample signals that we'll use to test linearity etc.
disp ("Test samples:");
x1 = randi ([0, 9], 1, 8)
x2 = randi ([0, 9], 1, 8)

# Apply systems on x1, x2 and x1 + x2 and check linearity
disp ("LINEARITY TEST RESULTS:")
ltest (sistem1, x1, x2)
ltest (sistem2, x1, x2)
ltest (sistem3, x1, x2)

# Apply systems on x1 and x2 and check for time invariance
disp ("TIME INVARIANCE TEST RESULTS:")
titest (sistem1, x1)
titest (sistem2, x1)
titest (sistem3, x1)

# Test built-in convolution and custom convolution
h = 1:3;
x = 4:7;
c1 = conv (h, x)
c2 = myconv (h, x)
